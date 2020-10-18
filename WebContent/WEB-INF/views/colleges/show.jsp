<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../layout/adminsApp.jsp">
    <c:param name="content">
        <div class="main">
            <div class="container">
                <div class="heading-wrapper">
                    <h2>
                        <i class="fas fa-school"></i>大学詳細
                    </h2>
                </div>
                <c:choose>
                    <c:when test="${college != null}">
                        <div class="show-wrapper">
                            <div class="data-wrapper">
                                <h3>College data</h3>
                                <div class="data-contents row">
                                    <div class="data col-md-5">
                                        <p>大学名：</p>
                                    </div>
                                    <div class="data col-md-6">
                                        <c:out value="${college.name}" />
                                    </div>
                                    <div class="data col-md-5">
                                        <p>学部名：</p>
                                    </div>
                                    <div class="data col-md-6">
                                        <c:out value="${college.undergraduate_name}" />
                                    </div>
                                    <div class="data col-md-5">
                                        <p>学科名：</p>
                                    </div>
                                    <div class="data col-md-6">
                                        <c:out value="${college.department_name}" />
                                    </div>
                                    <div class="data col-md-5">
                                        <p>コード：</p>
                                    </div>
                                    <div class="data col-md-6">
                                        <c:out value="${college.code}" />
                                    </div>
                                </div>
                            </div>
                            <div class="btn-wrapper show-btn-wrapper">
                                <h3 class="font-weight-bold text-center">Action</h3>
                                <form method="POST" action="<c:url value='/colleges/destroy' />">
                                <a class="btn btn-info" href="<c:url value='/colleges/edit?id=${college.id}' />">大学情報の編集</a>
                                    <input type="hidden" name="_token" value="${_token}">
                                    <button class="btn btn-dark" type="submit">この大学を削除</button>
                                </form>
                            </div>
                        </div>
                        <div class="show-date-wrapper">
                            <div class="date-data">
                                <h3 class="font-weight-bold">作成日時</h3><span class="badge badge-success">Create</span>
                                <p class="text-success"><c:out value="${college.created_at}" /></p>
                            </div>
                            <div class="date-data">
                                <h3 class="font-weight-bold">更新日時</h3><span class="badge badge-danger">Update</span>
                                <p class="text-danger"><c:out value="${college.updated_at}" /></p>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <h3>お探しの大学情報は見つかりませんでした。</h3>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </c:param>
</c:import>
