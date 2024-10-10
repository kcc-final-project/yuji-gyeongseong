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


    <!-- Common-layout CSS-->
    <link rel="stylesheet" href="/resources/css/common/common-work-lounge-tap.css"/>
</head>
<body>

<div class="tabs-container">
    <div class="container">
        <ul class="nav nav-tabs">
            <div class="work-logo">
                WORK LOUNGE<br /><span class="work-logo-small">워크라운지</span>
            </div>
            <li class="nav-item">
                <a class="nav-link" data-path="#" id="tab-timeline">업무타임라인</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-path="#" id="tab-personal-info">개인정보</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-path="#" id="tab-researcher-info"
                >연구원정보</a
                >
            </li>
            <li class="nav-item">
                <a class="nav-link" data-path="#" id="tab-submission-list"
                >접수목록</a
                >
            </li>
            <li class="nav-item">
                <a class="nav-link" data-path="#" id="tab-evaluation-task"
                >평가 과제 목록</a
                >
            </li>
            <li class="nav-item">
                <a class="nav-link" data-path="#" id="tab-selection-evaluation"
                >선정 평가</a
                >
            </li>
        </ul>
    </div>
</div>

<script>
    $(function () {
       /* // 페이지가 로드될 때 localStorage에서 활성화된 탭을 설정
        const activeTabId = localStorage.getItem('activeTab');
        if (activeTabId) {
            $('#' + activeTabId).addClass('active');
        }

        // 탭 클릭 이벤트 처리
        $('.nav-link').click(function (event) {
            event.preventDefault();
            const nextPath = $(this).data('path');

            // 모든 탭의 'active' 클래스 제거 후 클릭한 탭에 추가
            $('.nav-link').removeClass('active');
            $(this).addClass('active');

            // localStorage에 활성화된 탭 저장
            const clickedTabId = $(this).attr('id');
            localStorage.setItem('activeTab', clickedTabId);

            // 해당 경로로 이동
            window.location.href = nextPath;
        });*/


        // 탭 클릭 이벤트 처리
        $('.nav-link').click(function (event) {
            event.preventDefault();
            const nextPath = $(this).data('path');

            // 모든 탭의 'active' 클래스 제거 후 클릭한 탭에 추가
            console.log($(`.nav-link`))
            $('.nav-link').removeClass('active');
            $(this).addClass('active');

            window.location.href = nextPath;
        });
    });
</script>
</body>
</html>