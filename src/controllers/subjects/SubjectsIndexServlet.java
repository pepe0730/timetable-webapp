package controllers.subjects;

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
 * Servlet implementation class SubjectsIndexServlet
 */
@WebServlet("/subjects/index")
public class SubjectsIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectsIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DButil.createEntityManager();

        Person teacher = (Person)request.getSession().getAttribute("login_person");
        int page = 1;

        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch(NumberFormatException ex) {}

        List<Subject> e_subjects = null;
        List<Subject> u_subjects = null;
        List<Subject> d_subjects = null;
        try {
            e_subjects = em.createNamedQuery("getAllCollegeSubjects", Subject.class)
                                   .setParameter("college_code", teacher.getCollege().getCode())
                                   .setFirstResult(30 * (page - 1))
                                   .setMaxResults(30)
                                   .getResultList();

            u_subjects = em.createNamedQuery("getUnderSubjects", Subject.class)
                                    .setParameter("college_code", teacher.getCollege().getCode())
                                    .getResultList();

            d_subjects = em.createNamedQuery("getDepartmentSubjects", Subject.class)
                                    .setParameter("college_code", teacher.getCollege().getCode())
                                    .getResultList();
        } catch (Exception e) {}

        long subjects_count = em.createNamedQuery("getAllCollegeSubjectCount", Long.class)
                                    .setParameter("college_code", teacher.getCollege().getCode())
                                    .getSingleResult();

        em.close();

        request.setAttribute("page", page);
        request.setAttribute("e_subjects", e_subjects);
        request.setAttribute("u_subjects", u_subjects);
        request.setAttribute("d_subjects", d_subjects);
        request.setAttribute("subjects_count", subjects_count);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/subjects/index.jsp");
        rd.forward(request, response);
    }

}
