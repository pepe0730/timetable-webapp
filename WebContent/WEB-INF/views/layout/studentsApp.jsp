<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>C.house</title>
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" href="<c:url value='/css/style.css' />">
        <script src="https://kit.fontawesome.com/b24292ab52.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <div class="header-left">
                <h1>C.house</h1>
                <p>~オンライン授業サポートアプリ~</p>
            </div>
        </header>
        
        <div id="content">
            ${param.content}
        </div>
        <footer>
            by Shun Kambayashi.
        </footer>
    </body>
</html>