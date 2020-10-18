<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../../layout/adminsApp.jsp">
    <c:param name="content">
        <div class="main">
            <div class="container">
                <div class="heading-wrapper">
                    <h2><i class="fas fa-users-cog"></i>新規管理者登録</h2>
                </div>
                <c:if test="${errors != null}">
                    <div id="flush_error">
                        <div class="error-content">
                            <h3 class="font-weight-bold"><span class="mr-3 badge badge-danger">Error</span>入力内容にエラーがあります</h3>
                            <c:forEach var="error" items="${errors}">
                                <p><i class="fas fa-check mr-3"></i><c:out value="${error}" /></p>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
                <form class="text-form" method="POST" action="<c:url value='/people/create' />">
                    <h3>Admins create</h3>
                    <div class="form-group row">
                        <label class="col-2 col-form-label" for="name">氏名 :</label>
                        <div class="col-10">
                            <input type="text" class="form-control" name="name" value="${person.name}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-2 col-form-label" for="code">個人コード :</label>
                        <div class="col-10">
                            <input type="text" class="form-control" name="code" value="${person.code}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-2 col-form-label" for="college_code">大学コード : </label>
                        <div class="col-10">
                            <input type="text" class="form-control" name="college_code" value="${person.college.code}" placeholder="管理職の場合は00000000">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-2 col-form-label" for="password">パスワード : </label>
                        <div class="col-10">
                            <input type="password" class="form-control" name="password" />
                        </div>
                    </div>
                    <input type="hidden" name="authority" value=2>
                    <input type="hidden" name="_token" value="${_token}">
                    <button class="btn btn-primary"type="submit">新規作成</button>
                </form>
            </div>
        </div>
    </c:param>
</c:import>