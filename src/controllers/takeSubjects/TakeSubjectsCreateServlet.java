package controllers.takeSubjects;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
            TakeSubject t = new TakeSubject();
            t.setPerson(p);
            t.setSubject(s);

            em.getTransaction().begin();
            em.persist(t);
            em.getTransaction().commit();
            em.close();

            response.sendRedirect(request.getContextPath() + "/takeSubjects/index");


        }
    }

}
