package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table (name = "takesubject")

@NamedQueries({
    @NamedQuery(
            name = "getMyTakeSubjects",
            query = "SELECT t FROM TakeSubject AS t WHERE t.person.code = :student_code"
            ),
    @NamedQuery(
            name = "getMyTakeSubjectsCount",
            query = "SELECT COUNT(t) FROM TakeSubject AS t WHERE t.person.code = :student_code"
            ),
    @NamedQuery(
            name = "getRegisteredSubject",
            query = "SELECT t FROM TakeSubject AS t WHERE t.person.code = :student_code AND t.subject.code = :subject_code"
            ),
    @NamedQuery(
            name = "checkRegisteredTimeAndDate",
            query = "SELECT t FROM TakeSubject AS t WHERE t.person.code = :student_code AND t.subject.day_of_week = :day_of_week AND t.subject.time = :time"
            ),
    @NamedQuery(
            name = "destroySubjects",
            query = "SELECT t FROM TakeSubject AS t WHERE t.subject.code = :code AND t.subject.college.code = :college_code"
            )
})
@Entity
public class TakeSubject {
    @Id
    @Column (name = "id", nullable = false)
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn (name = "person_id", nullable = false)
    private Person person;

    @ManyToOne
    @JoinColumn (name = "subject_id", nullable = false)
    private Subject subject;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }
}
