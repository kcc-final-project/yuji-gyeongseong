<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-noheader.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>월별 연구 현황 버블 차트</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .info {
            display: none;
            margin: 20px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .info:hover {
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        }

        .card-body {
            padding: 15px;
        }

        .card-title {
            font-size: 1.5rem;
            margin-bottom: 15px;
            color: #007bff; /* Bootstrap primary color */
        }

        .card-text {
            font-size: 1rem;
            margin: 5px 0;
            color: #333;
        }

        .institution-name {
            font-weight: bold;
            color: #333;
        }

        .business-number,
        .type,
        .location,
        .category {
            color: #555;
        }
    </style>
</head>
<body class="mt-3" style="height: auto">

<div class="d-flex align-items-center justify-content-end">
    <div class="d-flex justify-content-end mb-3">
        <div class="form-group col-md-2 me-3">
<%--            <label for="year">년도:</label>--%>
            <select id="year" class="form-select form-select-sm">
                <option value="2022">2022</option>
                <option value="2023">2023</option>
            </select>
        </div>
        <div class="form-group col-md-2 me-3">
<%--            <label for="institution">기관:</label>--%>
            <select id="institution" class="form-select form-select-sm" onchange="updateChart()">
                <option value="all">전체</option>
                <option value="KCC정보통신">KCC정보통신</option>
                <option value="서울대학교">서울대학교</option>
                <option value="연세대학교">연세대학교</option>
                <option value="삼성전자">삼성전자</option>
                <option value="한화그룹">한화그룹</option>
                <option value="LG전자">LG전자</option>
                <option value="한전KPS">한전KPS</option>
                <option value="한미약품">한미약품</option>
                <option value="한국원자력연구원">한국원자력연구원</option>
                <option value="한국지질자원연구원">한국지질자원연구원</option>
                <option value="부산테크노파크">부산테크노파크</option>
                <option value="한국항공우주연구원">한국항공우주연구원</option>
                <option value="국립의료원">국립의료원</option>
            </select>
        </div>
    </div>

</div>

<canvas id="myChart"></canvas>

<template id="institution-template">
    <div class="info card mb-1">
        <div class="card-body d-flex">
            <div class="col-5">
                <h4 class="card-title ms-5">기관 정보</h4>
            </div>
            <div class="col-7">
                <p class="card-text">기관명: <span class="institution-name"></span></p>
                <p class="card-text">사업자등록번호: <span class="business-number"></span></p>
                <p class="card-text">기업유형: <span class="type"></span></p>
                <p class="card-text">소재지: <span class="location"></span></p>
                <p class="card-text">기관구분: <span class="category"></span></p>
            </div>
        </div>
    </div>
</template>

<script>
    const data = {
        2022: {
            KCC정보통신: [45, 12, 67, 34, 89, 53, 91, 2, 77, 64],
            서울대학교: [56, 43, 22, 78, 99, 11, 30, 64, 80, 45],
            삼성전자: [33, 11, 89, 53, 78, 92, 45, 63, 28, 77],
            연세대학교: [62, 34, 12, 71, 48, 59, 83, 45, 67, 55],
            한화그룹: [21, 67, 32, 45, 90, 33, 76, 59, 88, 70],
            LG전자: [14, 85, 32, 62, 41, 71, 55, 77, 99, 60],
            한전KPS: [27, 90, 46, 53, 63, 71, 89, 54, 12, 80],
            한미약품: [15, 82, 47, 68, 29, 64, 52, 33, 71, 99],
            한국원자력연구원: [80, 56, 37, 45, 91, 62, 74, 99, 11, 65],
            한국지질자원연구원: [38, 56, 72, 61, 50, 19, 83, 27, 64, 45],
            부산테크노파크: [24, 66, 58, 32, 85, 91, 77, 53, 60, 43],
            한국항공우주연구원: [99, 55, 60, 73, 40, 33, 25, 57, 82, 16],
            국립의료원: [11, 78, 59, 32, 85, 63, 42, 97, 54, 21]
        },
        2023: {
            KCC정보통신: [78, 32, 65, 98, 12, 56, 89, 1, 45, 78],
            서울대학교: [23, 90, 56, 12, 87, 65, 34, 99, 21, 78],
            삼성전자: [45, 78, 12, 34, 90, 56, 78, 12, 34, 90],
            연세대학교: [54, 76, 89, 11, 34, 67, 92, 21, 56, 33],
            한화그룹: [22, 33, 57, 98, 64, 72, 11, 49, 84, 60],
            LG전자: [18, 92, 45, 63, 34, 77, 21, 58, 80, 39],
            한전KPS: [91, 40, 75, 60, 12, 88, 33, 21, 48, 66],
            한미약품: [35, 72, 18, 64, 89, 41, 56, 23, 57, 99],
            한국원자력연구원: [13, 25, 78, 92, 56, 41, 66, 53, 87, 29],
            한국지질자원연구원: [45, 23, 67, 54, 32, 79, 16, 50, 38, 62],
            부산테크노파크: [76, 56, 33, 90, 18, 61, 99, 50, 42, 67],
            한국항공우주연구원: [21, 83, 49, 72, 59, 85, 14, 63, 77, 18],
            국립의료원: [92, 55, 61, 22, 37, 49, 84, 71, 58, 69],

        },
    };

    const labels = [
        "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월",
    ];

    const ctx = document.getElementById("myChart").getContext("2d");
    let myChart;

    function updateChart() {
        const selectedYear = document.getElementById("year").value;
        const selectedInstitution = document.getElementById("institution").value;
        const yearData = data[selectedYear];
        const datasets = [];
        let maxValue = 0;

        // Find the max value to calculate the bubble radius dynamically
        if (selectedInstitution === "all") {
            for (const institution in yearData) {
                maxValue = Math.max(maxValue, ...yearData[institution]);
            }
        } else {
            maxValue = Math.max(...yearData[selectedInstitution]);
        }

        // Dynamically adjust the bubble radius based on the max value
        const calculateRadius = (value) => {
            return Math.max(3, Math.min((value / maxValue) * 10, 8)); // Min and max radius values (3 to 8)
        };

        if (selectedInstitution === "all") {
            for (const institution in yearData) {
                datasets.push({
                    label: institution,
                    data: yearData[institution].map((value, index) => ({
                        x: index + 1,
                        y: value,
                        r: calculateRadius(value),
                    })),
                    backgroundColor: getRandomColor(),
                });
            }
            hideInstitutionInfo();
        } else {
            datasets.push({
                label: selectedInstitution,
                data: yearData[selectedInstitution].map((value, index) => ({
                    x: index + 1,
                    y: value,
                    r: calculateRadius(value),
                })),
                backgroundColor: getRandomColor(),
            });
            showInstitutionInfo(selectedInstitution);
        }

        if (myChart) {
            myChart.destroy();
        }

        myChart = new Chart(ctx, {
            type: "bubble",
            data: {
                labels: labels,
                datasets: datasets,
            },
            options: {
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: "월",
                        },
                        ticks: {
                            callback: function (value) {
                                return labels[value - 1];
                            },
                        },
                    },
                    y: {
                        title: {
                            display: true,
                            text: "연구 갯수",
                        },
                    },
                },
            },
        });
    }


    function getRandomColor() {
        const letters = "0123456789ABCDEF";
        let color = "#";
        for (let i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }

    function hideInstitutionInfo() {
        const infos = document.getElementsByClassName('info');
        for (let i = 0; i < infos.length; i++) {
            infos[i].style.display = 'none';
        }
    }

    function showInstitutionInfo(selectedInstitution) {
        hideInstitutionInfo();
        const institutionInfo = institutions.find(inst => inst.name === selectedInstitution);
        if (institutionInfo) {
            const elements = document.querySelectorAll('.info span');
            elements[0].textContent = institutionInfo.name;
            elements[1].textContent = institutionInfo.businessNumber;
            elements[2].textContent = institutionInfo.type;
            elements[3].textContent = institutionInfo.location;
            elements[4].textContent = institutionInfo.category;
            const infoDiv = document.querySelector('.info');
            if (infoDiv) {
                infoDiv.style.display = 'block';
            }
        }
    }

    document.getElementById("year").addEventListener("change", updateChart);
    document.getElementById("institution").addEventListener("change", updateChart);
    updateChart();

    const institutions = [
        {
            name: 'KCC정보통신',
            businessNumber: '123-45-67890',
            type: '산업체',
            location: '서울',
            category: '공공'
        },
        {
            name: '서울대학교',
            businessNumber: '234-56-78901',
            type: '대학교',
            location: '서울',
            category: '사립'
        },
        {
            name: '연세대학교',
            businessNumber: '345-67-89012',
            type: '대학교',
            location: '서울',
            category: '사립'
        },
        {
            name: '삼성전자',
            businessNumber: '456-78-90123',
            type: '기업',
            location: '서울',
            category: '상장'
        },
        {
            name: '한화그룹',
            businessNumber: '567-89-01234',
            type: '기업',
            location: '서울',
            category: '상장'
        },
        {
            name: 'LG전자',
            businessNumber: '678-90-12345',
            type: '기업',
            location: '서울',
            category: '상장'
        },
        {
            name: '한전KPS',
            businessNumber: '789-01-23456',
            type: '공기업',
            location: '서울',
            category: '공공'
        },
        {
            name: '한미약품',
            businessNumber: '890-12-34567',
            type: '제약',
            location: '서울',
            category: '상장'
        },
        {
            name: '한국원자력연구원',
            businessNumber: '901-23-45678',
            type: '연구소',
            location: '대전',
            category: '공공'
        },
        {
            name: '한국지질자원연구원',
            businessNumber: '012-34-56789',
            type: '연구소',
            location: '대전',
            category: '공공'
        },
        {
            name: '부산테크노파크',
            businessNumber: '123-45-67891',
            type: '기관',
            location: '부산',
            category: '공공'
        },
        {
            name: '한국항공우주연구원',
            businessNumber: '234-56-78902',
            type: '연구소',
            location: '대전',
            category: '공공'
        },
        {
            name: '국립의료원',
            businessNumber: '345-67-89013',
            type: '병원',
            location: '서울',
            category: '공공'
        }
    ];


    const template = document.getElementById('institution-template');

    institutions.forEach(institution => {
        const clone = template.content.cloneNode(true);
        const elements = clone.querySelectorAll('span');
        elements[0].textContent = institution.name;
        elements[1].textContent = institution.businessNumber;
        elements[2].textContent = institution.type;
        elements[3].textContent = institution.location;
        elements[4].textContent = institution.category;

        document.body.appendChild(clone);
    });
</script>
</body>
</html>
