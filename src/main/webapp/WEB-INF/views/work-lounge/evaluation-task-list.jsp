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
</head>
<body class="mt-5">
<div class="common-main" style="margin-top: 70px">
    <div class="container">
        <div class="d-flex align-items-center my-3">
            <h4 class="me-5"><b>평가위원회 목록</b></h4>
        </div>

        <div class="line"></div>

        <div class="d-flex align-items-center mb-3">
            <select id="sortSelect" class="form-select me-5" onchange="onSelectChange()" style="width: 100px">
                <option value="start">최신순</option>
                <option value="end">마감순</option>
            </select>
            <div class="d-flex justify-content-end flex-grow-1">
                <div class="me-2">
                    <select id="filterType" class="form-control">
                        <option value="all">전체</option>
                        <option value="0">평가위원회명</option>
                        <option value="1">공모분야명</option>
                        <option value="4">평가상태</option>
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

        <div style="max-height: 250px; overflow-y: auto">
            <table class="table table-bordered text-center table-hover mt-3">
                <thead>
                <tr class="domain">
                    <th>평가위원회명</th>
                    <th>공모분야명</th>
                    <th>평가시작일자</th>
                    <th>평가종료일자</th>
                    <th>평가상태</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${committeeList}" var="committee">
                    <tr class="letter">
                        <td>
                            <a class="committee-link" data-id="${committee.name}">
                                <c:out value="${committee.name}"/>
                            </a>
                        </td>
                        <td><c:out value="${committee.subTitle}"/></td>
                        <td><c:out value="${committee.evalStartedAt}"/></td>
                        <td><c:out value="${committee.evalClosedAt}"/></td>
                        <td><c:out value="${committee.evalStatus}"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div id="myTable"></div>
        <%--       이자리에 나옴--%>
    </div>
</div>

<script src="/resources/js/work-lounge/evaluation-task-list.js"></script>
</body>
</html>
