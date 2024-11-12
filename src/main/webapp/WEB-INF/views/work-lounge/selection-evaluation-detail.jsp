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
    <title>의견공유</title>
    <link
            rel="stylesheet"
            href="/resources/css/work-lounge/selection-evaluation-detail.css"
    />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
    />
    <!-- SweetAlert2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body style="height: auto;">
<div class="common-main" style="margin-top: 10px;">
    <div class="container">
        <div style="max-height: 320px; overflow-y: auto">

            <table class="table table-bordered text-center table-hover">
                <c:if test="${not empty selectEvaluationDetail}">
                    <thead>
                    <tr class="domain" style="font-size: 15px">
<%--                        <td class="col-1">--%>
<%--                            <h5>--%>
<%--                                <span class="pt-1 pb-1 badge text-bg-secondary black" style="background-color: #ffffff !important;">--%>
<%--                                    <c:out value="${selectEvaluationDetail[0].evalStatus}"/>--%>
<%--                                </span>--%>
<%--                            </h5>--%>
<%--                        </td>--%>
                        <td class="col-5 align-middle" colspan="3">
                            <div class="d-flex justify-content-center align-items-center">
                                <span class="me-2 w-25">공모분야명</span>
                                <input class="border d-inline-block form-control form-control-sm align-middle p-2 truncate-text"
                                       style="border: 1px solid black; width: 350px; border-radius: 5px; text-align: center"
                                       value="${selectEvaluationDetail[0].subTitle}" disabled readonly>
                            </div>
                        </td>
                        <td class="col-5 align-middle" colspan="3">
                            <div class="input-group" style="width: 100%">
                                <div class="d-flex justify-content-center align-items-center">
                                    <span class="w-25 me-1">최종선정기간</span>
                                    <div class="input-group w-75">
                                        <input type="text" class="form-control date-input" style="text-align: center"
                                               id="startDate"
                                               value="${selectEvaluationDetail[0].startDate}" disabled readonly/>
                                        <span class="input-group-text">~</span>
                                        <input type="text" class="form-control date-input" style="text-align: center"
                                               id="endDate"
                                               value="${selectEvaluationDetail[0].finalSelectedAt}" disabled readonly/>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td class="col-1 align-middle" style="padding-left: 13px">
                            <select id="committeeSelect" class="form-control" style="width: 130px">
                                <option value="ALL">전체</option>
                                <option value="평가위원회-01">평가위원회-01</option>
                                <option value="평가위원회-02">평가위원회-02</option>
                                <option value="평가위원회-03">평가위원회-03</option>
                                <option value="평가위원회-04">평가위원회-04</option>
                                <option value="평가위원회-05">평가위원회-05</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="blue">
                        <td class="align-middle text-center">
                            <div class="form-check d-flex justify-content-center align-items-center">
                                <input class="form-check-input" type="checkbox" value="" id="allcheck-input"/>
                            </div>
                        </td>
                        <td>계획서번호</td>
                        <td>과제명</td>
                        <td>주관연구기관</td>
                        <td>연구책임자</td>
                        <td>평균점수</td>
                        <td>계획서상태</td>
                    </tr>
                    </thead>
                </c:if>

                <tbody id="plansTable" class="text-center">
                <c:forEach items="${selectEvaluationDetail}" var="selectEvaluation" varStatus="status">
                    <tr class="committee-font" data-committee="${selectEvaluation.committeeName}">
                        <td class="align-middle text-center">
                            <div class="form-check d-flex justify-content-center align-items-center">
                                <input
                                        class="form-check-input plan-checkbox committee-member"
                                        type="checkbox"
                                        value="${selectEvaluation.subAnnNo}"
                                        data-plan="${selectEvaluation.rndTaskNo}"
                                        data-id="${selectEvaluation.rndPlanNo}"
                                />
                            </div>
                        </td>
                        <td class="committee-member" style="padding-top: 17px"
                            data-plan="${selectEvaluation.rndTaskNo}">
                            <c:out value="${selectEvaluation.rndTaskNo}"/>
                        </td>
                        <td style="padding-top: 17px"><c:out value="${selectEvaluation.taskName}"/></td>
                        <td style="padding-top: 17px"><c:out value="${selectEvaluation.rndInstitution}"/></td>
                        <td style="padding-top: 17px"><c:out value="${selectEvaluation.roundName}"/></td>
                        <td style="padding-top: 17px"><c:out value="${selectEvaluation.totalScore}"/></td>
                        <td>
                            <form>
                                <div class="form-group">
                                    <select style="padding-left: 2.18rem !important;" class="form-select"
                                            aria-label="계획서 상태 선택"
                                            data-rndPlanNo="${selectEvaluation.rndPlanNo}"
                                            onchange="updatePlanStatus(this)">
                                        <option selected disabled
                                                style="background-color: #2f3f6a; font-weight: bold; color: white;">
                                            <c:out value="${selectEvaluation.planStatus}"/></option>
                                            <%--                        <option selected disabled>심사 결과를 선택하세요</option>--%>
                                        <option value="선정">선정</option>
                                        <option value="탈락">탈락</option>
                                    </select>
                                </div>
                            </form>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>

            </table>
        </div>
        <div class="col-12 d-flex justify-content-end text-align-center letter">
            <p>[총 <span id="row-count"></span>건]</p>
        </div>
        <div class="custom-divider mb-3"></div>
        <div class="row">
            <div class="ms-3 col-5 p-2 card me-1" style="max-height: 650px; overflow-y: auto">
                <div class="d-flex align-items-center p-3">
                    <div id="committeeList" style="width: 100%"></div>
                </div>

            </div>
            <div class="card p-3" style="width: 55.9%">
                <select class="form-select" aria-label="Default select example" id="chartSelector"
                        onchange="showChart(this.value)">
                    <option value="deviation">[연구계획서 점수 분석]</option>
                    <option value="radar">[기관 규모]</option>
                    <option value="bubble">[기관별 연구 실적]</option>
                </select>

                <div id="deviation" class="chart-container">
                    <canvas id="deviationChart" class="mt-3 card p-2 shadow" width="680" height="540"></canvas>
                </div>

                <div id="radar" class="mt-3 chart-container card p-2 shadow">
                    <iframe src="http://localhost:8082/work-lounge/radar-chart" width="100%" height="745px"></iframe>
                </div>

                <div id="bubble" class="mt-3 chart-container card p-2 shadow">
                    <iframe src="http://localhost:8082/work-lounge/bubble-chart" width="100%" height="600px"></iframe>
                </div>

                <script>
                    function showChart(chartId) {
                        document.querySelectorAll('.chart-container').forEach(chart => {
                            chart.classList.remove('active');
                        });
                        document.getElementById(chartId).classList.add('active');
                    }

                    document.addEventListener("DOMContentLoaded", function () {
                        showChart('deviation');
                    });
                </script>
            </div>
        </div>
    </div>
    <div class="custom-divider2 mt-3"></div>
    <div id="button-area" class="d-flex justify-content-between mt-2">
        <div class="d-flex">
<%--            <button--%>
<%--                    class="btn ctm-btn-mirror"--%>
<%--                    onclick="window.open('http://localhost:8082/rnd-plans/8','_blank','width=700, height=600, top=50, left=50, scrollbars=yes')">--%>
<%--                계획서 상세 조회--%>
<%--            </button>--%>
<%--            <button--%>
<%--                    class="ms-3 btn ctm-btn-normal"--%>
<%--                    onclick="submitEvaluation()">--%>
<%--                &lt;%&ndash;                    onclick="window.location.href='http://localhost:8082/work-lounge/selection-evaluation'">&ndash;%&gt;--%>
<%--                신청--%>
<%--            </button>--%>
        </div>
        <div class="d-flex mb-2">
            <c:if test="${not empty selectEvaluationDetail}">
<%--            <button data-id="${selectEvaluationDetail[0].subAnnNo}" id="finalSubmitBtn" class="btn ctm-btn-orange" disabled onclick="closeWindow()">--%>
            <button data-id="${selectEvaluationDetail[0].subAnnNo}" id="finalSubmitBtn" class="btn ctm-btn-orange" disabled onclick="submitFinalEvaluation()">
                선정확정
            </button>
            </c:if>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="/resources/js/work-lounge/selection-evaluation-detail.js"></script>
<script>
    $(document).ready(function () {

        $(".plan-checkbox").click(function (e) {
            e.stopPropagation();

            $(".plan-checkbox").not(this).prop("checked", false);

            $(this).prop("checked", true);

            var committeeMember = $(this).data("plan");

        });

        $("#allcheck-input").prop("disabled", true);

        updateRowCount();

        $("#committeeSelect").on("change", function () {
            const selectedCommittee = $(this).val();

            if (selectedCommittee === "ALL") {
                $("#plansTable tr").show();
            } else {
                $("#plansTable tr").show().filter(function () {
                    return $(this).data("committee") !== selectedCommittee;
                }).hide();
            }

            updateRowCount();
        });

        function updateRowCount() {
            const filteredRowCount = $("#plansTable tr:visible").length;
            $("#row-count").text(filteredRowCount);
        }


        $(".committee-member").click(function (e) {
            e.preventDefault();
            var committeeMember = $(this).data("plan");

            $.ajax({
                url: "/api/v1/work_lounge/selection-evaluation-detail/" + committeeMember,
                method: "GET",
                success: function (response) {

                    createTable(response);
                    createBarChart(response);
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching data: ", error);
                },
            });
        });

        const firstCheckbox = $("#plansTable tr:first .committee-member");
        if (firstCheckbox.length > 0) {
            firstCheckbox.trigger("click");
        }

        function createTable(data) {
            $("#committeeList").empty();

            var countDisplay = $("<div class='d-flex align-items-center justify-content-center'></div>")
                .attr("id", "rowCount")
                .append("<p class='mb-0 letter1'>평가위원</p>")
                .append("<p class='mb-0 ms-3 letter'>[전체 " + data.length + "명]</p>");

            $("#committeeList").append(countDisplay);


            var table = $("<table class='table table-bordered mt-3 text-center table-hover table-rounded'></table>");
            var thead = $("<thead></thead>");
            var headerRow = $("<tr class='domain'></tr>");
            headerRow.append("<td>성명</td>");
            headerRow.append("<td>소속기관</td>");
            // headerRow.append("<td>국가연구자번호</td>");
            headerRow.append("<td>평가점수</td>");
            headerRow.append("<td>편차(%)</td>");
            thead.append(headerRow);
            table.append(thead);


            var tbody = $("<tbody></tbody>");

            var totalScore = data.reduce((sum, item) => sum + item.score, 0);
            var averageScore = totalScore / data.length;

            data.forEach(function (item) {
                var row = $("<tr></tr>");
                row.append("<td>" + item.coName + "</td>");
                row.append("<td>" + item.insName + "</td>");
                // row.append("<td>" + item.corsName + "</td>");
                row.append("<td>" + item.score + "</td>");

                const deviation = item.score - averageScore;
                const deviationPercentage = (deviation / averageScore) * 100;

                row.append("<td style='color: red'>" + deviationPercentage.toFixed(1) + "%</td>");
                tbody.append(row);
            });

            table.append(tbody);

            $("#committeeList").append(table);
        }


        function createBarChart(data) {

            $("#barChart").remove();


            var labels = data.map(item => item.coName);
            var scores = data.map(item => item.score);


            var backgroundColors = labels.map(() => generateRandomColor());
            var borderColors = labels.map(() => generateRandomColor());


            var canvas = $("<canvas></canvas>").attr("id", "barChart").addClass("mt-3");


            var chartCardDiv = $("<div class='card mt-3 shadow-sm p-2'></div>");
            chartCardDiv.append(canvas);

            $("#committeeList").append(chartCardDiv);

            var ctx = document.getElementById("barChart").getContext("2d");
            var barChart = new Chart(ctx, {
                type: "bar",
                data: {
                    labels: labels,
                    datasets: [{
                        label: "평가 점수",
                        data: scores,
                        backgroundColor: borderColors,
                        borderColor: borderColors,
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }


        function generateRandomColor() {
            const letters = '0123456789ABCDEF';
            let color = '#';
            for (let i = 0; i < 6; i++) {
                color += letters[Math.floor(Math.random() * 16)];
            }
            return color;
        }

    });


    const committeeSelect = document.getElementById('committeeSelect');
    const deviationChart = document.getElementById('deviationChart').getContext('2d');

    function generateChartData(selectedCommittee) {
        const chartData = {
            labels: [],
            datasets: [],
        };

        const tableRows = document.querySelectorAll('#plansTable tr');
        for (const row of tableRows) {
            const committee = row.dataset.committee;
            const rndTaskNo = row.querySelector('.committee-member[data-plan]').dataset.plan;
            const totalScore = parseFloat(row.querySelector('td:nth-child(6)').textContent);

            if (selectedCommittee === 'ALL' || committee === selectedCommittee) {
                if (!chartData.labels.includes(rndTaskNo)) {
                    chartData.labels.push(rndTaskNo);
                }

                if (!chartData.datasets.find(d => d.label === selectedCommittee)) {
                    chartData.datasets.push({
                        label: selectedCommittee,
                        data: [],
                        borderColor: generateRandomColor(),
                        backgroundColor: 'rgba(0, 0, 0, 0)',
                        pointRadius: 5,
                        pointHoverRadius: 7,
                        pointBackgroundColor: generateRandomColor(),
                        pointBorderColor: 'black',
                        pointBorderWidth: 1,
                    });
                }

                const committeeDataset = chartData.datasets.find(d => d.label === selectedCommittee);
                committeeDataset.data.push(totalScore);
            }
        }

        return chartData;
    }

    function generateRandomColor() {
        const letters = '0123456789ABCDEF';
        let color = '#';
        for (let i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }

    function displayChart(chartData, committeeName) {
        if (deviationChart.chart) {
            deviationChart.chart.destroy();
        }

        deviationChart.chart = new Chart(deviationChart, {
            type: 'line',
            data: chartData,
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                    },
                },
                plugins: {
                    title: {
                        display: true,
                        text: committeeName,
                    },
                },
            },
        });
    }

    committeeSelect.addEventListener('change', function () {
        const selectedCommittee = this.value;
        const chartData = generateChartData(selectedCommittee);
        displayChart(chartData, selectedCommittee);
    });

    window.addEventListener('DOMContentLoaded', function () {
        const initialChartData = generateChartData('ALL');
        displayChart(initialChartData, '전체');
    });

    // 선정 버튼용 ajax
    // function submitEvaluation() {
    //     // 체크된 행의 체크박스를 찾기
    //     const selectedCheckbox = document.querySelector(".plan-checkbox:checked");
    //
    //     if (selectedCheckbox) {
    //         const rndPlanNo = selectedCheckbox.getAttribute("data-id");
    //         console.log(rndPlanNo)
    //
    //         // AJAX 요청
    //         $.ajax({
    //             url: `/api/v1/work_lounge/eval-list/` + rndPlanNo,
    //             method: "POST", // POST 요청으로 변경
    //             success: function (response) {
    //                 console.log(response)
    //                 // 성공적인 응답 처리
    //                 console.log("Evaluation submitted successfully:", response);
    //                 // 추가 로직 (예: 알림, 페이지 전환 등)
    //
    //                 location.reload(true);
    //             },
    //             error: function (xhr, status, error) {
    //                 // 오류 처리
    //                 console.error("Error submitting evaluation:", error);
    //             }
    //         });
    //     } else {
    //         // alert("먼저 평가 항목을 선택해주세요.");
    //         Swal.fire({
    //             icon: 'warning',  // 경고 아이콘
    //             title: '알림',
    //             text: '먼저 평가 항목을 선택해주세요.',
    //             confirmButtonText: '확인'
    //         });
    //     }
    // }


    function updatePlanStatus(selectElement) {
        const planStatus = selectElement.value;
        const rndPlanNo = selectElement.getAttribute("data-rndPlanNo");

        // AJAX 요청 보내기
        fetch(`/api/v1/work_lounge/update-plan-status/` + rndPlanNo,
            {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    planStatus: planStatus
                })
            })
            .then(response => {
                if (response.ok) {
                    console.log("DB 업데이트 성공");
                    location.reload();
                } else {
                    console.error("DB 업데이트 실패");
                }
            })
            .catch(error => {
                console.error("AJAX 요청 실패:", error);
            });

    }


    // 최종 완료 용도
    /*
    설명:
        1. updatePlanStatus() 함수:

        이 함수는 select 요소의 값이 변경될 때마다 호출됩니다.
        select 요소들에 대해 하나라도 "제출완료" 값이 있으면 isSubmissionComplete 변수를 true로 설정하고, 버튼을 비활성화합니다.
        "제출완료"가 없다면 버튼을 활성화합니다.
        2. window.onload:

        페이지가 처음 로드될 때, updatePlanStatus() 함수가 호출되어 select 요소들의 초기 상태를 확인하고 버튼의 상태를 결정합니다.
        동작 원리:
        페이지 로드 시: select 요소들의 값을 모두 확인하여 "제출완료" 값이 있으면 버튼을 비활성화하고, 없으면 버튼을 활성화합니다.
        select 값 변경 시: 사용자가 select 값을 변경하면, 다시 모든 select 요소를 확인하여 버튼의 활성화 여부를 결정합니다.
        예상되는 동작:
        만약 여러 행이 있더라도, 각 행의 select 요소 중 하나라도 "제출완료" 값을 가지면 버튼은 비활성화되고, 모든 행의 select 값이 "제출완료"가 아니면 버튼이 활성화됩니다.
     */
    // 모든 select 요소를 확인하여 제출완료가 하나라도 있으면 버튼을 비활성화
    function updateSelection() {
        var selects = document.querySelectorAll('.form-select');  // 모든 select 요소
        var submitButton = document.getElementById('finalSubmitBtn');
        var isSubmissionComplete = false;

        // 각 select의 값을 확인하여 "제출완료"가 하나라도 있으면 비활성화
        selects.forEach(function (select) {
            if (select.value === "제출완료") {
                isSubmissionComplete = true;
            }
        });

        // 제출완료가 하나라도 있으면 버튼 비활성화
        if (isSubmissionComplete) {
            submitButton.disabled = true;
        } else {
            submitButton.disabled = false;
        }
    }

    // 페이지 로드 시 초기 상태 체크
    window.onload = function () {
        updateSelection();  // 페이지 로드 시 한 번 상태를 확인
    }

    // 버튼 클릭 시 window.close() 실행
    function closeWindow() {
        window.close();  // 현재 브라우저 창을 닫음
    }



    /*선정확정용 */
    function submitFinalEvaluation() {
        const subAnnNo = document.getElementById("finalSubmitBtn").getAttribute("data-id");

        $.ajax({
            url: `/api/v1/work_lounge/prog-status/` + subAnnNo,
            method: "POST", // POST 요청으로 변경
            success: function (response) {
                console.log(response)
                // 성공적인 응답 처리
                console.log("Evaluation submitted successfully:", response);
                // 추가 로직 (예: 알림, 페이지 전환 등)

                // location.reload(true); // 현재 페이지 새로 고침
                window.opener.location.reload(); // 부모 창 새로 고침
                window.close();
            },
            error: function (xhr, status, error) {
                // 오류 처리
                console.error("Error submitting evaluation:", error);
            }
        });

    }

</script>
</body>
</html>
