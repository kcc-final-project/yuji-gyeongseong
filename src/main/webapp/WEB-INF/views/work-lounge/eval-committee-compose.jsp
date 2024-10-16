<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/common-noheader.jsp" %>
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
            <input id="projectName" type="text" value="[2024-RM-03-총괄] 경수형 SMR 사고해석 및 놋김핵설계 규제검증 기반기술 개발" readonly/>
        </div>
        <hr>
        <div class="setting-two">
            <div class="setting-text">연구계획서 개수</div>
            <input id="proposalCount" class="small" type="text" value="250" readonly/>
            <div class="setting-text">인원 설정</div>
            <input id="personnelSetting" class="small" type="text" value="6" readonly/>
            <div class="setting-text" style="margin-left: 500px">수신기한 설정</div>
            <input id="startDate" class="medium" type="date" value="2024-10-15"/>
            <span style="color: white">~</span>
            <input id="endDate" class="medium" type="date" value="2024-10-15"/>
        </div>
        <hr>
        <div class="setting-three">
            <div class="setting-text">연구기관 비율</div>
            <input id="researchInstituteRate" class="small" type="text" value="33%" readonly>
            <div class="setting-text">교육기관 비율</div>
            <input id="educationInstituteRate" class="small" type="text" value="33%" readonly>
            <div class="setting-text">전문기관 비율</div>
            <input id="professionalInstituteRate" class="small" type="text" value="33%" readonly>
            <button class="ctm-btn-normal" id="composeButton"
                    style="background-color: #FF8F27FF; width: 150px; margin-left: 650px">구성하기
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
                        <th style="width: 7%;"></th>
                        <th style="width: 40%;">평가위원회</th>
                        <th style="width: 17%;">수신시작일</th>
                        <th style="width: 17%;">수신종료일</th>
                        <th style="width: 25%;">수신 상태</th>
                    </tr>
                    </thead>
                </table>
                <div class="table-body-container">
                    <table class="committee-table">
                        <tbody>
                        <tr>
                            <td><input type="radio" name="committee"/></td>
                            <td>[2024-RM-03-총괄] 평가위원회-2</td>
                            <td>2024-10-15</td>
                            <td>2024-10-15</td>
                            <td><span class="status not-approved">미승인</span></td>
                        </tr>
                        <tr>
                            <td><input type="radio" name="committee"/></td>
                            <td>[2024-RM-03-총괄] 평가위원회-3</td>
                            <td>2024-10-15</td>
                            <td>2024-10-15</td>
                            <td><span class="status approved">수신완료</span></td>
                        </tr>
                        <tr>
                            <td><input type="radio" name="committee"/></td>
                            <td>[2024-RM-03-총괄] 평가위원회-3</td>
                            <td>2024-10-15</td>
                            <td>2024-10-15</td>
                            <td><span class="status approved">수신완료</span></td>
                        </tr>
                        <tr>
                            <td><input type="radio" name="committee"/></td>
                            <td>[2024-RM-03-총괄] 평가위원회-3</td>
                            <td>2024-10-15</td>
                            <td>2024-10-15</td>
                            <td><span class="status approved">수신완료</span></td>
                        </tr>
                        <tr>
                            <td><input type="radio" name="committee"/></td>
                            <td>[2024-RM-03-총괄] 평가위원회-3</td>
                            <td>2024-10-15</td>
                            <td>2024-10-15</td>
                            <td><span class="status approved">수신완료</span></td>
                        </tr>
                        <tr>
                            <td><input type="radio" name="committee"/></td>
                            <td>[2024-RM-03-총괄] 평가위원회-3</td>
                            <td>2024-10-15</td>
                            <td>2024-10-15</td>
                            <td><span class="status approved">수신완료</span></td>
                        </tr>
                        <tr>
                            <td><input type="radio" name="committee"/></td>
                            <td>[2024-RM-03-총괄] 평가위원회-3</td>
                            <td>2024-10-15</td>
                            <td>2024-10-15</td>
                            <td><span class="status approved">수신완료</span></td>
                        </tr>
                        <!-- 추가적인 행은 필요에 따라 여기에 추가 -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="committee-card">
            <div class="card-part">
                <div class="card">
                    <div class="card-row">
                        <span class="card-label">국가연구자번호</span>
                        <span class="card-value" id="researcherId">10329212</span>
                    </div>
                    <div class="card-row">
                        <span class="card-label">이름</span>
                        <span class="card-value" id="researcherName">황철원</span>
                        <span class="card-label">기관명</span>
                        <span class="card-value" id="institutionName">한국연구재단</span>
                    </div>
                    <div class="card-row">
                        <div class="card-status">
                            <span class="status approved" id="receiveStatus">수신완료</span>
                        </div>
                        <span class="card-label">수신기관</span>
                        <span class="card-value" id="institutionType">연구기관</span>
                    </div>
                </div>
                <div class="card">
                    <div class="card-row">
                        <span class="card-label">국가연구자번호</span>
                        <span class="card-value">10329212</span>
                    </div>
                    <div class="card-row">
                        <span class="card-label">이름</span>
                        <span class="card-value">황철원</span>
                        <span class="card-label">기관명</span>
                        <span class="card-value">한국연구재단</span>
                    </div>
                    <div class="card-row">
                        <div class="card-status">
                            <span class="status approved">수신완료</span>
                        </div>
                        <span class="card-label">수신기관</span>
                        <span class="card-value">연구기관</span>
                    </div>
                </div>
            </div>
            <div class="card-part">
                <div class="card">
                    <div class="card-row">
                        <span class="card-label">국가연구자번호</span>
                        <span class="card-value">10329212</span>
                    </div>
                    <div class="card-row">
                        <span class="card-label">이름</span>
                        <span class="card-value">황철원</span>
                        <span class="card-label">기관명</span>
                        <span class="card-value">한국연구재단</span>
                    </div>
                    <div class="card-row">
                        <div class="card-status">
                            <span class="status approved">수신완료</span>
                        </div>
                        <span class="card-label">수신기관</span>
                        <span class="card-value">연구기관</span>
                    </div>
                </div>
                <div class="card">
                    <div class="card-row">
                        <span class="card-label">국가연구자번호</span>
                        <span class="card-value">10329212</span>
                    </div>
                    <div class="card-row">
                        <span class="card-label">이름</span>
                        <span class="card-value">황철원</span>
                        <span class="card-label">기관명</span>
                        <span class="card-value">한국연구재단</span>
                    </div>
                    <div class="card-row">
                        <div class="card-status">
                            <span class="status approved">수신완료</span>
                        </div>
                        <span class="card-label">수신기관</span>
                        <span class="card-value">연구기관</span>
                    </div>
                </div>
            </div>
            <div class="card-part">
                <div class="card">
                    <div class="card-row">
                        <span class="card-label">국가연구자번호</span>
                        <span class="card-value">10329212</span>
                    </div>
                    <div class="card-row">
                        <span class="card-label">이름</span>
                        <span class="card-value">황철원</span>
                        <span class="card-label">기관명</span>
                        <span class="card-value">한국연구재단</span>
                    </div>
                    <div class="card-row">
                        <div class="card-status">
                            <span class="status approved">수신완료</span>
                        </div>
                        <span class="card-label">수신기관</span>
                        <span class="card-value">연구기관</span>
                    </div>
                </div>
                <div class="card">
                    <div class="card-row">
                        <span class="card-label">국가연구자번호</span>
                        <span class="card-value">10329212</span>
                    </div>
                    <div class="card-row">
                        <span class="card-label">이름</span>
                        <span class="card-value">황철원</span>
                        <span class="card-label">기관명</span>
                        <span class="card-value">한국연구재단</span>
                    </div>
                    <div class="card-row">
                        <div class="card-status">
                            <span class="status approved">수신완료</span>
                        </div>
                        <span class="card-label">수신기관</span>
                        <span class="card-value">연구기관</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="committee-summary" style="display: none">
        <div class="summary-item">
            <span>총 평가위원회 수: </span>
            <span id="totalCommitteeCount">12</span>
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
