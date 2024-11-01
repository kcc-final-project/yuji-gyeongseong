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
</head>
<body>
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
                <td>평가상태</td>
                <td>과제명</td>
                <td>계획서</td>
                <td>주관연구기관</td>
                <td>연구책임자</td>
                <td>평가시작일자</td>
                <td>평가종료일자</td>
            </tr>
            <c:if test="${not empty sharingOpinionList}">
                <tr class="blue letter">
                    <td class="text-center"><c:out value="${sharingOpinionList[0].evalStatus}"/></td>
                    <td class="text-center"><c:out value="${sharingOpinionList[0].taskName}"/></td>
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
                        <%--                        <div style="max-height: 400px; overflow-y: auto;">--%>
                        <%--                            <div class="card mb-2" style="max-height: 400px; overflow-y: auto;">--%>
                        <%--                                <div class="card-body d-flex flex-column justify-content-between"--%>
                        <%--                                     style="padding: 15px;">--%>
                        <%--                                     <div id="textArea"></div>--%>
                        <%--                                    <div class="d-flex justify-content-between">--%>
                        <%--                                        <div>--%>
                        <%--                                            <strong>익명의 평가위원1:</strong>--%>
                        <%--                                        </div>--%>
                        <%--                                        <span>2023-11-23 14:32</span>--%>
                        <%--                                    </div>--%>
                        <%--                                    <br>--%>
                        <%--                                    <p class="card-text my-0" style="font-size: large">여기 게시글 내용이 나옵니다.</p>--%>
                        <%--                                    <div class="d-flex justify-content-end">--%>
                        <%--                                        <button class="btn ctm-btn-bigger" type="button" onclick="toggleComments(this)">--%>
                        <%--                                            댓글보기--%>
                        <%--                                        </button>--%>
                        <%--                                    </div>--%>
                        <%--                                </div>--%>

                        <%--                                <div class="comments-section card mx-2 my-2" style="display: none;">--%>
                        <%--                                    <div class="card card-body mx-2 mt-2 mb-2 gray">--%>
                        <%--                                        <div class="mb-3">--%>
                        <%--                                            <p>--%>
                        <%--                                                <strong>익명의 평가위원1:</strong> <span--%>
                        <%--                                                    style="float: right;">2023-11-23 14:32</span>--%>
                        <%--                                            </p>--%>
                        <%--                                            <p>추가자료_제출본.pdf--%>
                        <%--                                                <button class="btn ctm-btn-back mb-3" style="float: right;">삭제</button>--%>
                        <%--                                            </p>--%>
                        <%--                                        </div>--%>
                        <%--                                    </div>--%>
                        <%--                                    <div class="card card-body mx-2 mt-2 mb-2 gray">--%>
                        <%--                                        <div class="mb-3">--%>
                        <%--                                            <p>--%>
                        <%--                                                <strong>익명의 평가위원2:</strong> 두 번째 댓글 내용이 여기에 나옵니다.--%>
                        <%--                                            </p>--%>
                        <%--                                        </div>--%>
                        <%--                                    </div>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>

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
                                <hr>
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
                    <td class="text-center bluee pb-1 letter1" colspan="2"><c:out
                            value="${committeePerson.evalName}"/></td>
                </c:forEach>
            </tr>
            <tr>
                <td colspan="6">
<%--                    <div class="d-flex align-items-center">--%>
<%--                        <p class="ms-2"><b>[익명의 평가위원1]</b>에 대한 답글작성</p>--%>
<%--                        <div class="col-1"></div>--%>
<%--                        <div class="col-6"></div>--%>
<%--                        <button class="btn ctm-btn-bigger file_btn ms-2 mb-1" id="newButton">첨부파일</button>--%>
<%--                    </div>--%>

                    <div class="d-flex mb-1" id="contentWrapper">
                        <div class="w-100 p-2 bg-light border rounded text_area_div" id="textareaDiv">

                            <div class="form-group w-100 mt-3">
                                <label for="postContent" class="font-weight-bold"><b>&nbsp;내용</b></label>
                                <textarea class="form-control content_area" id="postContent" rows="3"
                                          placeholder="게시글의 내용을 입력해주세요."></textarea>
                            </div>
                        </div>

                        <div class="ms-2 mt-3 d-none w-50 uploadDiv_area" id="uploadDiv">
                            <div class="mt-5 bg-light border rounded p-3">
                                <div class="uploadDiv w-100 p-3 h-100">
                                    <input type="file" name="uploadFile" class="form-control" multiple>
                                </div>
                                <div class='uploadResult mb-3'>
                                    <ul class="list-unstyled">
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
                <td colspan="1">
                    <div class="d-flex justify-content-center align-items-center flex-row mt-5 p-4">
                        <button id="uploadBtn" class="btn ml-2 ctm-btn-small">
                            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                                 fill="#5f6368">
                                <path d="M720-330q0 104-73 177T470-80q-104 0-177-73t-73-177v-370q0-75 52.5-127.5T400-880q75 0 127.5 52.5T580-700v350q0 46-32 78t-78 32q-46 0-78-32t-32-78v-370h80v370q0 13 8.5 21.5T470-320q13 0 21.5-8.5T500-350v-350q-1-42-29.5-71T400-800q-42 0-71 29t-29 71v370q-1 71 49 120.5T470-160q70 0 119-49.5T640-330v-390h80v390Z"/>
                            </svg>
                        </button>
                        &nbsp;&nbsp;
                        <button id="submitBtn" class="btn ml-2 ctm-btn-normal submit_btn">등록</button>
                    </div>
                </td>
            </tr>

            </tbody>
        </table>

    </div>

    <!-- 댓글 작성 모달 구조 -->
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
                            <label for="recipient-name" class="col-form-label">작성자:</label>
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
                        opinions += '<div class="opinion-card ' + (item.depth > 0 ? 'nested' : '') + '">' +
                            '<div class="opinion-content">' +
                            (item.depth > 0 ? '&nbsp;&nbsp;' + 'ㄴ' : '') +
                            item.content +
                            '</div>' +
                            '<div class="opinion-meta text-center">' +
                            '<span>작성자: ' + item.memNo + '</span>' +
                            '<span>작성일: ' + (item.delInfo !== -1 ? item.createdAt.split(' ')[0] : 'unknown') + '</span>' +
                            '<span>조회수: ' + item.readhit + '</span>' +
                            '<button type="button" class="btn ml-2 ctm-btn-normal submit_btn" data-bs-toggle="modal" data-bs-target="#commentModal" data-id="' + item.opinionNo + '">' +
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
                var writerName = $(this).siblings('span').first().text().replace('작성자: ', '');
                $('#recipient-name').val(writerName);

                $('#submitComment').off('click').on('click', function () {
                    var comment = $('#message-text').val();
                    var summaryUrl = 'http://localhost:8082/api/v1/work_lounge/summary-id/' + opinionId;

                    $.ajax({
                        url: summaryUrl,
                        method: 'POST',
                        data: { content: comment },
                        success: function (response) {

                            $('#commentModal').modal('hide');
                            $('#message-text').val('');

                            location.reload();
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.error('Error posting comment:', textStatus, errorThrown);
                        }
                    });
                });
            });
        });



    </script>


</div>
</body>

</html>