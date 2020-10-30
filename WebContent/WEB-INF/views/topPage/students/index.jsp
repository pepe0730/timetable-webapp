<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../../layout/studentsApp.jsp">
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
                        <i class="fas fa-calendar-alt"></i>履修状況
                    </h2>
                    <div class="date-box">
                        <h3>今日の曜日</h3>
                        <p><span class="text-warning">${day_of_week}</span></p>
                    </div>
                </div>
            </div>
        </div>
        <table class="table table-bordered timetable">
            <thead>
                <tr>
                    <th>&nbsp;</th>
                    <th>月曜</th>
                    <th>火曜</th>
                    <th>水曜</th>
                    <th>木曜</th>
                    <th>金曜</th>
                    <th>土曜</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>1限</th>
                    <td class="${subject_array[1][0].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[1][0].id}'/>">
                            <p>${subject_array[1][0].name}</p>
                            <p>${subject_array[1][0].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[1][1].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[1][1].id}'/>">
                            <p>${subject_array[1][1].name}</p>
                            <p>${subject_array[1][1].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[1][2].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[1][2].id}'/>">
                            <p>${subject_array[1][2].name}</p>
                            <p>${subject_array[1][2].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[1][3].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[1][3].id}'/>">
                            <p>${subject_array[1][3].name}</p>
                            <p>${subject_array[1][3].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[1][4].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[1][4].id}'/>">
                            <p>${subject_array[1][4].name}</p>
                            <p>${subject_array[1][4].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[1][5].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[1][5].id}'/>">
                            <p>${subject_array[1][5].name}</p>
                            <p>${subject_array[1][5].teacher.name}</p>
                        </a>
                    </td>
                </tr>
                <tr>
                    <th>2限</th>
                    <td class="${subject_array[2][0].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[2][0].id}'/>">
                            <p>${subject_array[2][0].name}</p>
                            <p>${subject_array[2][0].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[2][1].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[2][1].id}'/>">
                            <p>${subject_array[2][1].name}</p>
                            <p>${subject_array[2][1].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[2][2].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[2][2].id}'/>">
                            <p>${subject_array[2][2].name}</p>
                            <p>${subject_array[2][2].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[2][3].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[2][3].id}'/>">
                            <p>${subject_array[2][3].name}</p>
                            <p>${subject_array[2][3].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[2][4].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[2][4].id}'/>">
                            <p>${subject_array[2][4].name}</p>
                            <p>${subject_array[2][4].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[2][5].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[2][5].id}'/>">
                            <p>${subject_array[2][5].name}</p>
                            <p>${subject_array[2][5].teacher.name}</p>
                        </a>
                    </td>
                </tr>
                <tr>
                    <th>3限</th>
                    <td class="${subject_array[3][0].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[3][0].id}'/>">
                            <p>${subject_array[3][0].name}</p>
                            <p>${subject_array[3][0].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[3][1].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[3][1].id}'/>">
                            <p>${subject_array[3][1].name}</p>
                            <p>${subject_array[3][1].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[3][2].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[3][2].id}'/>">
                            <p>${subject_array[3][2].name}</p>
                            <p>${subject_array[3][2].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[3][3].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[3][3].id}'/>">
                            <p>${subject_array[3][3].name}</p>
                            <p>${subject_array[3][3].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[3][4].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[3][4].id}'/>">
                            <p>${subject_array[3][4].name}</p>
                            <p>${subject_array[3][4].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[3][5].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[3][5].id}'/>">
                            <p>${subject_array[3][5].name}</p>
                            <p>${subject_array[3][5].teacher.name}</p>
                        </a>
                    </td>
                </tr>
                <tr>
                    <th>4限</th>
                    <td class="${subject_array[4][0].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[4][0].id}'/>">
                            <p>${subject_array[4][0].name}</p>
                            <p>${subject_array[4][0].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[4][1].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[4][1].id}'/>">
                            <p>${subject_array[4][1].name}</p>
                            <p>${subject_array[4][1].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[4][2].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[4][2].id}'/>">
                            <p>${subject_array[4][2].name}</p>
                            <p>${subject_array[4][2].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[4][3].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[4][3].id}'/>">
                            <p>${subject_array[4][3].name}</p>
                            <p>${subject_array[4][3].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[4][4].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[4][4].id}'/>">
                            <p>${subject_array[4][4].name}</p>
                            <p>${subject_array[4][4].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[4][5].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[4][5].id}'/>">
                            <p>${subject_array[4][5].name}</p>
                            <p>${subject_array[4][5].teacher.name}</p>
                        </a>
                    </td>
                </tr>
                <tr>
                    <th>5限</th>
                    <td class="${subject_array[5][0].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[5][0].id}'/>">
                            <p>${subject_array[5][0].name}</p>
                            <p>${subject_array[5][0].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[5][1].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[5][1].id}'/>">
                            <p>${subject_array[5][1].name}</p>
                            <p>${subject_array[5][1].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[5][2].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[5][2].id}'/>">
                            <p>${subject_array[5][2].name}</p>
                            <p>${subject_array[5][2].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[5][3].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[5][3].id}'/>">
                            <p>${subject_array[5][3].name}</p>
                            <p>${subject_array[5][3].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[5][4].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[5][4].id}'/>">
                            <p>${subject_array[5][4].name}</p>
                            <p>${subject_array[5][4].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[5][5].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[5][5].id}'/>">
                            <p>${subject_array[5][5].name}</p>
                            <p>${subject_array[5][5].teacher.name}</p>
                        </a>
                    </td>
                </tr>
                <tr>
                    <th>6限</th>
                    <td class="${subject_array[6][0].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[6][0].id}'/>">
                            <p>${subject_array[6][0].name}</p>
                            <p>${subject_array[6][0].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[6][1].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[6][1].id}'/>">
                            <p>${subject_array[6][1].name}</p>
                            <p>${subject_array[6][1].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[6][2].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[6][2].id}'/>">
                            <p>${subject_array[6][2].name}</p>
                            <p>${subject_array[6][2].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[6][3].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[6][3].id}'/>">
                            <p>${subject_array[6][3].name}</p>
                            <p>${subject_array[6][3].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[6][4].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[6][4].id}'/>">
                            <p>${subject_array[6][4].name}</p>
                            <p>${subject_array[6][4].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[6][5].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[6][5].id}'/>">
                            <p>${subject_array[6][5].name}</p>
                            <p>${subject_array[6][5].teacher.name}</p>
                        </a>
                    </td>
                </tr>
                <tr>
                    <th>7限</th>
                    <td class="${subject_array[7][0].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[7][0].id}'/>">
                            <p>${subject_array[7][0].name}</p>
                            <p>${subject_array[7][0].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[7][1].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[7][1].id}'/>">
                            <p>${subject_array[7][1].name}</p>
                            <p>${subject_array[7][1].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[7][2].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[7][2].id}'/>">
                            <p>${subject_array[7][2].name}</p>
                            <p>${subject_array[7][2].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[7][3].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[7][3].id}'/>">
                            <p>${subject_array[7][3].name}</p>
                            <p>${subject_array[7][3].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[7][4].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[7][4].id}'/>">
                            <p>${subject_array[7][4].name}</p>
                            <p>${subject_array[7][4].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[7][5].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[7][5].id}'/>">
                            <p>${subject_array[7][5].name}</p>
                            <p>${subject_array[7][5].teacher.name}</p>
                        </a>
                    </td>
                </tr>
                <tr>
                    <th>8限</th>
                    <td class="${subject_array[8][0].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[8][0].id}'/>">
                            <p>${subject_array[8][0].name}</p>
                            <p>${subject_array[8][0].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[8][1].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[8][1].id}'/>">
                            <p>${subject_array[8][1].name}</p>
                            <p>${subject_array[8][1].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[8][2].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[8][2].id}'/>">
                            <p>${subject_array[8][2].name}</p>
                            <p>${subject_array[8][2].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[8][3].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[8][3].id}'/>">
                            <p>${subject_array[8][3].name}</p>
                            <p>${subject_array[8][3].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[8][4].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[8][4].id}'/>">
                            <p>${subject_array[8][4].name}</p>
                            <p>${subject_array[8][4].teacher.name}</p>
                        </a>
                    </td>
                    <td class="${subject_array[8][5].color}">
                        <a href="<c:url value='/registeredSubjects/show?id=${subject_array[8][5].id}'/>">
                            <p>${subject_array[8][5].name}</p>
                            <p>${subject_array[8][5].teacher.name}</p>
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>
    </c:param>
</c:import>