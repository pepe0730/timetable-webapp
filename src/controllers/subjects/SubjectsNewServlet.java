package controllers.subjects;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Subject;

/**
 * Servlet implementation class SubjectsNewServlet
 */
@WebServlet("/subjects/new")
public class SubjectsNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectsNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = request.getSession().getId();
        Subject s = new Subject();

        request.setAttribute("_token", _token);
        request.setAttribute("subject", s);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/subjects/new.jsp");
        rd.forward(request, response);
    }

}
