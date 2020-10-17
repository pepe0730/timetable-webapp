<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/adminsApp.jsp">
    <c:param name="content">
        <div class="main">
            <div class="container">
                <h2>大学情報の編集</h2>
                <form method="POST" action="<c:url value='/colleges/update'/>">
                    <c:import url="_form.jsp" />
                    <button class="btn btn-primary" type="submit">更新</button>
                </form>
            </div>
        </div>
    </c:param>
</c:import>
