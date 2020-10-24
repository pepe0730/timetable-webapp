<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/studentsApp.jsp">
    <c:param name="content">
        <div class="main">
            <div class="container">
                <c:if test="${error != null}">
                    <div id="flush_error">
                        <div class="error-content">
                            <h3 class="font-weight-bold"><span class="mr-3 badge badge-danger">Error</span>履修登録に失敗しました。</h3>
                            <p><i class="fas fa-check mr-3"></i><c:out value="${error}" /></p>
                        </div>
                    </div>
                </c:if>
                <div class="heading-wrapper">
                    <h2>
                        <i class="fas fa-book"></i>講義詳細:&nbsp;${subject.name}
                    </h2>
                </div>
                <c:choose>
                    <c:when test="${subject != null}">
                        <div class="show-wrapper">
                            <div class="data-wrapper">
                                <h3>class data</h3>
                                <div class="data-contents row">
                                    <div class="data col-md-5">
                                        <p>講義名：</p>
                                    </div>
                                    <div class="data col-md-6">
                                        <c:out value="${subject.name}" />
                                    </div>
                                    <div class="data col-md-5">
                                        <p>講義コード：</p>
                                    </div>

                                    <div class="data col-md-6">
                                        <c:out value="${subject.code}" />
                                    </div>
                                    <div class="data col-md-5">
                                        <p> 担当教授：</p>
                                    </div>
                                    <div class="data col-md-6">
                                        <c:out value="${subject.teacher.name}" />
                                    </div>
                                    <div class="data col-md-5">
                                        <p>大学名：</p>
                                    </div>
                                    <div class="data col-md-6">
                                        <c:out value="${subject.college.name}" />
                                    </div>
                                    <div class="data col-md-5">
                                        <p>学部名：</p>
                                    </div>
                                    <div class="data col-md-6">
                                        <c:out value="${subject.college.undergraduate_name}" />
                                    </div>
                                    <div class="data col-md-5">
                                        <p>学科名：</p>
                                    </div>
                                    <div class="data col-md-6">
                                        <c:out value="${subject.college.department_name}" />
                                    </div>
                                    <div class="data col-md-5">
                                        <p>大学コード：</p>
                                    </div>
                                    <div class="data col-md-6">
                                        <c:out value="${subject.college.code}" />
                                    </div>
                                </div>
                            </div>
                            <div class="btn-wrapper show-btn-wrapper">
                                <h3 class="font-weight-bold text-center">Action</h3>
                                <form method="POST" action="<c:url value='/takeSubjects/create' />">
                                    <a class="btn btn-info" href="<c:url value='/takeSubjects/index' />">講義一覧に戻る</a>
                                    <input type="hidden" name="_token" value="${_token}">
                                    <button class="btn btn-danger" type="submit">履修登録</button>
                                </form>
                            </div>
                        </div>
                        <div class="show-wrapper">
                            <div class="subject-data-wrapper">
                                <h3>Time table</h3>
                                <div class="data-contents row">
                                    <div class="data col-md-5">
                                        <p>開講曜日：</p>
                                    </div>
                                    <div class="data col-md-6">
                                        <c:choose>
                                            <c:when test="${subject.day_of_week == 'monday'}">
                                                <p>月曜日</p>
                                            </c:when>
                                            <c:when test="${subject.day_of_week == 'tuesday'}">
                                                <p>火曜日</p>
                                            </c:when>
                                            <c:when test="${subject.day_of_week == 'wednesday'}">
                                                <p>水曜日</p>
                                            </c:when>
                                            <c:when test="${subject.day_of_week == 'thursday'}">
                                                <p>木曜日</p>
                                            </c:when>
                                            <c:when test="${subject.day_of_week == 'friday'}">
                                                <p>金曜日</p>
                                            </c:when>
                                            <c:when test="${subject.day_of_week == 'saturdy'}">
                                                <p>土曜日</p>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                    <div class="data col-md-5">
                                        <p>開催時限：</p>
                                    </div>
                                    <div class="data col-md-6">
                                        <p><c:out value="${subject.time}" />限</p>
                                    </div>
                                    <div class="data col-md-5">
                                        <p>色:<br/>(時間割)</p>
                                    </div>
                                    <div class="data col-md-6">
                                        <c:out value="${subject.color}" />
                                    </div>
                                    <div class="data col-md-5">
                                        <p>対象生徒</p>
                                    </div>
                                    <div class="data col-md-6">
                                        <c:choose>
                                            <c:when test="${subject.open_flag == 2}">
                                                <p>全生徒</p>
                                            </c:when>
                                            <c:when test="${subject.open_flag == 1}">
                                                <p>${subject.college.undergraduate_name }生のみ</p>
                                            </c:when>
                                            <c:when test="${subject.open_flag == 0}">
                                                <p>${subject.college.department_name}生のみ</p>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                            <div class="subject-description">
                                <h3 class="font-weight-bold">講義概要</h3>
                                <p class="mt-5 ml-2">a<c:out value="${subject.description}"/></p>
                            </div>
                        </div>
                        <div class="show-date-wrapper">
                            <div class="date-data">
                                <h3 class="font-weight-bold">作成日時</h3><span class="badge badge-success">Create</span>
                                <p class="text-success"><c:out value="${subject.created_at}" /></p>
                            </div>
                            <div class="date-data">
                                <h3 class="font-weight-bold">更新日時</h3><span class="badge badge-danger">Update</span>
                                <p class="text-danger"><c:out value="${subject.updated_at}" /></p>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <h3>お探しの講義情報は見つかりませんでした。</h3>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </c:param>
</c:import>