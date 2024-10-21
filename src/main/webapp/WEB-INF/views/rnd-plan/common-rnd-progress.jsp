<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<link rel="stylesheet" href="/resources/css/rnd-plan/common-rnd-progress.css">

<div id="sub-ann-no" class="visually-hidden">${subAnnNo}</div>

<h4>(신청용) 연구개발계획서</h4>
<%-- 진행바 --%>
<div class="multi-step-progress-bar">
    <div class="progress-container">
        <div class="progress px-1" style="height: 5px;">
            <div class="progress-bar"
                 role="progressbar"
                 aria-valuenow="0"
                 aria-valuemin="0"
                 aria-valuemax="100">
            </div>
        </div>

        <div class="step-container d-flex justify-content-between">
            <div class="step-group" onclick="changeStep(1)">
                <div class="step-circle">1</div>
                <span class="ctm-poiner">기본정보</span>
            </div>
            <div class="step-group" onclick="changeStep(2)">
                <div class="step-circle">2</div>
                <span class="ctm-poiner">과제요약</span>
            </div>
            <div class="step-group" onclick="changeStep(3)">
                <div class="step-circle">3</div>
                <span class="ctm-poiner">연구기관</span>
            </div>
            <div class="step-group" onclick="changeStep(4)">
                <div class="step-circle">4</div>
                <span class="ctm-poiner">연구개발비</span>
            </div>
            <div class="step-group" onclick="changeStep(5)">
                <div class="step-circle">5</div>
                <span class="ctm-poiner">첨부파일</span>
            </div>
            <div class="step-group" onclick="changeStep(6)">
                <div class="step-circle">6</div>
                <span class="ctm-poiner">최종제출</span>
            </div>
        </div>
    </div>
</div>

<%-- 과제정보 --%>
<div class="task-info mt-5">
    <div class="header-section">
        <div class="header-section__title">
            <h5>과제정보</h5>
        </div>
        <div class="header-section__btn">
            <div class="ctm-btn ctm-btn-outline" data-bs-toggle="modal"
                 data-bs-target="#progressHistoryModal">
                <span class="material-icons ctm-icon">history_2</span>진행내역 조회
            </div>
        </div>
    </div>
    <div class="body-section">
        <table class="table table-bordered mt-2">
            <thead>
            <tr>
                <td class="ctm-th ctm-w45p">과제명</td>
                <td class="ctm-th">연구개발기관</td>
                <td class="ctm-th">연구 책임자</td>
                <td class="ctm-th">연구개발 과제번호</td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><input id="dpy-task-title" class="form-control ctm-td" disabled readonly type="text"></td>
                <td><input class="form-control ctm-td" disabled readonly type="text"></td>
                <td><input class="form-control ctm-td" disabled readonly type="text"></td>
                <td><input class="form-control ctm-td" disabled readonly type="text"></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<%-- 진행내역 조회 모달창 --%>
<div class="modal fade" id="progressHistoryModal" tabindex="-1" aria-labelledby="progressHistoryModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-xl ctm-modal-position">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fz16" id="progressHistoryModalLabel">진행내역</h1>
            </div>
            <div class="modal-body ctm-f">
                <div class="progressHistorySection">
                    <h5>진행내역</h5>
                    <div class="techFieldSection-sub ctm-f-center-start">
                        <span class="fz14 fc-blue fw-bold">시스템 상 자동으로 임시저장 처리되는 경우 처리자 항목이 '시스템 처리'로 표시됩니다.</span>
                    </div>
                    <div class="techFieldSection-line"></div>
                    <div class="progressHistorySection-body">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <td class="ctm-th ctm-tb-w53">No.</td>
                                <td class="ctm-th ctm-tb-w215">처리상태</td>
                                <td class="ctm-th ctm-tb-w215">처리자</td>
                                <td class="ctm-th ctm-tb-w323">처리일시</td>
                                <td class="ctm-th ctm-tb-w283">비고</td>
                            </tr>
                            </thead>
                        </table>
                        <div class="ctm-tb-scroll">
                            <table class="table table-bordered table-striped">
                                <tbody>
                                <tr>
                                    <td class="text-center ctm-w5p">1</td>
                                    <td class="text-center ctm-w20p">계획서 작성중</td>
                                    <td class="text-center ctm-w20p">황철원</td>
                                    <td class="text-center">2024-09-12 11:15:21:70</td>
                                    <td class="text-center ctm-w25p">기본정보 - 작성중</td>
                                </tr>
                                <tr>
                                    <td class="text-center">1</td>
                                    <td class="text-center">계획서 작성중</td>
                                    <td class="text-center">황철원</td>
                                    <td class="text-center">2024-09-12 11:15:21:70</td>
                                    <td class="text-center">기본정보 - 작성중</td>
                                </tr>
                                <tr>
                                    <td class="text-center">1</td>
                                    <td class="text-center">계획서 작성중</td>
                                    <td class="text-center">황철원</td>
                                    <td class="text-center">2024-09-12 11:15:21:70</td>
                                    <td class="text-center">기본정보 - 작성중</td>
                                </tr>
                                <tr>
                                    <td class="text-center">1</td>
                                    <td class="text-center">계획서 작성중</td>
                                    <td class="text-center">황철원</td>
                                    <td class="text-center">2024-09-12 11:15:21:70</td>
                                    <td class="text-center">기본정보 - 작성중</td>
                                </tr>
                                <tr>
                                    <td class="text-center">1</td>
                                    <td class="text-center">계획서 작성중</td>
                                    <td class="text-center">황철원</td>
                                    <td class="text-center">2024-09-12 11:15:21:70</td>
                                    <td class="text-center">기본정보 - 작성중</td>
                                </tr>
                                <tr>
                                    <td class="text-center">1</td>
                                    <td class="text-center">계획서 작성중</td>
                                    <td class="text-center">황철원</td>
                                    <td class="text-center">2024-09-12 11:15:21:70</td>
                                    <td class="text-center">기본정보 - 작성중</td>
                                </tr>
                                <tr>
                                    <td class="text-center">1</td>
                                    <td class="text-center">계획서 작성중</td>
                                    <td class="text-center">황철원</td>
                                    <td class="text-center">2024-09-12 11:15:21:70</td>
                                    <td class="text-center">기본정보 - 작성중</td>
                                </tr>

                                <tr>
                                    <td class="text-center">1</td>
                                    <td class="text-center">계획서 작성중</td>
                                    <td class="text-center">황철원</td>
                                    <td class="text-center">2024-09-12 11:15:21:70</td>
                                    <td class="text-center">기본정보 - 작성중</td>
                                </tr>
                                <tr>
                                    <td class="text-center">1</td>
                                    <td class="text-center">계획서 작성중</td>
                                    <td class="text-center">황철원</td>
                                    <td class="text-center">2024-09-12 11:15:21:70</td>
                                    <td class="text-center">기본정보 - 작성중</td>
                                </tr>
                                <tr>
                                    <td class="text-center">1</td>
                                    <td class="text-center">계획서 작성중</td>
                                    <td class="text-center">황철원</td>
                                    <td class="text-center">2024-09-12 11:15:21:70</td>
                                    <td class="text-center">기본정보 - 작성중</td>
                                </tr>
                                <tr>
                                    <td class="text-center">1</td>
                                    <td class="text-center">계획서 작성중</td>
                                    <td class="text-center">황철원</td>
                                    <td class="text-center">2024-09-12 11:15:21:70</td>
                                    <td class="text-center">기본정보 - 작성중</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer ctm-f-center">
                <button type="button" class="ctm-btn ctm-btn-outline ctm-w10p ctm-h38 ctm-f-center"
                        data-bs-dismiss="modal">닫기
                </button>
            </div>
        </div>
    </div>
</div>

<script src="/resources/js/rnd-plan/common-rnd-progress.js"></script>
