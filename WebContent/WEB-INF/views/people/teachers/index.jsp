<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../../layout/adminsApp.jsp">
    <c:param name="content">
        <div class="main">
            <div class="container">
                <c:if test="${flush != null}">
                    <div id="flush_success">
                        <div class="success-content">
                            <h3 class="font-weight-bold"><span class="mr-3 badge badge-success">Success</span>正常に動作しました</h3>
                            <p><i class="fas fa-check mr-3"></i><c:out value="${flush}" /></p>
                        </div>
                    </div>
                </c:if>
                <div class="heading-wrapper">
                    <h2>
                        <i class="fas fa-user-tie"></i>教授一覧
                    </h2>
                    <div class="count-box">
                        <h3>現在の登録教授数</h3>
                        <p><span class="text-warning">${teachers_count}</span>人</p>
                    </div>
                </div>
                <div class="table-wrapper">
                    <h3 class="font-weight-bold">Teachers</h3>
                    <table class="table" style="table-layout: fixed;">
                         <tbody>
                            <tr>
                                <th>個人コード</th>
                                <th>名前</th>
                                <th>大学コード</th>
                                <th>大学名</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach var="teacher" items="${teachers}">
                                <tr>
                                    <td><c:out value="${teacher.code}" /></td>
                                    <td><c:out value="${teacher.name}" /></td>
                                    <td><c:out value="${teacher.college.code}" /></td>
                                    <td><c:out value="${teacher.college.name}" /></td>
                                    <td><a class="btn btn-info" href="<c:url value='/people/show?id=${teacher.id}&authority=1' />">詳細</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="pagenation">
                        <c:forEach var="i" begin="1"
                            end="${((teachers_count - 1) / 30) + 1}">
                            <c:choose>
                                <c:when test="${i == page}">
                                    <c:out value="${i}" />&nbsp;
                            </c:when>
                                <c:otherwise>
                                    <a href="<c:url value='/people/teachers/index?page=${i}' />"> <c:out
                                            value="${i}" />&nbsp;
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                </div>
                <div class="new-btn-wrapper">
                    <a class="btn btn-primary" href="<c:url value='/people/new?authority=1'/>">教授の登録</a>
                </div>
            </div>
        </div>
    </c:param>
</c:import>
