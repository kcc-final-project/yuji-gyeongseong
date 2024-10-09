<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<link rel="stylesheet" href="/resources/css/rnd-plan/basic.css"/>

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
                        <input id="ipt-task-title" class="form-control ps-3" value="" placeholder="연구개발과제명을 입력해주세요."
                               type="text" required maxlength="60">
                        <div class="d-flex">
                            <div id="task-title-feedback" class="invalid-feedback">
                                연구개발과제명은 60자 이내로 입력해주시기 바랍니다.
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

    <div class="toast align-items-center ctm-toast" role="alert" aria-live="assertive" aria-atomic="true"
         id="success-toast">
        <div class="ctm-toast-line"></div>
        <div class="toast-body ctm-f-center">
            <span class="material-icons icon-success me-1">check_circle</span>
            <span>연구개발과제명이 적용되었습니다.</span>
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
                            <div class="ctm-th__btn">
                                <span class="material-icons ctm-icon">content_copy</span>
                            </div>
                        </div>
                    </td>
                    <td><input class="form-control ctm-td" disabled readonly type="text"></td>
                    <td><input class="form-control ctm-td" disabled readonly type="text"></td>
                    <td><input class="form-control ctm-td" disabled readonly type="text"></td>
                    <td><input class="form-control ctm-td" disabled readonly type="text"></td>
                    <td><input class="form-control ctm-td" disabled readonly type="text"></td>
                    <td><input class="form-control ctm-td" disabled readonly type="text"></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="/resources/js/rnd-plan/basic.js"></script>
