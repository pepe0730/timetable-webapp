<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/adminsApp.jsp">
    <c:param name="content">
        <div class="main">
            <div class="container">
                <c:if test="${errors != null}">
                    <div id="flush_error">
                            入力内容にエラーがあります <br />
                        <c:forEach var="error" items="${errors}">
                            <c:out value="${error}" /><br />
                        </c:forEach>
                    </div>
                </c:if>
                <h2><i class="fas fa-school"></i>新規大学登録</h2>
                 <form method="POST" action="<c:url value='/colleges/create' />">
                    <c:import url="_form.jsp" />
                    <button class="btn btn-primary" type="submit">新規作成</button>
                 </form>
            </div>
        </div>
    </c:param>
</c:import>