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
            <h5 class="text-muted mb-0 ms-3 mt-1 blue-font">
                접수 기한이 종료 되었을 경우(접수종료일시) 계획서 수정이 불가능합니다.
            </h5>
        </div>
        <div class="line"></div>
        <div style="max-height: 300px; overflow-y: auto">
            <table class="table table-bordered text-center">
                <thead>
                <tr class="domain">
                    <th>공고명</th>
                    <th>공모유형</th>
                    <th>접수시작일시</th>
                    <th>접수종료일시</th>
                    <th>접수상태</th>
                    <th>수정</th>
                    <th>작성취소</th>
                </tr>
                </thead>
                <tbody>
                <tr class="letter">
                    <td>2024년 글로벌혁신특구혁신사업육성(R&D)_가상실증인프라(재)</td>
                    <td>지정공모</td>
                    <td>2024-09-10 19:00:00</td>
                    <td>2024-09-25 9:00:00</td>
                    <td>접수중</td>
                    <td>
                        <button type="button" class="btn btn-outline-primary"
                                onclick="window.location.href='http://localhost:8082/work-lounge/evaluation-table'">
                            수정
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-outline-danger">
                            취소
                        </button>
                    </td>
                </tr>
                <tr class="letter">
                    <td>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제</td>
                    <td>품목지정공모</td>
                    <td>2024-09-23 19:00:00</td>
                    <td>2024-10-11 9:00:00</td>
                    <td>접수마감</td>
                    <td>
                        <button type="button" class="btn btn-outline-secondary">
                            수정
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-outline-secondary">
                            취소
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="d-flex align-items-center my-3 mt-5">
            <h4><b>완료된 계획서</b></h4>
            <h5 class="text-muted mb-0 ms-3 mt-1 blue-font">
                접수 기한이 종료 되었을 경우(접수종료일시) 제출 취소가 불가능합니다.
            </h5>
        </div>
        <div class="line"></div>
        <div style="max-height: 300px; overflow-y: auto">
            <table class="table table-bordered text-center">
                <thead>
                <tr class="domain">
                    <th>공고명</th>
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
                <tr class="letter">
                    <td>2024년 글로벌혁신특구혁신사업육성(R&D)_가상실증인프라(재)</td>
                    <td>지정공모</td>
                    <td>2024-09-10 19:00:00</td>
                    <td>2024-09-25 9:00:00</td>
                    <td>2024-09-25 9:36:00</td>
                    <td>평가진행중</td>
                    <td>
                        <button type="button" class="btn btn-outline-secondary">
                            취소
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-back-orange"
                                onclick="window.location.href='http://localhost:8082/work-lounge/evaluation-table'">
                            의견공유
                        </button>
                    </td>
                </tr>
                <tr class="letter">
                    <td>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제</td>
                    <td>품목지정공모</td>
                    <td>2024-09-23 9:00:00</td>
                    <td>2024-10-11 23:59:59</td>
                    <td>2024-10-11 20:59:30</td>
                    <td>탈락</td>
                    <td>
                        <button type="button" class="btn btn-outline-danger">
                            취소
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-back-orange"
                                onclick="window.location.href='http://localhost:8082/work-lounge/evaluation-table'">
                            의견공유
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="/resources/js/work-lounge/register-list.js"></script>
</body>
</html>