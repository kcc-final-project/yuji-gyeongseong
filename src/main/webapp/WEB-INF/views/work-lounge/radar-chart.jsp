<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@
        include file="../common/common-noheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Radar Chart with Filters</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        #filters {
            margin-bottom: 20px;
        }
    </style>
</head>
<body class="mt-3" style="height: auto">
<div class="d-flex justify-content-center align-items-center mb-1">
    <div class="form-group col-md-2 me-3">
        <select id="year" class="form-select form-select-sm">
            <option value="2022">2022</option>
            <option value="2023">2023</option>
        </select>
    </div>
    <div class="form-group col-md-2 me-3 mb-4 d-flex flex-column align-items-center">
        <label for="institution1" style="font-size: 14px;">기관A</label>
        <select id="institution1" class="form-select form-select-sm">
            <option value="A">기상청</option>
            <option value="B">한국수자원공사</option>
        </select>
    </div>
    <div class="form-group col-md-2 me-3 mb-4 d-flex flex-column align-items-center">
        <label for="institution2" style="font-size: 14px;">기관B</label>
        <select id="institution2" class="form-select form-select-sm">
            <option value="A">기상청</option>
            <option value="B">한국수자원공사</option>
        </select>
    </div>
    <div class="form-group col-md-2 me-3">
        <select id="quarter" class="form-select form-select-sm">
            <option value="Q1">1분기</option>
            <option value="Q2">2분기</option>
            <option value="Q3">3분기</option>
            <option value="Q4">4분기</option>
        </select>
    </div>
</div>



<div class="d-flex justify-content-end align-items-center">
    <p class="me-2">[단위: 천]</p>
</div>

<canvas id="radarChart"></canvas>
<div style="font-size: 13px">
    <hr>
    <p>∴ 매출액: 기업이 일정 기간 동안 제품이나 서비스를 판매하여 얻은 총 수입</p>
    <p>∴ 영업이익: 기업이 주된 사업 활동을 통해 벌어들인 수익</p>
    <p>∴ 자산총계: 기업이 보유한 모든 자산의 총합</p>
    <p>∴ 부채총계: 기업이 갚아야 할 모든 빛의 총합</p>
    <p>∴ 자본총계: 기업이 실제로 소유하고 있는 자산</p>
    <hr>
</div>

<script>
    const allData = {
        2022: {
            A: {
                Q1: [200, 50, 300, 100, 200],
                Q2: [250, 80, 310, 110, 210],
                Q3: [270, 60, 320, 90, 230],
                Q4: [300, 70, 330, 120, 240],
            },
            B: {
                Q1: [150, 70, 260, 150, 110],
                Q2: [170, 90, 280, 130, 150],
                Q3: [190, 120, 290, 160, 180],
                Q4: [220, 140, 300, 180, 200],
            },
        },
        2023: {
            A: {
                Q1: [220, 60, 310, 120, 210],
                Q2: [260, 90, 330, 150, 230],
                Q3: [280, 70, 350, 110, 250],
                Q4: [320, 80, 360, 140, 270],
            },
            B: {
                Q1: [180, 80, 270, 160, 140],
                Q2: [190, 100, 290, 170, 160],
                Q3: [210, 130, 300, 190, 190],
                Q4: [240, 150, 310, 200, 210],
            },
        },
    };

    const ctx = document.getElementById("radarChart").getContext("2d");
    let radarChart;

    function updateChart() {
        const selectedYear = document.getElementById("year").value;
        const selectedInstitution1 =
            document.getElementById("institution1").value;
        const selectedInstitution2 =
            document.getElementById("institution2").value;
        const selectedQuarter = document.getElementById("quarter").value;
        const data1 =
            allData[selectedYear][selectedInstitution1][selectedQuarter];
        const data2 =
            allData[selectedYear][selectedInstitution2][selectedQuarter];

        const chartData = {
            labels: ["매출액", "영업이익", "자산총계", "부채총계", "자본총계"],
            datasets: [
                {
                    label: "기관" + selectedInstitution1 + " (" + selectedYear + " " + selectedQuarter + ")",
                    data: data1,
                    backgroundColor: "rgba(54, 162, 235, 0.2)",
                    borderColor: "rgba(54, 162, 235, 1)",
                    borderWidth: 1,
                    pointBackgroundColor: "rgba(54, 162, 235, 1)",
                },
                {
                    label: "기관" + selectedInstitution2 + " (" + selectedYear + " " + selectedQuarter + ")",
                    data: data2,
                    backgroundColor: "rgba(255, 99, 132, 0.2)",
                    borderColor: "rgba(255, 99, 132, 1)",
                    borderWidth: 1,
                    pointBackgroundColor: "rgba(255, 99, 132, 1)",
                },
            ],
        };

        if (radarChart) radarChart.destroy();

        radarChart = new Chart(ctx, {
            type: "radar",
            data: chartData,
            options: {
                plugins: {
                    legend: {
                        labels: {
                            font: {
                                size: 15
                            }
                        }
                    }
                },
                responsive: true,
                scales: {
                    r: {
                        angleLines: {
                            display: true,
                        },
                        suggestedMin: 0,
                        suggestedMax: 400,
                    },
                },
            },
        });
    }

    document.getElementById("year").addEventListener("change", updateChart);
    document
        .getElementById("institution1")
        .addEventListener("change", updateChart);
    document
        .getElementById("institution2")
        .addEventListener("change", updateChart);
    document
        .getElementById("quarter")
        .addEventListener("change", updateChart);

    updateChart();
</script>
</body>
</html>
