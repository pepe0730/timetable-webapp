package controllers.People;

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
import models.Person;
import models.validators.PersonValidator;
import utils.DButil;
import utils.EncryptUtil;

/**
 * Servlet implementation class PeopleUpdateServlet
 */
@WebServlet("/people/update")
public class PeopleUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PeopleUpdateServlet() {
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
            Person p = em.find(Person.class, (Integer)request.getSession().getAttribute("person_id"));

            Boolean code_duplicate_check_flag = true;
            if (p.getCode().equals(request.getParameter("code"))) {
                code_duplicate_check_flag = false;
            } else {
                p.setCode(request.getParameter("code"));
            }

            //パスワード欄に入力ありの場合は入力チェック
            Boolean password_check_flag = true;
            String password = request.getParameter("password");
            if (password == null || password.equals("")) {
                password_check_flag = false;
            } else {
                p.setPassword(
                        EncryptUtil.getPasswordEncrypt(
                                password,
                                (String)this.getServletContext().getAttribute("pepper")
                                )
                        );
            }


            p.setName(request.getParameter("name"));
            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            p.setUpdated_at(currentTime);

            List<String> errors = PersonValidator.validate(p, request.getParameter("college_code"), code_duplicate_check_flag, password_check_flag);

            if (!request.getParameter("college_code").equals("") || !p.getCollege().getCode().equals(request.getParameter("college_code"))) {
              //入力されたコードに該当するcollegeを取得
                College c = null;
                try {
                    c = em.createNamedQuery("getPersonCollege", College.class)
                            .setParameter( "code", request.getParameter("college_code"))
                            .getSingleResult();
                } catch (Exception e) {}

                if (c == null) {
                    errors.add("この大学コードは存在しません。");
                } else {
                    p.setCollege(c);
                }
            }

            if (errors.size() > 0) {
                em.close();
                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("person", p);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/people/admins/edit.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.getTransaction().commit();
                em.close();

                request.getSession().setAttribute("flush", "更新しました");

                request.getSession().removeAttribute("person_id");
                response.sendRedirect(request.getContextPath() + "/admins/index.html");
            }


        }
    }

}
