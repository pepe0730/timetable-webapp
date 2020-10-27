package controllers.people;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
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
 * Servlet implementation class PeopleDestroyServlet
 */
@WebServlet("/people/destroy")
public class PeopleDestroyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PeopleDestroyServlet() {
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
            Person p = em.find(Person.class, (Integer)request.getSession().getAttribute("person_id"));

            Integer authority = Integer.parseInt(request.getParameter("authority"));

            if (authority == 1) {
                List<Subject> subjects = null;
                try {
                    subjects = em.createNamedQuery("destroyTeacher", Subject.class)
                                                .setParameter("code", p.getCode())
                                                .getResultList();
                } catch (NoResultException e) {}
                for (Subject subject : subjects) {
                    em.getTransaction().begin();
                    em.remove(subject);
                    em.getTransaction().commit();
                }

            } else if (authority ==  0) {
                List<TakeSubject> takeSubjects = null;
                try {
                    takeSubjects = em.createNamedQuery("destroyStudent", TakeSubject.class)
                            .setParameter("code", p.getCode())
                            .getResultList();
                } catch (NoResultException e) {}

                for (TakeSubject takeSubject : takeSubjects) {
                    em.getTransaction().begin();
                    em.remove(takeSubject);
                    em.getTransaction().commit();
                }
            }

            em.getTransaction().begin();
            em.remove(p);
            em.getTransaction().commit();
            em.close();

            request.getSession().setAttribute("flush","削除しました");


            if (authority == 2) {
                response.sendRedirect(request.getContextPath() + "/admins/index.html");
            } else if (authority == 1) {
                response.sendRedirect(request.getContextPath() + "/people/teachers/index");
            } else {
                response.sendRedirect(request.getContextPath() + "/people/students/index");
            }
        }
    }

}
