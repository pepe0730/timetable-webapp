package controllers.colleges;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.College;
import utils.DButil;

/**
 * Servlet implementation class CollegesDestroyServlet
 */
@WebServlet("/colleges/destroy")
public class CollegesDestroyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CollegesDestroyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = request.getParameter("_token");
        if (_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DButil.createEntityManager();

            College c = em.find(College.class, (Integer)request.getSession().getAttribute("college_id"));

            em.getTransaction().begin();
            em.remove(c);
            em.getTransaction().commit();
            em.close();

            request.getSession().removeAttribute("college_id");

            response.sendRedirect(request.getContextPath() + "/colleges/index");
        }
    }

}
