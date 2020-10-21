<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../../layout/studentsApp.jsp">
    <c:param name="content">
        <div class="main">
            <div class="container">
                <div class="heading-wrapper">
                    <h2>
                        <i class="fas fa-calendar-alt"></i>履修状況
                    </h2>
                    <div class="count-box">
                        <h3>現在の登録管理者数</h3>
                        <p><span class="text-warning">${admins_count}</span>人</p>
                    </div>
                </div>
            </div>
        </div>
    </c:param>
</c:import>