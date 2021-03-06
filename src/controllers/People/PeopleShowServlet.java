package controllers.people;

import java.io.IOException;

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
 * Servlet implementation class PeopleShowServlet
 */
@WebServlet("/people/show")
public class PeopleShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PeopleShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DButil.createEntityManager();

        Person p = em.find(Person.class, Integer.parseInt(request.getParameter("id")));
        em.close();

        request.setAttribute("person", p);
        request.setAttribute("_token", request.getSession().getId());
        request.getSession().setAttribute("person_id", p.getId());


        //authorityによって分岐
        Integer authority = Integer.parseInt(request.getParameter("authority"));
        RequestDispatcher rd;
        if (authority == 2) {
            rd = request.getRequestDispatcher("/WEB-INF/views/people/admins/show.jsp");
        } else if(authority == 1) {
            rd = request.getRequestDispatcher("/WEB-INF/views/people/teachers/show.jsp");
        } else {
            rd = request.getRequestDispatcher("/WEB-INF/views/people/students/show.jsp");
        }
        rd.forward(request, response);
    }

}
