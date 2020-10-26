package controllers.colleges;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
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
 * Servlet implementation class CollegesDestroyServlet
 */
@WebServlet("/colleges/destroy")
public class CollegesDestroyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CollegesDestroyServlet() {
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

            College c = em.find(College.class, (Integer)request.getSession().getAttribute("college_id"));

            System.out.println(c.getName() + c.getCode());

            TakeSubject test = em.createNamedQuery("test", TakeSubject.class)
                                             .setParameter("code", c.getCode())
                                             .getSingleResult();

            System.out.println(test.getCollege().getName() + test.getCollege().getCode());

            List<TakeSubject> college_takeSubjects = null;

            try {
                college_takeSubjects  = em.createNamedQuery("destroyColleges", TakeSubject.class)
                        .setParameter("college_code", c.getCode())
                        .getResultList();
                for(TakeSubject college_takeSubject : college_takeSubjects) {
                    em.getTransaction().begin();
                    em.remove(college_takeSubject);
                    em.getTransaction().commit();
                }
            } catch (NoResultException e) {}


            List<Person> college_people = null;

            try {
                college_people = em.createNamedQuery("getAllCollegePeople", Person.class)
                        .setParameter("college_code", c.getCode())
                        .getResultList();
                for(Person college_person : college_people) {
                    em.getTransaction().begin();
                    em.remove(college_person);
                    em.getTransaction().commit();
                }
            } catch(NoResultException e) {}


            List<Subject> college_subjects = null;
            try {
                college_subjects = em.createNamedQuery("destroySubject", Subject.class)
                        .setParameter("college_code", c.getCode())
                        .getResultList();
                for(Subject college_subject : college_subjects) {
                    em.getTransaction().begin();
                    em.remove(college_subject);
                    em.getTransaction().commit();
                }
            }catch (NoResultException e) {}

            em.getTransaction().begin();
            em.remove(c);
            em.getTransaction().commit();
            em.close();

            request.getSession().setAttribute("flush", "大学を削除しました。");

            request.getSession().removeAttribute("college_id");

            response.sendRedirect(request.getContextPath() + "/colleges/index");
        }
    }

}
