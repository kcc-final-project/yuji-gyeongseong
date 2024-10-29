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
            <c:if test="${not empty selectEvaluationDetail}">
    <thead>
        <tr class="domain" style="font-size: 15px">
            <td class="col-1">
                <h5>
                    <span class="pt-1 pb-1 badge text-bg-secondary black"
                          style="background-color: #b9b9b9 !important;">
                        <c:out value="${selectEvaluationDetail[0].evalStatus}"/>
                    </span>
                </h5>
            </td>
            <td class="col-5 align-middle" colspan="2">
                <div class="d-flex justify-content-center align-items-center">
                    <span class="me-2 w-25">공모분야명</span>
                    <input class="border d-inline-block form-control form-control-sm align-middle p-2 truncate-text"
                           style="border: 1px solid black; width: 350px; border-radius: 3px; background-color: #b9b9b9;"
                           value="${selectEvaluationDetail[0].subTitle}" disabled readonly>
                </div>
            </td>
            <td class="col-4 align-middle" colspan="3">
                <div class="input-group" style="width: 100%">
                    <div class="d-flex justify-content-center align-items-center">
                        <span class="w-25 me-1">최종선정기간</span>
                        <div class="input-group w-75">
                            <input type="text" class="form-control date-input" id="startDate"
                                   value="${selectEvaluationDetail[0].start}" disabled readonly/>
                            <div class="input-group-append">
                                <span class="input-group-text">~</span>
                            </div>
                            <input type="text" class="form-control date-input" id="endDate"
                                   value="${selectEvaluationDetail[0].finalSelectedAt}" disabled readonly/>
                        </div>
                    </div>
                </div>
            </td>
            <td class="col-1 align-middle">
                <select id="committeeSelect" class="form-control" style="width: 130px">
                    <option value="ALL">전체</option>
                    <option value="CommitteeA">평가위원회 A</option>
                    <option value="CommitteeB">평가위원회 B</option>
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

                <c:forEach items="${selectEvaluationDetail}" var="selectEvaluation" varStatus="status">
                    <tbody id="plansTable" class="text-center">
                    <tr data-committee="${selectEvaluation.name}">
                        <td class="align-middle text-center">
                            <div class="form-check d-flex justify-content-center align-items-center">
                                <input
                                        class="form-check-input plan-checkbox committee-member"
                                        type="checkbox"
                                        value="${selectEvaluation.subAnnNo}"
                                        data-plan="${selectEvaluation.rndTaskNo}"
                                />
                            </div>
                        </td>

                        <td class="committee-member" data-plan="${selectEvaluation.rndTaskNo}"> <c:out value="${selectEvaluation.rndTaskNo}"/></td>
                        <td><c:out value="${selectEvaluation.taskName}"/></td>
                        <td><c:out value="${selectEvaluation.rndInstitution}"/></td>
                        <td><c:out value="${selectEvaluation.rndName}"/></td>
                        <td><c:out value="${selectEvaluation.totalScore}"/></td>
                        <td><span class="badge text-bg-secondary"><c:out value="${selectEvaluation.planStatus}"/></span></td>
                    </tr>

                    </tbody>
                </c:forEach>
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
    $(document).ready(function () {
        // Handle click on plan checkboxes (".plan-checkbox")
        $(".plan-checkbox").click(function (e) {
            e.stopPropagation(); // Prevent event bubbling

            // Deselect other checkboxes
            $(".plan-checkbox").not(this).prop("checked", false);

            // Set clicked checkbox to checked
            $(this).prop("checked", true);

            // Selected plan processing (optional)
            var committeeMember = $(this).data("plan");
            console.log("Selected plan:", committeeMember);
        });

        // Disable the "Select All" checkbox
        $("#allcheck-input").prop("disabled", true);


        // Count visible rows on document ready
        const rowCount = $("#plansTable tr:visible").length;
        $("#row-count").text(rowCount);

        // Update row count on filter changes
        $("#committeeSelect").on("change", function () {
            const selectedCommittee = $(this).val();
            if (selectedCommittee === "ALL") {
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
            $("#row-count").text(filteredRowCount);
        });

        // Handle click on committee member checkboxes
        $(".committee-member").click(function (e) {
            e.preventDefault();
            var committeeMember = $(this).data("plan");

            // AJAX call to fetch evaluation details based on selected plan
            $.ajax({
                url: "/api/v1/work_lounge/selection-evaluation-detail/" + committeeMember,
                method: "GET",
                success: function (response) {
                    // Assuming the response is an array of objects
                    createTable(response);
                    createBarChart(response);
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching data: ", error);
                },
            });
        });

        // Automatically trigger click on the first checkbox to load data on page load
        const firstCheckbox = $("#plansTable tr:first .committee-member");
        if (firstCheckbox.length > 0) {
            firstCheckbox.trigger("click");
        }

        function createTable(data) {
            // Clear any existing table and count display
            $("#committeeList").empty();

            // Create a count display
            var countDisplay = $("<div></div>").attr("id", "rowCount");
            countDisplay.text("총 행의 수: " + data.length);
            $("#committeeList").append(countDisplay);

            // Create table headers
            var table = $("<table></table>").addClass("evaluation-table");
            var headerRow = $("<tr></tr>");
            headerRow.append("<th>Co Name</th>");
            headerRow.append("<th>Ins Name</th>");
            headerRow.append("<th>CORS Name</th>");
            headerRow.append("<th>Score</th>");
            table.append(headerRow);

            // Populate table with data
            data.forEach(function (item) {
                var row = $("<tr></tr>");
                row.append("<td>" + item.coName + "</td>");
                row.append("<td>" + item.insName + "</td>");
                row.append("<td>" + item.corsName + "</td>");
                row.append("<td>" + item.score + "</td>");
                table.append(row);
            });

            // Append the table to the committeeList container
            $("#committeeList").append(table);
        }

        function createBarChart(data) {
            // Clear any existing chart
            $("#barChartContainer").remove(); // Remove previous chart if it exists

            // Create a new canvas for the chart
            var canvas = $("<canvas></canvas>").attr("id", "barChart");
            $("#committeeList").append(canvas);

            // Prepare data for the chart
            var labels = data.map(item => item.coName);
            var scores = data.map(item => item.score);

            // Create the chart
            var ctx = document.getElementById("barChart").getContext("2d");
            var barChart = new Chart(ctx, {
                type: "bar",
                data: {
                    labels: labels,
                    datasets: [{
                        label: "평가 점수",
                        data: scores,
                        backgroundColor: 'rgba(75, 192, 192, 0.5)',
                        borderColor: 'rgba(75, 192, 192, 1)',
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
    });



    const committeeSelect = document.getElementById('committeeSelect');
    const deviationChart = document.getElementById('deviationChart').getContext('2d');

    // Function to generate chart data based on selected committee
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

                // Initialize dataset for the selected committee
                if (!chartData.datasets.find(d => d.label === selectedCommittee)) {
                    chartData.datasets.push({
                        label: selectedCommittee, // Set label to the selected committee
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

                // Add score data to the dataset for the selected committee
                const committeeDataset = chartData.datasets.find(d => d.label === selectedCommittee);
                committeeDataset.data.push(totalScore);
            }
        }

        return chartData;
    }

    // Function to generate a random color
    function generateRandomColor() {
        const letters = '0123456789ABCDEF';
        let color = '#';
        for (let i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }

    // Function to display the chart with a title
    function displayChart(chartData, committeeName) {
        // Clear the existing chart if it exists
        if (deviationChart.chart) {
            deviationChart.chart.destroy();
        }

        // Create the chart
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
                        text: committeeName, // Set the title based on the selected committee
                    },
                },
            },
        });
    }

    // Event listener for committee selection change
    committeeSelect.addEventListener('change', function() {
        const selectedCommittee = this.value;
        const chartData = generateChartData(selectedCommittee);
        displayChart(chartData, selectedCommittee); // Pass the selected committee for the title
    });

    // Call the function to generate and display the initial chart on page load
    window.addEventListener('DOMContentLoaded', function() {
        const initialChartData = generateChartData('ALL');
        displayChart(initialChartData, '전체'); // Initial title
    });

</script>
</body>
</html>
