<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../common/common-header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>후보단 등록</title>
    <link rel="stylesheet" href="/resources/css/research-number/eval-committee-register.css"/>
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
        <!-- 학력 정보 출력 -->
        <div class="academic">
            <div id="academic_details">
                <c:forEach var="acad" items="${academic_list}">
                    <hr>
                    <div class="list">
                        <div class="field">
                            <label>학력구분</label>
                            <div class="value">${acad.ability_type}</div>
                        </div>
                        <div class="field">
                            <label>취득연월</label>
                            <div class="value"><fmt:formatDate value="${acad.acquired_at}" pattern="yyyy-MM-dd" /></div>
                        </div>
                    </div>
                    <div class="list">
                        <div class="field">
                            <label>취득국가</label>
                            <div class="value">${acad.acquired_country}</div>
                        </div>
                        <div class="field">
                            <label>취득기관명</label>
                            <div class="value">${acad.org_name}</div>
                        </div>
                    </div>
                    <div class="list">
                        <div class="field">
                            <label>전공명</label>
                            <div class="value">${acad.major_name}</div>
                        </div>
                        <div class="field">
                            <label>학력구분</label>
                            <div class="value">${acad.major_affiliation}</div>
                            <div class="value">${acad.major_field}</div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- 경력 정보 출력 -->
        <div class="career">
            <div id="career_details">
                <c:forEach var="career" items="${career_list}">
                    <hr>
                    <div class="list">
                        <div class="field">
                            <label>근무기관명</label>
                            <div class="value">${career.org_name}</div>
                        </div>
                    </div>
                    <div class="list">
                        <div class="field">
                            <label>근무부서</label>
                            <div class="value">${career.dept_name}</div>
                        </div>
                        <div class="field">
                            <label>고용형태</label>
                            <div class="value">${career.career_type}</div>
                        </div>
                    </div>
                    <div class="list">
                        <div class="field">
                            <label>근무시작일</label>
                            <div class="value"><fmt:formatDate value="${career.started_at}" pattern="yyyy-MM-dd" /></div>
                        </div>
                        <div class="field">
                            <label>근무종료일</label>
                            <div class="value"><fmt:formatDate value="${career.ended_at}" pattern="yyyy-MM-dd" /></div>
                        </div>
                    </div>
                </c:forEach>
            </div>
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
