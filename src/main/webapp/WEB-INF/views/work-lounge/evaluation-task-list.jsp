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
    <link rel="stylesheet" href="/resources/css/work-lounge/evaluation-task-list.css"/>
</head>
<body>
<div class="common-main">
<%--    <div class="common-main">--%>
        <div class="container">
            <div class="d-flex align-items-center my-3">
                <h4>
                    <b>평가위원회 목록</b>
                </h4>
                <div class="col-1"></div>
                <!-- 검색창-->
                <div class="row mb-3 offset-md-3" style="width: 630px"> <!-- 오른쪽 정렬 예시 -->
                    <div class="col-1"></div>
                    <div class="col">
                        <select id="filterType" class="form-control">
                            <option value="all">전체</option>
                            <option value="0">평가위원회명</option>
                            <option value="1">공모분야명</option>
                            <option value="4">평가상태</option>
                        </select>
                    </div>
                    <div class="col">
                        <input type="text" id="filterValue" class="form-control" placeholder="검색 내용 입력" />
                    </div>
                    <div class="col">
                        <button class="btn btn-primary" onclick="filterTable()">검색</button>
                    </div>
                </div>
            </div>

            <div class="line"></div>
            <select id="sortSelect" class="form-select" onchange="onSelectChange()" style="width: 100px">
                <option value="start">최신순</option>
                <option value="end">마감순</option>
            </select>
            <div style="max-height: 300px; overflow-y: auto">

                <!-- 표 -->
                <table id="myTable" class="table table-bordered text-center table-hover mt-3">
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
                    <tr class="letter">
                        <td class="committee-link"
                            data-id="평가위원회1">
                            [2024-RM-03-총괄] 평가위원회1
                        </td>
                        <td>
                            [2024-RM-03-총괄] 경수형 SMR 사고해석 및 핵설계 규제검증 기반 기술
                            개발
                        </td>
                        <td>2024-09-10</td>
                        <td>2024-09-25</td>
                        <td>평가진행중</td>
                    </tr>
                    <tr class="letter">
                        <td class="committee-link"
                            data-id="평가위원회2">
                            [2024-RM-03-총괄] 평가위원회2
                        </td>
                        <td>
                            [2024-RM-03-총괄] 경수형 SMR 사고해석 및 핵설계 규제검증 기반 기술
                            개발
                        </td>
                        <td>2024-09-23</td>
                        <td>2024-10-11</td>
                        <td>평가완료</td>
                    </tr>
                    </tbody>
                </table>
            </div>




            <!-- 평가과제목록 나오는거-->
            <div id="evaluationTaskList" class="mt-4" style="display: none">
                <div class="d-flex justify-content-between align-items-center">
                    <h4>평가과제목록 - <span id="selectedCommitteeName"></span></h4>
                    <div class="all-product-counts">
                        <span>전체 </span><span id="taskTotalCount">0</span
                    ><span> 건</span>
                    </div>
                </div>
                <div class="product-table card shadow-sm">
                    <table
                            class="table table-striped table-hover table-box"
                            id="task-table"
                    >
                        <thead>
                        <tr>
                            <th scope="col">과제명</th>
                            <th scope="col">시작일자</th>
                            <th scope="col">종료일자</th>
                            <th scope="col">상태</th>
                            <th scope="col">의견공유</th>
                            <th scope="col">평가</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- AJAX로 불러온 데이터가 여기에 추가됩니다 -->
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- 평가 모달 -->
            <div
                    class="modal fade"
                    id="evaluationModal"
                    tabindex="-1"
                    aria-labelledby="evaluationModalLabel"
                    aria-hidden="true"
            >
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="evaluationModalLabel">평가</h5>
                            <button
                                    type="button"
                                    class="btn-close"
                                    data-bs-dismiss="modal"
                                    aria-label="Close"
                            ></button>
                        </div>
                        <div class="modal-body">
                            <!-- 평가 폼 내용 -->
                            <form id="evaluationForm">
                                <div class="mb-3">
                                    <label for="evaluationInput" class="form-label"
                                    >평가 내용</label
                                    >
                                    <textarea
                                            class="form-control"
                                            id="evaluationInput"
                                            rows="3"
                                    ></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary">제출</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>




            <div class="d-flex align-items-center my-3 mt-5">
                <h4><b>평가과제목록</b></h4>
                <h5 class="text-muted mb-0 ms-3 mt-1 mb-2">
                    <b>
                    [2024-RM-03-총괄] 평가위원회-1 </b>
                    조회결과

                </h5>
                <div class="col-4"></div>
                <h5 class="text-muted mb-0 ms-5 mt-1 mb-2">
                    총 6건
                </h5>
            </div>
            <div class="line"></div>
            <div style="max-height: 300px; overflow-y: auto">
                <table class="table table-bordered text-center table-hover">
                    <thead>
                    <tr class="domain">
                        <th>과제명</th>
                        <th>주관연구기관</th>
                        <th>연구책임자</th>
                        <th>평가완료일자</th>
                        <th>평가상태</th>
                        <th>의견공유</th>
                        <th>평가</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="letter">
                        <td>경수형 SMR 사고해석 OOO 계획서 보고안</td>
                        <td>강남대학교</td>
                        <td>김상학</td>
                        <td>-</td>
                        <td>미평가</td>
                        <td>
                            <button type="button" class="btn btn-back-orange"
                                    onclick="window.location.href='http://localhost:8082/work-lounge/evaluation-table'">
                                의견공유
                            </button>
                        </td>

                        <td>
                            <button type="button" class="btn btn-back-orange"
                                    onclick="window.location.href='http://localhost:8082/work-lounge/evaluation-table'">
                                평가
                            </button>
                        </td>
                    </tr>
                    <tr class="letter">
                        <td>경수형 SMR 사고해석 OOO 계획서 보고</td>
                        <td>강남대학교</td>
                        <td>홍길동</td>
                        <td>2024-10-11 20:59:30</td>
                        <td>평가완료</td>
                        <td>
                            <button type="button" class="btn btn-back-orange"
                                    onclick="window.location.href='http://localhost:8082/work-lounge/evaluation-table'">
                                의견공유
                            </button>
                        </td>

                        <td>
                            <button type="button" class="btn btn-back-orange"
                                    onclick="window.location.href='http://localhost:8082/work-lounge/evaluation-table'">
                                평가
                            </button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
<%--    </div>--%>

</div>

<script src="/resources/js/work-lounge/evaluation-task-list.js"></script>
</body>
</html>