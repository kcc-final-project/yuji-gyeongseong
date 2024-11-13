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
            <option value="C">KCC정보통신</option>
            <option value="D">서울대학교</option>
            <option value="E">연세대학교</option>
            <option value="F">삼성전자</option>
            <option value="G">한화그룹</option>
            <option value="H">LG전자</option>
            <option value="I">한전KPS</option>
            <option value="J">한미약품</option>
            <option value="K">한국원자력연구원</option>
            <option value="L">한국지질자원연구원</option>
            <option value="M">부산테크노파크</option>
            <option value="N">한국항공우주연구원</option>
            <option value="O">국립의료원</option>
        </select>
    </div>
    <div class="form-group col-md-2 me-3 mb-4 d-flex flex-column align-items-center">
        <label for="institution2" style="font-size: 14px;">기관B</label>
        <select id="institution2" class="form-select form-select-sm">
            <option value="A">기상청</option>
            <option value="B">한국수자원공사</option>
            <option value="C">KCC정보통신</option>
            <option value="D">서울대학교</option>
            <option value="E">연세대학교</option>
            <option value="F">삼성전자</option>
            <option value="G">한화그룹</option>
            <option value="H">LG전자</option>
            <option value="I">한전KPS</option>
            <option value="J">한미약품</option>
            <option value="K">한국원자력연구원</option>
            <option value="L">한국지질자원연구원</option>
            <option value="M">부산테크노파크</option>
            <option value="N">한국항공우주연구원</option>
            <option value="O">국립의료원</option>
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
                Q4: [300, 70, 330, 120, 240]
            },
            B: {
                Q1: [150, 70, 260, 150, 110],
                Q2: [170, 90, 280, 130, 150],
                Q3: [190, 120, 290, 160, 180],
                Q4: [220, 140, 300, 180, 200]
            },
            C: {
                Q1: [180, 60, 290, 120, 190],
                Q2: [210, 85, 310, 140, 210],
                Q3: [230, 95, 330, 160, 220],
                Q4: [260, 105, 350, 170, 230]
            },
            D: {
                Q1: [120, 40, 250, 90, 180],
                Q2: [150, 60, 270, 110, 200],
                Q3: [170, 80, 280, 130, 210],
                Q4: [200, 100, 300, 150, 220]
            },
            E: {
                Q1: [190, 50, 280, 100, 210],
                Q2: [220, 70, 300, 120, 230],
                Q3: [240, 90, 320, 140, 250],
                Q4: [270, 110, 340, 160, 270]
            },
            F: {
                Q1: [200, 55, 290, 110, 220],
                Q2: [230, 75, 310, 130, 240],
                Q3: [250, 95, 330, 150, 260],
                Q4: [280, 115, 350, 170, 280]
            },
            G: {
                Q1: [210, 60, 300, 120, 230],
                Q2: [240, 80, 320, 140, 250],
                Q3: [260, 100, 340, 160, 270],
                Q4: [290, 120, 360, 180, 290]
            },
            H: {
                Q1: [220, 65, 310, 130, 240],
                Q2: [250, 85, 330, 150, 260],
                Q3: [270, 105, 350, 170, 280],
                Q4: [300, 125, 370, 190, 300]
            },
            I: {
                Q1: [230, 70, 320, 140, 250],
                Q2: [260, 90, 340, 160, 270],
                Q3: [280, 110, 360, 180, 290],
                Q4: [310, 130, 380, 200, 310]
            },
            J: {
                Q1: [240, 75, 330, 150, 260],
                Q2: [270, 95, 350, 170, 280],
                Q3: [290, 115, 370, 190, 300],
                Q4: [320, 135, 390, 210, 320]
            },
            K: {
                Q1: [250, 80, 340, 160, 270],
                Q2: [280, 100, 360, 180, 290],
                Q3: [300, 120, 380, 200, 310],
                Q4: [330, 140, 400, 220, 330]
            },
            L: {
                Q1: [260, 85, 350, 170, 280],
                Q2: [290, 105, 370, 190, 300],
                Q3: [310, 125, 390, 210, 320],
                Q4: [340, 145, 410, 230, 340]
            },
            M: {
                Q1: [270, 90, 360, 180, 290],
                Q2: [300, 110, 380, 200, 310],
                Q3: [320, 130, 400, 220, 330],
                Q4: [350, 150, 420, 240, 350]
            },
            N: {
                Q1: [280, 95, 370, 190, 300],
                Q2: [310, 115, 390, 210, 320],
                Q3: [330, 135, 410, 230, 340],
                Q4: [360, 155, 430, 250, 360]
            },
            O: {
                Q1: [290, 100, 380, 200, 310],
                Q2: [320, 120, 400, 220, 330],
                Q3: [340, 140, 420, 240, 350],
                Q4: [370, 160, 440, 260, 370]
            }
        },
        2023: {
            A: {
                Q1: [210, 55, 310, 110, 210],
                Q2: [260, 85, 320, 120, 220],
                Q3: [280, 65, 330, 100, 240],
                Q4: [310, 75, 340, 130, 250]
            },
            B: {
                Q1: [160, 75, 270, 160, 120],
                Q2: [180, 95, 290, 140, 160],
                Q3: [200, 125, 300, 170, 190],
                Q4: [230, 145, 310, 190, 210]
            },
            C: {
                Q1: [190, 65, 300, 130, 200],
                Q2: [220, 90, 320, 150, 220],
                Q3: [240, 100, 340, 170, 230],
                Q4: [270, 110, 360, 180, 240]
            },
            D: {
                Q1: [130, 45, 260, 100, 190],
                Q2: [160, 65, 280, 120, 210],
                Q3: [180, 85, 290, 140, 220],
                Q4: [210, 105, 310, 160, 230]
            },
            E: {
                Q1: [200, 55, 290, 110, 220],
                Q2: [230, 75, 310, 130, 240],
                Q3: [250, 95, 330, 150, 260],
                Q4: [280, 115, 350, 170, 280]
            },
            F: {
                Q1: [210, 60, 300, 120, 230],
                Q2: [240, 80, 320, 140, 250],
                Q3: [260, 100, 340, 160, 270],
                Q4: [290, 120, 360, 180, 290]
            },
            G: {
                Q1: [220, 65, 310, 130, 240],
                Q2: [250, 85, 330, 150, 260],
                Q3: [270, 105, 350, 170, 280],
                Q4: [300, 125, 370, 190, 300]
            },
            H: {
                Q1: [230, 70, 320, 140, 250],
                Q2: [260, 90, 340, 160, 270],
                Q3: [280, 110, 360, 180, 290],
                Q4: [310, 130, 380, 200, 310]
            },
            I: {
                Q1: [240, 75, 330, 150, 260],
                Q2: [270, 95, 350, 170, 280],
                Q3: [290, 115, 370, 190, 300],
                Q4: [320, 135, 390, 210, 320]
            },
            J: {
                Q1: [250, 80, 340, 160, 270],
                Q2: [280, 100, 360, 180, 290],
                Q3: [300, 120, 380, 200, 310],
                Q4: [330, 140, 400, 220, 330]
            },
            K: {
                Q1: [260, 85, 350, 170, 280],
                Q2: [290, 105, 370, 190, 300],
                Q3: [310, 125, 390, 210, 320],
                Q4: [340, 145, 410, 230, 340]
            },
            L: {
                Q1: [270, 90, 360, 180, 290],
                Q2: [300, 110, 380, 200, 310],
                Q3: [320, 130, 400, 220, 330],
                Q4: [350, 150, 420, 240, 350]
            },
            M: {
                Q1: [280, 95, 370, 190, 300],
                Q2: [310, 115, 390, 210, 320],
                Q3: [330, 135, 410, 230, 340],
                Q4: [360, 155, 430, 250, 360]
            },
            N: {
                Q1: [290, 100, 380, 200, 310],
                Q2: [320, 120, 400, 220, 330],
                Q3: [340, 140, 420, 240, 350],
                Q4: [370, 160, 440, 260, 370]
            },
            O: {
                Q1: [300, 105, 390, 210, 320],
                Q2: [330, 125, 410, 230, 340],
                Q3: [350, 145, 430, 250, 360],
                Q4: [380, 165, 450, 270, 380]
            }
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
