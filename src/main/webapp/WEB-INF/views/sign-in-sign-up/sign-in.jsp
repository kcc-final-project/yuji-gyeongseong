<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/resources/css/sign-in-sign-up/sign-in.css"/>
</head>
<body>
<div class="common-main">
    <div class="login-area shadow-sm">
            <a href="/" style="color: inherit; text-decoration: none;">
                <img src="/resources/img/common/logo.svg" style="margin-top: 30px; width: 112px" class="logo" alt="logo"/>
            </a>
        <h3 class="container-title">로그인</h3>
        <p class="container-p">로그인하시면 서비스를 이용하실 수 있습니다.</p>
        <hr>
        <form class="login-form" action="/login" method="POST">
            <div class="input-group">
                <input type="text" id="username" name="username" class="input-field" placeholder="아이디">
            </div>
            <div class="input-group">
                <input type="password" id="password" name="password" class="input-field" placeholder="패스워드">
            </div>
            <div class="checkbox-group">
                <label><input type="checkbox" name="save-id"> 아이디 저장</label>
            </div>
            <c:if test="${param.error != null}">
                <div>
                    <p class="error-message">아이디 또는 비밀번호를 잘못 입력하셨습니다.</p>
                </div>
            </c:if>
            <button type="submit" class="login-btn">로그인</button>
        </form>

        <div class="login-footer">
            <span>회원이 아니신가요?</span>
            <a href="/member/sign/up1" class="signup-link">회원가입</a>
        </div>
    </div>
</div>
</body>
</html>