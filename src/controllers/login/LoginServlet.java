package controllers.login;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Person;
import utils.DButil;
import utils.EncryptUtil;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("_token", request.getSession().getId());
        request.setAttribute("hasError", false);
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login/login.jsp");
        rd.forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Boolean check_result = false;
        String code = request.getParameter("code");
        String college_code = request.getParameter("college_code");
        String plain_pass = request.getParameter("password");

        Person p = null;

        if (code != null && !code.equals("") && college_code != null && !college_code.equals("") && plain_pass != null && !plain_pass.equals("")) {
            EntityManager em = DButil.createEntityManager();

            String password = EncryptUtil.getPasswordEncrypt(plain_pass,
                    (String)this.getServletContext().getAttribute("pepper"));

            try {
                p = em.createNamedQuery("checkLoginCodeAndPassword", Person.class)
                                        .setParameter("code", code)
                                        .setParameter("college_code", college_code)
                                        .setParameter("pass", password)
                                        .getSingleResult();
            } catch (NoResultException ex){}

            em.close();

            if (p != null) {
                check_result = true;
            }

            if (!check_result) {
                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("hasError", true);
                request.setAttribute("code", code);
                request.setAttribute("college_code", college_code);
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login/login.jsp");
                rd.forward(request, response);
            } else {
                request.getSession().setAttribute("login_person", p);
                request.getSession().setAttribute("flush", "ログインしました。");

                if (p.getAuthority() == 2) {
                    response.sendRedirect(request.getContextPath() + "/admins/");
                } else if(p.getAuthority() == 1) {
                    response.sendRedirect(request.getContextPath() + "/teachers/");
                } else if (p.getAuthority() == 0) {
                    response.sendRedirect(request.getContextPath() + "/students/");
                }
            }
        }


    }

}
