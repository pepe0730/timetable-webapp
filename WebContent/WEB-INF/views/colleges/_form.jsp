<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="form-group row">
    <label class="col-md-2 col-12 col-form-label" for="code">大学コード :</label>
    <div class="col-md-10 col-12">
        <input type="text" class="form-control" name="code"
            value="${college.code}" placeholder="管理職の場合は00000000">
    </div>
</div>
<div class="form-group row">
    <label class="col-md-2 col-12 col-form-label" for="name">大学名 :</label>
    <div class="col-md-10 col-12">
        <input type="text" class="form-control" name="name"
            value="${college.name}">
    </div>
</div>
<div class="form-group row">
    <label class="col-md-2 col-12 col-form-label" for="undergraduate_name">学部名 :
    </label>
    <div class="col-md-10 col-12">
        <input type="text" class="form-control" name="undergraduate_name"
            value="${college.undergraduate_name}">
    </div>
</div>
<div class="form-group row">
    <label class="col-md-2 col-12 col-form-label" for="department_name">学科名 : </label>
    <div class="col-md-10 col-12">
        <input type="text" class="form-control" name="department_name"
             value="${college.department_name}"/>
    </div>
</div>
<input type="hidden" name="_token" value="${_token}">
