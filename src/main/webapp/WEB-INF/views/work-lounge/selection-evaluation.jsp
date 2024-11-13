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
        <div class="col-9" style="margin-right: 100px !important"></div>
        <div class="form-group">
            <select onchange="filterTable(this.value)" class="form-control" style="border-radius: 5px;">
                <option value="" disabled>필터 선택</option>
                <option value="미평가">미평가</option>
                <option value="평가완료">평가완료</option>
            </select>
        </div>
        <button onclick="resetTable()"
                style="background-color: #f1f1f1; border: none; padding: 5px 10px; border-radius: 5px; cursor: pointer; margin: auto">
            <div style="margin-bottom: 4px">
            <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="#5f6368">
                <path d="M440-122q-121-15-200.5-105.5T160-440q0-66 26-126.5T260-672l57 57q-38 34-57.5 79T240-440q0 88 56 155.5T440-202v80Zm80 0v-80q87-16 143.5-83T720-440q0-100-70-170t-170-70h-3l44 44-56 56-140-140 140-140 56 56-44 44h3q134 0 227 93t93 227q0 121-79.5 211.5T520-122Z"/>
            </svg>
            </div>
        </button>

        <div id="totalRows"></div>
    </div>

    <div class="mt-3" style="max-height: 500px; overflow-y: auto">
        <table class="table table-hover ">
            <thead>
            <tr class="domain" style="justify-items: center;text-align: center">
                <td></td>
                <td>통합공고명</td>
                <td style="margin-right: 16px;">접수마감일</td>
                <td style="margin-right: 20px;">최종선정일</td>
                <td>평가상태</td>
                <td style="padding-left: 28px">평가위원</td>
                <td style="padding-left: 10px">선정</td>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${selectEvaluationList}" var="selectEvaluation" varStatus="status">
                <tr class="clickable-row" style="justify-items: center;text-align: center">
                    <th class="icon"><i class="arrow down"></i></th>
                    <td class="truncate-text" style="width: 613px; font-size: 16px;font-weight: normal; padding-top: 12px"><c:out
                            value="${selectEvaluation.totalTitle}"/></td>
                    <th></th>
                    <th></th>
                    <td style="text-align: center;justify-items: center; padding-top: 13px">
                        <c:choose>
                            <c:when test="${selectEvaluation.evalStatus == '미평가'}">
                                <span class="status red">미평가</span>
                            </c:when>
                            <c:when test="${selectEvaluation.evalStatus == '평가완료'}">
                                <span class="status green">평가완료</span>
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
                            <c:forEach items="${selectEvaluation.notiTypes}" var="noti" varStatus="notiStatus">
                                <tbody style="vertical-align: baseline;">
                                <tr style="text-align: center;justify-items: center;font-size: 14px;font-weight: normal;">
                                    <th class="ps-3 pe-3">
                                    </th>
                                    <td class="truncate-text1" style="width: 642px"><c:out
                                            value="${noti.subTitle}"/></td>
                                    <td style="padding-left: 14px;"><c:out value="${noti.closedAt}"/></td>
                                    <td class="pe-3" style="padding-left: 36px;"><c:out value="${noti.finalSelectedAt}"/></td>
                                    <td style="margin-right: 20px !important;">
                                        <c:choose>
                                            <c:when test="${noti.progStatus == '평가대기중'}">
                                                <span class="status yellow">평가대기중</span>
                                            </c:when>
                                            <c:when test="${noti.progStatus == '평가진행중'}">
                                                <span class="status blue">평가진행중</span>
                                            </c:when>
                                            <c:when test="${noti.progStatus == '과제평가완료'}">
                                                <span class="status green">과제평가완료</span>
                                            </c:when>
                                            <c:when test="${noti.progStatus == '선정평가완료'}">
                                                <span class="status purple">선정평가완료</span>
                                            </c:when>
                                            <c:when test="${noti.progStatus == '선정평가대기'}">
                                                <span class="status orange">선정평가대기</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status gray"
                                                      >구성대기</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td style="text-align: center; flex: 0 0 auto;">
                                        <button type="button"  style="margin-left: 10px" class="btn ctm-btn-orange
                                                <c:if test='${noti.progStatus != "구성대기"}'>ctm-btn-gray</c:if>"
                                                onclick="if('${noti.progStatus}' == '구성대기') { window.open('/work-lounge/eval-list/eval-compose/${noti.subAnnNo}', '_blank','width=1625, height=840, top=5, left=5, scrollbars=yes'); }"
                                                <c:if test='${noti.progStatus != "구성대기"}'>disabled</c:if>>
                                            위원구성
                                        </button>
                                    </td>


                                    <td style="text-align: center; justify-content: center; margin: auto">
                                        <button type="button" class="btn ctm-btn-orange1
                                                <c:if test='${noti.progStatus != "선정평가대기"}'>ctm-btn-gray disabled</c:if>"
                                                onclick="if('${noti.progStatus}' == '선정평가대기') { window.open('/work-lounge/eval-list/evaluation-select/${noti.subAnnNo}', '_blank','width=1300, height=800, top=25, left=60, scrollbars=yes'); }"
                                                <c:if test='${noti.progStatus != "선정평가대기"}'>disabled</c:if>>
                                            선정평가
                                        </button>

                                    </td>
                                </tr>
                                </tbody>
                            </c:forEach>

                        </table>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div>
<script src="/resources/js/work-lounge/selection-evaluation.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const hiddenRows = document.querySelectorAll('.hidden-row');

        hiddenRows.forEach(row => {
            const progStatuses = row.querySelectorAll('.status');
            let allSelectedComplete = true;

            // 각 상태를 확인하여 '선정평가완료'인지 체크
            progStatuses.forEach(statusElement => {
                const progStatus = statusElement.textContent.trim();
                if (progStatus !== '선정평가완료') {
                    allSelectedComplete = false;
                }
            });

            // 모든 '선정평가완료' 상태인 경우, 상위 행에서 '미평가'를 '평가완료'로 변경하고 '미평가'는 숨기기
            if (allSelectedComplete) {
                // '미평가' 상태를 찾아서 변경
                const evalStatusElement = row.closest('tr').previousElementSibling.querySelector('.status.red');
                console.log(evalStatusElement); // evalStatusElement가 제대로 선택되었는지 확인

                if (evalStatusElement) {
                    // '미평가' 상태 숨기기
                    evalStatusElement.style.display = 'none'; // '미평가' 상태를 숨깁니다.

                    // 새로운 '평가완료' 상태를 추가
                    const newStatusElement = document.createElement('span'); // 새로운 span 생성
                    newStatusElement.classList.add('status', 'green'); // '평가완료' 스타일 클래스 추가
                    newStatusElement.textContent = '평가완료'; // '평가완료' 텍스트 추가

                    // '미평가' 상태가 있던 자리 후에 새로운 '평가완료' 상태를 추가
                    evalStatusElement.parentElement.appendChild(newStatusElement);
                }
            }
        });
    });



</script>
</body>
</html>
