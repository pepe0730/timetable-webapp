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
import models.Subject;
import utils.DButil;

/**
 * Servlet implementation class ToppageTeachersIndexServlet
 */
@WebServlet("/teachers/index.html")
public class ToppageTeachersIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToppageTeachersIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        EntityManager em = DButil.createEntityManager();

        Person login_person = (Person)request.getSession().getAttribute("login_person");

        List<Subject> subjects = em.createNamedQuery("getAllMyClassSubjects", Subject.class)
                                        .setParameter("teacher_code", login_person.getCode())
                                        .getResultList();

        Subject subject_array[][];
        subject_array = new Subject[7][5];

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



        request.setAttribute("subject_array", subject_array);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/topPage/teachers/index.jsp");
        rd.forward(request, response);


    }

}
