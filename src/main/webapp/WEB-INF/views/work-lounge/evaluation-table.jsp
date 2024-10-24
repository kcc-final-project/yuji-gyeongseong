<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-noheader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>전자평가표</title>
    <link rel="stylesheet" href="/resources/css/work-lounge/evaluation-table.css"/>
    <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <style>
        .d-flex {
            display: flex;
        }

        .scroll-container {
            max-height: 700px;
            overflow-y: auto;
        }

        .scroll-container1 {
            max-height: 565px;
            overflow-y: auto;
        }

        .form-select {
            width: 100px;
            margin-right: 10px;
        }
    </style>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="main-container" style="width: 100%;height: 756px;">
    <div class="marin-header"
         style="width: 100%; height: 10%; display: flex; justify-content: center; align-items: center;">
        <h2>전자평가표</h2>
    </div>

    <div>
        <div class="d-flex justify-content-center ps-1">
            <div class="card col-4 scroll-container">
                <div class="d-flex justify-content-center align-center mt-1">
                    <select class="form-select" aria-label="Default select example">
                        <option value="all">전체</option>
                        <option value="접수중">접수 중</option>
                        <option value="접수예정">접수 예정</option>
                    </select>
                    <select class="form-select" aria-label="Default select example">
                        <option value="recent">최신순</option>
                        <option value="closing">마감순</option>
                    </select>
                </div>
                <div class="mt-3 mb-1">
                    <div class="card mb-3" style="background-color: white;">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title truncate-text">
                                [2024-RM-03-총괄] 경수형 SMR 사고해석 및 사고회로
                            </h5>
                            <p class="card-text">
                                <span class="div-class">접수마감</span>
                            <h5 class="d-flex">공고일 : <p>&nbsp;2024-10-01</p></h5>
                            <h5 class="d-flex">접수마감일 : <p>&nbsp;2024-10-17</p></h5>
                            </p>
                            <select class="form-select mt-2 w-100" aria-label="Default select example">
                                <option selected>공모분야를 선택해주세요.</option>
                                <option value="1">옵션 1</option>
                                <option value="2">옵션 2</option>
                                <option value="3">옵션 3</option>
                            </select>
                        </div>
                    </div>
                    <div class="card mb-3" style="background-color: white;">
                        <div class="card-body d-flex flex-column align-items-center">
                            <h5 class="card-title">목록 2</h5>
                            <p class="card-text">내용 2</p>
                            <select class="form-select mt-2" aria-label="Default select example">
                                <option selected>선택</option>
                                <option value="1">옵션 1</option>
                                <option value="2">옵션 2</option>
                                <option value="3">옵션 3</option>
                            </select>
                        </div>
                    </div>
                    <div class="card mb-3" style="background-color: white;">
                        <div class="card-body d-flex flex-column align-items-center">
                            <h5 class="card-title">목록 3</h5>
                            <p class="card-text">내용 3</p>
                            <select class="form-select mt-2" aria-label="Default select example">
                                <option selected>선택</option>
                                <option value="1">옵션 1</option>
                                <option value="2">옵션 2</option>
                                <option value="3">옵션 3</option>
                            </select>
                        </div>
                    </div>
                    <div class="card mb-3" style="background-color: white;">
                        <div class="card-body d-flex flex-column align-items-center">
                            <h5 class="card-title">목록 4</h5>
                            <p class="card-text">내용 4</p>
                            <select class="form-select mt-2" aria-label="Default select example">
                                <option selected>선택</option>
                                <option value="1">옵션 1</option>
                                <option value="2">옵션 2</option>
                                <option value="3">옵션 3</option>
                            </select>
                        </div>
                    </div>
                    <div class="card mb-3" style="background-color: white;">
                        <div class="card-body d-flex flex-column align-items-center">
                            <h5 class="card-title">목록 5</h5>
                            <p class="card-text">내용 5</p>
                            <select class="form-select mt-2" aria-label="Default select example">
                                <option selected>선택</option>
                                <option value="1">옵션 1</option>
                                <option value="2">옵션 2</option>
                                <option value="3">옵션 3</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-8 d-flex">
                <div class="col-12">
                    <table class="table table-bordered text-center">
                        <thead>
                        <tr class="domain">
                            <th>공고분야명</th>
                            <th>공모분야</th>
                            <th>기술분야</th>
                            <th>서식구성</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="flex text-align-center justify-content-center">
                            <td class="truncate-text1"
                                data-full-text="2024년 글로벌혁신특구혁신사업육성(R&D)_가상실증인프라(재)zzzzzzzzzzzzzz">
                                2024년
                                글로벌혁신특구혁신사업육성(R&D)_가상실증인프라(재)zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
                            </td>
                            <td>품목지정공모</td>
                            <td>IT분야</td>
                            <td>
                                <div class="form-group" style="margin-bottom: 0px">
                                    <select
                                            class="form-control"
                                            id="formSelect"
                                            onchange="createTabs(this.value)"
                                    >
                                        <option value="1" selected>Form 1</option>
                                        <option value="2">Form 2</option>
                                        <option value="3">Form 3</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div id="tabsContainer" class="mt-3 scroll-container1"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/resources/js/work-lounge/evaluation-table.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>