package controllers.registerdSubjects;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Subject;
import utils.DButil;

/**
 * Servlet implementation class RegisterdSubjectsShowServlet
 */
@WebServlet("/registeredSubjects/show")
public class RegisteredSubjectsShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisteredSubjectsShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DButil.createEntityManager();
        Subject s = em.find(Subject.class, Integer.parseInt(request.getParameter("id")));

        request.getSession().setAttribute("subject_id", s.getId());
        request.setAttribute("subject", s);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/registeredSubjects/show.jsp");
        rd.forward(request, response);
    }

}
