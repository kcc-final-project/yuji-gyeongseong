<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>유지경성</title>
    <link rel="stylesheet" href="/resources/css/rnd-plan/common-rnd-progress.css">
</head>
<body>
<div class="multi-step-progress-bar">
    <div class="progress-container">
        <div class="progress px-1" style="height: 5px;">
            <div class="progress-bar"
                 role="progressbar"
                 aria-valuenow="0"
                 aria-valuemin="0"
                 aria-valuemax="100">
            </div>
        </div>

        <div class="step-container d-flex justify-content-between">
            <div class="step-group" onclick="displayStep(1)">
                <div class="step-circle">1</div>
                <span>기본정보</span>
            </div>
            <div class="step-group" onclick="displayStep(2)">
                <div class="step-circle">2</div>
                <span>과제요약</span>
            </div>
            <div class="step-group" onclick="displayStep(3)">
                <div class="step-circle">3</div>
                <span>연구기관</span>
            </div>
            <div class="step-group" onclick="displayStep(4)">
                <div class="step-circle">4</div>
                <span>연구개발비</span>
            </div>
            <div class="step-group" onclick="displayStep(5)">
                <div class="step-circle">5</div>
                <span>첨부파일</span>
            </div>
            <div class="step-group" onclick="displayStep(6)">
                <div class="step-circle">6</div>
                <span>최종제출</span>
            </div>
        </div>
    </div>
</div>
<script src="/resources/js/rnd-plan/common-rnd-progress.js"></script>
</body>
</html>
