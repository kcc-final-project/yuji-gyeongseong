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
    <link rel="stylesheet" href="/resources/css/sign-in-sign-up/sign-up-1.css"/>
</head>
<body>
<div class="common-main">
    <div class="container-area">
        <div class="title-tab-area">
            <h2 class="common-title">회원가입</h2>
            <div class="common-tab">
                <button class="common-btn" id="authentication-tab">본인인증</button>
                <button class="common-btn">약관동의</button>
                <button class="common-btn">가입양식 작성</button>
                <button class="common-btn">가입완료</button>
            </div>
        </div>
        <div class="change-tab-contents-area">
            <div class="identity-verification">
                <h5 class="identity-verification-title">본인인증 후 회원가입</h5>
                <div class="identity-authentication-box shadow-sm">
                    <p class="common-text">휴대폰 본인인증은 본인 명의 휴대폰으로 진행 가능합니다.</p>
                    <p class="common-text">본인인증(휴대폰)이 가능한 연구자는 ‘해외체류 중’ 가입 절차를 이용할 수 없습니다.</p>
                    <p class="common-text">※ 본인인증 오류 문의처: NICE평가정보(☎ 1600-1522) </p>
                    <button class="authentication-btn">휴대폰 본인인증</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
