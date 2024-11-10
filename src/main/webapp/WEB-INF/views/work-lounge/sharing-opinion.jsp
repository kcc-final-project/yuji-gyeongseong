<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-noheader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>의견공유</title>
    <link rel="stylesheet" href="/resources/css/work-lounge/sharing-opinion.css"/>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>
    <link
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            rel="stylesheet"
    />

    <!-- SweetAlert2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body style="height: auto;">
<div class="common-header">
    <div class="container d-flex h-100 pe-0">
        <div
                class="row row-cols-2 justify-content-between align-items-center w-100"
        >
            <div class="col-3 d-flex align-items-center ps-5 h-100"></div>
            <div class="col-3 d-flex align-items-center ps-5 h-100">
                <h2><b>의견공유</b></h2>
            </div>
            <div class="col-3 d-flex align-items-center ps-5 h-100"></div>
        </div>
    </div>
</div>

<div class="common-main">
    <hr/>
    <div class="mt-4">
        <table class="table table-bordered">
            <tbody>
            <tr class="text-center domain">
<%--                <td>평가상태</td>--%>
                <td colspan="2">과제명</td>
                <td>계획서</td>
                <td>주관연구기관</td>
                <td>연구책임자</td>
                <td>평가시작일자</td>
                <td>평가종료일자</td>
            </tr>
            <c:if test="${not empty sharingOpinionList}">
                <tr class="blue letter">
<%--                    <td class="text-center"><c:out value="${sharingOpinionList[0].evalStatus}"/></td>--%>
                    <td colspan="2" class="text-center"><c:out value="${sharingOpinionList[0].taskName}"/></td>
                    <td class="text-center">
                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                             fill="#EA3323">
                            <path d="M360-460h40v-80h40q17 0 28.5-11.5T480-580v-40q0-17-11.5-28.5T440-660h-80v200Zm40-120v-40h40v40h-40Zm120 120h80q17 0 28.5-11.5T640-500v-120q0-17-11.5-28.5T600-660h-80v200Zm40-40v-120h40v120h-40Zm120 40h40v-80h40v-40h-40v-40h40v-40h-80v200ZM320-240q-33 0-56.5-23.5T240-320v-480q0-33 23.5-56.5T320-880h480q33 0 56.5 23.5T880-800v480q0 33-23.5 56.5T800-240H320Zm0-80h480v-480H320v480ZM160-80q-33 0-56.5-23.5T80-160v-560h80v560h560v80H160Zm160-720v480-480Z"/>
                        </svg>
                    </td>
                    <td class="text-center"><c:out value="${sharingOpinionList[0].rndInstitution}"/></td>
                    <td class="text-center"><c:out value="${sharingOpinionList[0].rndName}"/></td>
                    <td class="text-center"><c:out value="${sharingOpinionList[0].evalStartedAt}"/></td>
                    <td class="text-center"><c:out value="${sharingOpinionList[0].evalClosedAt}"/></td>
                </tr>
            </c:if>


            <tr>
                <td rowspan="7" colspan="6">
                    <div style="max-height: 540px; overflow-y: auto;">
                        <div class="alert alert-info text-center purplealert mt-2" role="alert">
                            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                                 fill="#9977fa">
                                <path d="M480-280q17 0 28.5-11.5T520-320q0-17-11.5-28.5T480-360q-17 0-28.5 11.5T440-320q0 17 11.5 28.5T480-280Zm-40-160h80v-240h-80v240Zm40 360q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q134 0 227-93t93-227q0-134-93-227t-227-93q-134 0-227 93t-93 227q0 134 93 227t227 93Zm0-320Z"/>
                            </svg>
                            <strong>담당자 알림:</strong> 이는 모든 사용자에게 중요한 알림입니다. 입장시 한번씩 확인 부탁드립니다.
                        </div>

                        <!-- 의견 -->
                        <div style="max-height: 400px; overflow-y: auto;">


                            <div id="textArea" style="max-height: 400px; overflow-y: auto;"></div>


                        </div>

                        <script>
                            function toggleComments(button) {
                                const commentsSection = button.closest('.card').querySelector('.comments-section');
                                if (commentsSection.style.display === "none") {
                                    commentsSection.style.display = "block";
                                    button.textContent = "댓글 숨기기";
                                } else {
                                    commentsSection.style.display = "none";
                                    button.textContent = "댓글보기";
                                }
                            }
                        </script>


                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="1" class="text-center">
                    <div style="max-height: 400px; overflow-y: auto;">
                        <c:forEach items="${committeePersonList}" var="committeePerson" varStatus="status">
                        <div>
                            <p class="letter1"><c:out value="${committeePerson.evalPeople}"/>
                                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960"
                                     width="24px" fill="#327b3e">
                                    <path d="m424-296 282-282-56-56-226 226-114-114-56 56 170 170Zm56 216q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q134 0 227-93t93-227q0-134-93-227t-227-93q-134 0-227 93t-93 227q0 134 93 227t227 93Zm0-320Z"/>
                                </svg>

                            </p>
                            <div class="custom-divider">
                            </div>
                            </c:forEach>
                        </div>
                </td>
            </tr>
            <tr>

            </tr>
            <tr>

            </tr>
            <tr>

            </tr>
            <tr>

            </tr>
            <tr style="height: 25px; text-align: center; justify-items: center">
                <c:forEach items="${committeePersonList}" var="committeePerson" varStatus="status">
                    <td class="text-center bluee letter" colspan="2" style="margin: auto"><c:out
                            value="${committeePerson.evalName}"/></td>
                </c:forEach>
            </tr>
            <tr>
                <td colspan="7">
                    <div class="d-flex justify-content-between align-items-center">
                        <div style="width: 90%">
                            <div class="form-group">
                                <label for="postContent" class="font-weight-bold"><b>&nbsp;내용</b></label>
                                <textarea class="form-control content_area" id="postContent" rows="3"
                                          placeholder="게시글의 내용을 입력해주세요."></textarea>
                            </div>
                        </div>
                        <div class="w-10 d-flex flex-column align-items-end mt-3">
                            <button id="uploadBtn" class="btn ctm-btn-small mb-2" style="background-color: #eaecef;">
                                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960"
                                     width="24px" fill="#5f6368">
                                    <path d="M720-330q0 104-73 177T470-80q-104 0-177-73t-73-177v-370q0-75 52.5-127.5T400-880q75 0 127.5 52.5T580-700v350q0 46-32 78t-78 32q-46 0-78-32t-32-78v-370h80v370q0 13 8.5 21.5T470-320q13 0 21.5-8.5T500-350v-350q-1-42-29.5-71T400-800q-42 0-71 29t-29 71v370q-1 71 49 120.5T470-160q70 0 119-49.5T640-330v-390h80v390Z"/>
                                </svg>
                            </button>
                            <c:if test="${not empty sharingOpinionList}">
                                <button id="submitBtn1" class="btn btn-back-indigo" style="width: 90px"
                                        data-id="${sharingOpinionList[0].rndPlanNo}">등록
                                </button>
                            </c:if>
                        </div>
                    </div>
                </td>

                </td>

            </tr>

            </tbody>
        </table>

    </div>

    <div class="modal fade" id="commentModal" tabindex="-1" aria-labelledby="commentModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="commentModalLabel">댓글 작성</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="commentForm">
                        <div class="mb-3">
                            <label for="recipient-name" class="col-form-label">의견번호:</label>
                            <input type="text" class="form-control" id="recipient-name" disabled>
                        </div>
                        <div class="mb-3">
                            <label for="message-text" class="col-form-label">댓글 내용:</label>
                            <textarea class="form-control" id="message-text" placeholder="댓글을 입력하세요"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn ml-2 ctm-btn-normal submit_btn" id="submitComment">작성</button>
                </div>
            </div>
        </div>
    </div>


    <script src="/resources/js/work-lounge/sharing-opinion.js"></script>

    <script>
        $(document).ready(function () {
            $.ajax({
                url: 'http://localhost:8082/api/v1/work_lounge/opinion',
                method: 'GET',
                success: function (data) {

                    var opinions = '<div class="mt-4"><div class="opinions-container">';
                    $.each(data, function (index, item) {
                        opinions += '<div class="flex opinion-card ' + (item.depth > 0 ? 'nested' : '') + '">' +
                            '<div class="d-flex justify-content-between">' +
                            '<span class="d-flex align-items-center">' +
                            '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#999999">' +
                            '<path d="M0-240v-63q0-43 44-70t116-27q13 0 25 .5t23 2.5q-14 21-21 44t-7 48v65H0Zm240 0v-65q0-32 17.5-58.5T307-410q32-20 76.5-30t96.5-10q53 0 97.5 10t76.5 30q32 20 49 46.5t17 58.5v65H240Zm540 0v-65q0-26-6.5-49T754-397q11-2 22.5-2.5t23.5-.5q72 0 116 26.5t44 70.5v63H780Zm-455-80h311q-10-20-55.5-35T480-370q-55 0-100.5 15T325-320ZM160-440q-33 0-56.5-23.5T80-520q0-34 23.5-57t56.5-23q34 0 57 23t23 57q0 33-23 56.5T160-440Zm640 0q-33 0-56.5-23.5T720-520q0-34 23.5-57t56.5-23q34 0 57 23t23 57q0 33-23 56.5T800-440Zm-320-40q-50 0-85-35t-35-85q0-51 35-85.5t85-34.5q51 0 85.5 34.5T600-600q0 50-34.5 85T480-480Zm0-80q17 0 28.5-11.5T520-600q0-17-11.5-28.5T480-640q-17 0-28.5 11.5T440-600q0 17 11.5 28.5T480-560Zm1 240Zm-1-280Z"/>' +
                            '</svg>' +
                            '<span style="margin-left: 10px;">' + item.memName + '</span>' +
                            '</span>' +
                            '<span class="text-end" style="margin-right: 10px">' + (item.delInfo !== -1 ? item.createdAt.split(' ')[0] : 'unknown') + '</span>' +
                            '</div>' +
                            '<div class="opinion-content d-flex justify-content-between p-2">' +
                            (item.depth > 0 ? '&nbsp;&nbsp;' : '') +
                            item.content +
                            '<button type="button" class="btn btn-back-indigo submit_btn" data-bs-toggle="modal" data-bs-target="#commentModal" data-id="' + item.opinionNo + '">' +
                            '댓글 작성' +
                            '</button>' +
                            '</div>' +
                            '</div>';


                    });

                    opinions += '</div></div>';
                    $('#textArea').html(opinions);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.error('Error fetching data:', textStatus, errorThrown);
                    $('#textArea').html('<p>Failed to load data.</p>');
                }
            });

            $(document).on('click', '.submit_btn', function () {
                var opinionId = $(this).data('id');
                var writerName = $(this).data('id');
                $('#recipient-name').val(writerName);

                $('#submitComment').off('click').on('click', function () {
                    var comment = $('#message-text').val();

                    // var summaryUrl = 'http://localhost:8082/api/v1/work_lounge/summary-id/' + opinionId;
                    var summaryUrl = 'http://localhost:8082/api/v1/work_lounge/post/' + opinionId;

                    $.ajax({
                        url: summaryUrl,
                        method: 'POST',
                        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',  // 데이터를 URL 인코딩 형식으로 전송
                        data: {
                            ref: opinionId,
                            content: comment
                        },
                        success: function (response) {
                            console.log(opinionId)
                            console.log(comment)
                            // SweetAlert로 성공 메시지 표시
                            Swal.fire({
                                icon: 'success',  // 성공 아이콘
                                title: '성공',
                                text: '댓글이 성공적으로 작성되었습니다.',  // 성공 메시지
                                confirmButtonText: '확인'  // 버튼 텍스트
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    $('#commentModal').modal('hide');  // 모달 창 닫기
                                    $('#message-text').val('');  // 입력 필드 비우기
                                    $('#recipient-name').val('');  // 작성자 이름 비우기
                                    location.reload();  // 페이지 새로 고침
                                }
                            });
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.error('댓글 작성 오류:', textStatus, errorThrown);

                            // SweetAlert로 오류 메시지 표시
                            Swal.fire({
                                icon: 'error',  // 오류 아이콘
                                title: '오류',
                                text: '댓글 작성 중 오류가 발생했습니다.',  // 오류 메시지
                                confirmButtonText: '확인'  // 버튼 텍스트
                            });
                        }
                    });

                });
            });


        });


        // 게시글
        // $(document).ready(function () {
        //     // 등록 버튼 클릭 이벤트 리스너
        //     $('#submitBtn1').on('click', function () {
        //         var content = $('#postContent').val(); // textarea의 내용을 가져옵니다
        //         var opinionId = $(this).data('id'); // 버튼에 data-id 속성이 설정되어 있어야 합니다
        //
        //         // 내용이 비어있는지 확인
        //         if (!content.trim()) {
        //             // alert('내용을 입력해주세요.');
        //             Swal.fire({
        //                 icon: 'info',  // 정보 아이콘
        //                 title: '알림',
        //                 text: '내용을 입력해주세요.',
        //                 confirmButtonText: '확인'
        //             });
        //
        //             return;
        //         }
        //
        //         // AJAX 요청 전송
        //         $.ajax({
        //             // url: 'http://localhost:8082/api/v1/work_lounge/post/' + opinionId,
        //             url: 'http://localhost:8082/api/v1/work_lounge/summary-id/' + opinionId,
        //             method: 'POST',
        //             data: {content: content},
        //             success: function (response) {
        //                 alert('게시글이 성공적으로 저장되었습니다.');
        //                 $('#postContent').val(''); // textarea 비우기
        //                 location.reload(); // 페이지 새로 고침
        //             },
        //             error: function (jqXHR, textStatus, errorThrown) {
        //                 console.error('게시글 저장 중 오류 발생:', textStatus, errorThrown);
        //                 alert('게시글 저장에 실패했습니다.');
        //             }
        //         });
        //     });
        // });

        $(document).ready(function () {
            // 등록 버튼 클릭 이벤트 리스너
            $('#submitBtn1').on('click', function () {
                var content = $('#postContent').val(); // textarea의 내용을 가져옵니다
                var opinionId = $(this).data('id'); // 버튼에 data-id 속성이 설정되어 있어야 합니다

                // 내용이 비어있는지 확인
                if (!content.trim()) {
                    // SweetAlert로 알림 표시
                    Swal.fire({
                        icon: 'info',  // 아이콘 타입 (정보 아이콘)
                        title: '알림',
                        text: '내용을 입력해주세요.',  // 알림 메시지
                        confirmButtonText: '확인'  // 버튼 텍스트
                    });

                    return;
                }

                // AJAX 요청 전송
                $.ajax({
                    // url: 'http://localhost:8082/api/v1/work_lounge/post/' + opinionId,
                    url: 'http://localhost:8082/api/v1/work_lounge/summary-id/' + opinionId,
                    method: 'POST',
                    data: {content: content},
                    success: function (response) {
                        // SweetAlert로 성공 메시지 표시
                        Swal.fire({
                            icon: 'success',  // 성공 아이콘
                            title: '성공',
                            text: '게시글이 성공적으로 저장되었습니다.',  // 성공 메시지
                            confirmButtonText: '확인'  // 버튼 텍스트
                        }).then((result) => {
                            // '확인' 버튼을 클릭했을 때만 페이지 새로 고침
                            if (result.isConfirmed) {
                                $('#postContent').val(''); // textarea 비우기
                                location.reload(); // 페이지 새로 고침
                            }
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.error('게시글 저장 중 오류 발생:', textStatus, errorThrown);

                        // SweetAlert로 실패 메시지 표시
                        Swal.fire({
                            icon: 'error',  // 오류 아이콘
                            title: '오류',
                            text: '게시글 저장에 실패했습니다.',  // 오류 메시지
                            confirmButtonText: '확인'  // 버튼 텍스트
                        });
                    }
                });
            });
        });



    </script>


</div>
</body>

</html>