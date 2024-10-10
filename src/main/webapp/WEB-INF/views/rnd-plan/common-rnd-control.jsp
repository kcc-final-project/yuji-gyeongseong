<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<link rel="stylesheet" href="/resources/css/rnd-plan/common-rnd-control.css">

<%-- 앵커 버튼 --%>
<div class="anchor-btn" data-target="#best">
    <span class="material-icons">keyboard_double_arrow_up</span>
</div>

<%-- 컨트롤 바 --%>
<div class="control-bar">
    <div class="control-bar-main">
        <div class="timer-group ctm-w40p">
            <div class="timer-group__icon ctm-w15p">
                <span class="material-icons timer-icon">alarm</span>
            </div>
            <div class="timer-group__info">
                <div class="timer-group__section1">
                    <span class="remaining-time">로그인 세션 남은시간 <span class="time">60분 00초</span> / <span>60분</span></span>
                    <div class="ctm-btn-outline-orange extend-session">연장</div>
                </div>
                <div class="timer-group__section2">
                    접수기간: <span>2024.09.23(월) 09:00 ~ 2024.09.30(월) 17:00</span>
                </div>
            </div>
        </div>
        <div class="cbar-btn-group ctm-w40p">
            <div class="ctm-btn-init ctm-btn-init__init">
                초기화
            </div>
            <div class="ctm-btn-init ctm-btn-init__cancel">
                접수취소
            </div>
            <div class="ctm-btn-init ctm-btn-init__save">
                임시저장
            </div>
            <div class="ctm-btn-init ctm-btn-init__next">
                다음
            </div>
        </div>
    </div>
</div>

<%-- 토스트 알림 --%>
<div class="toast align-items-center ctm-toast" role="alert" aria-live="assertive" aria-atomic="true"
     id="success-toast2">
    <div class="ctm-toast-line"></div>
    <div class="toast-body ctm-f-center">
        <span class="material-icons icon-success2 me-1">hourglass_top</span>
        <span>세션이 연장되었습니다.</span>
    </div>
</div>

<script src="/resources/js/rnd-plan/common-rnd-control.js"></script>
