<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../layout/adminsApp.jsp">
    <c:param name="content">
        <div class="main">
            <div class="container">
                <h2>
                    <i class="fas fa-school"></i>大学詳細 コード
                </h2>
                <c:choose>
                    <c:when test="${college != null}">
                        <div class="row">
                            <div class="col-md-2">
                                <p>大学名：</p>
                            </div>
                            <div class="col-md-10">
                                <c:out value="${college.name}" />
                            </div>
                            <div class="col-md-2">
                                <p>学部名：</p>
                            </div>
                            <div class="col-md-10">
                                <c:out value="${college.undergraduate_name}" />
                            </div>
                            <div class="col-md-2">
                                <p>学科名：</p>
                            </div>
                            <div class="col-md-10">
                                <c:out value="${college.department_name}" />
                            </div>
                            <div class="col-md-2">
                                <p>コード：</p>
                            </div>
                            <div class="col-md-10">
                                <c:out value="${college.code}" />
                            </div>
                        </div>
                        <div class="btn-wrapper">
                            <a href="<c:url value='/colleges/edit?id=${college.id}' />">大学情報の編集</a>
                            <form method="POST" action="<c:url value='/colleges/destroy' />">
                                <input type="hidden" name="_token" value="${_token}">
                                <button class="btn btn-success destroy-btn" type="submit">この大学を削除</button>
                            </form>

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
