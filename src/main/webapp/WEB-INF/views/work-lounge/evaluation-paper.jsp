<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@
        include file="../common/common-noheader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>평가 보고서</title>
    <link
            rel="stylesheet"
            href="/resources/css/work-lounge/evaluation-paper.css"
    />
</head>
<body>
<div class="main-container" style="width: 100%;height: 756px;">
    <div class="marin-header"
         style="width: 100%; height: 10%; display: flex; justify-content: center; align-items: center;">
        <h2>평가보고서</h2>
    </div>
    <div class="container">
        <table class="table table-bordered">
            <tbody>
            <c:if test="${not empty paperList}">
                <tr>
                    <th class="table-active domain">사업명</th>
                    <th colspan="3">${paperList[0].totalTitle}</th>
                </tr>
                <tr>
                    <th class="table-active domain">연구개발계획서번호</th>
                    <td>${paperList[0].rndPlanNo}</td>
                    <th class="table-active domain">평가일</th>
                    <td>${paperList[0].evalCompletedAt}</td>
                </tr>
                <tr>
                    <th class="table-active domain">연구개발과제명</th>
                    <td colspan="3">${paperList[0].taskName}</td>
                </tr>
                <tr>
                    <th class="table-active domain">주관연구개발기관</th>
                    <td>${paperList[0].rndInstitution}</td>
                    <th class="table-active domain">연구책임자</th>
                    <td>${paperList[0].rndMem}</td>
                </tr>
                <tr>
                    <th class="table-active domain">평가위원</th>
                    <td>${paperList[0].etMem}</td>
                    <th class="table-active domain">소속</th>
                    <td>${paperList[0].affilType}</td>
                </tr>
                <tr>
                    <th class="table-active domain">부서</th>
                    <td>${paperList[0].affilDept}</td>
                    <th class="table-active domain">직위</th>
                    <td>${paperList[0].position}</td>
                </tr>
            </c:if>

            <tr>
                <td colspan="4">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <c:forEach var="paper" items="${paperList}">
                            <li class="nav-item">
                                <a
                                        class="nav-link active evpaper"
                                        id="common-tab"
                                        data-toggle="tab"
                                        href="#common"
                                        role="tab"
                                        aria-controls="common"
                                        aria-selected="true"
                                        data-id="common"
                                        data-form-id="${paper.formType}"
                                >공통 평가지</a
                                >
                            </li>
                            <li class="nav-item">
                                <a
                                        class="nav-link evpaper"
                                        id="skill-tab"
                                        data-toggle="tab"
                                        href="#skill"
                                        role="tab"
                                        aria-controls="skill"
                                        aria-selected="false"
                                        data-id="${paper.type}"
                                        data-form-id="${paper.formType}"
                                >기술분야 평가지 (${paper.type})</a
                                >
                            </li>

                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div
                                class="tab-pane fade show active"
                                id="common"
                                role="tabpanel"
                                aria-labelledby="common-tab"
                        >
                            <table class="table table-bordered common">
                                <tbody>
                                <!-- 여기 나옴. -->
                                </tbody>
                            </table>
                            <h3 class="text-end mt-2 shadow-sm score">
                                총 점수 : <span id="result1">0</span>점
                            </h3>
                            <br>
                            <div class="d-flex mt-5">
                                <div class="col-4"></div>
                                <button
                                        class="btn btn-primary save-button ctm-btn-normal"
                                        onclick="saveSurvey()"
                                >
                                    취소
                                </button>
                                <div class="col-1"></div>
                                <button
                                        class="btn btn-primary edit-button ctm-btn-normal"
                                        onclick="enableEditing()"
                                >
                                    완료
                                </button>
                            </div>
                            <br>
                        </div>

                        <div
                                class="tab-pane fade"
                                id="skill"
                                role="tabpanel"
                                aria-labelledby="skill-tab"
                        >

                            <table class="table table-bordered data-table ${paper.type}">
                                <tbody>
                                <!-- 여기 나옴. -->
                                </tbody>
                            </table>
                            </c:forEach>
                            <h3 class="text-end mt-2 shadow-sm score">
                                총 점수 : <span id="result2">0</span>점
                            </h3>
                            <br>
                            <div class="d-flex mt-5">
                                <div class="col-4"></div>
                                <button
                                        class="btn btn-primary save-button ctm-btn-normal"
                                        onclick="saveSurvey()"
                                >
                                    취소
                                </button>
                                <div class="col-1"></div>
                                <button
                                        class="btn btn-primary edit-button ctm-btn-normal"
                                        onclick="enableEditing()"
                                >
                                    완료
                                </button>
                            </div>
                            <br>
                        </div>

                    </div>
                </td>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="/resources/js/work-lounge/evaluation-paper.js"></script>


</div>
</body>
</html>
