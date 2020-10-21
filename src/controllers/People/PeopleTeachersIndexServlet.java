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
 * Servlet implementation class PeopleTeachersIndexServlet
 */
@WebServlet("/people/teachers/index")
public class PeopleTeachersIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PeopleTeachersIndexServlet() {
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
        List<Person> teachers = null;
        try {
            teachers = em.createNamedQuery("getAllTeachers", Person.class)
                    .setFirstResult(30 * (page - 1))
                    .setMaxResults(30)
                    .getResultList();
        } catch (Exception e){}

        long teachers_count = em.createNamedQuery("getAllTeacherCount", Long.class)
                                .getSingleResult();

        em.close();

        request.setAttribute("page", page);
        request.setAttribute("teachers", teachers);
        request.setAttribute("teachers_count", teachers_count);

        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/people/teachers/index.jsp");
        rd.forward(request, response);

    }

}
