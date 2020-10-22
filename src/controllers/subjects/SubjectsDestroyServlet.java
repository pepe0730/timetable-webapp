package controllers.subjects;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Subject;
import utils.DButil;

/**
 * Servlet implementation class SubjectsDestroyServlet
 */
@WebServlet("/subjects/destroy")
public class SubjectsDestroyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectsDestroyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = request.getParameter("_token");
        if (_token != null && _token.equals("")) {
            EntityManager em = DButil.createEntityManager();
            Subject s = em.find(Subject.class, (Integer)request.getSession().getAttribute("subject_id"));

            em.getTransaction().begin();
            em.remove(s);
            em.getTransaction().commit();
            em.close();

            request.getSession().setAttribute("flush", "講義を1件削除しました。");
            request.getSession().removeAttribute("subject_id");

            response.sendRedirect(request.getContextPath() + "/subjects/index");
        }
    }

}
