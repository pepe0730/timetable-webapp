package controllers.people;

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
import utils.DButil;

/**
 * Servlet implementation class PeopleStudentsIndexServlet
 */
@WebServlet("/people/students/index")
public class PeopleStudentsIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PeopleStudentsIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DButil.createEntityManager();

        int page = 1;

        try {
           page = Integer.parseInt(request.getParameter("page"));
        } catch (Exception e){}
        List<Person> students = null;
        try {
            students = em.createNamedQuery("getAllStudents", Person.class)
                    .setFirstResult(30 * (page - 1))
                    .setMaxResults(30)
                    .getResultList();
        } catch (Exception e){}

        long students_count = em.createNamedQuery("getAllStudentCount", Long.class)
                                .getSingleResult();

        em.close();

        Person p = (Person)request.getSession().getAttribute("login_person");

        request.setAttribute("page", page);
        request.setAttribute("students", students);
        request.setAttribute("students_count", students_count);
        request.setAttribute("person", p);

        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/people/students/index.jsp");
        rd.forward(request, response);
    }

}
