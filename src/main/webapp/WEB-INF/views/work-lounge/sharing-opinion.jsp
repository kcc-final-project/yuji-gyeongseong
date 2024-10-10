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
            <tr class="blue">
                <td class="text-center">평가진행중</td>
                <td class="text-center">경수형 SMR 사고해석 ooo 계획서 보고안</td>
                <td class="text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                         fill="#EA3323">
                        <path d="M360-460h40v-80h40q17 0 28.5-11.5T480-580v-40q0-17-11.5-28.5T440-660h-80v200Zm40-120v-40h40v40h-40Zm120 120h80q17 0 28.5-11.5T640-500v-120q0-17-11.5-28.5T600-660h-80v200Zm40-40v-120h40v120h-40Zm120 40h40v-80h40v-40h-40v-40h40v-40h-80v200ZM320-240q-33 0-56.5-23.5T240-320v-480q0-33 23.5-56.5T320-880h480q33 0 56.5 23.5T880-800v480q0 33-23.5 56.5T800-240H320Zm0-80h480v-480H320v480ZM160-80q-33 0-56.5-23.5T80-160v-560h80v560h560v80H160Zm160-720v480-480Z"/>
                    </svg>
                </td>
                <td class="text-center">강남대학교</td>
                <td class="text-center">홍길동</td>
                <td class="text-center">2024-10-18</td>
                <td class="text-center">2024-10-20</td>
            </tr>

            <tr>
                <td rowspan="7" colspan="5">
                    <div class="alert alert-info text-center purplealert mt-2" role="alert">
                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"
                             fill="#9977fa">
                            <path d="M480-280q17 0 28.5-11.5T520-320q0-17-11.5-28.5T480-360q-17 0-28.5 11.5T440-320q0 17 11.5 28.5T480-280Zm-40-160h80v-240h-80v240Zm40 360q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q134 0 227-93t93-227q0-134-93-227t-227-93q-134 0-227 93t-93 227q0 134 93 227t227 93Zm0-320Z"/>
                        </svg>
                        <strong>담당자 알림:</strong> 이는 모든 사용자에게 중요한 알림입니다. 입장시 한번씩 확인 부탁드립니다.
                    </div>
                    <div style="max-height: 400px; overflow-y: auto;">
                        <div class="card mb-2" style="max-height: 400px; overflow-y: auto;">
                            <div class="card-body d-flex flex-column justify-content-between">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960"
                                             width="24px" fill="#5f6368">
                                            <path d="M0-240v-63q0-43 44-70t116-27q13 0 25 .5t23 2.5q-14 21-21 44t-7 48v65H0Zm240 0v-65q0-32 17.5-58.5T307-410q32-20 76.5-30t96.5-10q53 0 97.5 10t76.5 30q32 20 49 46.5t17 58.5v65H240Zm540 0v-65q0-26-6.5-49T754-397q11-2 22.5-2.5t23.5-.5q72 0 116 26.5t44 70.5v63H780Zm-455-80h311q-10-20-55.5-35T480-370q-55 0-100.5 15T325-320ZM160-440q-33 0-56.5-23.5T80-520q0-34 23.5-57t56.5-23q34 0 57 23t23 57q0 33-23 56.5T160-440Zm640 0q-33 0-56.5-23.5T720-520q0-34 23.5-57t56.5-23q34 0 57 23t23 57q0 33-23 56.5T800-440Zm-320-40q-50 0-85-35t-35-85q0-51 35-85.5t85-34.5q51 0 85.5 34.5T600-600q0 50-34.5 85T480-480Zm0-80q17 0 28.5-11.5T520-600q0-17-11.5-28.5T480-640q-17 0-28.5 11.5T440-600q0 17 11.5 28.5T480-560Zm1 240Zm-1-280Z"/>
                                        </svg>
                                        <strong>익명의 평가위원1:</strong>
                                    </div>
                                    <span>2023-11-23 14:32</span>
                                </div>
                                <br>
                                <h4 class="card-text">여기 게시글 내용이 나옵니다.</h4>
                                <div class="d-flex justify-content-end">
                                    <button class="btn ctm-btn-normal me-2" type="button" data-toggle="collapse"
                                            data-target="#commentsSection1" aria-expanded="false"
                                            aria-controls="commentsSection1">
                                        대댓글
                                    </button>
                                    <button class="btn ctm-btn-bigger" type="button" data-toggle="collapse"
                                            data-target="#commentsSection" aria-expanded="false"
                                            aria-controls="commentsSection">
                                        댓글보기
                                    </button>
                                </div>
                            </div>

                            <div class="collapse" id="commentsSection">
                                <div class="card card-body mx-3 mt-2 mb-2 gray">
                                    <div class="mb-3">
                                        <p>
                                            <svg xmlns="http://www.w3.org/2000/svg" height="24px"
                                                 viewBox="0 -960 960 960" width="24px" fill="#5f6368">
                                                <path d="M0-240v-63q0-43 44-70t116-27q13 0 25 .5t23 2.5q-14 21-21 44t-7 48v65H0Zm240 0v-65q0-32 17.5-58.5T307-410q32-20 76.5-30t96.5-10q53 0 97.5 10t76.5 30q32 20 49 46.5t17 58.5v65H240Zm540 0v-65q0-26-6.5-49T754-397q11-2 22.5-2.5t23.5-.5q72 0 116 26.5t44 70.5v63H780Zm-455-80h311q-10-20-55.5-35T480-370q-55 0-100.5 15T325-320ZM160-440q-33 0-56.5-23.5T80-520q0-34 23.5-57t56.5-23q34 0 57 23t23 57q0 33-23 56.5T160-440Zm640 0q-33 0-56.5-23.5T720-520q0-34 23.5-57t56.5-23q34 0 57 23t23 57q0 33-23 56.5T800-440Zm-320-40q-50 0-85-35t-35-85q0-51 35-85.5t85-34.5q51 0 85.5 34.5T600-600q0 50-34.5 85T480-480Zm0-80q17 0 28.5-11.5T520-600q0-17-11.5-28.5T480-640q-17 0-28.5 11.5T440-600q0 17 11.5 28.5T480-560Zm1 240Zm-1-280Z"/>
                                            </svg>
                                            &nbsp;
                                            <strong>익명의 평가위원1:</strong> <span
                                                style="float: right;">2023-11-23 14:32</span>
                                        </p>

                                        <p>
                                            추가자료_제출본.pdf
                                            <button class="btn ctm-btn-back mb-3" style="float: right; display: block;">
                                                삭제
                                            </button>
                                        </p>
                                        <div class="ml-4">

                                            <p class="d-flex" style="width :100%;">
                                                <svg xmlns="http://www.w3.org/2000/svg" height="24px"
                                                     viewBox="0 -960 960 960" width="24px" fill="#5f6368">
                                                    <path d="M234-276q51-39 114-61.5T480-360q69 0 132 22.5T726-276q35-41 54.5-93T800-480q0-133-93.5-226.5T480-800q-133 0-226.5 93.5T160-480q0 59 19.5 111t54.5 93Zm246-164q-59 0-99.5-40.5T340-580q0-59 40.5-99.5T480-720q59 0 99.5 40.5T620-580q0 59-40.5 99.5T480-440Zm0 360q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q53 0 100-15.5t86-44.5q-39-29-86-44.5T480-280q-53 0-100 15.5T294-220q39 29 86 44.5T480-160Zm0-360q26 0 43-17t17-43q0-26-17-43t-43-17q-26 0-43 17t-17 43q0 26 17 43t43 17Zm0-60Zm0 360Z"/>
                                                </svg>
                                                &nbsp;
                                                <strong>연구책임자의 댓글1-1:</strong> <span style="margin-left: auto;">2023-11-23 14:32</span>
                                            </p>

                                            <p>첫 번째 댓글에 대한 댓글이 여기에 나옵니다.
                                                <button class="btn ctm-btn-back mb-3" style="float: right;">삭제</button>
                                            </p>

                                            <div class="ml-4">
                                                <p class="d-flex" style="width :100%;">
                                                    <svg xmlns="http://www.w3.org/2000/svg" height="24px"
                                                         viewBox="0 -960 960 960" width="24px" fill="#5f6368">
                                                        <path d="M0-240v-63q0-43 44-70t116-27q13 0 25 .5t23 2.5q-14 21-21 44t-7 48v65H0Zm240 0v-65q0-32 17.5-58.5T307-410q32-20 76.5-30t96.5-10q53 0 97.5 10t76.5 30q32 20 49 46.5t17 58.5v65H240Zm540 0v-65q0-26-6.5-49T754-397q11-2 22.5-2.5t23.5-.5q72 0 116 26.5t44 70.5v63H780Zm-455-80h311q-10-20-55.5-35T480-370q-55 0-100.5 15T325-320ZM160-440q-33 0-56.5-23.5T80-520q0-34 23.5-57t56.5-23q34 0 57 23t23 57q0 33-23 56.5T160-440Zm640 0q-33 0-56.5-23.5T720-520q0-34 23.5-57t56.5-23q34 0 57 23t23 57q0 33-23 56.5T800-440Zm-320-40q-50 0-85-35t-35-85q0-51 35-85.5t85-34.5q51 0 85.5 34.5T600-600q0 50-34.5 85T480-480Zm0-80q17 0 28.5-11.5T520-600q0-17-11.5-28.5T480-640q-17 0-28.5 11.5T440-600q0 17 11.5 28.5T480-560Zm1 240Zm-1-280Z"/>
                                                    </svg>
                                                    &nbsp;
                                                    <strong>익명의 평가위원의 댓글1-1-1:</strong> <span
                                                        style="margin-left: auto;">2023-11-23 14:32</span>
                                                </p>

                                                <p>댓글에 대한 댓글의 댓글이
                                                    여기에 나옵니다.
                                                    <button class="btn ctm-btn-back mb-3" style="float: right;">삭제
                                                    </button>
                                                </p>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card card-body mx-3 mt-2 mb-2 gray">

                                    <div class="mb-3">
                                        <p>
                                            <svg xmlns="http://www.w3.org/2000/svg" height="24px"
                                                 viewBox="0 -960 960 960" width="24px" fill="#5f6368">
                                                <path d="M0-240v-63q0-43 44-70t116-27q13 0 25 .5t23 2.5q-14 21-21 44t-7 48v65H0Zm240 0v-65q0-32 17.5-58.5T307-410q32-20 76.5-30t96.5-10q53 0 97.5 10t76.5 30q32 20 49 46.5t17 58.5v65H240Zm540 0v-65q0-26-6.5-49T754-397q11-2 22.5-2.5t23.5-.5q72 0 116 26.5t44 70.5v63H780Zm-455-80h311q-10-20-55.5-35T480-370q-55 0-100.5 15T325-320ZM160-440q-33 0-56.5-23.5T80-520q0-34 23.5-57t56.5-23q34 0 57 23t23 57q0 33-23 56.5T160-440Zm640 0q-33 0-56.5-23.5T720-520q0-34 23.5-57t56.5-23q34 0 57 23t23 57q0 33-23 56.5T800-440Zm-320-40q-50 0-85-35t-35-85q0-51 35-85.5t85-34.5q51 0 85.5 34.5T600-600q0 50-34.5 85T480-480Zm0-80q17 0 28.5-11.5T520-600q0-17-11.5-28.5T480-640q-17 0-28.5 11.5T440-600q0 17 11.5 28.5T480-560Zm1 240Zm-1-280Z"/>
                                            </svg>
                                            &nbsp;
                                            <strong>익명의 평가위원의 댓글2:</strong> 두 번째 댓글 내용이 여기에
                                            나옵니다.
                                        </p>
                                        <div class="ml-4">
                                            <p>
                                                <svg xmlns="http://www.w3.org/2000/svg" height="24px"
                                                     viewBox="0 -960 960 960" width="24px" fill="#5f6368">
                                                    <path d="M234-276q51-39 114-61.5T480-360q69 0 132 22.5T726-276q35-41 54.5-93T800-480q0-133-93.5-226.5T480-800q-133 0-226.5 93.5T160-480q0 59 19.5 111t54.5 93Zm246-164q-59 0-99.5-40.5T340-580q0-59 40.5-99.5T480-720q59 0 99.5 40.5T620-580q0 59-40.5 99.5T480-440Zm0 360q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q53 0 100-15.5t86-44.5q-39-29-86-44.5T480-280q-53 0-100 15.5T294-220q39 29 86 44.5T480-160Zm0-360q26 0 43-17t17-43q0-26-17-43t-43-17q-26 0-43 17t-17 43q0 26 17 43t43 17Zm0-60Zm0 360Z"/>
                                                </svg>
                                                &nbsp;
                                                <strong>연구책임자의 댓글2-1:</strong> 두 번째 댓글에 대한 댓글이
                                                여기에 나옵니다.
                                            </p>
                                            <div class="ml-4">
                                                <p>
                                                    <svg xmlns="http://www.w3.org/2000/svg" height="24px"
                                                         viewBox="0 -960 960 960" width="24px" fill="#5f6368">
                                                        <path d="M0-240v-63q0-43 44-70t116-27q13 0 25 .5t23 2.5q-14 21-21 44t-7 48v65H0Zm240 0v-65q0-32 17.5-58.5T307-410q32-20 76.5-30t96.5-10q53 0 97.5 10t76.5 30q32 20 49 46.5t17 58.5v65H240Zm540 0v-65q0-26-6.5-49T754-397q11-2 22.5-2.5t23.5-.5q72 0 116 26.5t44 70.5v63H780Zm-455-80h311q-10-20-55.5-35T480-370q-55 0-100.5 15T325-320ZM160-440q-33 0-56.5-23.5T80-520q0-34 23.5-57t56.5-23q34 0 57 23t23 57q0 33-23 56.5T160-440Zm640 0q-33 0-56.5-23.5T720-520q0-34 23.5-57t56.5-23q34 0 57 23t23 57q0 33-23 56.5T800-440Zm-320-40q-50 0-85-35t-35-85q0-51 35-85.5t85-34.5q51 0 85.5 34.5T600-600q0 50-34.5 85T480-480Zm0-80q17 0 28.5-11.5T520-600q0-17-11.5-28.5T480-640q-17 0-28.5 11.5T440-600q0 17 11.5 28.5T480-560Zm1 240Zm-1-280Z"/>
                                                    </svg>
                                                    &nbsp;
                                                    <strong>익명의 평가위원의 댓글2-1-1:</strong> 댓글에 대한 댓글의 댓글이
                                                    여기에 나옵니다.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="collapse p-2" id="commentsSection1">
                                <div class="card card-body">
                                    <div class="d-flex align-items-center">
                                        <p class="ms-2"><b>[익명의 평가위원1]</b>에 대한 답글작성</p>
                                        <div class="col-5"></div>
                                        <button class="btn ctm-btn-bigger file_btn ms-2 mb-1" id="newButton1">첨부파일
                                        </button>
                                    </div>

                                    <div class="mb-3">
                                        <div class="d-flex mb-1" id="contentWrapper1">

                                            <div class="w-100 p-2 bg-light border rounded text_area_div"
                                                 id="textareaDiv1">

                                                <div class="form-group w-100 mt-3">
                                                    <label for="postContent"
                                                           class="font-weight-bold"><b>&nbsp;내용</b></label>
                                                    <textarea class="form-control content_area" id="postContent1"
                                                              rows="3"
                                                              placeholder="게시글의 내용을 입력해주세요."></textarea>
                                                </div>
                                            </div>

                                            <div class="ms-2 mt-3 d-none w-50 uploadDiv_area" id="uploadDiv1">
                                                <div class="mt-5 bg-light border rounded p-3">
                                                    <div class="uploadDiv w-100 p-3 h-100">
                                                        <input type="file" name="uploadFile" class="form-control"
                                                               multiple>
                                                    </div>

                                                    <div class='uploadResult mb-3'>
                                                        <ul class="list-unstyled">
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="d-flex justify-content-center align-items-center flex-row mt-1 p-1">
                                            <button id="uploadBtn1" class="btn ml-2 ctm-btn-small">
                                                <svg xmlns="http://www.w3.org/2000/svg" height="24px"
                                                     viewBox="0 -960 960 960" width="24px"
                                                     fill="#5f6368">
                                                    <path d="M720-330q0 104-73 177T470-80q-104 0-177-73t-73-177v-370q0-75 52.5-127.5T400-880q75 0 127.5 52.5T580-700v350q0 46-32 78t-78 32q-46 0-78-32t-32-78v-370h80v370q0 13 8.5 21.5T470-320q13 0 21.5-8.5T500-350v-350q-1-42-29.5-71T400-800q-42 0-71 29t-29 71v370q-1 71 49 120.5T470-160q70 0 119-49.5T640-330v-390h80v390Z"/>
                                                </svg>
                                            </button>
                                            &nbsp;&nbsp;
                                            <button id="submitBtn1" class="btn ml-2 ctm-btn-normal submit_btn">등록
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="text-center">
                    <div style="max-height: 400px; overflow-y: auto;">
                        <div>
                            <h5>홍길동
                                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960"
                                     width="24px" fill="#327b3e">
                                    <path d="m424-296 282-282-56-56-226 226-114-114-56 56 170 170Zm56 216q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q134 0 227-93t93-227q0-134-93-227t-227-93q-134 0-227 93t-93 227q0 134 93 227t227 93Zm0-320Z"/>
                                </svg>

                            </h5>
                            <hr>
                        </div>
                        <div>
                            <h5>익명의 평가위원1
                                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960"
                                     width="24px" fill="#e8eaed">
                                    <path d="m424-296 282-282-56-56-226 226-114-114-56 56 170 170Zm56 216q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q134 0 227-93t93-227q0-134-93-227t-227-93q-134 0-227 93t-93 227q0 134 93 227t227 93Zm0-320Z"/>
                                </svg>
                            </h5>
                            <hr>
                        </div>
                        <div>
                            <h5>익명의 평가위원2
                                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960"
                                     width="24px" fill="#e8eaed">
                                    <path d="m424-296 282-282-56-56-226 226-114-114-56 56 170 170Zm56 216q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q134 0 227-93t93-227q0-134-93-227t-227-93q-134 0-227 93t-93 227q0 134 93 227t227 93Zm0-320Z"/>
                                </svg>
                            </h5>
                            <hr>
                        </div>
                        <div>
                            <h5>익명의 평가위원3
                                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960"
                                     width="24px" fill="#e8eaed">
                                    <path d="m424-296 282-282-56-56-226 226-114-114-56 56 170 170Zm56 216q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q134 0 227-93t93-227q0-134-93-227t-227-93q-134 0-227 93t-93 227q0 134 93 227t227 93Zm0-320Z"/>
                                </svg>
                            </h5>
                            <hr>
                        </div>
                        <div>
                            <h5>익명의 평가위원4
                                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960"
                                     width="24px" fill="#e8eaed">
                                    <path d="m424-296 282-282-56-56-226 226-114-114-56 56 170 170Zm56 216q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q134 0 227-93t93-227q0-134-93-227t-227-93q-134 0-227 93t-93 227q0 134 93 227t227 93Zm0-320Z"/>
                                </svg>
                            </h5>
                            <hr>
                        </div>
                        <div>
                            <h5>익명의 평가위원5
                                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960"
                                     width="24px" fill="#e8eaed">
                                    <path d="m424-296 282-282-56-56-226 226-114-114-56 56 170 170Zm56 216q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q134 0 227-93t93-227q0-134-93-227t-227-93q-134 0-227 93t-93 227q0 134 93 227t227 93Zm0-320Z"/>
                                </svg>
                            </h5>
                            <hr>
                        </div>
                        <div>
                            <h5>익명의 평가위원6
                                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960"
                                     width="24px" fill="#e8eaed">
                                    <path d="m424-296 282-282-56-56-226 226-114-114-56 56 170 170Zm56 216q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q134 0 227-93t93-227q0-134-93-227t-227-93q-134 0-227 93t-93 227q0 134 93 227t227 93Zm0-320Z"/>
                                </svg>
                            </h5>
                            <hr>
                        </div>
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
            <tr>
                <td class="text-center bluee pb-1" colspan="2">[2024-RM-03-총괄] 평가위원회</td>
            </tr>
            <tr>
                <td colspan="6">
                    <div class="d-flex align-items-center">
                        <p class="ms-2"><b>[익명의 평가위원1]</b>에 대한 답글작성</p>
                        <div class="col-1"></div>
                        <div class="col-6"></div>
                        <button class="btn ctm-btn-bigger file_btn ms-2 mb-1" id="newButton">첨부파일</button>
                    </div>

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

                        <%--                        <script src="https://code.jquery.com/jquery-3.3.1.min.js"--%>
                        <%--                                integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="--%>
                        <%--                                crossorigin="anonymous"></script>--%>

                        &nbsp;&nbsp;
                        <button id="submitBtn" class="btn ml-2 ctm-btn-normal submit_btn">등록</button>
                    </div>
                </td>
            </tr>

            </tbody>
        </table>
        <div class="d-flex justify-content-center">
            <button class="btn ctm-btn-back mb-3"
                    onclick="window.location.href='http://localhost:8082/work-lounge/evaluation-table'">뒤로
            </button>
        </div>
    </div>
    <script src="/resources/js/work-lounge/sharing-opinion.js"></script>
</div>
</body>
</html>