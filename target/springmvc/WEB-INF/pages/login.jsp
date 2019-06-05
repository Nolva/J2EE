<%--
  Created by IntelliJ IDEA.
  User: DHX17
  Date: 2019/5/29
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>企业信息管理系统</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/styles.css"/>
</head>
<body>
<div class="htmleaf-container">
    <div class="wrapper">
        <div class="container">
            <h1>Welcome</h1>

            <form class="form" action="login" method="post" >
                <input type="text" required="required" placeholder="管理员" name="managerId">
                <input type="password" required="required" placeholder="密码" name="manPassword">
                <button type="submit" id="login-button">Login</button>
            </form>
        </div>

        <ul class="bg-bubbles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.1.min.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>