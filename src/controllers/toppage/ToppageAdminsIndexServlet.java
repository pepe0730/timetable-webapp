package controllers.toppage;

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
 * Servlet implementation class ToppageAdminsIndexServlet
 */
@WebServlet("/admins/index.html")
public class ToppageAdminsIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToppageAdminsIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

        EntityManager em = DButil.createEntityManager();

        int page=1;

        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch(NumberFormatException e){ }


        List<Person> admins = em.createNamedQuery("getAllAdmins", Person.class)
                                    .setFirstResult(30 * (page -1))
                                    .setMaxResults(30)
                                    .getResultList();

        Long admins_count = em.createNamedQuery("getAllAdminCount", Long.class)
                                    .getSingleResult();

        request.setAttribute("page", page);
        request.setAttribute("admins", admins);
        request.setAttribute("admins_count", admins_count);

        if (request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/topPage/admins/index.jsp");
        rd.forward(request, response);





        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

}
