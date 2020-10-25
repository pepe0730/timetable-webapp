package controllers.subjects;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.College;
import models.Person;
import models.Subject;
import models.validators.SubjectValidator;
import utils.DButil;

/**
 * Servlet implementation class SubjectsUpdateServlet
 */
@WebServlet("/subjects/update")
public class SubjectsUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectsUpdateServlet() {
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

            Subject s = em.find(Subject.class, (Integer)request.getSession().getAttribute("subject_id"));

            String name = request.getParameter("name");
            s.setName(name);

            Boolean subject_duplicate_check_flag = false;
            String code = request.getParameter("code");
            if (!code.equals(s.getCode())) {
                s.setCode(code);
                subject_duplicate_check_flag = true;
            }

            String teacher_code = request.getParameter("teacher_code");

            String college_code = request.getParameter("college_code");
            if (!college_code.equals(s.getCollege().getCode())) {
                subject_duplicate_check_flag = true;
            }

            String color = request.getParameter("color");
            s.setColor(color);

            //時間と曜日に値に変更があれば、重複チェックする
            Boolean time_duplicate_check_flag = false;
            String day_of_week = request.getParameter("day_of_week");
            if (!s.getDay_of_week().equals(day_of_week)) {
                time_duplicate_check_flag = true;
                s.setDay_of_week(day_of_week);
            }

            Integer time = Integer.parseInt(request.getParameter("time"));
            if (s.getTime() != time) {
                time_duplicate_check_flag = true;
                s.setTime(time);
            }


            String description = request.getParameter("description");
            s.setDescription(description);

            Integer open_flag = Integer.parseInt(request.getParameter("open_flag"));
            s.setOpen_flag(open_flag);

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            s.setUpdated_at(currentTime);

            List<String> errors = SubjectValidator.validate(s, teacher_code, college_code, subject_duplicate_check_flag);

            if(!teacher_code.equals(s.getTeacher().getCode()) && !teacher_code.equals("")) {
                Person p = null;
                try {
                    p = em.createNamedQuery("getTeacher", Person.class)
                            .setParameter("teacher_code", teacher_code)
                            .getSingleResult();
                } catch( Exception e) {}

                if (p != null) {
                    s.setTeacher(p);
                } else {
                    errors.add("このコードの教授は存在しません");
                }
            }
            if (time_duplicate_check_flag) {
                Subject r_subject = null;
                try {
                    r_subject = em.createNamedQuery("checkRegisteredDateaAndTime", Subject.class)
                                           .setParameter("teacher_code", s.getTeacher().getCode())
                                           .setParameter("time", s.getTime())
                                           .setParameter("day_of_week", s.getDay_of_week())
                                           .getSingleResult();
                } catch (NoResultException  e) {}

                if (r_subject != null) {
                    errors.add("選択した時限・曜日にはすでに担当講義が存在します。");
                }
            }
            if (!college_code.equals(s.getCollege().getCode()) && !college_code.equals("")) {
                College c = null;
                try {
                    c = em.createNamedQuery("getCollege", College.class)
                            .setParameter("code", college_code)
                            .getSingleResult();
                }catch(Exception e) {}

                if (c != null) {
                    s.setCollege(c);
                } else {
                    errors.add("このコードの大学は存在しません");
                }

                Person login_teacher = (Person)request.getSession().getAttribute("login_person");
                String t_c_st_code =  login_teacher.getCollege().getCode().substring(0, 4);
                String c_st_code = college_code.substring(0, 4);
                if (!c_st_code.equals(t_c_st_code)) {
                    errors.add("操作対象外です。大学コードを確認してください");
                }
            }

            if (errors.size() > 0) {
                em.close();
                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("errors", errors);
                request.setAttribute("subject", s);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/subjects/edit.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.getTransaction().commit();
                request.getSession().setAttribute("flush", "更新が完了しました。");
                em.close();

                request.getSession().removeAttribute("subject_id");

                response.sendRedirect(request.getContextPath() + "/subjects/index");
            }

        }

    }

}
