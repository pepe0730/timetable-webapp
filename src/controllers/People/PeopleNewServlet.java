package controllers.people;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Person;

/**
 * Servlet implementation class PeopleNewServlet
 */
@WebServlet("/people/new")
public class PeopleNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PeopleNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().setAttribute("_token", request.getSession().getId());

        Person p = new Person();

        request.setAttribute("person", p);

        Integer authority = Integer.parseInt(request.getParameter("authority"));

        RequestDispatcher rd = null;;
        if (authority == 2) {
            rd = request.getRequestDispatcher("/WEB-INF/views/people/admins/new.jsp");
        } else if(authority == 1) {
            rd = request.getRequestDispatcher("/WEB-INF/views/people/teachers/new.jsp");
        } else if(authority == 0){
            rd = request.getRequestDispatcher("/WEB-INF/views/people/students/new.jsp");
        }
        rd.forward(request, response);


    }

}
