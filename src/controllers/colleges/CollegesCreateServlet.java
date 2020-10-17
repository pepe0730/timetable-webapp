package controllers.colleges;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.College;
import models.validators.CollegeValidator;
import utils.DButil;

/**
 * Servlet implementation class CollegesCreateServlet
 */
@WebServlet("/colleges/create")
public class CollegesCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CollegesCreateServlet() {
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

           College c = new College();
           c.setCode(request.getParameter("code"));
           c.setName(request.getParameter("name"));
           c.setUndergraduate_name(request.getParameter("undergraduate_name"));
           c.setDepartment_name(request.getParameter("department_name"));

           Timestamp currentTime = new Timestamp(System.currentTimeMillis());
           c.setCreated_at(currentTime);
           c.setUpdated_at(currentTime);

           List<String> errors = CollegeValidator.validate(c, true, true);
           if (errors.size() > 0) {
               em.close();

               request.setAttribute("_token", request.getSession().getId());
               request.setAttribute("errors", errors);
               request.setAttribute("college", c);
               RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/colleges/new.jsp");
               rd.forward(request, response);
           } else {
               em.getTransaction().begin();
               em.persist(c);
               em.getTransaction().commit();
               request.getSession().setAttribute("flush", "登録が完了しました。");
               em.close();

               response.sendRedirect(request.getContextPath() + "/colleges/index");
           }

        }
    }

}
