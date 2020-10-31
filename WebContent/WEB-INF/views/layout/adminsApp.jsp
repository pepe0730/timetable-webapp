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
    <nav class="sidebar col-md-2 d-none d-md-block">
        <h1>
            <a class="text-primary" href="<c:url value='/admins/index.html' />">
                <img src="<c:url value='/img/icon_111060_256.png' />">
                C.house
            </a>
        </h1>
        <ul>
            <li><a href="<c:url value='/profile/admins '/>">プロフィール</a></li>
            <li><a href="<c:url value='/colleges/index '/>">大学情報</a></li>
            <li><a href="<c:url value='/people/teachers/index '/>">教授情報</a></li>
            <li><a href="<c:url value='/people/students/index '/>">生徒情報</a></li>
            <li><a href="<c:url value='/admins/index.html' /> ">管理者情報</a>
        </ul>
    </nav>
    <main class="col-md-10 col-12" style="padding: 0;">
        <header>
            <div class="header-left">
                <h1 class="d-md-none">
                    <a class="text-primary" href="<c:url value='/admins/index.html' />">
                        <img src="<c:url value='/img/icon_111060_256.png' />">
                        C.house
                    </a>
                </h1>
                <p class="d-none d-md-block">~オンライン授業サポートアプリ~</p>
            </div>
            <div class="header-right">
                <p class="d-inline-block">${login_person.name}さん</p>
                <a class="d-none d-md-inline-block"href="<c:url value='/logout' />">Logout</a>
                <a id="header-modal-btn"class="d-inline-block d-md-none"><i class="fas fa-bars"></i></a>
            </div>
            <div id="header-modal-wrapper" class="d-md-none header-modal-wrapper">
                <div class="header-modal">
                    <div id="close-modal">
                        <i class="fas fa-times"></i>
                    </div>
                    <div class="content">
                        <h3>menu</h3>
                        <ul>
                            <li><a href="<c:url value='/profile/admins '/>">プロフィール</a></li>
                            <li><a href="<c:url value='/colleges/index '/>">大学情報</a></li>
                            <li><a href="<c:url value='/people/teachers/index '/>">教授情報</a></li>
                            <li><a href="<c:url value='/people/students/index '/>">生徒情報</a></li>
                            <li><a href="<c:url value='/admins/index.html' /> ">管理者情報</a>
                            <li class="font-weight-bold"><a href="<c:url value='/logout' />">Logout</a></li>
                        </ul>
                    </div>
                </div>
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
    <script src="<c:url value='/js/main.js' />"></script>
</body>
</html>