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
    <!-- SweetAlert2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body class="mt-4">
<div class="common-main">
    <div class="container">
        <div class="d-flex align-items-center my-3">
            <h4><b>작성중인 계획서</b></h4>
            <span class="text-muted mb-0 ms-3 mt-1 cc">
                접수 기한이 종료 되었을 경우(접수종료일시) 계획서 수정이 불가능합니다.
            </span>
        </div>
        <div class="line"></div>
        <div style="max-height: 300px; overflow-y: auto">
            <table class="table table-bordered text-center">
                <thead>
                <tr class="domain">
                    <td>통합공고명</td>
                    <td>공모분야명</td>
                    <td>공모유형</td>
                    <td>접수시작일시</td>
                    <td>접수종료일시</td>
                    <td>접수상태</td>
                    <td>계획서상태</td>
                    <td>수정</td>
                    <td>작성취소</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${registerList}" var="register" varStatus="status">
                    <c:if test="${register.status eq '접수중'}">
                        <tr class="letter" style="text-align: center;justify-content: center; margin: auto">
                            <td class="truncate-text p-3"><c:out value="${register.totalTitle}"/></td>
                            <td class="truncate-text p-3"><c:out value="${register.subTitle}"/></td>
                            <td class="pt-3"><c:out value="${register.annType}"/></td>
                            <td class="pt-3"><c:out value="${register.startedAt}"/></td>
                            <td class="pt-3"><c:out value="${register.closedAt}"/></td>
                            <td class="pt-3"><c:out value="${register.status}"/></td>
                            <td class="pt-3"><c:out value="${register.planStatus}"/></td>
                            <td>
                                <button type="button" class="btn btn-sm ctm-btn-blue btn-edit" style="margin: auto"
                                        onclick="window.location.href='http://localhost:8082/rnd-plans/${register.rndPlanNo}'">
                                    수정
                                </button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-sm ctm-btn-red btn-cancel" style="margin: auto"
                                        onclick="deleteBoard(${register.rndPlanNo})">
                                    취소
                                </button>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="d-flex align-items-center my-3 mt-4">
            <h4><b>완료된 계획서</b></h4>
            <span class="text-muted mb-0 ms-3 mt-1 cc">
                접수 기한이 종료 되었을 경우(접수종료일시) 제출 취소가 불가능합니다.
            </span>
        </div>
        <div class="line"></div>
        <div style="max-height: 300px; overflow-y: auto">
            <table class="table table-bordered text-center">
                <thead>
                <tr class="domain">
                    <td>통합공고명</td>
                    <td>공모분야명</td>
                    <td>공모유형</td>
                    <td>접수시작일시</td>
                    <td>접수종료일시</td>
                    <td>접수일자</td>
                    <td>접수상태</td>
                    <td>계획서상태</td>
                    <td>제출취소</td>
                    <td>의견공유</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${completeList}" var="complete" varStatus="status">
                    <tr class="letter" style="text-align: center;justify-content: center;">
                        <td class="truncate-text1 pt-3"><c:out value="${complete.totalTitle}"/></td>
                        <td class="truncate-text1 pt-3"><c:out value="${complete.subTitle}"/></td>
                        <td class="pt-3"><c:out value="${complete.annType}"/></td>
                        <td class="pt-3"><c:out value="${complete.startedAt}"/></td>
                        <td class="pt-3"><c:out value="${complete.closedAt}"/></td>
                        <td class="pt-3"><c:out value="${complete.submittedAt}"/></td>
                        <td class="pt-3"><c:out value="${complete.status}"/></td>
                        <td class="pt-3"><c:out value="${complete.planStatus}"/></td>
                        <td>
                            <button type="button" class="btn btn-sm ctm-btn-red btn-edit" style="margin: auto"
                                    onclick="deleteBoard(${complete.rndPlanNo})">
                                취소
                            </button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-sm ctm-btn-orange btn-opinion" style="margin: auto"
                                    onclick="window.open('http://localhost:8082/work-lounge/sharing-opinion/${complete.rndPlanNo}','_blank','width=1150, height=800,top=25, left=140, scrollbars=no')">
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
    // function deleteBoard(rndPlanNo) {
    //     if (confirm("정말로 이 계획서를 삭제하시겠습니까?")) {
    //         $.ajax({
    //             type: "POST",
    //             url: "http://localhost:8082/work-lounge/delete",
    //             data: {rndPlanNo: rndPlanNo},
    //             success: function (response) {
    //
    //                 alert("삭제되었습니다.");
    //
    //                 location.reload();
    //             },
    //             error: function () {
    //                 alert("삭제 실패. 다시 시도해 주세요.");
    //             }
    //         });
    //     }
    // }

    function deleteBoard(rndPlanNo) {
        Swal.fire({
            title: '정말로 이 계획서를 삭제하시겠습니까?',
            text: '삭제한 데이터는 복구할 수 없습니다.',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: '삭제',
            cancelButtonText: '취소',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {

                $.ajax({
                    type: "POST",
                    url: "http://localhost:8082/work-lounge/delete",
                    data: { rndPlanNo: rndPlanNo },
                    success: function (response) {

                        Swal.fire({
                            icon: 'success',
                            title: '삭제되었습니다.',
                            text: '계획서가 성공적으로 삭제되었습니다.',
                            confirmButtonText: '확인'
                        }).then(() => {
                            location.reload();
                        });
                    },
                    error: function () {

                        Swal.fire({
                            icon: 'error',
                            title: '삭제 실패',
                            text: '삭제에 실패했습니다. 다시 시도해 주세요.',
                            confirmButtonText: '확인'
                        });
                    }
                });
            }
        });

    }
</script>

</body>
</html>