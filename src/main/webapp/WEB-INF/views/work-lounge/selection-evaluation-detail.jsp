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
</head>
<body>
<div class="common-main" style="margin-top: 50px;">
    <h2 class="text-center">선정평가</h2>
    <div class="container pt-3">
        <div style="max-height: 320px; overflow-y: auto">

            <table class="table table-bordered text-center table-hover">
                <thead>
                <tr class="domain" style="font-size: 15px">
                    <td class="col-1">
                        <h5>
                            <span class="pt-1 pb-1 badge text-bg-secondary black"
                                  style="background-color: #b9b9b9 !important;">
                                선정평가대기
                            </span>
                        </h5>
                    </td>
                    <td class="col-5 align-middle" colspan="2">
                        <div class="d-flex justify-content-center align-items-center">
                            <span class="me-2 w-25">공모분야명</span>
                            <input class="border d-inline-block form-control form-control-sm align-middle p-2 truncate-text"
                                   style="border: 1px solid black; border-radius: 3px; background-color: #b9b9b9;"
                                   value="[2024-RM-03-총괄] 경수형 SMR 사고해석 및 사고회로가나다라마바사" disabled readonly>
                        </div>

                    </td>
                    <td class="col-4 align-middle" colspan="3">
                        <div class="input-group w-100">
                            <div class="d-flex justify-content-center align-items-center">
                                <span class="w-25">최종선정기간</span>
                                <div class="input-group w-75">

                                    <input
                                            type="text"
                                            class="form-control date-input"
                                            id="startDate"
                                            placeholder="시작일"
                                    />
                                    <div class="input-group-append">
                                        <span class="input-group-text">~</span>
                                    </div>
                                    <input
                                            type="text"
                                            class="form-control date-input"
                                            id="endDate"
                                            placeholder="종료일"
                                    />

                                </div>
                            </div>
                        </div>
                    </td>
                    <td class="col-1 align-middle">
                        <select id="committeeSelect" class="form-control">
                            <option value="전체">전체</option>
                            <option value="A">평가위원회 A</option>
                            <option value="B">평가위원회 B</option>
                        </select>
                    </td>
                </tr>
                </thead>
                <tbody id="plansTable" class="text-center">
                <tr class="blue">
                    <td class="align-middle text-center">
                        <div class="form-check d-flex justify-content-center align-items-center">
                            <input
                                    class="form-check-input"
                                    type="checkbox"
                                    value=""
                                    id="allcheck-input"
                            />

                        </div>
                    </td>
                    <td>계획서번호</td>
                    <td>과제명</td>
                    <td>주관연구기관</td>
                    <td>연구책임자</td>
                    <td>평균점수</td>
                    <td>계획서상태</td>
                </tr>
                <tr data-committee="A">
                    <td class="align-middle text-center">
                        <div class="form-check d-flex justify-content-center align-items-center">
                            <input class="form-check-input plan-checkbox" type="checkbox" value="1"
                                   data-plan="P2024051A"/>
                        </div>
                    </td>

                    <td class="plan-number" data-plan="P2024051A">P2024051A</td>
                    <td>[2024-RM-01-총괄] 섬유 연속 In-line 플라즈마(가)</td>
                    <td>한국산업기술기획평가원</td>
                    <td>홍길동</td>
                    <td>100</td>
                    <td><span class="badge text-bg-secondary">계획서완료</span></td>
                </tr>
                <tr data-committee="A">
                    <td class="align-middle text-center">
                        <div class="form-check d-flex justify-content-center align-items-center">
                            <input
                                    class="form-check-input plan-checkbox"
                                    type="checkbox"
                                    value="2"
                                    data-plan="P2024051B"
                            />

                        </div>
                    </td>
                    <td class="plan-number" data-plan="P2024051B">P2024051B</td>
                    <td>[2024-RM-01-총괄] 섬유 연속 In-line 플라즈마(나)</td>
                    <td>한국산업기술기획평가원</td>
                    <td>박길동</td>
                    <td>90</td>
                    <td><span class="badge text-bg-secondary">계획서완료</span></td>
                </tr>
                <tr data-committee="A">
                    <td class="align-middle text-center">
                        <div class="form-check d-flex justify-content-center align-items-center">
                            <input
                                    class="form-check-input plan-checkbox"
                                    type="checkbox"
                                    value="3"
                                    data-plan="P2024051C"
                            />

                        </div>
                    </td>
                    <td class="plan-number" data-plan="P2024051C">P2024051C</td>
                    <td>[2024-RM-01-총괄] 섬유 연속 In-line 플라즈마(나)</td>
                    <td>한국산업기술기획평가원</td>
                    <td>고길동</td>
                    <td>80</td>
                    <td><span class="badge text-bg-secondary">계획서완료</span></td>
                </tr>
                <tr data-committee="B">
                    <td class="align-middle text-center">
                        <div class="form-check d-flex justify-content-center align-items-center">
                            <input
                                    class="form-check-input plan-checkbox"
                                    type="checkbox"
                                    value="4"
                                    data-plan="P2024051D"
                            />

                        </div>
                    </td>
                    <td class="plan-number" data-plan="P2024051D">P2024051D</td>
                    <td>[2024-RM-01-총괄] 섬유 연속 In-line 플라즈마(다)</td>
                    <td>한국산업기술기획평가원</td>
                    <td>신길동</td>
                    <td>70</td>
                    <td><span class="badge text-bg-secondary">계획서완료</span></td>
                </tr>
                <tr data-committee="B">
                    <td class="align-middle text-center">
                        <div class="form-check d-flex justify-content-center align-items-center">
                            <input
                                    class="form-check-input plan-checkbox"
                                    type="checkbox"
                                    value="5"
                                    data-plan="P2024051E"
                            />

                        </div>
                    </td>
                    <td class="plan-number" data-plan="P2024051E">P2024051E</td>
                    <td>[2024-RM-01-총괄] 섬유 연속 In-line 플라즈마(라)</td>
                    <td>한국산업기술기획평가원</td>
                    <td>개길동</td>
                    <td>60</td>
                    <td><span class="badge text-bg-secondary">계획서완료</span></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="col-12 d-flex justify-content-end text-align-center">
            <p>[총 <span id="row-count"></span>건]</p>
        </div>
        <hr>
        <div class="row">
            <div class="col-5 p-2" style="max-height: 600px; overflow-y: auto">
                <div class="d-flex align-items-center">
                    <div id="committeeList"></div>
                </div>

            </div>
            <div class="col-7 mt-2">
                <select class="form-select" aria-label="Default select example" id="chartSelector"
                        onchange="showChart(this.value)">
                    <option value="deviation">[연구계획서 점수 분석]</option>
                    <option value="radar">[기관 규모]</option>
                    <option value="bubble">[기관별 연구 실적]</option>
                </select>

                <div id="deviation" class="chart-container">
                    <canvas id="deviationChart" class="mt-5" width="400" height="300"></canvas>
                </div>

                <div id="radar" class="chart-container">
                    <iframe src="http://localhost:8082/work-lounge/radar-chart" width="100%" height="745px"></iframe>
                </div>

                <div id="bubble" class="chart-container">
                    <iframe src="http://localhost:8082/work-lounge/bubble-chart" width="100%" height="650px"></iframe>
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
    <hr>
    <div id="button-area" class="d-flex justify-content-between mt-2">
        <div class="d-flex">
            <button
                    class="btn ctm-btn-mirror"
                    onclick="window.location.href='http://localhost:8082/work-lounge/selection-evaluation'">
                계획서 상세 조회
            </button>
            <button
                    class="ms-3 btn ctm-btn-normal"
                    onclick="window.location.href='http://localhost:8082/work-lounge/selection-evaluation'">
                신청
            </button>
        </div>
        <div class="d-flex">
            <button
                    class="me-3 btn ctm-btn-orangemirror"
                    onclick="window.location.href='http://localhost:8082/work-lounge/selection-evaluation'">
                뒤로
            </button>
            <button
                    class="btn ctm-btn-orange"
                    onclick="window.location.href='http://localhost:8082/work-lounge/selection-evaluation'">
                최종완료
            </button>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="/resources/js/work-lounge/selection-evaluation-detail.js"></script>
<script>
    var data = [
        {
            plan_number: "P2024051A",
            committees: [
                {name: "홍길동", institution: "KCC", researchernumber: "20241012", score: "60"},
                {name: "신길동", institution: "KCC", researchernumber: "20241022", score: "70"},
                {name: "박길동", institution: "KCC", researchernumber: "20241032", score: "80"},
                {name: "개길동", institution: "KCC", researchernumber: "20251022", score: "50"},
                {name: "구길동", institution: "KCC", researchernumber: "20251032", score: "100"},
            ],
            average_score: 100,
            committee: "A",
        },
        {
            plan_number: "P2024051B",
            committees: [
                {name: "산길동", institution: "기상청", researchernumber: "20241052", score: "30"},
                {name: "오길동", institution: "기상청", researchernumber: "20241062", score: "40"},
            ],
            average_score: 90,
            committee: "A",
        },
        {
            plan_number: "P2024051C",
            committees: [
                {name: "Committee Member C1"},
                {name: "Committee Member C2"},
                {name: "Committee Member C3"},
            ],
            average_score: 80,
            committee: "A",
        },
        {
            plan_number: "P2024051D",
            committees: [
                {name: "Committee Member D1"},
                {name: "Committee Member D2"},
                {name: "Committee Member D3"},
            ],
            average_score: 70,
            committee: "B",
        },
        {
            plan_number: "P2024051E",
            committees: [
                {name: "Committee Member E1"},
                {name: "Committee Member E2"},
                {name: "Committee Member E3"},
            ],
            average_score: 60,
            committee: "B",
        },
    ];

    $(document).ready(function () {
        var initialPlanNumber = $(".plan-number").first().data("plan");
        loadCommitteeList(initialPlanNumber);
        loadBarChartForPlan(initialPlanNumber);

        $("#allcheck-input").on("click", function () {
            var isChecked = $(this).prop("checked");

            $(".plan-checkbox").prop("checked", isChecked);
        });

        $(".plan-checkbox").on("click", function () {
            var planNumber = $(this).data("plan");
            loadCommitteeList(planNumber);

            const selectedPlans = $(".plan-checkbox:checked").map(function () {
                return $(this).data("plan");
            }).get();

            const committeeScores = [];
            selectedPlans.forEach(planNumber => {
                const selectedPlan = data.find(plan => plan.plan_number === planNumber);
                if (selectedPlan) {
                    committeeScores.push(...selectedPlan.committees.map(member => ({
                        name: member.name,
                        score: member.score
                    })));
                }
            });

            const existingBarChart = document.getElementById('barChart');
            if (existingBarChart) {
                existingBarChart.parentNode.removeChild(existingBarChart);
            }

            if (committeeScores.length > 0) {
                createBarChart(committeeScores);
            }
        });

        $(".plan-number").on("click", function () {
            var planNumber = $(this).data("plan");

            uncheckAllCheckboxes();

            const checkbox = $(".plan-checkbox[data-plan='" + planNumber + "']");
            checkbox.prop('checked', true);

            loadCommitteeList(planNumber);
            loadBarChartForPlan(planNumber);

            const selectedPlans = $(".plan-checkbox:checked").map(function () {
                return $(this).data("plan");
            }).get();

            const committeeScores = [];
            selectedPlans.forEach(planNumber => {
                const selectedPlan = data.find(plan => plan.plan_number === planNumber);
                if (selectedPlan) {
                    committeeScores.push(...selectedPlan.committees.map(member => ({
                        name: member.name,
                        score: member.score
                    })));
                }
            });

            const existingBarChart = document.getElementById('barChart');
            if (existingBarChart) {
                existingBarChart.parentNode.removeChild(existingBarChart);
            }

            if (committeeScores.length > 0) {
                createBarChart(committeeScores);
            }
        });

        $("#committeeSelect").on("change", function () {
            var selectedCommittee = $(this).val();
            if (selectedCommittee === "전체") {
                $("#plansTable tr").show();
            } else {
                $("#plansTable tr").show();
                $("#plansTable tr")
                    .filter(function () {
                        return $(this).data("committee") !== selectedCommittee;
                    })
                    .hide();
            }
            const filteredRowCount = $("#plansTable tr:visible").length;
            document.getElementById("row-count").textContent = filteredRowCount;
        });

        function uncheckAllCheckboxes() {
            $('.plan-checkbox').prop('checked', false);
        }

    });

    function loadCommitteeList(planNumber) {
        var selectedPlan = data.find((plan) => plan.plan_number === planNumber);
        if (selectedPlan) {
            var committeeCount = selectedPlan.committees.length;
            var tableContent =
                '<div class="d-flex align-items-center"><h4 class="mb-0">평가위원</h4><h5 class="mb-0 ms-2">[전체 ' + committeeCount + '명]</h5></div><table class="table table-bordered mt-3 text-center table-hover"><thead><tr class="domain"><td>성명</td><td>소속기관</td><td>국가연구자번호</td><td>평가점수</td><td>편차(%)</td></tr></thead><tbody>';
            selectedPlan.committees.forEach(function (committee) {

                const deviation = committee.score - selectedPlan.average_score;
                const deviationPercentage = (deviation / selectedPlan.average_score) * 100;
                tableContent +=
                    "<tr><td>" +
                    committee.name +
                    "</td> <td>" +
                    committee.institution +
                    "</td>  <td>" +
                    committee.researchernumber +
                    "</td>  <td>" +
                    committee.score +
                    "</td><td style='color: red'>" +
                    deviationPercentage.toFixed(1) +
                    "</td></tr>";
            });
            tableContent += "</tbody></table>";
            $("#committeeList").html(tableContent);
        } else {
            $("#committeeList").html(
                "No data found for the selected plan number."
            );
        }
    }

    function loadBarChartForPlan(planNumber) {
        const selectedPlan = data.find(plan => plan.plan_number === planNumber);
        if (selectedPlan) {
            const committeeScores = selectedPlan.committees.map(member => ({name: member.name, score: member.score}));

            const existingBarChart = document.getElementById('barChart');
            if (existingBarChart) {
                existingBarChart.parentNode.removeChild(existingBarChart);
            }

            if (committeeScores.length > 0) {
                createBarChart(committeeScores);
            }
        }
    }

    const tableBody = document.querySelector("tbody");
    const rowCount = tableBody.rows.length;
    document.getElementById("row-count").textContent = rowCount;

    function uncheckAllCheckboxes() {
        $('.plan-checkbox').prop('checked', false);
    }

    $(".plan-checkbox").on("click", function () {
        uncheckAllCheckboxes();
        $(this).prop('checked', true);

        var planNumber = $(this).data("plan");
        loadCommitteeList(planNumber);
    });

    const ctx = document.getElementById('deviationChart').getContext('2d');
    const chart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: [],
            datasets: [{
                label: '연구계획서 점수 분석',
                data: [],
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

    function updateDeviationChart(data) {

        chart.data.labels.length = 0;
        chart.data.datasets[0].data.length = 0;

        const filteredData = data.filter(plan => {
            const selectedCommittee = $("#committeeSelect").val();
            return selectedCommittee === "전체" || plan.committee === selectedCommittee;
        });

        filteredData.forEach(plan => {
            chart.data.labels.push(plan.plan_number);
            chart.data.datasets[0].data.push(plan.average_score);
        });

        chart.update();
    }

    updateDeviationChart(data);

    $("#committeeSelect").on("change", function () {
        updateDeviationChart(data);
    });

    function createBarChart(committeeScores) {
        const barChartCanvas = document.createElement('canvas');
        barChartCanvas.id = 'barChart';
        barChartCanvas.width = 52;
        barChartCanvas.height = 27;

        const barChartContainer = document.querySelector('.col-5:nth-child(1)');
        barChartContainer.appendChild(barChartCanvas);

        const barChartCtx = barChartCanvas.getContext('2d');

        const barChart = new Chart(barChartCtx, {
            type: 'bar',
            data: {
                labels: committeeScores.map(member => member.name),
                datasets: [{
                    label: '평가점수',
                    data: committeeScores.map(member => member.score),
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
    }
</script>
</body>
</html>
