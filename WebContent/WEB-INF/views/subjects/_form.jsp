<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="form-group row">
    <label class="col-2 col-form-label" for="code">講義コード :</label>
    <div class="col-8">
        <input type="text" class="form-control" name="code"
            value="${subject.code}" >
    </div>
</div>

<div class="form-group row">
    <label class="col-2 col-form-label" for="code">講義名 :</label>
    <div class="col-8">
        <input type="text" class="form-control" name="name"
            value="${subject.name}">
    </div>
</div>
<div class="form-group row">
    <label class="col-2 col-form-label" for="teacher_name">担当教授 :</label>
    <div class="col-8">
        <input type="text" class="form-control" name="teacher_name"
            value="${subject.teacher.name}">
    </div>
</div>
<div class="form-group row">
    <label class="col-2 col-form-label" for="college_code">大学コード :
    </label>
    <div class="col-8">
        <input type="text" class="form-control" name="college_code"
            value="${subject.college.code}">
    </div>
</div>


<div class="form-group row">
    <label class="col-2 col-form-label" for="color">カラー : </label>
    <div class="col-3">
        <select class="form-control" name="color">
        <option value="red">赤</option>
        <option value="blue">青</option>
        <option value="yellow">黄</option>
        <option value="green">緑</option>
        <option value="yellow_green">黄緑</option>
        <option value="purple">紫</option>
        <option value="grey">グレー</option>
        <option value="brown">茶色</option>
        </select>
    </div>
</div>

<div class="form-group row">
    <label class="col-2 col-form-label" for="day_of_week">開講曜日 : </label>
    <div class="col-3">
        <select class="form-control" name="day_of_week">
        <option value="monday">月曜日</option>
        <option value="tuesday">火曜日</option>
        <option value="wednesday">水曜日</option>
        <option value="thursday">木曜日</option>
        <option value="friday">金曜日</option>
        <option value="saturday">土曜日</option>
        </select>
    </div>
</div>

<div class="form-group row">
    <label class="col-2 col-form-label" for="time">開講時限 : </label>
    <div class="col-3">
        <select class="form-control" name="time">
        <option value="monday">1限</option>
        <option value="tuesday">2限</option>
        <option value="wednesday">3限</option>
        <option value="thursday">4限</option>
        <option value="friday">5限</option>
        <option value="saturday">6限</option>
        <option value="saturday">7限</option>
        <option value="saturday">8限</option>
        </select>
    </div>
</div>

<div class="form-group row">
    <label class="col-2 col-form-label" for="description">講義説明: </label>
    <div class="col-10">
        <textarea class="form-control" rows="7" name="description" value="${subject.description}"></textarea>
    </div>
</div>
<input type="hidden" name="_token" value="${_token}">
