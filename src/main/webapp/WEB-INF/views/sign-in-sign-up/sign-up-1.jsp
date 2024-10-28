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
                    <button class="authentication-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">휴대폰 본인인증
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">본인인증</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="body-header">
                    <h3>사용자 정보</h3>
                </div>
                <div class="body-body">
                    <h4>이름</h4>
                    <input class="form-control form-control-lg" id="name" type="text" placeholder="홍길동">
                    <h4>생년월일</h4>
                    <input class="form-control form-control-lg" id="birth" type="text" placeholder="2000.02.17">
                    <h4>휴대폰번호</h4>
                    <input class="form-control form-control-lg" id="tel" type="text" placeholder="010-1234-5678">
                    <h5 id="cert-title" style="display: none;">인증번호 입력</h5>
                    <div id="certNum-btn-area">
                        <input class="form-control form-control-lg" id="certNum" type="text">
                        <button class="common-submit-btn" id="cert-btn">인증</button>
                    </div>

                </div>
                <div class="body-footer">
                    <button class="common-submit-btn" id="submit-btn">확인</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/resources/js/sign-in-sign-up/sign-up-1.js"></script>
</body>
</html>
