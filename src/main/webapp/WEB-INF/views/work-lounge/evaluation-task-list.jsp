<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-work-lounge-tap.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>평가위원회 목록</title>
    <link rel="stylesheet" href="/resources/css/work-lounge/evaluation-task-list.css"/>
    <style>
        .arrow {
            margin-left: 5px;
            font-size: 0.8em;
        }

        .up::after {
            content: '▲';
            color: green;
        }

        .down::after {
            content: '▼';
            color: red;
        }
    </style>
</head>
<body class="mt-5">
<div class="common-main" style="margin-top: 70px">
    <div class="container">
        <div class="d-flex align-items-center my-3">
            <h4 class="me-5"><b>평가위원회 목록</b></h4>
        </div>

        <div class="line"></div>

        <div class="d-flex align-items-center mb-3">
            <div class="d-flex justify-content-end flex-grow-1">
                <div class="me-2">
                    <select id="filterType" class="form-control" onchange="updateFilterValue()">
                        <option value="all">전체</option>
                        <option value="0">평가위원회명</option>
                        <option value="1">공모분야명</option>
<%--                        <option value="4">평가상태</option>--%>
                        <option value="in-progress">미평가</option>
                        <option value="completed">평가완료</option>
                    </select>
                </div>
                <div class="me-2">
                    <input type="text" id="filterValue" class="form-control" placeholder="검색 내용 입력"/>
                </div>
                <div>
                    <button class="btn btn-back-indigo" onclick="filterTable()">검색</button>
                </div>
            </div>
        </div>

        <div id="myTable" style="max-height: 250px; overflow-y: auto">
            <table class="table table-bordered text-center table-hover mt-3">
                <thead>
                <tr class="domain">
                    <td>평가위원회명</td>
                    <td>공모분야명</td>
                    <td class="sortable" onclick="sortTable('start')">평가시작일자<span id="startArrow" class="arrow"></span></td>
                    <td class="sortable" onclick="sortTable('end')">평가종료일자<span id="endArrow" class="arrow"></span></td>
                    <td>평가상태</td>
                    <td>연구 과제 리스트</td>
                </tr>
                </thead>
                <tbody id="tableBody">
                <c:forEach items="${committeeList}" var="committee">
                    <tr class="letter">
                        <td style="padding-top: 13px !important">
                            <a class="committee-link" data-id="${committee.name}" style="text-decoration: none; color: black" >
                                <c:out value="${committee.name}"/>
                            </a>
                        </td>
                        <td style="padding-top: 13px !important"><c:out value="${committee.subTitle}"/></td>
                        <td style="padding-top: 13px !important"><c:out value="${committee.evalStartedAt}"/></td>
                        <td style="padding-top: 13px !important"><c:out value="${committee.evalClosedAt}"/></td>
                        <td style="padding-top: 13px !important"><c:out value="${committee.evalStatus}"/></td>
                        <td style="padding-top: 13px !important"><button type="button" data-id="${committee.name}" class="btn btn-sm btn-back-indigo committee-link">연구과제 상세 보기</button></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="/resources/js/work-lounge/evaluation-task-list.js"></script>
<script>
    let sortOrder = {
        start: 'asc',
        end: 'asc'
    };

    function updateFilterValue() {
        const filterType = document.getElementById('filterType').value;
        const filterValue = document.getElementById('filterValue');


        if (filterType === 'completed') {
            filterValue.value = '평가완료';
        } else if (filterType === 'in-progress') {
            filterValue.value = '미평가';
        } else {
            filterValue.value = '';
        }
    }


    function filterTable() {
        const filterType = document.getElementById('filterType').value;
        const filterValue = document.getElementById('filterValue').value.toLowerCase();
        const tableBody = document.getElementById('tableBody');
        const rows = Array.from(tableBody.rows);

        rows.forEach(row => {
            let cellValue = '';
            let shouldDisplay = false;

            switch (filterType) {
                case '0': // 평가위원회명
                    cellValue = row.cells[0].innerText.toLowerCase();
                    shouldDisplay = filterValue ? cellValue.includes(filterValue) : true;
                    break;
                case '1': // 공모분야명
                    cellValue = row.cells[1].innerText.toLowerCase();
                    shouldDisplay = filterValue ? cellValue.includes(filterValue) : true;
                    break;
                case '4': // 평가상태
                    cellValue = row.cells[4].innerText.toLowerCase();
                    shouldDisplay = filterValue ? cellValue.includes(filterValue) : true;
                    break;
                case 'completed': // 심사완료 필터
                    shouldDisplay = row.cells[4].innerText.toLowerCase() === '평가완료';
                    break;
                case 'in-progress': // 심사중 필터
                    shouldDisplay = row.cells[4].innerText.toLowerCase() === '미평가';
                    break;
                default:
                    shouldDisplay = true; // 기본값: 모든 행 표시
                    break;
            }

            row.style.display = shouldDisplay ? '' : 'none';
        });
    }

    window.onload = function() {
        document.getElementById('filterType').value = 'in-progress';
        document.getElementById('filterValue').value = '미평가';
        filterTable();
    }


    function sortTable(type) {
        const table = document.querySelector("#myTable table tbody");
        const rows = Array.from(table.rows);

        const startArrow = document.getElementById('startArrow');
        const endArrow = document.getElementById('endArrow');

        if (type === 'start') {

            endArrow.classList.remove('up', 'down');
            rows.sort((a, b) => {
                const dateA = new Date(a.cells[2].innerText);
                const dateB = new Date(b.cells[2].innerText);
                return sortOrder.start === 'asc' ? dateA - dateB : dateB - dateA;
            });
            sortOrder.start = sortOrder.start === 'asc' ? 'desc' : 'asc';
            startArrow.classList.toggle('up', sortOrder.start === 'asc');
            startArrow.classList.toggle('down', sortOrder.start === 'desc');
        } else if (type === 'end') {

            startArrow.classList.remove('up', 'down');
            rows.sort((a, b) => {
                const dateA = new Date(a.cells[3].innerText);
                const dateB = new Date(b.cells[3].innerText);
                return sortOrder.end === 'asc' ? dateA - dateB : dateB - dateA;
            });
            sortOrder.end = sortOrder.end === 'asc' ? 'desc' : 'asc';
            endArrow.classList.toggle('up', sortOrder.end === 'asc');
            endArrow.classList.toggle('down', sortOrder.end === 'desc');
        }


        rows.forEach(row => table.appendChild(row));
    }
</script>
</body>
</html>
