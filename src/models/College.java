package models;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table (name = "colleges")
@NamedQueries({
    @NamedQuery(
            name = "getAllColleges",
            query = "SELECT c FROM College AS c ORDER BY c.id DESC"
            ),
    @NamedQuery(
            name = "getAllCollegeCount",
            query = "SELECT COUNT(c) FROM College AS c"
            ),
    @NamedQuery(
            name = "checkRegisteredCollegeCode",
            query = "SELECT COUNT(c) FROM College AS c WHERE c.code = :code"
            ),
    @NamedQuery(
            name = "checkRegisteredCollege",
            query = "SELECT COUNT(c) FROM College AS c WHERE c.name = :name AND c.undergraduate_name = :undergraduate_name AND c.department_name = :department_name"
            ),
    @NamedQuery(
            name = "getPersonCollege",
            query = "SELECT c FROM College AS c WHERE c.code = :code"
            )
})
@Entity
public class College {
    @Id
    @Column (name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column (name = "code", nullable = false, length = 8, unique = true)
    private String code;

    @Column (name = "name", nullable = false)
    private String name;

    @Column (name = "undergraduate_name", nullable = false)
    private String undergraduate_name;

    @Column (name = "department_name", nullable = false)
    private String department_name;

    @Column (name = "created_at", nullable = false)
    private Timestamp created_at;

    @Column (name = "updated_at", nullable = false)
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

    public String getUndergraduate_name() {
        return undergraduate_name;
    }

    public void setUndergraduate_name(String undergraduate_name) {
        this.undergraduate_name = undergraduate_name;
    }

    public String getDepartment_name() {
        return department_name;
    }

    public void setDepartment_name(String department_name) {
        this.department_name = department_name;
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
