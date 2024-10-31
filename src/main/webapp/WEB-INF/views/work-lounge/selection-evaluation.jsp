<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-work-lounge-tap.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/resources/css/work-lounge/selection-evaluation.css"/>
</head>
<body>
<div class="common-main modify" style="height: auto; padding-top: 65px;">
    <h4><b>선정평가 목록</b></h4>
    <div class="line"></div>
    <div class="d-flex align-items-center gap-2">
        <div class="col-9" style="margin-right: 3rem !important"></div>
        <button class="badge text-bg-warning" onClick="filterTable('심사중')">심사중</button>
        <button class="badge text-bg-success" onClick="filterTable('심사완료')">심사완료</button>
        <button class="badge text-bg-light" onclick="resetTable()"
                style="background-color: #f1f1f1; border: none; padding: 5px 10px; border-radius: 5px; cursor: pointer;">
            <svg xmlns="http://www.w3.org/2000/svg" height="16px" viewBox="0 -960 960 960" width="16px" fill="#5f6368">
                <path d="M440-122q-121-15-200.5-105.5T160-440q0-66 26-126.5T260-672l57 57q-38 34-57.5 79T240-440q0 88 56 155.5T440-202v80Zm80 0v-80q87-16 143.5-83T720-440q0-100-70-170t-170-70h-3l44 44-56 56-140-140 140-140 56 56-44 44h3q134 0 227 93t93 227q0 121-79.5 211.5T520-122Z"/>
            </svg>
        </button>
        <div id="totalRows"></div>
    </div>

    <div class="mt-3" style="max-height: 500px; overflow-y: auto">
        <table class="table table-hover ">
            <thead>
            <tr class="domain" style="justify-items: center;text-align: center">
                <td></td>
                <td>통합공고명</td>
                <td>접수마감일</td>
                <td>최종선정일</td>
                <td>평가상태</td>
                <td>평가위원</td>
                <td>선정</td>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${selectEvaluationList}" var="selectEvaluation" varStatus="status">
                <tr class="clickable-row" style="justify-items: center;text-align: center">
                    <th class="icon"><i class="arrow down"></i></th>
                    <td class="truncate-text" style="width: 620px; font-size: 14px;font-weight: bolder;"><c:out
                            value="${selectEvaluation.totalTitle}"/></td>
                    <th></th>
                    <th></th>
                    <td style="text-align: center;justify-items: center">
                        <c:choose>
                            <c:when test="${selectEvaluation.evalStatus == '심사중'}">
                                <span class="badge text-bg-warning">심사중</span>
                            </c:when>
                            <c:when test="${selectEvaluation.evalStatus == '심사완료'}">
                                <span class="badge text-bg-success">심사완료</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge text-bg-primary" style="background-color: #2E406AFF !important;">상태 미지정</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <th class="ps-5 pe-5"></th>
                    <th class="ps-5 pe-5"></th>
                </tr>
                <tr class="hidden-row" style="font-size: 16px;">
                    <td colspan="7" class="blue" style="padding: 0px">
                        <table class="table  table-sm text-center" style="background-color: #ffffff !important;">
                            <thead style="vertical-align: baseline;">
                            <tr style="text-align: center;justify-items: center;font-size: 14px;font-weight: bolder;">
                                <th class="ps-3 pe-3">
                                </th>
                                <td class="truncate-text1" style="width: 635px"><c:out
                                        value="${selectEvaluation.subTitle}"/></td>
                                <td><c:out value="${selectEvaluation.closedAt}"/></td>
                                <td><c:out value="${selectEvaluation.finalSelectedAt}"/></td>
                                <td class="ps-4">
                                    <c:choose>
                                        <c:when test="${selectEvaluation.progStatus == '심사중'}">
                                            <span class="badge text-bg-danger">평가대기중</span>
                                        </c:when>
                                        <c:when test="${selectEvaluation.progStatus == '심사완료'}">
                                            <span class="badge text-bg-warning">평가진행중</span>
                                        </c:when>
                                        <c:when test="${selectEvaluation.progStatus == '심사완료'}">
                                            <span class="badge text-bg-secondary">과제평가완료</span>
                                        </c:when>
                                        <c:when test="${selectEvaluation.progStatus == '심사완료'}">
                                            <span class="badge text-bg-success">선정평가완료</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge text-bg-primary" style="background-color: #2E406AFF !important;">상태 미지정</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-back-beige"
                                            onclick="window.location.href='http://localhost:8082/work-lounge/evaluation-table'">
                                        위원 구성
                                    </button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-back-orange"
                                            onclick="window.location.href='http://localhost:8082/work-lounge/evaluation-table'">
                                        선정평가
                                    </button>
                                </td>
                            </tr>
                            </thead>
                                <%--                            <tbody style="vertical-align: baseline;">--%>
                                <%--                            <tr>--%>
                                <%--                                <td></td>--%>
                                <%--                                <td class="truncate-text1">[2024-RM-03-총괄] 경수형 SMR 사고해석 및 핵 설계 규제검증 기반기술 개발</td>--%>
                                <%--                                <td>2024-10-15</td>--%>
                                <%--                                <td>2024-10-18</td>--%>
                                <%--                                <td><span class="badge text-bg-secondary">선정평가대기</span></td>--%>
                                <%--                                <th>--%>
                                <%--                                    <button type="button" class="btn btn-back-orange"--%>
                                <%--                                            onclick="window.location.href='http://localhost:8082/work-lounge/evaluation-table'">--%>
                                <%--                                        위원 재편성--%>
                                <%--                                    </button>--%>
                                <%--                                </th>--%>
                                <%--                                <th>--%>
                                <%--                                    <button type="button" class="btn btn-back-orange"--%>
                                <%--                                            onclick="window.location.href='http://localhost:8082/work-lounge/evaluation-table'">--%>
                                <%--                                        선정평가--%>
                                <%--                                    </button>--%>
                                <%--                                </th>--%>
                                <%--                            </tr>--%>
                                <%--                            </tbody>--%>
                        </table>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div>
<script src="/resources/js/work-lounge/selection-evaluation.js"></script>
</body>
</html>