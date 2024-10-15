<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<link rel="stylesheet" href="/resources/css/rnd-plan/common-rnd.css"/>

<div class="main">
    <!-- 연구개발단계구성 및 연구개발기간 -->
    <div class="mt-5">
        <div class="header-section">
            <div class="header-section__title">
                <h5>연구개발단계구성 및 연구개발기간</h5>
            </div>
        </div>

        <table class="table table-bordered mt-2 align-middle">
            <tr>
                <td class="ctm-th ctm-w15p">전체 연구개발기간</td>
                <td class="d-flex justify-content-around">
                    <input id="overall-start-date" class="form-control ps-3 ctm-w35p" disabled readonly type="text">
                    <span class="ctm-w5p text-center pt-1 fw-bolder">~</span>
                    <input id="overall-end-date" class="form-control ps-3 ctm-w35p" disabled readonly type="text">
                    <input id="overall-duration" class="form-control ps-3 ctm-w15p" disabled readonly type="text">
                </td>
                <td class="ctm-th ctm-w15p">(공고)연구기간</td>
                <td class="ctm-w20p">
                    <input class="form-control ps-3" value="자율구성" disabled readonly type="text">
                </td>
            </tr>
        </table>

        <div class="body-section">
            <table id="stage-table" class="table table-bordered mt-2 mb-5 align-middle text-center table-hover">
                <tr>
                    <td class="ctm-th ctm-w15p">단계</td>
                    <td class="ctm-th ctm-w15p">연차</td>
                    <td class="ctm-th">연구개발시작일</td>
                    <td class="ctm-th">연구개발종료일</td>
                    <td class="ctm-th">개월 수</td>
                </tr>
                <!--  -->
            </table>
        </div>
    </div>

    <!-- 최종목표 및 내용 -->
    <div class="mt-5">
        <div class="header-section">
            <div class="header-section__title">
                <h5>최종목표 및 내용</h5>
            </div>
            <div class="header-section__info">
                <span>* 필수 항목</span>
            </div>
        </div>
        <div class="body-section">
            <table class="table table-bordered mt-2 align-middle">
                <tr>
                    <td class="ctm-th ctm-w15p" rowspan="3">개별연구개발</td>
                    <td class="ctm-th__sub ctm-w15p">
                        <span class="required-item">* </span>
                        최종목표내용
                    </td>
                    <td>
                        <textarea id="finalGoalContent" class="form-control textarea-input" minlength="25"
                                  maxlength="2000" rows="4 required"></textarea>
                        <div class="ctm-f">
                            <span class="fz14">최소 25자 이상</span>
                            <div>
                                <span class="char-count" data-maxlength="2000">0</span>
                                <span> / 2000</span>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="ctm-th__sub ctm-w15p">
                        <span class="required-item">* </span>
                        연구개발내용
                    </td>
                    <td>
                        <textarea id="rndContent" class="form-control textarea-input" minlength="100" maxlength="2000"
                                  rows="4" required></textarea>
                        <div class="ctm-f">
                            <span class="fz14">최소 100자 이상</span>
                            <div>
                                <span class="char-count" data-maxlength="2000">0</span>
                                <span> / 2000</span>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="ctm-th__sub ctm-w15p">
                        <span class="required-item">* </span>
                        연구개발성과<br/> 활용계획 및 기대효과
                    </td>
                    <td>
                        <textarea id="rndOutcomePlan" class="form-control textarea-input" minlength="25"
                                  maxlength="2000" rows="4" required></textarea>
                        <div class="ctm-f">
                            <span class="fz14">최소 25자 이상</span>
                            <div>
                                <span class="char-count" data-maxlength="2000">0</span>
                                <span> / 2000</span>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <%-- 단계별 목표 및 내용 --%>
    <div class="mt-5">
        <div class="header-section">
            <div class="header-section__title">
                <h6>단계별 목표 및 내용</h6>
            </div>
            <div class="header-section__info">
                <span>* 필수 항목</span>
            </div>
        </div>
        <div class="body-section">
            <table class="table table-bordered mt-2 align-middle">
                <tbody id="stage-goals-section">
                <%-- --%>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="/resources/js/rnd-plan/task-summary.js"></script>
