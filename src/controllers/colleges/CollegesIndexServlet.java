package controllers.colleges;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class CollegesIndexServlet
 */
@WebServlet("/colleges/index")
public class CollegesIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CollegesIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DButil.createEntityManager();

        int page=1;

        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch(NumberFormatException e){ }


        List<College> colleges = null;

        try {
            colleges = em.createNamedQuery("getAllColleges", College.class)
                    .setFirstResult(30 * (page - 1))
                    .setMaxResults(30)
                    .getResultList();
        } catch (Exception e) {}

        Long colleges_count = em.createNamedQuery("getAllCollegeCount", Long.class)
                                    .getSingleResult();

        request.setAttribute("page", page);
        request.setAttribute("colleges", colleges);
        request.setAttribute("colleges_count", colleges_count);

        if (request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/colleges/index.jsp");
        rd.forward(request, response);
    }

}
