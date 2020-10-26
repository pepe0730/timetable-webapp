package controllers.takeSubjects;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.College;
import models.Person;
import models.Subject;
import models.TakeSubject;
import utils.DButil;

/**
 * Servlet implementation class TakeSubjectsCreateServlet
 */
@WebServlet("/takeSubjects/create")
public class TakeSubjectsCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TakeSubjectsCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = request.getParameter("_token");
        if (_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DButil.createEntityManager();
            Person p = (Person)request.getSession().getAttribute("login_person");
            Subject s = em.find(Subject.class, (Integer)request.getSession().getAttribute("subject_id"));
            College c = s.getCollege();
            TakeSubject t = new TakeSubject();
            t.setPerson(p);
            t.setSubject(s);
            t.setCollege(c);

            //時限と曜日の重複チェック（すでに履修登録済みの講義と被っていないか）
            Integer time = s.getTime();
            String day_of_week = s.getDay_of_week();

            TakeSubject registeredSubject = null;

            try {
                registeredSubject = em.createNamedQuery("checkRegisteredTimeAndDate", TakeSubject.class)
                        .setParameter("student_code", p.getCode())
                        .setParameter("day_of_week", day_of_week)
                        .setParameter("time", time)
                        .getSingleResult();
            } catch (NoResultException e){}


            if (registeredSubject != null) {
                em.close();
                request.setAttribute("error", "この曜日・時限にはすでに講義が登録されています。");
                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("subject", s);
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/takeSubjects/show.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.persist(t);
                em.getTransaction().commit();
                em.close();


                request.getSession().setAttribute("flush", "履修登録が完了しました。");
                request.removeAttribute("subject_id");

                response.sendRedirect(request.getContextPath() + "/takeSubjects/index");
            }

        }
    }

}
