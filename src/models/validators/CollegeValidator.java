package models.validators;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import models.College;
import utils.DButil;

public class CollegeValidator {


    public static List<String> validate (College c, Boolean code_duplicate_check_flag, Boolean college_duplicate_check_flag) {
        List <String> errors = new ArrayList<String>();

        String code_error = _validationCode(c.getCode(), code_duplicate_check_flag);
        if (!code_error.equals("")) {
            errors.add(code_error);
        }

        String college_error = _checkCollege(c, college_duplicate_check_flag);
        if (!college_error.equals("")) {
            errors.add(college_error);
        }

        String name_error = _validationName(c.getName());
        if (!name_error.equals("")) {
            errors.add(name_error);
        }

        String undergraduate_name_error = _validationUndergraduate_name(c.getUndergraduate_name());
        if (!undergraduate_name_error.equals("")) {
            errors.add(undergraduate_name_error);
        }

        String department_name_error = _validationDepartment_name(c.getDepartment_name());
        if (!department_name_error.equals("")) {
            errors.add(department_name_error);
        }

        return errors;
    }

    private static String _validationCode (String code, Boolean code_duplicate_check_flag) {
        if (code == null || code.equals("")) {
            return "大学コードを入力してください";
        }

        if (code_duplicate_check_flag) {
            EntityManager em = DButil.createEntityManager();
            Long code_count = (Long)em.createNamedQuery("checkRegisteredCollegeCode", Long.class)
                                        .setParameter("code", code)
                                        .getSingleResult();

            if (code_count != 0) {
                return "この大学コードはすでに登録されています";
            }
        }

        return "";
    }

    private static String _checkCollege (College c, Boolean college_duplicate_check_flag) {
        if (college_duplicate_check_flag) {
            EntityManager em = DButil.createEntityManager();
            Long colleges_count = (Long)em.createNamedQuery("checkRegisteredCollege", Long.class)
                                        .setParameter("name", c.getName())
                                        .setParameter("undergraduate_name", c.getUndergraduate_name())
                                        .setParameter("department_name", c.getDepartment_name())
                                        .getSingleResult();

            if (colleges_count != 0) {
                return "この大学・学部・学科はすでに登録されています";
            }
        }
        return "";
    }

    private static String _validationName (String name) {
        if (name == null || name.equals("")) {
            return "大学名を入力してください";
        }

        return "";
    }

    private static String _validationUndergraduate_name (String undergraduate_name) {
        if (undergraduate_name == null || undergraduate_name.equals("")) {
            return "学部名を入力してください";
        }

        return "";
    }

    private static String _validationDepartment_name(String department_name) {
        if (department_name == null || department_name.equals("")) {
            return "学科名を入力してください";
        }
        return "";
    }
}
