<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../../layout/teachersApp.jsp">
    <c:param name="content">
        <div class="main">
            <div class="container">
                <div class="heading-wrapper">
                    <h2>
                        <i class="far fa-id-card"></i>プロフィール
                    </h2>
                </div>
                <c:choose>
                    <c:when test="${person != null}">
                        <div class="show-wrapper">
                            <div class="data-wrapper">
                                <h3>My data</h3>
                                <div class="data-contents row">
                                    <div class="data col-5">
                                        <p>名前：</p>
                                    </div>
                                    <div class="data col-6">
                                        <c:out value="${person.name}" />
                                    </div>
                                    <div class="data col-5">
                                        <p>個人コード：</p>
                                    </div>
                                    <div class="data col-6">
                                        <c:out value="${person.code}" />
                                    </div>
                                    <div class="data col-5">
                                        <p>大学名：</p>
                                    </div>
                                    <div class="data col-6">
                                        <c:out value="${person.college.name}" />
                                    </div>
                                    <div class="data col-5">
                                        <p>学部名：</p>
                                    </div>
                                    <div class="data col-6">
                                        <c:out value="${person.college.undergraduate_name}" />
                                    </div>
                                    <div class="data col-5">
                                        <p>学科名：</p>
                                    </div>
                                    <div class="data col-6">
                                        <c:out value="${person.college.department_name}" />
                                    </div>
                                    <div class="data col-5">
                                        <p>大学コード：</p>
                                    </div>
                                    <div class="data col-6">
                                        <c:out value="${person.college.code}" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="show-date-wrapper">
                            <div class="date-data">
                                <h3 class="font-weight-bold">作成日時</h3><span class="badge badge-success">Create</span>
                                <p class="text-success"><c:out value="${person.created_at}" /></p>
                            </div>
                            <div class="date-data">
                                <h3 class="font-weight-bold">更新日時</h3><span class="badge badge-danger">Update</span>
                                <p class="text-danger"><c:out value="${person.updated_at}" /></p>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <h3>お探しのデータは見つかりませんでした。</h3>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </c:param>
</c:import>