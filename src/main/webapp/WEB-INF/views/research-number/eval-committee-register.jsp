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
<body style="height: auto;">
<div class="common-main">
    <div class="eval_title"  style="display: none">
        <p>후보단 등록</p>
    </div>

    <div class="agree-explain container mt-5">
        <div class="card shadow-lg">
            <div class="card-header  text-white" style="background-color: #2e406a">
                <h3 class="mb-0">후보단 등록에 대한 설명</h3>
            </div>
            <div class="card-body">
                <p class="card-text">
                    '범부처 평가위원 후보단'은 [국가연구개발혁신법 시행령] 제 27조에 따라 연구개발과제평가단의 전문성을 확보하기 위하여 연구개발과제평가단을 구성하는 연구개발과제 평가위원의 후보군을 구성하는 것을 의미합니다. 국가연구개발과제 평가의 공정성과 객관성을 제고하기 위하여 범부처 평가위원 후보단으로서의 활동 시 준수사항을 다음과 같이 안내해드리오니 확인 후 숙지하여 주시기 바랍니다.
                </p>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <strong>범부처산업 연구개발과제 중 아래와 같이 공정한 평가를 수행하기 어려운 관계라고 판단되는 경우</strong>, 범부처단 부서에서 공고된 안내에 따라 조심히 바랍니다.
                    </li>
                    <li class="list-group-item">평가대상과제의 참여연구원의 경우</li>
                    <li class="list-group-item">평가대상과제의 연구자와 친족관계가 있거나 있었던 사람</li>
                    <li class="list-group-item">서로 다른 두 건의 연구개발과제에 평가가 동시에 진행될 때 범부처산업과제의 연구자가 그 서로 다른 연구개발과제를 평가하는 관계가 되는 경우의 연구개발과제의 연구자</li>
                    <li class="list-group-item">
                        <strong>범부처 대형 연구개발과제의 연구자</strong>이자 각종 기관에 소속된 사람. 다른 부문의 어느 하나에 해당하는 경우에 한하며, 하부(해당 부분에 해당 기관이 없는 경우), 부서 등 최하위 부서 부서에 갈 소속된 사람으로 한정하여 제
                        <ol>
                            <li>고등교육법, 제2조 각 호에 준 ※ 대학, 상업대학, 교육대학, 전문대학, 방송대학. 통신대학. 방송통신대학 및 사이버대학, 기술대학, 감축학교</li>
                            <li>정보통신업계구기능의 설립, 운영 및 운영에 관한 법률</li>
                            <li>과학기술분야 정부연구업계기능의 설립, 운영 및 운영에 관한 법률</li>
                            <li>토적업구기관 운영법, 제3조제1항부터 제3항까지 및 제3조2항에 따른 업구기관 ※ 한국과학기술원, 국제과학기술원, 대구경북과학기술원, 육군과학기술원</li>
                        </ol>
                    </li>
                </ul>
            </div>
            <div class="card-footer text-right">
                <button id="explain-button" class="btn ctm-btn-normal">동의하기</button>
            </div>
        </div>
    </div>


    <div class="title" style="display: none">
        <p class="academic-name">학력정보</p>
        <div class="icon-with-tooltip">
            <span class="material-icons-outlined">info</span>
            <span class="tooltip-text">연구원 등록할 때 입력한 <br>"학력정보" 입니다. <br>올바른 정보인지 확인해주세요.</span>
        </div>
        <p class="career-name">경력정보</p>
        <div class="icon-with-tooltip">
            <span class="material-icons-outlined" >info</span>
            <span class="tooltip-text">연구원 등록할 때 입력한 <br>"경력정보" 입니다. <br>올바른 정보인지 확인해주세요.</span>
        </div>
        <p class="technic-name">기술분야정보</p>
        <div class="icon-with-tooltip">
            <span class="material-icons-outlined" >info</span>
            <span class="tooltip-text">연구원 등록할 때 입력한 <br>"기술분야정보" 입니다. <br>올바른 정보인지 확인해주세요.</span>
        </div>
    </div>

    <div class="informs" style="display: none">
        <!-- 학력 정보 출력 -->
        <div class="academic">
            <div id="academic_details">
                <c:forEach var="acad" items="${academic_list}">
                    <hr>
                    <div class="list">
                        <div class="field">
                            <label>학력구분</label>
                            <div class="value">${acad.abilityType}</div>
                        </div>
                        <div class="field">
                            <label>취득연월</label>
                            <div class="value"><fmt:formatDate value="${acad.acquiredAt}" pattern="yyyy-MM-dd"/></div>
                        </div>
                    </div>
                    <div class="list">
                        <div class="field">
                            <label>취득국가</label>
                            <div class="value">${acad.acquiredCountry}</div>
                        </div>
                        <div class="field">
                            <label>취득기관명</label>
                            <div class="value">${acad.orgName}</div>
                        </div>
                    </div>
                    <div class="list">
                        <div class="field">
                            <label>전공명</label>
                            <div class="value">${acad.majorName}</div>
                        </div>
                        <div class="field">
                            <label>학력구분</label>
                            <div class="value">${acad.majorAffiliation}</div>
                            <div class="value">${acad.majorField}</div>
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
                            <div class="value">${career.orgName}</div>
                        </div>
                    </div>
                    <div class="list">
                        <div class="field">
                            <label>근무부서</label>
                            <div class="value">${career.deptName}</div>
                        </div>
                        <div class="field">
                            <label>고용형태</label>
                            <div class="value">${career.careerType}</div>
                        </div>
                    </div>
                    <div class="list">
                        <div class="field">
                            <label>근무시작일</label>
                            <div class="value"><fmt:formatDate value="${career.startedAt}" pattern="yyyy-MM-dd"/></div>
                        </div>
                        <div class="field">
                            <label>근무종료일</label>
                            <div class="value"><fmt:formatDate value="${career.endedAt}" pattern="yyyy-MM-dd"/></div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div class="technic">
            <hr>
            <div id="technicDetails">
                <c:forEach var="Name" items="${tech_name_list}" varStatus="status">
                    <div class="field">
                        <label>기술분야명 ${status.count}</label>
                        <div class="value">${Name}</div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div >

    <div class="info-buttons" style="display: none">

        <button type="button" class="ctm-btn-cancel btnwid">취소</button>
        <button id="registerButton" type="button" class="ctm-btn-normal btnwid">신청</button>

    </div>
</div>
<script src="/resources/js/research-number/eval-committee-register.js"></script>
</body>
</html>
