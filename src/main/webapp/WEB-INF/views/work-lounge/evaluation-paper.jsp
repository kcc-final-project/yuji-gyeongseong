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
    <!-- SweetAlert2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        .custom-swal-popup {
            width: 600px;
        }
    </style>

</head>
<body>
<div class="main-container" style="width: 100%;height: 756px;">
    <%--    <div class="marin-header"--%>
    <%--         style="width: 100%; height: 10%; display: flex; justify-content: center; align-items: center;">--%>
    <%--        <h2>평가보고서</h2>--%>
    <%--    </div>--%>
    <%--    <div class="col-2"></div>--%>
    <div class="container col-11 mt-2 mb-2">
        <table class="table table-bordered shadow table-container">
            <tbody>
            <c:if test="${not empty paperList}">
                <tr>
                    <td class="table-active domain">사업명</td>
                    <td colspan="3">${paperList[0].totalTitle}</td>
                </tr>
                <tr class="letter">
                    <td class="table-active domain">연구개발계획서번호</td>
                    <td>[RM-2024-NO${paperList[0].rndPlanNo}]</td>
                    <td class="table-active domain">평가일</td>
                    <td>${paperList[0].evalCompletedAt}</td>
                </tr>
                <tr class="letter">
                    <td class="table-active domain">연구개발과제명</td>
                    <td colspan="3">${paperList[0].taskName}</td>
                </tr>
                <tr class="letter">
                    <td class="table-active domain">주관연구개발기관</td>
                    <td>${paperList[0].rndInstitution}</td>
                    <td class="table-active domain">연구책임자</td>
                    <td>${paperList[0].name}</td>
                </tr>
                <tr class="letter">
                    <td class="table-active domain">평가위원</td>
                    <td>${paperList[0].etname}</td>
                    <td class="table-active domain">소속</td>
                    <td>${paperList[0].affilType}</td>
                </tr>
                <tr class="letter">
                    <td class="table-active domain">부서</td>
                    <td>${paperList[0].affilDept}</td>
                    <td class="table-active domain">직위</td>
                    <td>${paperList[0].position}</td>
                </tr>
            </c:if>

            <tr>
                <td colspan="4">
                    <c:forEach var="paper" items="${paperList}">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">

                            <li class="nav-item">
                                <a
                                        class="nav-link active evpaper"
                                        style="border-radius: 0.375rem 0.375rem 0 0; border-top: 1px solid #2f3f6a; border-left: 1px solid #2f3f6a; border-right: 1px solid #2f3f6a;"
                                        id="common-tab"
                                        data-toggle="tab"
                                        href="#common"
                                        role="tab"
                                        aria-controls="common"
                                        aria-selected="true"
                                        data-id="공통"
                                        data-form-id="${paper.formType}"
                                >공통 평가지</a
                                >
                            </li>
                            <li class="nav-item">
                                <a
                                        class="nav-link evpaper"
                                        style="border-radius: 0.375rem 0.375rem 0 0; border-top: 1px solid #2f3f6a; border-left: 1px solid #2f3f6a; border-right: 1px solid #2f3f6a;"
                                        id="skill-tab"
                                        data-toggle="tab"
                                        href="#skill"
                                        role="tab"
                                        aria-controls="skill"
                                        aria-selected="false"
                                        data-id="${paper.type}"
                                        data-form-id="${paper.formType}"
                                >기술분야 평가지 (${paper.tfName})</a>
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
                                <p class="text-end mt-2 shadow-sm p-1">
                                    총 합계 : <span id="result1">0</span>점
                                </p>
                                    <%--                            <br>--%>
                                    <%--                            <div class="d-flex mt-5">--%>
                                    <%--                                <div class="col-4"></div>--%>
                                    <%--                                <button--%>
                                    <%--                                        class="btn save-button ctm-btn-white"--%>
                                    <%--                                        onclick="saveSurvey()"--%>
                                    <%--                                >--%>
                                    <%--                                    취소--%>
                                    <%--                                </button>--%>
                                    <%--                                <div class="col-1"></div>--%>
                                    <%--                                <button--%>
                                    <%--                                        class="btn btn-primary edit-button ctm-btn-normal"--%>
                                    <%--                                        onclick="enableEditing()"--%>
                                    <%--                                >--%>
                                    <%--                                    완료--%>
                                    <%--                                </button>--%>
                                    <%--                            </div>--%>
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

                                <p class="text-end mt-2 shadow-sm p-1">
                                    총 합계 : <span id="result2">0</span>점
                                </p>
                                <br>
                                <div class="d-flex mt-2 me-4">
                                    <div class="col-4"></div>
                                    <button
                                            class="btn btn-primary save-button ctm-btn-white"
                                            onclick="window.close();"
                                    >
                                        취소
                                    </button>
                                    <div class="col-1"></div>
                                    <button
                                            class="btn btn-primary edit-button ctm-btn-normal"
                                            onclick="saveScores();"
                                    >
                                        완료
                                    </button>
                                </div>
                                <br>
                            </div>

                        </div>
                    </c:forEach>
                </td>
            </tbody>
        </table>
    </div>
    <%--    <div class="col-2"></div>--%>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="/resources/js/work-lounge/evaluation-paper.js"></script>
    <script>
        function saveScores() {

            const totalScore1 = parseInt(localStorage.getItem('totalScore_common')) || 0;
            const totalScore2 = parseInt(localStorage.getItem('totalScore_specific')) || 0;


            const totalScore = totalScore1 + totalScore2;


            const scoreData = {
                totalScore: totalScore  // 합산된 점수
                // evalCommitteeNo: 1,
                // rndPlanNo: 3,
                // memNo: 1,
                // evaluationTableNo: 1
            };

            // $.ajax({
            //     url: "/work-lounge/score",
            //     type: "POST",
            //     contentType: "application/json",
            //     data: JSON.stringify(scoreData),
            //
            //     success: function (response) {
            //         console.log("점수가 성공적으로 저장되었습니다.", response);
            //
            //         Swal.fire({
            //             icon: 'success',
            //             title: '점수가 성공적으로 저장되었습니다.',
            //             text: '점수가 저장되었습니다.',
            //             confirmButtonText: '확인',
            //             customClass: {
            //                 popup: 'custom-swal-popup'
            //             }
            //         }).then(() => {
            //             window.close();
            //         });
            //     },
            //     error: function (xhr, status, error) {
            //         console.error("점수 저장 오류:", status, error);
            //
            //         Swal.fire({
            //             icon: 'error',
            //             title: '점수 저장에 실패했습니다.',
            //             text: '다시 시도해주세요.',
            //             confirmButtonText: '확인'
            //         });
            //     }
            // });

            Swal.fire({
                icon: 'success',
                title: '점수가 성공적으로 저장되었습니다.',
                text: '점수가 저장되었습니다.',
                confirmButtonText: '확인',
                customClass: {
                    popup: 'custom-swal-popup'
                }
            }).then(() => {
                window.close();
            });
        }

    </script>

</div>
</body>
</html>
