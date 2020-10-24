package controllers.takeSubjects;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Person;
import models.Subject;
import utils.DButil;

/**
 * Servlet implementation class TakeSubjectsIndexServlet
 */
@WebServlet("/takeSubjects/index")
public class TakeSubjectsIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TakeSubjectsIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DButil.createEntityManager();

        Person login_person = (Person)request.getSession().getAttribute("login_person");

        List<Subject> everyone_subjects = em.createNamedQuery("getAllCollegeSubjects", Subject.class)
                                                .setParameter("college_code", login_person.getCollege().getCode())
                                                .getResultList();

        List<Subject> u_subjects = em.createNamedQuery("getUnderSubjects", Subject.class)
                                                .setParameter("college_code", login_person.getCollege().getCode())
                                                .getResultList();

        List<Subject> d_subjects = em.createNamedQuery("getDepartmentSubjects", Subject.class)
                                                .setParameter("college_code", login_person.getCollege().getCode())
                                                .getResultList();

        long registeredSubjects_count = em.createNamedQuery("getMyTakeSubjectsCount", Long.class)
                                                        .setParameter("student_code", login_person.getCode())
                                                        .getSingleResult();

        request.setAttribute("e_subjects", everyone_subjects);
        request.setAttribute("u_subjects", u_subjects);
        request.setAttribute("d_subjects", d_subjects);
        request.setAttribute("subjects_count", registeredSubjects_count);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/takeSubjects/index.jsp");
        rd.forward(request, response);


    }

}
