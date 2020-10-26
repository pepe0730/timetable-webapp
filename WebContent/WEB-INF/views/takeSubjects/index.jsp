<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/studentsApp.jsp">
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
                        <i class="fas fa-book"></i>履修講義一覧
                    </h2>
                    <div class="count-box">
                        <h3>現在の登録講義数</h3>
                        <p><span class="text-warning">${subjects_count}</span>件</p>
                    </div>
                </div>
                <div class="table-wrapper my-5">
                <h3 class="font-weight-bold">全学部共通講義</h3>
                    <table class="table" style="table-layout: fixed;">
                        <tbody>
                            <tr>
                                <th>コード</th>
                                <th>科目名</th>
                                <th>学部</th>
                                <th>担当教師</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach var="e_subject" items="${e_subjects}">
                                <tr>
                                    <td><c:out value="${e_subject.code}" /></td>
                                    <td><c:out value="${e_subject.name}" /></td>
                                    <td><c:out value="${e_subject.college.undergraduate_name}" /></td>
                                    <td><c:out value="${e_subject.teacher.name}" /></td>
                                    <td><a class="btn btn-info"
                                        href="<c:url value='/takeSubjects/show?id=${e_subject.id}' />">詳細</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="pagenation">
                        <c:forEach var="i" begin="1"
                            end="${((subjects_count - 1) / 30) + 1}">
                            <c:choose>
                                <c:when test="${i == page}">
                                    <c:out value="${i}" />&nbsp;
                            </c:when>
                                <c:otherwise>
                                    <a href="<c:url value='/subjects/index?page=${i}' />"> <c:out
                                            value="${i}" />&nbsp;
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                </div>
                <div class="table-wrapper my-5">
                <h3 class="font-weight-bold">学部限定講義</h3>
                    <table class="table" style="table-layout: fixed;">
                        <tbody>
                            <tr>
                                <th>コード</th>
                                <th>科目名</th>
                                <th>学部</th>
                                <th>担当教師</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach var="u_subject" items="${u_subjects}">
                                <tr>
                                    <td><c:out value="${u_subject.code}" /></td>
                                    <td><c:out value="${u_subject.name}" /></td>
                                    <td><c:out value="${u_subject.college.undergraduate_name}" /></td>
                                    <td><c:out value="${u_subject.teacher.name}" /></td>
                                    <td><a class="btn btn-info"
                                        href="<c:url value='/takeSubjects/show?id=${u_subject.id}' />">詳細</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="pagenation">
                        <c:forEach var="i" begin="1"
                            end="${((subjects_count - 1) / 30) + 1}">
                            <c:choose>
                                <c:when test="${i == page}">
                                    <c:out value="${i}" />&nbsp;
                            </c:when>
                                <c:otherwise>
                                    <a href="<c:url value='/subjects/index?page=${i}' />"> <c:out
                                            value="${i}" />&nbsp;
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                </div>
                <div class="table-wrapper my-5">
                <h3 class="font-weight-bold">学科限定講義</h3>
                    <table class="table" style="table-layout: fixed;">
                        <tbody>
                            <tr>
                                <th>コード</th>
                                <th>科目名</th>
                                <th>学部</th>
                                <th>担当教師</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach var="d_subject" items="${d_subjects}">
                                <tr>
                                    <td><c:out value="${d_subject.code}" /></td>
                                    <td><c:out value="${d_subject.name}" /></td>
                                    <td><c:out value="${d_subject.college.undergraduate_name}" /></td>
                                    <td><c:out value="${d_subject.teacher.name}" /></td>
                                    <td><a class="btn btn-info"
                                        href="<c:url value='/takeSubjects/show?id=${d_subject.id}' />">詳細</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="pagenation">
                        <c:forEach var="i" begin="1"
                            end="${((subjects_count - 1) / 30) + 1}">
                            <c:choose>
                                <c:when test="${i == page}">
                                    <c:out value="${i}" />&nbsp;
                            </c:when>
                                <c:otherwise>
                                    <a href="<c:url value='/subjects/index?page=${i}' />"> <c:out
                                            value="${i}" />&nbsp;
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>
    </c:param>
</c:import>