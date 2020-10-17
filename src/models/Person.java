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

@Table (name = "people")
@NamedQueries({
    @NamedQuery(
            name = "checkRegisteredCode",
            query = "SELECT COUNT(p) FROM Person AS p WHERE p.code = :code"
            ),
    @NamedQuery(
            name = "checkLoginCodeAndPassword",
            query = "SELECT p FROM Person AS p WHERE p.code = :code AND p.password = :pass"
            ),
    @NamedQuery(
            name = "getAllAdmins",
            query = "SELECT p FROM Person AS p WHERE p.authority = 2 ORDER BY p.id DESC"
            ),
    @NamedQuery(
            name = "getAllTeachers",
            query = "SELECT p FROM Person AS p WHERE p.authority = 1 ORDER BY p.id DESC"
            ),
    @NamedQuery(
            name = "getAllStudents",
            query = "SELECT p FROM Person AS p WHERE p.authority = 0 ORDER BY p.id DESC"
            ),
    @NamedQuery(
            name =  "getAllAdminCount",
            query = "SELECT COUNT(p) FROM Person AS p WHERE p.authority = 2"
            ),
    @NamedQuery(
            name = "getAllTeacherCount",
            query = "SELECT COUNT(p) FROM Person AS p WHERE p.authority = 1"
            ),
    @NamedQuery(
            name = "getAllStudentCount",
            query = "SELECT COUNT(p) FROM Person AS p WHERE p.authority = 0"
            ),

})

@Entity
public class Person {
    @Id
    @Column (name = "id", nullable = false)
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column (name = "code" , nullable = false, length = 10, unique = true)
    private String code;

    @Column (name = "name", nullable = false)
    private String name;

    @ManyToOne
    @JoinColumn (name = "college_id", nullable = false)
    private College college;

    @Column (name = "password",  nullable = false, length = 64)
    private String password;

    @Column (name = "created_at", nullable = false)
    private Timestamp created_at;

    @Column (name = "updated_at", nullable = false)
    private Timestamp updated_at;

    @Column (name = "authority", nullable = false)
    private Integer authority;

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

    public String getPassword() {
        return password;
    }

    public void setPassword(String passward) {
        this.password = passward;
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

    public Integer getAuthority() {
        return authority;
    }

    public void setAuthority(Integer authority) {
        this.authority = authority;
    }
}
