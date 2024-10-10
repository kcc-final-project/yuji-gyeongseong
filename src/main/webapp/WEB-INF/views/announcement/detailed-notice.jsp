<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>유지경성</title>
    <link rel="stylesheet" href="/resources/css/announcement/detailed-notice.css"/>
</head>
<body>
<script>
    $(function () {
        $('#announcement-button').addClass('active');
        $('.announcement-details').css("display", "block");

        function showField(targetClass, activeButton) {
            $('.announcement-details, .public-notice-field, .attachment-field').css("display", "none");
            $(targetClass).css("display", "block");

            $('#announcement-button, #competition-field-button, #attachment-file-button').removeClass('active');
            $(activeButton).addClass('active');
        }
        $('#announcement-button').on('click', function () {
            showField('.announcement-details', this);
        });
        $('#competition-field-button').on('click', function () {
            showField('.public-notice-field', this);
        });
        $('#attachment-file-button').on('click', function () {
            showField('.attachment-field', this);
        });
    });

</script>
<div class="common-main">
    <div class="announcement-container">
        <h3>사업공고</h3>
        <hr>
        <table class="announcement-table">
            <tr>
                <th>통합공고명</th>
                <td>2024년 제2차 미래국방혁신기술개발사업 신규과제 재공고</td>
                <th>공고번호</th>
                <td>과학기술정보통신부 공고 제 2024 - 0937호</td>
            </tr>
            <tr>
                <th>소관부처</th>
                <td>과학기술정보통신부</td>
                <th>전문기관</th>
                <td>한국연구재단</td>
            </tr>
            <tr>
                <th>공모분야명</th>
                <td>미래국방혁신기술개발(R&D)</td>
                <th>공모유형</th>
                <td>종합지원공모</td>
            </tr>
            <tr>
                <th>공모분야 개수</th>
                <td>4</td>
                <th>공고일자</th>
                <td>2024-09-23</td>
            </tr>
            <tr>
                <th>접수유형</th>
                <td>선정형 연구개발계획서</td>
                <th>접수기간</th>
                <td>2024-09-23 10:00:00 ~ 2024-10-11 23:59:59</td>
            </tr>
        </table>
        <div class="selector-item">
            <button id="announcement-button" >공고문</button>
            <button id="competition-field-button" >공모분야</button>
            <button id="attachment-file-button" >공고 첨부파일</button>
        </div>
        <div class="announcement-details">
            <p class="announcement-number">과학기술정보통신부 공고 제2024-0925호</p>
            <h4>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</h4>
            <p>과학기술정보통신부가 추진하는 『혁신형 소형모듈원자로 기술개발사업』의 신규과제를 아래와 같이 재공고하오니 관심있는 연구자분들의 많은 참여 바랍니다.</p>

            <p class="announcement-date">2024년 9월 23일</p>
            <div class="announcement-wrap">
                <p class="Order department">&lt;주무부처&gt; 과학기술정보통신부 장관<span>우상임</span>
                <p>
                <p class="professional-organization">
                    &lt;전문기관&gt; 과학기술정보통신부 기술개발사업단 단장<span>김한근</span></p>

            </div>


            <h5>가. 사업목적</h5>
            <p>28년까지 경제성·안정성·유연성 측면에서 경쟁력을 갖춘 혁신형 소형모듈원자로(혁신형 SMR 또는 i-SMR)을 개발하고, 표준설계인가 취득 추진</p>

            <h5>나. 사업내용</h5>
            <p>(설계)<br>- 노심, 계통, 종합설계의 3개 설계분야로 구성되며 각 설계분야는 혁신기술 및 혁신제조 분야와 유기적으로 연계되어 혁신형 SMR의 표준설계 수행</p>
        </div>
        <div class="public-notice-field">
            <table class="table shadow-sm notice-field-contents table-hover">
                <thead>
                <tr>
                    <th scope="col" class="notice-field-th">번호</th>
                    <th scope="col" class="notice-field-th">공모 분야명</th>
                    <th scope="col" class="notice-field-th">공모 유형</th>
                    <th scope="col" class="notice-field-th">계획서 유형</th>
                    <th scope="col" class="notice-field-th">접수 시작일</th>
                    <th scope="col" class="notice-field-th">접수 종료일</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>
                        [공공융합1] 극지고층대기 감시 및 미래 우주기상 예측 연구개발 전략수립 기획
                        <button class="zoom-in-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            <span class="material-icons">zoom_in</span>
                        </button>
                    </td>
                    <td>품목지정공모</td>
                    <td>신청용 연구개발계획서</td>
                    <td>2024-09-23</td>
                    <td>2024-10-11</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>[공공융합1] 극지고층대기 감시 및 미래 우주기상 예측 연구개발 전략수립 기획<button class="zoom-in-btn" data-bs-toggle="modal" data-bs-target="#exampleModal"><span class="material-icons">zoom_in</span></button></td>
                    <td>품목지정공모</td>
                    <td>신청용 연구개발계획서</td>
                    <td>2024-09-23</td>
                    <td>2024-10-11</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>[공공융합1] 극지고층대기 감시 및 미래 우주기상 예측 연구개발 전략수립 기획<button class="zoom-in-btn" data-bs-toggle="modal" data-bs-target="#exampleModal"><span class="material-icons">zoom_in</span></button></td>
                    <td>품목지정공모</td>
                    <td>신청용 연구개발계획서</td>
                    <td>2024-09-23</td>
                    <td>2024-10-11</td>
                </tr>
                <tr>
                    <th scope="row">4</th>
                    <td>[공공융합1] 극지고층대기 감시 및 미래 우주기상 예측 연구개발 전략수립 기획<button class="zoom-in-btn" data-bs-toggle="modal" data-bs-target="#exampleModal"><span class="material-icons">zoom_in</span></button></td>
                    <td>품목지정공모</td>
                    <td>신청용 연구개발계획서</td>
                    <td>2024-09-23</td>
                    <td>2024-10-11</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="attachment-field">
            <table class="table shadow-sm notice-field-contents table-hover">
                <thead>
                <tr>
                    <th scope="col" class="notice-field-th">번호</th>
                    <th scope="col" class="notice-field-th">파일명</th>
                    <th scope="col" class="notice-field-th">문서 유형</th>
                    <th scope="col" class="notice-field-th">크기(KB)</th>
                    <th scope="col" class="notice-field-th">PDF</th>
                    <th scope="col" class="notice-field-th"></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>초소형 관성센서를 위한 탄소나노튜브 기반 고감도 감지부 제조기술.pdf</td>
                    <td>과제 제안요구서(RFP)</td>
                    <td>718.3</td>
                    <td><span class="material-icons pdf">picture_as_pdf</span></td>
                    <td><span class="material-icons download-icon">download</span></td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>초소형 관성센서를 위한 탄소나노튜브 기반 고감도 감지부 제조기술.pdf</td>
                    <td>과제 제안요구서(RFP)</td>
                    <td>718.3</td>
                    <td><span class="material-icons pdf">picture_as_pdf</span></td>
                    <td><span class="material-icons download-icon">download</span></td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>초소형 관성센서를 위한 탄소나노튜브 기반 고감도 감지부 제조기술.pdf</td>
                    <td>과제 제안요구서(RFP)</td>
                    <td>718.3</td>
                    <td><span class="material-icons pdf">picture_as_pdf</span></td>
                    <td><span class="material-icons download-icon">download</span></td>
                </tr>
                <tr>
                    <th scope="row">4</th>
                    <td>초소형 관성센서를 위한 탄소나노튜브 기반 고감도 감지부 제조기술.pdf</td>
                    <td>과제 제안요구서(RFP)</td>
                    <td>718.3</td>
                    <td><span class="material-icons pdf">picture_as_pdf</span></td>
                    <td><span class="material-icons download-icon">download</span></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="btn-wrap">
            <button type="button" class=" inventory">목록</button>
            <button type="button" class=" apply">신청하기</button>
        </div>
    </div>
    <div class="modal fade" id="exampleModal">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable sang">
            <div class="modal-content hak">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">공모분야(RFP)상세 조회</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="yea-area">
                        <div class="yea-header">
                            <p>공모분야(RFP)상세 조회</p>
                        </div>
                        <div class="yea-body">
                            <table class="shadow-sm p-3 mb-5 bg-body rounded">
                                <tr>
                                    <th class="table-title">공모분야 ID</th>
                                    <td>0008074</td>
                                    <th class="table-title">담당자명</th>
                                    <td>정희근</td>
                                </tr>
                                <tr>
                                    <th class="table-title">공모분야명</th>
                                    <td colspan="3">초소형 관성센서를 위한 탄소나노튜브 기반 고감도 감지부 제조기술</td>
                                </tr>
                                <tr>
                                    <th class="table-title">전문기관</th>
                                    <td>한국연구재단</td>
                                    <th class="table-title">담당자 연락처</th>
                                    <td>02-438-5321</td>
                                </tr>
                                <tr>
                                    <th class="table-title">전문기관 관리번호</th>
                                    <td>2024-공공기술-10</td>
                                    <th class="table-title">기획년도</th>
                                    <td>2024</td>
                                </tr>
                                <tr>
                                    <th class="table-title">기술분야</th>
                                    <td>재료 > 국방소재 > 나노재료/공정</td>
                                    <th class="table-title">공모유형</th>
                                    <td>품목지정공모</td>
                                </tr>
                                <tr>
                                    <th class="table-title">총 정부 지원금</th>
                                    <td>385,000 (천원)</td>
                                    <th class="table-title">1차년도 정부 지원금</th>
                                    <td>65,000 (천원)</td>
                                </tr>
                                <tr>
                                    <th class="table-title">총 개발 개월</th>
                                    <td>29</td>
                                    <th class="table-title">1차년도 개발 개월</th>
                                    <td>5</td>
                                </tr>
                            </table>
                            <div class="file-title-area">
                                <p>첨부파일</p>
                                <hr>
                                <table>
                                    <thead>
                                    <tr>
                                        <th class="header-title" style="width: 65px;">번호</th>
                                        <th class="header-title">파일명</th>
                                        <th class="header-title">문서유형</th>
                                        <th class="header-title">PDF</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="index-number">1</td>
                                        <td>초소형 관성센서를 위한 탄소나노튜브 기반 고감도 감지부 제조기술.pdf</td>
                                        <td>과제 제안요구서(RFP)</td>
                                        <td>
                                            <span class="material-icons pdf">picture_as_pdf</span>
                                        </td>
                                        <td>
                                            <span class="material-icons download-icon">download</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="index-number">2</td>
                                        <td>초소형 관성센서를 위한 탄소나노튜브 기반 고감도 감지부 제조기술.pdf</td>
                                        <td>과제 제안요구서(RFP)</td>
                                        <td>
                                            <span class="material-icons pdf">picture_as_pdf</span>
                                        </td>
                                        <td>
                                            <span class="material-icons download-icon">download</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="index-number">3</td>
                                        <td>초소형 관성센서를 위한 탄소나노튜브 기반 고감도 감지부 제조기술.pdf</td>
                                        <td>과제 제안요구서(RFP)</td>
                                        <td>
                                            <span class="material-icons pdf">picture_as_pdf</span>
                                        </td>
                                        <td>
                                            <span class="material-icons download-icon">download</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="index-number">4</td>
                                        <td>초소형 관성센서를 위한 탄소나노튜브 기반 고감도 감지부 제조기술.pdf</td>
                                        <td>과제 제안요구서(RFP)</td>
                                        <td>
                                            <span class="material-icons pdf">picture_as_pdf</span>
                                        </td>
                                        <td>
                                            <span class="material-icons download-icon">download</span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary modal-close" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>






</body>
</html>