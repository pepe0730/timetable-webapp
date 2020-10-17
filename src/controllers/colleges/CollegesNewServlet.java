package controllers.colleges;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.College;

/**
 * Servlet implementation class CollegesNewServlet
 */
@WebServlet("/colleges/new")
public class CollegesNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CollegesNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().setAttribute("_token", request.getSession().getId());
        College c = new College();
        request.setAttribute("college", c);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/colleges/new.jsp");
        rd.forward(request, response);

    }

}
