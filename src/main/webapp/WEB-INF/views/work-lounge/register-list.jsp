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
    <link rel="stylesheet" href="/resources/css/work-lounge/register-list.css"/>
</head>
<body>
<div class="common-main">
    <div class="container">
        <div class="d-flex align-items-center my-3">
            <h4><b>작성중인 계획서</b></h4>
            <div class="text-muted mb-0 ms-3 blue-font" style="font-size: 20px">
                접수 기한이 종료 되었을 경우(접수종료일시) 계획서 수정이 불가능합니다.
            </div>
        </div>
        <div class="line"></div>
        <div style="max-height: 300px; overflow-y: auto">
            <table class="table table-bordered text-center">
                <thead>
                <tr class="domain">
                    <th>통합공고명</th>
                    <th>공모분야명</th>
                    <th>공모유형</th>
                    <th>접수시작일시</th>
                    <th>접수종료일시</th>
                    <th>접수상태</th>
                    <th>수정</th>
                    <th>작성취소</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${registerList}" var="register" varStatus="status">
                    <tr class="letter">
                        <td><c:out value="${register.totalTitle}"/></td>
                        <td><c:out value="${register.subTitle}"/></td>
                        <td><c:out value="${register.annType}"/></td>
                        <td><c:out value="${register.startedAt}"/></td>
                        <td><c:out value="${register.closedAt}"/></td>
                        <td><c:out value="${register.status}"/></td>
                        <td>
                            <button type="button" class="btn btn-sm btn-outline-primary"
                                    onclick="window.location.href='http://localhost:8082/work-lounge/evaluation-table'">
                                수정
                            </button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-sm btn-outline-danger"
                                    onclick="deleteBoard(${register.rndPlanNo})">
                                취소
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="d-flex align-items-center my-3 mt-5">
            <h4><b>완료된 계획서</b></h4>
            <div class="text-muted mb-0 ms-3 blue-font" style="font-size: 20px">
                접수 기한이 종료 되었을 경우(접수종료일시) 제출 취소가 불가능합니다.
            </div>
        </div>
        <div class="line"></div>
        <div style="max-height: 300px; overflow-y: auto">
            <table class="table table-bordered text-center">
                <thead>
                <tr class="domain">
                    <th>통합공고명</th>
                    <th>공모분야명</th>
                    <th>공모유형</th>
                    <th>접수시작일시</th>
                    <th>접수종료일시</th>
                    <th>접수일자</th>
                    <th>계획서상태</th>
                    <th>제출취소</th>
                    <th>의견공유</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${completeList}" var="complete" varStatus="status">
                    <tr class="letter">
                        <td><c:out value="${complete.totalTitle}"/></td>
                        <td><c:out value="${complete.subTitle}"/></td>
                        <td><c:out value="${complete.annType}"/></td>
                        <td><c:out value="${complete.startedAt}"/></td>
                        <td><c:out value="${complete.closedAt}"/></td>
                        <td><c:out value="${complete.submittedAt}"/></td>
                        <td><c:out value="${complete.planStatus}"/></td>
                        <td>
                            <button type="button" class="btn btn-sm btn-outline-secondary" onclick="deleteBoard(${complete.rndPlanNo})">
                                취소
                            </button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-sm btn-back-orange"
                                    onclick="window.location.href='http://localhost:8082/work-lounge/{annNo}'">
                                의견공유
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="/resources/js/work-lounge/register-list.js"></script>
<script>
    function deleteBoard(rndPlanNo) {
        if (confirm("정말로 이 계획서를 삭제하시겠습니까?")) {
            $.ajax({
                type: "POST",
                url: "http://localhost:8082/work-lounge/delete",
                data: { rndPlanNo: rndPlanNo },
                success: function(response) {
                    // Assuming the server returns a success response
                    alert("삭제되었습니다.");
                    // Optionally, remove the row from the table
                    // $(this).closest('tr').remove(); // Commented out as you may want to manage this differently
                    location.reload(); // Reload the page to reflect the changes
                },
                error: function() {
                    alert("삭제 실패. 다시 시도해 주세요.");
                }
            });
        }
    }
</script>

</body>
</html>