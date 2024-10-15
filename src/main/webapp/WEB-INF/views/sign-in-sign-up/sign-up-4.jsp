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
    <link rel="stylesheet" href="/resources/css/sign-in-sign-up/sign-up-4.css"/>
</head>
<body>
<div class="common-main">
    <div class="container-area">
        <div class="title-tab-area">
            <h2 class="common-title">회원가입</h2>
            <div class="common-tab">
                <button class="common-btn">본인인증</button>
                <button class="common-btn">약관동의</button>
                <button class="common-btn">가입양식 작성</button>
                <button class="common-btn" id="authentication-tab">가입완료</button>
            </div>
        </div>
        <div class="change-tab-contents-area shadow-sm">
            <div class="success-area">
                <span class="material-icons">check_circle</span>
                <h3>회원가입이 완료되었습니다.</h3>
                <h6>범부처 통합연구지원시스템을 사용하시려면 로그인을 해주세요.</h6>
            </div>
            <div class="btn-wrap">
                <button class="login-btn">로그인</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
