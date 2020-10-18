<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../../layout/adminsApp.jsp">
    <c:param name="content">
        <div class="main">
            <div class="container">
                <div class="heading-wrapper">
                    <h2>
                        <i class="fas fa-users-cog"></i>管理者一覧
                    </h2>
                    <div class="count-box">
                        <h3>現在の登録管理者数</h3>
                        <p><span class="text-warning">${admins_count}</span>人</p>
                    </div>
                </div>
                <div class="table-wrapper">
                    <h3 class="font-weight-bold">admins</h3>
                    <table class="table" style="table-layout: fixed;">
                         <tbody>
                            <tr>
                                <th>コード</th>
                                <th>名前</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach var="admin" items="${admins}">
                                <tr>
                                    <td><c:out value="${admin.code}" /></td>
                                    <td><c:out value="${admin.name}" /></td>
                                    <td><a class="btn btn-info" href="<c:url value='/people/show?id=${admin.id}' />">詳細</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="pagenation">
                        <c:forEach var="i" begin="1"
                            end="${((admins_count - 1) / 30) + 1}">
                            <c:choose>
                                <c:when test="${i == page}">
                                    <c:out value="${i}" />&nbsp;
                            </c:when>
                                <c:otherwise>
                                    <a href="<c:url value='/admins/index?page=${i}' />"> <c:out
                                            value="${i}" />&nbsp;
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                </div>
                <div class="new-btn-wrapper">
                    <a class="btn btn-primary" href="<c:url value='/people/new?authority=2'/>">管理者の登録</a>
                </div>
            </div>
        </div>

    </c:param>
</c:import>
