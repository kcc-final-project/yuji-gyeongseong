<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>

    <!-- research-page CSS -->
    <link rel="stylesheet" href="/resources/css/research-number/eval-committee-register.css"/>

    <!-- Material Icons CSS -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<div class="common-main">
    <div class="eval_title">
        <p>후보단 등록</p>
    </div>

    <div class="title">

        <p class="academic-name">학력정보</p>
        <p class="career-name">경력정보</p>
        <p class="technic-name">기술분야정보</p>

    </div>

    <div class="informs">
        <div class="academic">
            <div id="academicDetails"></div>
        </div>
        <div class="career">
            <div id="careerDetails"></div>
        </div>
        <div class="technic">
            <hr>
            <div id="technicDetails">
                <div class="field">
                    <label>기술분야명1</label>
                    <div id="secDetailedTech" class="value">분자 세포 생물학</div>
                </div>
                <div class="field">
                    <label>기술분야명2</label>
                    <div id="firstDetailedTech" class="value">분자 세포 생물학</div>
                </div>
                <div class="field">
                    <label>기술분야명3</label>
                    <div id="thirdDetailedTech" class="value">분자 세포 생물학</div>
                </div>
            </div>
        </div>
    </div>

    <div class="info-buttons">
        <button type="button" class="ctm-btn-cancel btnwid">취소</button>
        <button id="registerButton" type="button" class="ctm-btn-normal btnwid">신청</button>
    </div>

</div>

<script src="/resources/js/research-number/eval-committee-register.js"></script>
</body>
</html>