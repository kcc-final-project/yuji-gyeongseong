<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<link rel="stylesheet" href="/resources/css/rnd-plan/common-rnd.css"/>

<div class="main">
    <%-- 공모분야 --%>
    <div class="sub-announcement mt-5">
        <div class="header-section">
            <div class="header-section__title">
                <h5>공모분야</h5>
            </div>
        </div>
        <div class="body-section">
            <table class="table table-bordered mt-2 align-middle">
                <tr>
                    <td class="ctm-th ctm-w15p">통합공고명</td>
                    <td><input class="form-control ps-3" value="2024년도 양자과학기술 분야 국제협력거점 및 국제공동연구실 관련 공모" disabled
                               readonly type="text"></td>
                </tr>
                <tr>
                    <td class="ctm-th ctm-w15p">공모분야명</td>
                    <td><input class="form-control ps-3" value="(2024-양자국제협력-1) 양자광학기반 이산-연속변수 하이브리드 양자정보처리 국제공동연구실"
                               disabled readonly type="text">
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <%-- 공모분야 세부내용 --%>
    <div class="sub-announcement-detail mt-5">
        <div class="header-section">
            <div class="header-section__title">
                <h6>공모분야 세부내용</h6>
            </div>
        </div>
        <div class="body-section">
            <table class="table table-bordered mt-2 align-middle">
                <tr>
                    <td class="ctm-th__sub ctm-w15p ">시행연도</td>
                    <td><input class="form-control ps-3" value="2024년" disabled
                               readonly type="text"></td>
                    <td class="ctm-th__sub ctm-w15p">접수유형</td>
                    <td><input class="form-control ps-3" value="신청용 연구개발계획서" disabled
                               readonly type="text"></td>
                </tr>
                <tr>
                    <td class="ctm-th__sub ctm-w15p">공고구분</td>
                    <td><input class="form-control ps-3" value="지정공모"
                               disabled readonly type="text">
                    </td>
                    <td class="ctm-th__sub ctm-w15p">과제구분</td>
                    <td><input class="form-control ps-3" value="(일반)연구개발과제"
                               disabled readonly type="text">
                    </td>
                </tr>
                <tr>
                    <td class="ctm-th__sub ctm-w15p">정부지원금한도</td>
                    <td><input class="form-control ps-3" value="신청용 연구개발계획서"
                               disabled readonly type="text">
                    </td>
                    <td class="ctm-th__sub ctm-w15p">성과물 소유주체</td>
                    <td><input class="form-control ps-3" value="연구기관귀속"
                               disabled readonly type="text">
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <%-- 과제명 --%>
    <div class="task-title mt-5">
        <div class="header-section">
            <div class="header-section__title">
                <h5>과제명</h5>
            </div>
            <div class="header-section__info">
                <span>* 필수 항목</span>
            </div>
        </div>
        <div class="body-section">
            <table class="table table-bordered mt-2 align-middle">
                <tr>
                    <td class="ctm-th__sub ctm-w15p">
                        <span class="required-item">* </span>
                        연구개발과제명
                    </td>
                    <td>
                        <input id="ipt-task-title" class="form-control ps-3" value=""
                               placeholder="연구개발과제명을 60자 이내로 입력해주세요."
                               type="text" required maxlength="60">
                        <div class="d-flex">
                            <div id="task-title-feedback" class="invalid-feedback">
                                연구개발과제명은 최소 1자 이상 60자 이내로 입력해주시기 바랍니다.
                            </div>
                        </div>
                    </td>
                    <td class="ctm-w15p">
                        <div id="sbt-task-title" class="ctm-btn-normal">
                            적용하기
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <%-- 연구분야 --%>
    <div class="task-info mt-5">
        <div class="header-section">
            <div class="header-section__title">
                <h5>연구분야</h5>
            </div>
            <div class="header-section__info">
                <span>* 필수 항목</span>
            </div>
        </div>
        <div class="body-section">
            <table class="table table-bordered mt-2 align-middle">
                <thead>
                <tr>
                    <td class="ctm-th ctm-w10p">구분</td>
                    <td class="ctm-th ctm-w20p">기술분류</td>
                    <td class="ctm-th">1순위</td>
                    <td class="ctm-th ctm-w7p">가중치(%)</td>
                    <td class="ctm-th">2순위</td>
                    <td class="ctm-th ctm-w7p">가중치(%)</td>
                    <td class="ctm-th">3순위</td>
                    <td class="ctm-th ctm-w7p">가중치(%)</td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="ctm-th__sub">R&D 공통</td>
                    <td class="ctm-th__sub ">
                        <div class="ctm-th__with-btn">
                            <span><span class="required-item">* </span>국가과학기술표준분류</span>
                            <div class="ctm-th__btn openTechFieldModal" data-bs-toggle="modal"
                                 data-bs-target="#techFieldModal">
                                <span class="material-icons ctm-icon">content_copy</span>
                            </div>
                        </div>
                    </td>
                    <!-- 1순위 -->
                    <td><input id="research-field-1" class="form-control ctm-td" disabled readonly type="text"></td>
                    <td><input id="research-weight-1" class="form-control ctm-td" disabled readonly type="text"></td>
                    <!-- 2순위 -->
                    <td><input id="research-field-2" class="form-control ctm-td" disabled readonly type="text"></td>
                    <td><input id="research-weight-2" class="form-control ctm-td" disabled readonly type="text"></td>
                    <!-- 3순위 -->
                    <td><input id="research-field-3" class="form-control ctm-td" disabled readonly type="text"></td>
                    <td><input id="research-weight-3" class="form-control ctm-td" disabled readonly type="text"></td>
                </tr>
                </tbody>
            </table>
        </div>

        <%-- 기술분류 모달창 --%>
        <div class="modal fade" id="techFieldModal" tabindex="-1" aria-labelledby="techFieldModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-xl ctm-modal-position">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fz16" id="techFieldModalLabel">기술분류 목록</h1>
                    </div>
                    <div class="modal-body ctm-tech-field-mbody ctm-f">
                        <div class="techFieldSection ctm-w48p">
                            <h5>기술분류 목록</h5>
                            <div class="techFieldSection-sub ctm-f-center-start">
                                <span class="fz14 fc-blue fw-bold">최소 1개 이상 3개 이하까지 기술분류를 선택해주세요.</span>
                            </div>
                            <div class="techFieldSection-line"></div>
                            <div class="techFieldSection-body techFieldTree-body">
                                <div class="techFieldTree"></div>
                            </div>
                        </div>
                        <div class="ctm-f-col-center gap-3">
                            <div class="ctm-arrow-btn ctm-f-center" id="btn-add-selected">
                                <span class="material-icons">arrow_forward_ios</span>
                            </div>
                            <div class="ctm-arrow-btn ctm-f-center" id="btn-remove-selected">
                                <span class="material-icons ms-2">arrow_back_ios</span>
                            </div>
                        </div>

                        <div class="techFieldSection ctm-w48p">
                            <h5>선택 기술분류 목록</h5>
                            <div class="techFieldSection-sub ctm-f-center-start">
                                <span class="fz14 fc-blue fw-bold">여러 기술분류에 대한 가중치(%)의 합계는 100%가 되어야 합니다.</span>
                            </div>
                            <div class="techFieldSection-line"></div>
                            <div class="techFieldSection-body">
                                <div class="body-section ctm-f-col-center">
                                    <table class="table table-bordered mt-2 table-hover align-middle">
                                        <thead>
                                        <tr>
                                            <td class="ctm-th ctm-w5p">
                                                <input id="select-all" class="form-check-input ctm-td-btn-center"
                                                       type="checkbox"
                                                       value=""/>
                                            </td>
                                            <td class="ctm-th">기술분류명</td>
                                            <td class="ctm-th ctm-w20p">가중치(%)</td>
                                            <td class="ctm-th ctm-w15p">순위</td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%-- --%>
                                        </tbody>
                                    </table>
                                    <div id="weight-sum-error" class="invalid-message">
                                        가중치의 합계는 100이어야 합니다.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer ctm-f-center gap-3">
                        <button type="button" class="ctm-btn ctm-btn-outline ctm-w10p ctm-h38 ctm-f-center"
                                data-bs-dismiss="modal">취소
                        </button>
                        <button type="button" id="btn-modal-complete" class="ctm-btn ctm-btn-normal ctm-w10p">완료
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/resources/js/rnd-plan/basic.js"></script>
