package models.validators;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import models.Subject;
import utils.DButil;

public class SubjectValidator {
    public static List<String> validate(Subject s, String teacher_code, String college_code, Boolean subject_duplicate_check_flag) {

        List<String> errors = new ArrayList<String>();

        String name_error = _validateName(s.getName());
        if (!name_error.equals("")) {
            errors.add(name_error);
        }

        String code_error = _validateCode(s.getCode(), college_code, subject_duplicate_check_flag);
        if (!code_error.equals("")) {
            errors.add(code_error);
        }

        String teacher_code_error = _validateTeacherCode(teacher_code);
        if (!teacher_code_error.equals("")) {
            errors.add(teacher_code_error);
        }

        String college_code_error = _validateCollegeCode(college_code);
        if (!college_code_error.equals("")) {
            errors.add(college_code_error);
        }

        return errors;
    }

    private static String _validateName (String name) {
        if (name.equals("")) {
            return "講義名を入力してください";
        }
        return "";
    }

    private static String _validateCode(String code, String college_code, Boolean subject_duplicate_check_flag) {
        if (code.equals("")) {
            return "講義コードを入力してください";
        }

        if (subject_duplicate_check_flag) {
            EntityManager em = DButil.createEntityManager();
            Subject duplicate_subject = null;

            try {
                duplicate_subject = em.createNamedQuery("checkRegisteredSubject", Subject.class)
                        .setParameter("code", code)
                        .setParameter("college_code", college_code)
                        .getSingleResult();
            } catch (Exception e) {}

            em.close();

            if (duplicate_subject != null) {
                return "大学コードと講義コードの組み合わせがすでに存在します。";
            }
        }
        return "";
    }

    private static String _validateTeacherCode (String teacher_code) {
        if (teacher_code.equals("")) {
            return "教授コードを入力してください";
        }
        return "";
    }

    private static String _validateCollegeCode (String college_code) {
        if (college_code.equals("")) {
            return "大学コードを入力してください";
        }
        return "";
    }

}
