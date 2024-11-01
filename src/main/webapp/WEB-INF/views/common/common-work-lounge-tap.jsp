<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../common/common-header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>

    <!-- Common-layout CSS-->
    <link rel="stylesheet" href="/resources/css/common/common-work-lounge-tap.css"/>
</head>
<body style="height: auto; padding-top: 90px;">

<div class="tabs-container">

    <div class="container">
        <ul class="nav nav-tabs">
            <div class="work-logo">
                WORK LOUNGE
            </div>

            <c:if test="${fn:contains(userRole, 'USER') or fn:contains(userRole, 'RESE') or fn:contains(userRole, 'DIRE') or fn:contains(userRole, 'EVAL')}">
                <li class="nav-item">
                    <a class="nav-link" data-path="/business-timeline" id="tab-timeline">업무타임라인</a>
                </li>
            </c:if>

            <c:if test="${fn:contains(userRole, 'USER') or fn:contains(userRole, 'RESE') or fn:contains(userRole, 'DIRE') or fn:contains(userRole, 'EVAL')}">
                <li class="nav-item">
                    <a class="nav-link" data-path="/member/edit-personal-info" id="tab-personal-info">개인정보</a>
                </li>
            </c:if>

            <c:if test="${fn:contains(userRole, 'USER') or fn:contains(userRole, 'RESE') or fn:contains(userRole, 'DIRE') or fn:contains(userRole, 'EVAL')}">
                <li class="nav-item">
                    <a class="nav-link" data-path="#" id="tab-researcher-info">연구원정보</a>
                </li>
            </c:if>

            <c:if test="${fn:contains(userRole, 'USER') or fn:contains(userRole, 'RESE') or fn:contains(userRole, 'DIRE') or fn:contains(userRole, 'EVAL')}">
                <li class="nav-item">
                    <a class="nav-link" data-path="#" id="tab-submission-list">접수목록</a>
                </li>
            </c:if>

            <c:if test="${fn:contains(userRole, 'EVAL') or fn:contains(userRole, 'MGR')}">
                <li class="nav-item">
                    <a class="nav-link" data-path="#" id="tab-evaluation-task">평가 과제 목록</a>
                </li>
            </c:if>

            <c:if test="${fn:contains(userRole, 'MGR')}">
                <li class="nav-item">
                    <a class="nav-link" data-path="/work-lounge/eval-list/eval-compose/" id="tab-selection-evaluation">선정
                        평가</a>
                </li>
            </c:if>

            <c:if test="${fn:contains(userRole, 'MGR')}">
                <li class="nav-item">
                    <a class="nav-link" data-path="#" id="tab-selection-evaluation-form">전자 평가표</a>
                </li>
            </c:if>
        </ul>
    </div>
</div>

<script>
    $(function () {
        // 현재 URL의 경로를 가져옴
        const currentPath = window.location.pathname;

        // 현재 경로와 일치하는 data-path 속성을 가진 탭을 활성화
        $('.nav-link').each(function () {
            if ($(this).data('path') === currentPath) {
                $(this).addClass('active');
            }
        });

        // 클릭 시에도 해당 탭을 활성화하고 경로로 이동
        $('.nav-link').click(function (event) {
            event.preventDefault();
            const nextPath = $(this).data('path');

            $('.nav-link').removeClass('active');
            $(this).addClass('active');

            window.location.href = nextPath;
        });
    });
</script>
</body>
</html>
