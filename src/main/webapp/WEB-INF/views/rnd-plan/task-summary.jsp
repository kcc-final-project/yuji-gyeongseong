<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<link rel="stylesheet" href="/resources/css/rnd-plan/basic.css"/>

<div class="main">
    <%-- 연구개발단계구성 및 연구개발기간 --%>
    <div class="sub-announcement mt-5">
        <div class="header-section">
            <div class="header-section__title">
                <h5>공모분야</h5>
            </div>
            <div class="header-section__info">
                <span>반드시 '신청자격 리스트 및 확인서'를 체크해주시길 바랍니다.</span>
            </div>
        </div>
        <div class="body-section">
            <table class="table table-bordered mt-2 align-middle">
                <tr>
                    <td class="ctm-th ctm-w15p">통합공고명</td>
                    <td><input class="form-control ps-3" value="2024년도 양자과학기술 분야 국제협력거점 및 국제공동연구실 관련 공모" disabled
                               readonly type="text"></td>
                    <td class="ctm-w20p">
                        <div class="ctm-btn-outline check-item-btn">
                            <span class="material-icons ctm-icon icon-warning">dangerous</span>
                            <%--
                               <span class="material-icons ctm-icon icon-success">check_circle</span>
                           --%>
                            <span class="check-item-btn__title ps-4">신청자격 리스트</span>
                        </div
                    </td>
                </tr>
                <tr>
                    <td class="ctm-th ctm-w15p">공모분야명</td>
                    <td><input class="form-control ps-3" value="(2024-양자국제협력-1) 양자광학기반 이산-연속변수 하이브리드 양자정보처리 국제공동연구실"
                               disabled readonly type="text">
                    </td>
                    <td class="ctm-w20p">
                        <div class="ctm-btn-outline check-item-btn">
                            <span class="material-icons ctm-icon icon-warning">dangerous</span>
                            <%--
                                <span class="material-icons ctm-icon icon-success">check_circle</span>
                            --%>
                            <span class="check-item-btn__title">우대 및 감점사항 확인서</span>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <%-- 최종목표 및 내용 --%>
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
                        <textarea class="form-control" minlength="25" maxlength="2000" rows="4"></textarea>
                        <div class="ctm-f">
                            <span class="fz14">최소 25자 이상</span>
                            <div>
                                <span>0</span>
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
                        <textarea class="form-control" minlength="100" maxlength="2000" rows="4"></textarea>
                        <div class="ctm-f">
                            <span class="fz14">최소 100자 이상</span>
                            <div>
                                <span>0</span>
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
                        <textarea class="form-control" minlength="25" maxlength="2000" rows="4"></textarea>
                        <div class="ctm-f">
                            <span class="fz14">최소 25자 이상</span>
                            <div>
                                <span>0</span>
                                <span> / 2000</span>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <%-- 단계별 목표 및 내용 --%>
    <div class="sub-announcement-detail mt-5">
        <div class="header-section">
            <div class="header-section__title">
                <h6>단계별 목표 및 내용</h6>
            </div>
        </div>
        <div class="body-section">
            <table class="table table-bordered mt-2 align-middle">
                <tr>
                    <td class="ctm-th ctm-w15p" rowspan="6">개별연구개발</td>
                    <td class="ctm-th ctm-w15p" rowspan="2">1단계</td>
                    <td class="ctm-th__sub ctm-w15p">
                        <span class="required-item">* </span>
                        단계목표내용
                    </td>
                    <td>
                        <textarea class="form-control" minlength="25" maxlength="2000" rows="4"></textarea>
                        <div class="ctm-f">
                            <span class="fz14">최소 25자 이상</span>
                            <div>
                                <span>0</span>
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
                        <textarea class="form-control" minlength="100" maxlength="2000" rows="4"></textarea>
                        <div class="ctm-f">
                            <span class="fz14">최소 100자 이상</span>
                            <div>
                                <span>0</span>
                                <span> / 2000</span>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="ctm-th ctm-w15p" rowspan="2">2단계</td>
                    <td class="ctm-th__sub ctm-w15p">
                        <span class="required-item">* </span>
                        단계목표내용
                    </td>
                    <td>
                        <textarea class="form-control" minlength="25" maxlength="2000" rows="4"></textarea>
                        <div class="ctm-f">
                            <span class="fz14">최소 25자 이상</span>
                            <div>
                                <span>0</span>
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
                        <textarea class="form-control" minlength="100" maxlength="2000" rows="4"></textarea>
                        <div class="ctm-f">
                            <span class="fz14">최소 100자 이상</span>
                            <div>
                                <span>0</span>
                                <span> / 2000</span>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="ctm-th ctm-w15p" rowspan="2">3단계</td>
                    <td class="ctm-th__sub ctm-w15p">
                        <span class="required-item">* </span>
                        단계목표내용
                    </td>
                    <td>
                        <textarea class="form-control" minlength="25" maxlength="2000" rows="4"></textarea>
                        <div class="ctm-f">
                            <span class="fz14">최소 25자 이상</span>
                            <div>
                                <span>0</span>
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
                        <textarea class="form-control" minlength="100" maxlength="2000" rows="4"></textarea>
                        <div class="ctm-f">
                            <span class="fz14">최소 100자 이상</span>
                            <div>
                                <span>0</span>
                                <span> / 2000</span>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
