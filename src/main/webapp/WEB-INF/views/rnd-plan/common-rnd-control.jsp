<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>유지경성</title>
    <link rel="stylesheet" href="/resources/css/rnd-plan/common-rnd-control.css">
</head>
<body>
<div class="control-bar">
    <div class="control-bar-main">
        <div class="timer-group ctm-w40p">
            <div class="timer-group__icon ctm-w15p">
                <span class="material-icons timer-icon">alarm</span>
            </div>
            <div class="timer-group__info">
                <div class="timer-group__section1">
                    <span class="remaining-time">로그인 세션 남은시간 <span>28분 30초 / 30분</span></span>
                    <div class="ctm-btn-outline-orange">연장</div>
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
</body>
</html>
