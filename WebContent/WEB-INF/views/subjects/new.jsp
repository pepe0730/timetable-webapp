<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/teachersApp.jsp">
    <c:param name="content">
        <div class="main">
            <div class="container">
                <c:if test="${errors != null}">
                    <div id="flush_error">
                        <div class="error-content">
                            <h3 class="font-weight-bold"><span class="mr-3 badge badge-danger">Error</span>入力内容にエラーがあります</h3>
                            <c:forEach var="error" items="${errors}">
                                <p><i class="fas fa-check mr-3"></i><c:out value="${error}" /></p>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
                <div class="heading-wrapper">
                    <h2><i class="fas fa-book"></i>新規講義登録</h2>
                </div>
                 <form class="text-form" method="POST" action="<c:url value='/subjects/create' />">
                    <h3 class="font-weight-bold">subject create</h3>
                    <c:import url="_form.jsp" />
                    <button class="btn btn-primary" type="submit">新規作成</button>
                 </form>
            </div>
        </div>
    </c:param>
</c:import>