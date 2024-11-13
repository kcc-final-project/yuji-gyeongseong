<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<link rel="stylesheet" href="/resources/css/rnd-plan/common-rnd.css"/>
<link rel="stylesheet" href="/resources/css/sign-in-sign-up/sign-up-1.css"/>
<!-- SweetAlert2 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

<!-- SweetAlert2 JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<div class="main">
    <div class="change-tab-contents-area">
        <div class="identity-verification">
            <h5 class="identity-verification-title">최종제출</h5>
            <div class="identity-authentication-box shadow-sm">
                <p class="common-text">연구 개발 계획서의 최종제출은 연구책임자만 가능합니다.</p>
                <p class="common-text">모든 입력 정보가 올바르게 입력되었는지 확인해주세요!</p>
                <p class="common-text">※ 계획서 제출 관련 문의처: 정보(☎ 1235-1522) </p>
                <button class="authentication-btn" id="finalSubmitButton">최종제출
                </button>
            </div>
        </div>
    </div>
</div>


<script src="/resources/js/rnd-plan/final-submit.js"></script>
