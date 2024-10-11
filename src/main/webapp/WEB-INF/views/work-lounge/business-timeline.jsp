business-timeline.jsp


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-work-lounge-tap.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>

    <!-- research-page CSS -->
    <link rel="stylesheet" href="/resources/css/work-lounge/business-timeline.css"/>

    <!-- Material Icons CSS -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body style="height: auto;">
<div class="common-main">
    <div class="title">
        <span class="service-title">서비스 알림</span>
        <span class="service-content">과제의 진행현황을 실시간 확인하고, 업무 내용을 공동 연구자들과 공유하실 수 있습니다.</span>
    </div>
    <div class="filters">
        <button class="filter-button active">전체</button>
        <button class="filter-button">서비스</button>
        <button class="filter-button">평가위원</button>
        <button class="filter-button">담당자</button></div>
    <div class="alarms">
        <div class="notification-card" data-category="계획서">
            <div class="icon-container">
                <span class="material-icons-outlined" style="font-size: 50px">info</span>
            </div>
            <div class="notification-content">
                <p class="notification-title">[계획서 알림]</p>
                <p class="notification-description">수행 중인 [2024년도 다부처 국가생명연구자원 선진화사업 신규과제 3차 공모 재공고]의 연구과제가 최종
                    제출되었습니다.</p>
            </div>
            <div class="notification-timestamp">2024-10-10 14:05:55</div>
        </div>
        <div class="notification-card">
            <div class="icon-container">
                <span class="material-icons-outlined" style="font-size: 50px">diversity_3</span>
            </div>
            <div class="notification-content" data-category="평가위원">
                <p class="notification-title">[평가위원회 알림]</p>
                <p class="notification-description">[2024-RM-03-일반] 경수형 SMR 리스크 평가 규제기반기술 개발_평가위원회4의 의견공유가
                    활성화 되었습니다. 의견공유 및 평가를 진행해 주세요.</p>
            </div>
            <div class="notification-timestamp">2024-10-10 14:05:55</div>
            <div class="button-alarm">
                <button class="reject-button">의견공유 페이지</button>
            </div>
        </div>
        <div class="notification-card">
            <div class="icon-container">
                <span class="material-icons-outlined" style="font-size: 50px">forward_to_inbox</span>
            </div>
            <div class="notification-content" data-category="서비스">
                <p class="notification-title">[서비스 알림]</p>
                <p class="notification-description">[2024-RM-03-일반] 경수형 SMR 리스크 평가 규제기반기술 개발_평가위원회4에 참여하여
                    평가위원 제안을 수락하실지 여부를 선택해 주세요.</p>
            </div>
            <div class="notification-timestamp">2024-10-10 14:05:55</div>
            <div class="button-alarm">
                <button id="rejectButton" class="reject-button">거부</button>
                <button id="approveButton" class="approve-button">승인</button>
            </div>
        </div>
        <div class="notification-card">
            <div class="icon-container">
                <span class="material-icons-outlined" style="font-size: 50px">person_outline</span>
            </div>
            <div class="notification-content">
                <p class="notification-title">[담당자 알림]</p>
                <p class="notification-description">[2024-RM-03-일반] 경수형 SMR 리스크 평가 규제기반기술 개발의 선정평가가 활성화 되었습니다. 선정평가를 진행해
                    주세요.</p>
            </div>
            <div class="notification-timestamp">2024-10-10 14:05:55</div>
            <div class="button-alarm">
                <button class="reject-button">선정평가 페이지</button>
            </div>
        </div>
        <div class="notification-card">
            <div class="icon-container">
                <span class="material-icons-outlined" style="font-size: 50px">info</span>
            </div>
            <div class="notification-content">
                <p class="notification-title">[계획서 알림]</p>
                <p class="notification-description">수행 중인 [2024년도 다부처 국가생명연구자원 선진화사업 신규과제 3차 공모 재공고]의 연구과제가 최종
                    제출되었습니다.</p>
            </div>
            <div class="notification-timestamp">2024-10-10 14:05:55</div>
        </div>
        <div class="notification-card">
            <div class="icon-container">
                <span class="material-icons-outlined" style="font-size: 50px">info</span>
            </div>
            <div class="notification-content">
                <p class="notification-title">[계획서 알림]</p>
                <p class="notification-description">수행 중인 [2024년도 다부처 국가생명연구자원 선진화사업 신규과제 3차 공모 재공고]의 연구과제가 최종
                    제출되었습니다.</p>
            </div>
            <div class="notification-timestamp">2024-10-10 14:05:55</div>
        </div>
        <div class="notification-card">
            <div class="icon-container">
                <span class="material-icons-outlined" style="font-size: 50px">info</span>
            </div>
            <div class="notification-content">
                <p class="notification-title">[계획서 알림]</p>
                <p class="notification-description">수행 중인 [2024년도 다부처 국가생명연구자원 선진화사업 신규과제 3차 공모 재공고]의 연구과제가 최종
                    제출되었습니다.</p>
            </div>
            <div class="notification-timestamp">2024-10-10 14:05:55</div>
        </div>
    </div>
</div>


<script src="/resources/js/work-lounge/business-timeline.js"></script>
</body>
</html>