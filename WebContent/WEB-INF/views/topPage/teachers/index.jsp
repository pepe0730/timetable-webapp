<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../../layout/teachersApp.jsp">
    <c:param name="content">
        <div class="main">
            <div class="container">
                <div class="heading-wrapper">
                    <h2>
                        <i class="fas fa-calendar-alt"></i>担当講義スケジュール
                    </h2>
                    <div class="count-box">
                        <h3>今日の曜日</h3>
                        <p><span class="text-warning">${week}</span></p>
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
                    <a href="<c:url value='/subjects/show?id=${subject_array[1][0].id}'/>">
                        <td class="${subject_array[1][0].color}">
                            <p>${subject_array[1][0].name}</p>
                            <p>${subject_array[1][0].teacher.name}</p>
                        </td>
                    </a>
                    <td class="${subject_array[1][1].color}">
                        <p>${subject_array[1][2].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[1][1].id}'/>">詳細</a>&nbsp;
                    </td>
                    <td class="${subject_array[1][2].color}">
                        <p>${subject_array[1][2].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[1][2].id}'/>">詳細</a>&nbsp;
                    </td>
                    <td class="${subject_array[1][3].color}">
                        <p>${subject_array[1][3].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[1][3].id}'/>">詳細</a>&nbsp;
                    </td>
                    <td class="${subject_array[1][4].color}">
                        <p>${subject_array[1][4].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[1][4].id}'/>">詳細</a>&nbsp;
                    </td>
                    <td class="${subject_array[1][5].color}">
                        <p>${subject_array[1][5].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[1][5].id}'/>">詳細</a>&nbsp;
                    </td>
                </tr>
                <tr>
                    <th>2限</th>
                    <td class="${subject_array[2][0].color}">
                        <p>${subject_array[2][0].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[2][0].id}'/>">詳細</a>&nbsp;
                    </td>
                    <td class="${subject_array[2][1].color}">
                        <p>${subject_array[2][1].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[2][1].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[2][2].color}">
                        <p>${subject_array[2][2].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[2][2].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[2][3].color}">
                        <p>${subject_array[2][3].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[2][3].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[2][4].color}">
                        <p>${subject_array[2][4].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[2][4].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[2][5].color}">
                        <p>${subject_array[2][5].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[2][5].id}'/>">詳細</a>
                    </td>
                </tr>
                <tr>
                    <th>3限</th>
                    <td class="${subject_array[3][0].color}">
                        <p>${subject_array[3][0].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[3][0].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[3][1].color}">
                        <p>${subject_array[3][1].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[3][1].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[3][2].color}">
                        <p>${subject_array[3][2].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[3][2].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[3][3].color}">
                        <p>${subject_array[3][3].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[3][3].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[3][4].color}">
                        <p>${subject_array[3][4].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[3][4].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[3][5].color}">
                        <p>${subject_array[3][5].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[3][5].id}'/>">詳細</a>
                    </td>
                </tr>
                <tr>
                    <th>4限</th>
                    <td class="${subject_array[4][0].color}">
                        <p>${subject_array[4][0].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[4][0].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[4][1].color}">
                        <p>${subject_array[4][1].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[4][1].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[4][2].color}">
                        <p>${subject_array[4][2].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[4][2].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[4][3].color}">
                        <p>${subject_array[4][3].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[4][3].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[4][4].color}">
                        <p>${subject_array[4][4].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[4][4].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[4][5].color}">
                        <p>${subject_array[4][5].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[4][5].id}'/>">詳細</a>
                    </td>
                </tr>
                <tr>
                    <th>5限</th>
                    <td class="${subject_array[5][0].color}">
                        <p>${subject_array[5][0].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[5][0].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[5][1].color}">
                        <p>${subject_array[5][1].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[5][1].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[5][2].color}">
                        <p>${subject_array[5][2].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[5][2].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[5][3].color}">
                        <p>${subject_array[5][3].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[5][3].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[5][4].color}">
                        <p>${subject_array[5][4].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[5][4].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[5][5].color}">
                        <p>${subject_array[5][5].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[5][5].id}'/>">詳細</a>
                    </td>
                </tr>
                <tr>
                    <th>6限</th>
                    <td class="${subject_array[6][0].color}">
                        <p>${subject_array[6][0].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[6][0].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[6][1].color}">
                        <p>${subject_array[6][1].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[6][1].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[6][2].color}">
                        <p>${subject_array[6][2].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[6][2].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[6][3].color}">
                        <p>${subject_array[6][3].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[6][3].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[6][4].color}">
                        <p>${subject_array[6][4].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[6][4].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[6][5].color}">
                        <p>${subject_array[6][5].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[6][5].id}'/>">詳細</a>
                    </td>
                </tr>
                <tr>
                    <th>7限</th>
                    <td class="${subject_array[7][0].color}">
                        <p>${subject_array[7][0].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[7][0].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[7][1].color}">
                        <p>${subject_array[7][1].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[7][1].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[7][2].color}">
                        <p>${subject_array[7][2].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[7][2].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[7][3].color}">
                        <p>${subject_array[7][3].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[7][3].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[7][4].color}">
                        <p>${subject_array[7][4].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[7][4].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[7][5].color}">
                        <p>${subject_array[7][5].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[7][5].id}'/>">詳細</a>
                    </td>

                </tr>
                <tr>
                    <th>8限</th>
                    <td class="${subject_array[8][0].color}">
                        <p>${subject_array[8][0].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[8][0].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[8][1].color}">
                        <p>${subject_array[8][1].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[8][1].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[8][2].color}">
                        <p>${subject_array[8][2].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[8][2].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[8][3].color}">
                        <p>${subject_array[8][3].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[8][3].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[8][4].color}">
                        <p>${subject_array[8][4].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[8][4].id}'/>">詳細</a>
                    </td>
                    <td class="${subject_array[8][5].color}">
                        <p>${subject_array[8][5].name}</p>
                        <a class="btn btn-light" href="<c:url value='/subjects/show?id=${subject_array[8][5].id}'/>">詳細</a>
                    </td>
                </tr>
              </tbody>


        </table>
    </c:param>
</c:import>