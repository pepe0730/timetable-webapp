<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../layout/adminsApp.jsp">
    <c:param name="content">
        <div class="main">
            <div class="container">
                <div class="heading-wrapper">
                    <h2>
                        <i class="fas fa-school"></i>大学一覧
                    </h2>
                    <div class="count-box">
                        <h3>現在の登録大学数</h3>
                        <p><span class="text-warning">${colleges_count}</span>件</p>
                    </div>
                </div>
                <div class="table-wrapper">
                <h3 class="font-weight-bold">Colleges</h3>
                    <table class="table" style="table-layout: fixed;">
                        <tbody>
                            <tr>
                                <th>コード</th>
                                <th>大学</th>
                                <th>学部</th>
                                <th>学科</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach var="college" items="${colleges}">
                                <tr>
                                    <td><c:out value="${college.code}" /></td>
                                    <td><c:out value="${college.name}" /></td>
                                    <td><c:out value="${college.undergraduate_name}" /></td>
                                    <td><c:out value="${college.department_name}" /></td>
                                    <td><a class="btn btn-info"
                                        href="<c:url value='/colleges/show?id=${college.id}' />">詳細</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="pagenation">

                        <c:forEach var="i" begin="1"
                            end="${((colleges_count - 1) / 30) + 1}">
                            <c:choose>
                                <c:when test="${i == page}">
                                    <c:out value="${i}" />&nbsp;
                            </c:when>
                                <c:otherwise>
                                    <a href="<c:url value='/colleges/index?page=${i}' />"> <c:out
                                            value="${i}" />&nbsp;
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                </div>
                <div class="new-btn-wrapper">
                    <a class="btn btn-primary" href="<c:url value='/colleges/new'/>">新規大学の登録</a>
                </div>
            </div>
        </div>
    </c:param>
</c:import>