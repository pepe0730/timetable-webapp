package controllers.subjects;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Subject;
import models.TakeSubject;
import utils.DButil;

/**
 * Servlet implementation class SubjectsDestroyServlet
 */
@WebServlet("/subjects/destroy")
public class SubjectsDestroyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectsDestroyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = request.getParameter("_token");
        if (_token != null && _token.equals("")) {
            EntityManager em = DButil.createEntityManager();
            Subject s = em.find(Subject.class, (Integer)request.getSession().getAttribute("subject_id"));

            List<TakeSubject> takeSubjects = null;

            try {
                takeSubjects = em.createNamedQuery("destroySubjects", TakeSubject.class)
                                                    .setParameter("code", s.getCode())
                                                    .setParameter("college_code", s.getCollege().getCode())
                                                    .getResultList();
            } catch (Exception e) {}

            if (takeSubjects.size() > 0) {
                for (TakeSubject takeSubject : takeSubjects) {
                    em.getTransaction().begin();
                    em.remove(takeSubject);
                    em.getTransaction().commit();
                }
            }

            em.getTransaction().begin();
            em.remove(s);
            em.getTransaction().commit();
            em.close();

            request.getSession().setAttribute("flush", "講義を1件削除しました。");
            request.getSession().removeAttribute("subject_id");

            response.sendRedirect(request.getContextPath() + "/subjects/index");
        }
    }

}
