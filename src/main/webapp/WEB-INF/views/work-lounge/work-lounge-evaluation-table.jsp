<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-noheader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>전자평가표</title>
    <!-- EvaluationTable CSS-->
    <link rel="stylesheet" href="/resources/css/EvaluationTable.css"/>
</head>
<body>
<div class="common-main">
    <hr>
    <div class="container mt-4">
        <div class="row justify-content-center">
            <!-- left-box -->
            <div class="card col-3 mb-3 mx-3">
                <!-- left-box-filter -->
                <div class="row justify-content-center">
                    <div class="col-auto">
                        <div class="d-flex gap-2 mt-3">
                            <select class="form-select" aria-label="Default select example" id="status-filter">
                                <option value="all">전체</option>
                                <option value="접수중">접수 중</option>
                                <option value="접수예정">접수 예정</option>
                            </select>
                            <select class="form-select" aria-label="Default select example" id="sort-filter">
                                <option value="recent">최신순</option>
                                <option value="closing">마감순</option>
                            </select>
                        </div>
                    </div>
                </div>
                <!-- left-box-body -->
                <div class="announcement-list" id="announcement-list">
                    <!-- 통합공고목록 아이템들이 여기에 표시됩니다 -->
                </div>

                <div id="sub-category" class="mt-3"></div>
            </div>
            <!-- right-box -->
            <div class="col-8 mb-3 mx-3 mt-3">
                <div class="row">
                    <!-- right-box-1 -->
                    <div class="col-12">
                        <div id="selected-announcement-title"></div>
                        <div class="category-box" id="category-box">
                            <!-- 공모 분야 선택 div가 여기에 표시됩니다 -->
                        </div>
                        <div class="table-box">
                            <table id="category-table">
                                <thead class="category-table">
                                <tr class="text-white">
                                    <th class="text-center">공고분야명</th>
                                    <th class="text-center">공모분야</th>
                                    <th class="text-center">기술분야</th>
                                    <th class="text-center">서식 구성</th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- 선택된 공모 분야가 여기에 추가됩니다 -->
                                </tbody>
                            </table>
                        </div>
                        <div id="form-content"></div>
                    </div>

                    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                    <script src="/resources/js/EvaluationTable.js"></script>
                    <script src="/resources/js/Range.js"></script>
                </div>
            </div>
            <!-- 하단 버튼 -->
            <div class="d-flex ">
                <div class="col-5"></div>
                <button class="btn ctm-btn-normal edit-button ctm-btn ctm-btn-normal" onclick="enableEditing()">
                    수정
                </button>
                &nbsp;
                <button class="btn ctm-btn-normal save-button ctm-btn-normal" onclick="saveSurvey()">
                    저장
                </button>
            </div>

        </div>
    </div>
</div>
</body>
</html>