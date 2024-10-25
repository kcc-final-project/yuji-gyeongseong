<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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
        <button id="all" class="filter-button active">전체</button>
        <button id="service" class="filter-button">서비스</button>
        <button id="committee" class="filter-button">평가위원</button>
        <button id="manager" class="filter-button">담당자</button>
    </div>
    <div class="alarms">
        <div>
            <c:forEach var="noti" items="${noti_list}">
                <div class="notification-card" data-category="${noti.dataCategory}">
                    <div class="icon-container">
                        <span class="material-icons-outlined" style="font-size: 50px"></span>
                    </div>
                    <div class="notification-content">
                        <p class="notification-title">[${noti.notiType} 알림]</p>
                        <p class="notification-description">${noti.content}</p>
                    </div>
                    <div class="notification-timestamp"><fmt:formatDate value="${noti.createdAt}"
                                                                        pattern="yyyy-MM-dd HH:mm:ss"/></div>

                        <%--평가위원일 때 버튼 추가--%>
                    <c:if test="${noti.dataCategory == 'committee'}">
                        <c:if test="${noti.readState == '확인대기'}">

                            <div id="action-${noti.notificationNo}">
                                <button type="button" id="approve-${noti.notificationNo}" class="ctm-btn-normal"
                                        style="width: 100px; display: inline-block;"
                                        onclick="approveButton(${noti.notificationNo}, ${noti.memNo}, ${noti.notiContentNo})">
                                    승인
                                </button>
                                <button type="button" id="reject-${noti.notificationNo}"
                                        class="ctm-btn-normal delete-button"
                                        style="margin-left: 20px; width: 100px; display: inline-block;"
                                        onclick="approveButton(${noti.notificationNo}, ${noti.memNo}, ${noti.notiContentNo})">
                                    거부
                                </button>
                            </div>
                        </c:if>
                        <c:if test="${noti.readState == '확인완료'}">
                            <span class="confirmed">선택완료</span>
                        </c:if>
                    </c:if>

                </div>
            </c:forEach>
        </div>
    </div>
</div>
<script src="/resources/js/work-lounge/business-timeline.js"></script>
</body>
</html>