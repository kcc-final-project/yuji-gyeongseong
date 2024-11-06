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
<div class="common-main">
    <div class="announcement-container">
        <h3>사업공고</h3>
        <hr>
        <table class="announcement-table">
            <tr>
                <th>통합공고명</th>
                <td>${announcement.totalTitle}</td>
                <th>공고번호</th>
                <td>${announcement.totalAnnNo}</td>
            </tr>
            <tr>
                <th>소관부처</th>
                <td>${announcement.competentMinistry}</td>
                <th>전문기관</th>
                <td>${announcement.specInstitution}</td>
            </tr>
            <tr>
                <th>접수유형</th>
                <td>${announcement.receptionType}</td>
                <th>공모유형</th>
                <td>${announcement.annType}</td>
            </tr>
            <tr>
                <th>공모분야 개수</th>
                <td>${announcement.subAnnCount}</td>
                <th>공고일자</th>
                <td>${announcement.createdAt}</td>
            </tr>
            <tr>
                <th>접수상태</th>
                <td>${announcement.status}</td>
                <th>접수기간</th>
                <td>${announcement.startedAt} ~ ${announcement.closedAt}</td>
            </tr>

        </table>
        <div class="selector-item">
            <button id="announcement-button">공고문</button>
            <button id="competition-field-button">공모분야</button>
            <button id="attachment-file-button">공고 첨부파일</button>
        </div>
        <div class="announcement-details">
            ${announcement.content}
            <%--            <p class="announcement-number">과학기술정보통신부 공고 제2024-0925호</p>--%>
            <%--            <h4>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</h4>--%>
            <%--            <p>과학기술정보통신부가 추진하는 『혁신형 소형모듈원자로 기술개발사업』의 신규과제를 아래와 같이 재공고하오니 관심있는 연구자분들의 많은 참여 바랍니다.</p>--%>

            <%--            <p class="announcement-date">2024년 9월 23일</p>--%>
            <%--            <div class="announcement-wrap">--%>
            <%--                <p class="Order department">&lt;주무부처&gt; 과학기술정보통신부 장관<span>우상임</span>--%>
            <%--                <p>--%>
            <%--                <p class="professional-organization">--%>
            <%--                    &lt;전문기관&gt; 과학기술정보통신부 기술개발사업단 단장<span>김한근</span></p>--%>

            <%--            </div>--%>


            <%--            <h5>가. 사업목적</h5>--%>
            <%--            <p>28년까지 경제성·안정성·유연성 측면에서 경쟁력을 갖춘 혁신형 소형모듈원자로(혁신형 SMR 또는 i-SMR)을 개발하고, 표준설계인가 취득 추진</p>--%>

            <%--            <h5>나. 사업내용</h5>--%>
            <%--            <p>(설계)<br>- 노심, 계통, 종합설계의 3개 설계분야로 구성되며 각 설계분야는 혁신기술 및 혁신제조 분야와 유기적으로 연계되어 혁신형 SMR의 표준설계 수행</p>--%>
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
                <c:forEach var="subAnn" items="${announcement.subAnnouncements}" varStatus="status">
                    <tr>
                        <th scope="row">${status.index + 1}</th>
                        <td class="subTitle-zoom-in-btn-wrap">
                                ${subAnn.subTitle}
                            <button class="zoom-in-btn"
                                    data-bs-toggle="modal"
                                    data-bs-target="#exampleModal"
                                    data-announcement-no="${subAnn.subAnnNo}">
                                <span class="material-icons">zoom_in</span>
                            </button>
                        </td>
                        <td>${announcement.annType}</td> <!-- annType 가져오기 -->
                        <td>${subAnn.planType}</td>
                        <td>${announcement.startedAt}</td> <!-- startedAt 가져오기 -->
                        <td>${announcement.closedAt}</td> <!-- closedAt 가져오기 -->
                    </tr>
                </c:forEach>
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
                    <td>
      <span
              class="material-icons download-icon"
              style="cursor: pointer; color: blue; text-decoration: underline;"
      >
        download
      </span>
                    </td>
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
            <button type="button" class=" inventory" onclick="window.location.href='/anno'">목록</button>
            <button type="button" class="apply" id="apply-btn" data-annNo="${announcement.annNo}">신청하기</button>
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
                                    <td id="subAnnUniNo"></td>
                                    <th class="table-title">담당자명</th>
                                    <td id="mgrName"></td>
                                </tr>
                                <tr>
                                    <th class="table-title">공모분야명</th>
                                    <td colspan="3" id="subTitle"></td>
                                </tr>
                                <tr>
                                    <th class="table-title">전문기관</th>
                                    <td id="specInstitution"></td>
                                    <th class="table-title" id="">담당자 연락처</th>
                                    <td id="mgrTel"></td>
                                </tr>
                                <tr>
                                    <th class="table-title">전문기관 관리번호</th>
                                    <td id="specInstitutionNo"></td>
                                    <th class="table-title">기획년도</th>
                                    <td id="planningYear"></td>
                                </tr>
                                <tr>
                                    <th class="table-title">기술분야</th>
                                    <td id="techFieldName"></td>
                                    <th class="table-title">공모유형</th>
                                    <td id="annType"></td>
                                </tr>
                                <tr>
                                    <th class="table-title">총 정부 지원금</th>
                                    <td id="totalSubsidy"></td>
                                    <th class="table-title">1차년도 정부 지원금</th>
                                    <td id="oneYearSubsidy"></td>
                                </tr>
                                <tr>
                                    <th class="table-title">총 개발 개월</th>
                                    <td id="totalDevMonth"></td>
                                    <th class="table-title">1차년도 개발 개월</th>
                                    <td id="oneYearDevMonth"></td>
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
                                            <a href="https://kcc-bucket.s3.ap-northeast-2.amazonaws.com/kcc_yugi/%EA%B6%8C%ED%95%9C%EB%B3%84+%EC%9B%8C%ED%81%AC%EB%9D%BC%EC%9A%B4%EC%A7%80+%ED%83%AD.txt"
                                               download="권한별_워크라우지_택.txt">
                                                <span class="material-icons">download</span>
                                            </a>
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

<script src="/resources/js/announcement/detailed-notice.js"></script>
</body>
</html>
