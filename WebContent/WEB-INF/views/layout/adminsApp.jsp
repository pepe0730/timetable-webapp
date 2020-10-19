<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport"
    content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
    integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
    crossorigin="anonymous">

<title>C.house</title>
<link rel="stylesheet" href="<c:url value='/css/reset.css' />">
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<script src="https://kit.fontawesome.com/b24292ab52.js"
    crossorigin="anonymous"></script>
</head>
<body class="row">
    <nav class="sidebar col-2">
        <h1>
            <a class="text-primary" href="<c:url value='/admins/index.html' />">
                <img src="<c:url value='/img/icon_111060_256.png' />">
                C.house
            </a>
        </h1>
        <ul>
            <li><a href="#">プロフィール</a></li>
            <li><a href="<c:url value='/colleges/index '/>">大学情報</a></li>
            <li><a href="<c:url value='/people/teachers/index '/>">教授情報</a></li>
            <li><a href="<c:url value='/people/students/index '/>">生徒情報</a></li>
            <li><a href="<c:url value='/admins/index.html' /> ">管理者情報</a>
        </ul>
    </nav>
    <main class="col-10" style="padding: 0;">
        <header>
            <div class="header-left">
                <p>~オンライン授業サポートアプリ~</p>
            </div>
        </header>
        <div id="content">${param.content}</div>
        <footer> by Shun Kambayashi. </footer>
    </main>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
</body>
</html>