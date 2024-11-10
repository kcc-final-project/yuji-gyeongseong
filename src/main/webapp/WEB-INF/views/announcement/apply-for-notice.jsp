<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/announcement/apply-for-notice.css"/>
    <title>Insert title here</title>
</head>
<body>
<h1></h1>
<div class="common-main">

    <%--    <div class="section-title">--%>
    <%--        <h2>공모분야</h2>--%>
    <%--    </div>--%>

    <div class="technology-field-area">
<table class="table table-bordered table-hover" style="width: 99%;">
    <thead style="display: table; width: 100%; table-layout: fixed;">
        <tr>
            <th scope="col" style="width: 47%; background-color: #2E406A; color: white;">통합공고명</th>
            <th scope="col" style="width: 20%; background-color: #2E406A; color: white;">기술분야</th>
            <th scope="col" style="width: 20%; background-color: #2E406A; color: white;">소관부처</th>
            <th scope="col" style="width: 10%; background-color: #2E406A; color: white;">상세보기</th>
        </tr>
    </thead>
    <tbody class="technology-anno-list" style="
        display: block;
        height: 179px;
        overflow-y: auto;
        width: 100%;
        table-layout: fixed;
    ">
        <c:forEach var="item" items="${announcement}">
            <tr style="display: table; width: 100%; table-layout: fixed;">
                <td class="anno-title" data-annNo="${item.annNo}">${item.totalTitle}</td>
                <td class="text-align" style="width: 251px">${item.annTechFieldName}</td>
                <td class="text-align" style="width: 252px">${item.competentMinistry}</td>
                <td class="text-align">
                    <button class="details-btn">상세보기</button>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

    </div>
        <div class="header">
            <h5 class="title">공고명: ${applyAnnouncement.totalTitle}</h5>
        </div>
    <div class="card-container">
        <c:forEach var="data" items="${applyAnnouncement.subAnnouncements}" varStatus="index">
            <div class="card" data-subAnnNo= ${data.subAnnNo}>
                <h3 class="card-name">공모분야명</h3>
                <h5 class="card-title">${data.subTitle}</h5>
                <div class="card-info">
                    <p class="card-info-field">기술분야</p>
                    <p class="card-info-category">공모유형</p>
                </div>
                <div class="card-info">
                    <p class="field-contents">${data.techFieldName}</p>
                    <p class="card-info-category category-contents">${applyAnnouncement.annType}</p>

                </div>
                <div class="buttons">
                    <button class="detail-btn"
                            data-bs-toggle="modal"
                            data-bs-target="#exampleModal"
                            data-announcement-no="${data.subAnnNo}">상세보기
                    </button>
                    <button class="apply-btn">접수하기</button>
                </div>
            </div>
        </c:forEach>
    </div>



    <div class="footer-buttons">
        <button class="back-btn" onclick="window.history.back()">뒤로</button>
        <button class="list-btn" onclick="window.location.href='/anno'">목록</button>
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
                                <tbody class="file-body">
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
<script>
    const isLoggedIn = <%= session.getAttribute("principalDetailId") != null %>;
</script>
<script src="/resources/js/announcement/apply-for-notice.js"></script>
</body>
</html>