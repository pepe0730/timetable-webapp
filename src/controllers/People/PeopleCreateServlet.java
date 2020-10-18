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
 * Servlet implementation class PeopleCreateServlet
 */
@WebServlet("/people/create")
public class PeopleCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PeopleCreateServlet() {
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

            Person p = new Person();
            p.setCode(request.getParameter("code"));
            p.setName(request.getParameter("name"));
            p.setPassword(
                    EncryptUtil.getPasswordEncrypt(
                            request.getParameter("password"),
                            (String)this.getServletContext().getAttribute("pepper")
                    )
            );
            p.setAuthority(Integer.parseInt(request.getParameter("authority")));

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            p.setCreated_at(currentTime);
            p.setUpdated_at(currentTime);

            List<String> errors = PersonValidator.validate(p, request.getParameter("college_code"), true, true);

            if (!request.getParameter("college_code").equals("")) {
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
                request.getSession().setAttribute("_token", request.getSession().getId());
                request.setAttribute("errors", errors);
                request.setAttribute("person", p);
                //ログイン中のユーザーが管理者なら/admins/new.jspへ 教授なら/teachers/new.jspへ飛ばす
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/people/admins/new.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.persist(p);
                em.getTransaction().commit();
                request.getSession().setAttribute("flush", "登録が完了しました。");
                em.close();

                response.sendRedirect(request.getContextPath() + "/admins/index.html");

            }


        }

    }

}
