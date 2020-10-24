package models;

import java.sql.Timestamp;

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

@Table (name = "subject")
@NamedQueries({
    @NamedQuery(
            name = "getAllCollegeSubjects",
            query = "SELECT s FROM Subject AS s WHERE SUBSTRING(s.college.code,1,4) = SUBSTRING(:college_code,1,4) AND s.open_flag = 2 ORDER BY s.id DESC"
            ),
    @NamedQuery(
            name = "getAllCollegeSubjectCount",
            query = "SELECT COUNT(s) FROM Subject AS s WHERE SUBSTRING(s.college.code,1,4) = SUBSTRING(:college_code,1,4)"
            ),
    @NamedQuery(
            name = "getUnderSubjects",
            query = "SELECT s FROM Subject AS s WHERE SUBSTRING(s.college.code,1,4) = SUBSTRING(:college_code,1,4) AND s.open_flag = 1 ORDER BY s.id DESC"
            ),
    @NamedQuery(
            name = "getDepartmentSubjects",
            query = "SELECT s FROM Subject AS s WHERE SUBSTRING(s.college.code,1,4) = SUBSTRING(:college_code,1,4) AND s.open_flag = 0 ORDER BY s.id DESC"
            ),
    @NamedQuery(
            name = "checkRegisteredSubject",
            query = "SELECT s FROM Subject AS s WHERE s.code = :code AND s.college.code = :college_code"
            ),
    @NamedQuery(
            name = "getAllMyClassSubjects",
            query = "SELECT s FROM Subject AS s WHERE s.teacher.code = :teacher_code"
            )
})
@Entity
public class Subject {

    @Id
    @Column (name = "id")
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column (name = "code", nullable = false, length=11)
    private String code;

    @Column (name = "name", nullable = false)
    private String name;

    @ManyToOne
    @JoinColumn (name = "college_id", nullable = false)
    private College college;

    @ManyToOne
    @JoinColumn (name = "teacher_id", nullable = false)
    private Person teacher;

    @Column (name = "description")
    private String description;

    @Column (name = "color", nullable = false)
    private String color;

    @Column (name = "time", nullable = false)
    private Integer time;

    @Column (name = "day_of_week", nullable = false)
    private String day_of_week;

    @Column (name = "open_flag")
    private Integer open_flag;

    @Column (name = "created_at", nullable = false)
    private Timestamp created_at;

    @Column (name = "updated_at", nullable= false)
    private Timestamp updated_at;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public College getCollege() {
        return college;
    }

    public void setCollege(College college) {
        this.college = college;
    }

    public Person getTeacher() {
        return teacher;
    }

    public void setTeacher(Person teacher) {
        this.teacher = teacher;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Integer getTime() {
        return time;
    }

    public void setTime(Integer time) {
        this.time = time;
    }

    public String getDay_of_week() {
        return day_of_week;
    }

    public void setDay_of_week(String day_of_week) {
        this.day_of_week = day_of_week;
    }

    public Integer getOpen_flag() {
        return open_flag;
    }

    public void setOpen_flag(Integer open_flag) {
        this.open_flag = open_flag;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }



}
