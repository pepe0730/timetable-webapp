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
 * Servlet implementation class CollegesUpdateServlet
 */
@WebServlet("/colleges/update")
public class CollegesUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CollegesUpdateServlet() {
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

            College c = em.find(College.class, (Integer)(request.getSession().getAttribute("college_id")));


            Boolean code_duplicate_check_flag = true;
            //codeの入力内容に変更があれば、重複チェックと入力チェック
            if (c.getCode().equals(request.getParameter("code"))) {
                code_duplicate_check_flag = false;
            } else {
                c.setCode(request.getParameter("code"));
            }

            Boolean college_duplicate_check_flag = true;
            //大学名・学部名・学科名のいずれかに変更があれば、重複チェックを行う。
            if(c.getName().equals(request.getParameter("name")) && c.getUndergraduate_name().equals(request.getParameter("undergraduate_name")) && c.getDepartment_name().equals(request.getParameter("department_name"))) {
                college_duplicate_check_flag = false;
            } else {
                c.setName(request.getParameter("name"));
                c.setUndergraduate_name(request.getParameter("undergraduate_name"));
                c.setDepartment_name(request.getParameter("department_name"));
            }

            List<String> errors = CollegeValidator.validate(c, code_duplicate_check_flag, college_duplicate_check_flag);

            if (errors.size() != 0) {
                em.close();
                request.getSession().setAttribute("_token", request.getSession().getId());
                request.setAttribute("errors", errors);
                request.setAttribute("college", c);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/colleges/edit.jsp");
                rd.forward(request, response);
            } else {
                Timestamp currentTime = new Timestamp(System.currentTimeMillis());
                c.setUpdated_at(currentTime);

                em.getTransaction().begin();
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "更新が完了しました。");

                request.getSession().removeAttribute("employee_id");
                response.sendRedirect(request.getContextPath() + "/colleges/index");
            }
        }
    }
}
