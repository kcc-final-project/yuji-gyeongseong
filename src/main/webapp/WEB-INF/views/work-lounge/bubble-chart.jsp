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
        #chart-container {
            width: 80%;
            margin: 0 auto;
        }

        .info {
            display: none;
        }
    </style>
</head>
<body class="mt-5">

<div class="d-flex align-items-center">
    <div class="form-group col-md-2 ms-1">
        <label for="year">년도:</label>
        <select id="year" class="form-control-sm">
            <option value="2022">2022</option>
            <option value="2023">2023</option>
        </select>
    </div>
    <div class="form-group col-md-2 ms-4">
        <label for="institution">기관:</label>
        <select id="institution" class="form-control-sm" onchange="updateChart()">
            <option value="all">전체</option>
            <option value="A기관">A기관</option>
            <option value="B기관">B기관</option>
        </select>
    </div>
</div>

<canvas id="myChart"></canvas>

<template id="institution-template">
    <div class="info card mb-3">
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
            A기관: [10, 15, 20, 25, 30, 28, 22, 18, 15, 12],
            B기관: [5, 8, 12, 15, 18, 20, 19, 16, 13, 10],
        },
        2023: {
            A기관: [12, 18, 22, 25, 32, 30, 25, 20, 18, 15],
            B기관: [8, 12, 15, 18, 22, 25, 23, 20, 17, 14],
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

        if (selectedInstitution === "all") {
            for (const institution in yearData) {
                datasets.push({
                    label: institution,
                    data: yearData[institution].map((value, index) => ({
                        x: index + 1,
                        y: value,
                        r: value / 2,
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
                    r: value / 2,
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
            name: 'A기관',
            businessNumber: '123-45-67890',
            type: '연구소',
            location: '서울',
            category: '공공'
        },
        {
            name: 'B기관',
            businessNumber: '987-65-43210',
            type: '대학',
            location: '부산',
            category: '사립'
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
