<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../../layout/adminsApp.jsp">
    <c:param name="content">

        <div class="main">
            <div class="container">
                <h2><i class="fas fa-users-cog"></i>管理者一覧</h2>
                <table class="table table-striped table-bordered" style="table-layout:fixed;">
                    <tbody>
                        <tr>
                            <th>名前</th>
                            <th>ユーザーコード</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach var="admin" items="${admins}">
                            <tr>
                                <td><c:out value="${admin.name}" /></td>
                                <td><c:out value="${admin.code}" /></td>
                                <td><a href="<url value='/People/show?id=%{admin.id}' />">詳細</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="pagenation">
                    <p>管理者合計: ${admins_count}人</p>
                    <c:forEach var="i" begin="1"
                        end="${(admins_count - 1 / 30) + 1}">
                        <c:choose>
                            <c:when test="${i == page}">
                                <c:out value="${i}" />&nbsp;
                    </c:when>
                            <c:otherwise>
                                <a href="<c:url value='/admins/index.html?id=${i}' />"> <c:out
                                        value="${i}" />&nbsp;
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
                <div class="new-btn-wrapper">
                    <a href="<c:url value='/people/new?authority=2'/>">管理者の登録</a>
                </div>
            </div>
        </div>

    </c:param>
</c:import>
