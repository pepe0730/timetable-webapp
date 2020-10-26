package controllers.colleges;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.College;
import utils.DButil;

/**
 * Servlet implementation class CollegesShowServlet
 */
@WebServlet("/colleges/show")
public class CollegesShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CollegesShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DButil.createEntityManager();

        College c = em.find(College.class, Integer.parseInt(request.getParameter("id")));

        em.close();

        request.setAttribute("college", c);
        request.setAttribute("_token", request.getSession().getId());
        request.getSession().setAttribute("college_id", c.getId());

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/colleges/show.jsp");
        rd.forward(request, response);


    }

}
