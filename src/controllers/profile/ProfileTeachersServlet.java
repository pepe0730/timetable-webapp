package controllers.profile;

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
 * Servlet implementation class ProfileTeachersServlet
 */
@WebServlet("/profile/teachers")
public class ProfileTeachersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileTeachersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DButil.createEntityManager();

        Person p = (Person)request.getSession().getAttribute("login_person");

        request.setAttribute("person", p);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/people/teachers/profile.jsp");
        rd.forward(request, response);
    }

}
