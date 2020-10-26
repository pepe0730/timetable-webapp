package controllers.toppage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Person;
import models.Subject;
import models.TakeSubject;
import utils.DButil;
import utils.Date;

/**
 * Servlet implementation class ToppageStudentsIndexServlet
 */
@WebServlet("/students/index.html")
public class ToppageStudentsIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToppageStudentsIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DButil.createEntityManager();
        Person p = (Person)request.getSession().getAttribute("login_person");
        List<TakeSubject> takeSubjects = em.createNamedQuery("getMyTakeSubjects", TakeSubject.class)
                                                .setParameter("student_code", p.getCode())
                                                .getResultList();

        List<Subject> subjects =  new ArrayList<Subject>();
        for (TakeSubject takeSubject : takeSubjects) {
            subjects.add(takeSubject.getSubject());
        }

        Subject subject_array[][];
        subject_array = new Subject[9][5];

       for (Subject subject : subjects) {
           if (subject.getDay_of_week().equals("monday")) {
               subject_array[subject.getTime()][0] = subject;
           } else if (subject.getDay_of_week().equals("tuesday")) {
               subject_array[subject.getTime()][1] = subject;
           } else if (subject.getDay_of_week().equals("wednesday")) {
               subject_array[subject.getTime()][2] = subject;
           } else if (subject.getDay_of_week().equals("thursday")) {
               subject_array[subject.getTime()][3] = subject;
           } else if (subject.getDay_of_week().equals("friday")) {
               subject_array[subject.getTime()][4] = subject;
           } else if (subject.getDay_of_week().equals("saturday")) {
               subject_array[subject.getTime()][5] = subject;
           }

       }

       String day_of_week = Date.getDayOfTheWeek();

       request.setAttribute("subject_array", subject_array);
       request.setAttribute("day_of_week", day_of_week);

       if (request.getSession().getAttribute("flush") != null) {
           request.setAttribute("flush", request.getSession().getAttribute("flush"));
           request.getSession().removeAttribute("flush");
       }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/topPage/students/index.jsp");
        rd.forward(request, response);


    }

}
