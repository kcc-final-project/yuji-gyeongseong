<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/common-noheader.jsp" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>유지경성</title>
    <link rel="stylesheet" href="/resources/css/work-lounge/eval-committee-compose.css"/>

    <!-- Material Icons CSS -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined">

</head>
<body style="height: auto;">
<div class="common-main">

    <div class="title">
        <p>평가위원회 구성</p>
    </div>

    <div class="committee-setting" id="committee-setting">
        <div class="setting-one">
            <div class="setting-text">공모분야명</div>
            <input id="projectName" type="text" value="[${subAnnounce.subAnnUniNo}] ${subAnnounce.subTitle}"
                   readonly/>
            <div class="setting-text" style="margin-left: 150px">평가기간</div>
            <input id="evaluationStartDate" class="sedium"
                   value="<fmt:formatDate value='${evalCommittee.evalStartedAt}' pattern='yyyy-MM-dd' />" readonly/>
            <span style="color: white">~</span>
            <input id="evaluationEndDate" class="sedium"
                   value="<fmt:formatDate value='${evalCommittee.evalClosedAt}' pattern='yyyy-MM-dd' />" readonly/>
        </div>
        <hr>
        <div class="setting-two">
            <div class="setting-text">연구계획서 개수</div>
            <input id="proposalCount" class="small" type="text" value='${rndPlanCnt}' readonly/>
            <div class="setting-text">인원 설정</div>
            <input id="personnelSetting" class="small" type="text" value="6" readonly/>

            <div class="setting-text" style="margin-left: 500px">수신기한 설정</div>
            <input id="receptionStartDate" class="medium" type="date" value="2024-10-15"/>
            <span style="color: white">~</span>
            <input id="receptionEndDate" class="medium" type="date" value="2024-10-15"/>


        </div>
        <hr>
        <div class="setting-three">
            <div class="setting-text">산업체 비율</div>
            <input id="researchInstituteRate" class="small" type="text" value="33%" readonly>
            <div class="setting-text">교육기관 비율</div>
            <input id="educationInstituteRate" class="small" type="text" value="33%" readonly>
            <div class="setting-text">연구기관 비율</div>
            <input id="professionalInstituteRate" class="small" type="text" value="33%" readonly>
            <button class="ctm-btn-normal" id="composeButton" onclick="setEvalCommittee(${subAnnounce.subAnnNo})"
                    style="background-color: #FF8F27FF; width: 150px; margin-left: 650px;">구성하기
            </button>
            <button class="ctm-btn-normal" id="recomposeButton" onclick="resetEvalCommittee(${subAnnounce.subAnnNo})"
                    style="background-color: #FF8F27FF; width: 150px; margin-left: 650px; display: none">재구성하기
            </button>
        </div>
    </div>

    <div class="committee-standby" id="committee-standby">
        <div class="material-icons-outlined" style="font-size: 70px; color: #6BC256">info</div>
        <div class="standby-comment" style="margin-top: 20px; font-weight: bold">구성하기 버튼을 통해 <br> 평가위원회를 구성해주세요</div>
    </div>

    <div class="committee-info" id="committee-info" style="display: none">
        <div class="committee">
            <div class="table-container">
                <table class="committee-table">
                    <thead>
                    <tr>
                        <th style="width: 7.8%; font-size: small">전자<br>알림</th>
                        <th style="width: 23.8%;">평가위원회</th>
                        <th style="width: 20%;">수신시작일</th>
                        <th style="width: 20%;">수신종료일</th>
                        <th style="width: 20.5%;">수신 상태</th>
                    </tr>
                    </thead>
                </table>
                <div class="table-body-container">
                    <table class="committee-table table table-hover">
                        <tbody>

<%--                        <c:forEach var="committee" items="${committees}">
                            <tr data-committee-id="${committee.evalCommitteeNo}"
                                data-start-date="<fmt:formatDate value='${evalCommittee.evalStartedAt}' pattern='yyyy-MM-dd'/>"
                                data-end-date="<fmt:formatDate value='${evalCommittee.evalClosedAt}' pattern='yyyy-MM-dd'/>"
                                data-title="[${subAnnounce.subAnnUniNo}] ${committee.name}">
                                <td><input type="checkbox" name="committee" checked/></td>
                                <td class="subAnnounceName"
                                    data-sub-announce-name="[${subAnnounce.subAnnUniNo}] ${committee.name}">
                                    [${subAnnounce.subAnnUniNo}] ${committee.name}</td>
                                <td><fmt:formatDate value='${evalCommittee.evalStartedAt}' pattern='yyyy-MM-dd'/></td>
                                <td><fmt:formatDate value='${evalCommittee.evalClosedAt}' pattern='yyyy-MM-dd'/></td>
                                <td><span class="status stayed">승인대기</span></td>
                            </tr>
                        </c:forEach>--%>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="committee-card" id="researcherContainer">
            <div class="info-card">
                <div class="material-icons-outlined" style="font-size: 70px; color: #6BC256;">info
                </div>
                <div class="info-text">연구원 정보를 확인하려면 평가위원회를 눌러주세요</div>
            </div>
        </div>
    </div>

    <div class="committee-summary" style="display: none">
        <div class="summary-item">
            <span>총 평가위원회 수: </span>
            <span id="totalCommitteeCount">${fn:length(committees)}</span>
        </div>
        <div class="summary-item">
            <span>평가위원회명: </span>
            <span id="committeeName">[2024-RM-03-총괄] 평가위원회-1</span>
        </div>
        <div class="summary-item">
            <span>평가위원 수: </span>
            <span id="committeeMemberCount">6</span>
        </div>
    </div>


    <div class="committee-btn">
        <button id="cancelButton" class="ctm-btn-normal delete-button" style="width: 100px; ">
            취소
        </button>
        <button id="sendButton" class="ctm-btn-normal add-button" style="width: 200px; background-color: #FF8F27FF">
            전자알림 전송
        </button>
    </div>

</div>

<script src="/resources/js/work-lounge/eval-committee-compose.js"></script>
</body>
</html>
