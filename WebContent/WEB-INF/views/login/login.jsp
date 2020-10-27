<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">

    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/b24292ab52.js"
    crossorigin="anonymous"></script>
    <title>C.house</title>

</head>
<body>
     <header>
        <div class="header-left">
            <h1 class="d-inline-block">
                <a class="text-primary" href="<c:url value='/admins/index.html' />">
                    <img src="<c:url value='/img/icon_111060_256.png' />">
                    C.house
                </a>
            </h1>
            <p class="d-inline-block">~オンライン授業サポートアプリ~</p>
        </div>
     </header>
     <div class="main login">
        <div class="container">
            <c:if test="${hasError}">
                <div id="flush_error">
                    <div class="error-content">
                            <h3 class="font-weight-bold"><span class="mr-3 badge badge-danger">Error</span>ログインに失敗しました。</h3>
                            <p>個人コード・大学コード・パスワードの組み合わせが違います</p>
                    </div>
                </div>
            </c:if>
            <div class="login-form-wrapper">
                <span><i class="fas fa-user-lock"></i></span>
                <form class="login-form" method="POST" action="<c:url value='/login' />">
                    <h2 class="text-center">Login</h2>
                    <div class="input-area">
                        <p>個人コード</p>
                        <input type="text" name="code" value="${code}">
                    </div>
                    <div class="input-area">
                        <p>大学コード</p>
                        <input type="text" name="college_code" value="${college_code}">
                    </div>
                    <div class="input-area">
                        <p>パスワード</p>
                        <input type="password" name="password">
                    </div>
                    <button class="btn" type="submit">ログイン</button>
                </form>
            </div>

        </div>
        <footer> by Shun Kambayashi. </footer>
     </div>
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