<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="form-group row">
    <label class="col-2 col-form-label" for="code">講義名 :</label>
    <div class="col-8">
        <input type="text" class="form-control" name="name"
            value="${subject.name}">
    </div>
</div>

<div class="form-group row">
    <label class="col-2 col-form-label" for="code">講義コード :</label>
    <div class="col-8">
        <input type="text" class="form-control" name="code"
            value="${subject.code}" >
    </div>
</div>

<div class="form-group row">
    <label class="col-2 col-form-label" for="teacher_code">教授コード :</label>
    <div class="col-8">
        <input type="text" class="form-control" name="teacher_code"
            value="${subject.teacher.code}">
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
        <option value=0>月曜日</option>
        <option value=1>火曜日</option>
        <option value=2>水曜日</option>
        <option value=3>木曜日</option>
        <option value=4>金曜日</option>
        <option value=5>土曜日</option>
        </select>
    </div>
</div>

<div class="form-group row">
    <label class="col-2 col-form-label" for="time">開講時限 : </label>
    <div class="col-3">
        <select class="form-control" name="time">
        <option value=0>1限</option>
        <option value=1>2限</option>
        <option value=2>3限</option>
        <option value=3>4限</option>
        <option value=4>5限</option>
        <option value=5>6限</option>
        <option value=6>7限</option>
        <option value=7>8限</option>
        </select>
    </div>
</div>

<div class="form-group row">
    <label class="col-2 col-form-label" for="description">講義説明 : </label>
    <div class="col-10">
        <textarea class="form-control" rows="7" name="description" value="${subject.description}"></textarea>
    </div>
</div>

<div class="form-group row">
    <label class="col-2 col-form-label" for="open_flag">開講範囲 : </label>
    <div class="col-5">
        <select class="form-control" name="open_flag">
        <option value=2>全学生</option>
        <option value=1>該当学部の生徒のみ</option>
        <option value=0>該当学科の生徒のみ</option>
        </select>
    </div>
</div>
<input type="hidden" name="_token" value="${_token}">