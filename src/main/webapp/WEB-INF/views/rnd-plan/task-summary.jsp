<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<link rel="stylesheet" href="/resources/css/rnd-plan/basic.css"/>

<div class="main">
    <%-- 연구개발단계구성 및 연구개발기간 --%>
    <div class="mt-5">
        <div class="header-section">
            <div class="header-section__title">
                <h5>연구개발단계구성 및 연구개발기간</h5>
            </div>
            <div class="header-section__info">
                <%-- <span>반드시 '신청자격 리스트 및 확인서'를 체크해주시길 바랍니다.</span>--%>
            </div>
        </div>

        <table class="table table-bordered mt-2 align-middle">
            <tr>
                <td class="ctm-th ctm-w15p">전체 연구개발기간</td>
                <td class="d-flex justify-content-around">
                    <input class="form-control ps-3 ctm-w35p" value="2024-10-01" disabled readonly type="text">
                    <span class="ctm-w5p text-center pt-1 fw-bolder">~</span>
                    <input class="form-control ps-3 ctm-w35p" value="2028-12-31" disabled readonly type="text">
                    <input class="form-control ps-3 ctm-w15p" value="51 개월" disabled readonly type="text">
                </td>
                <td class="ctm-th ctm-w15p">(공고)연구기간</td>
                <td class="ctm-w20p">
                    <input class="form-control ps-3" value="자율구성" disabled readonly type="text">
                </td>
            </tr>
        </table>

        <div class="body-section">
            <table class="table table-bordered mt-2 mb-5 align-middle text-center table-hover">
                <tr>
                    <td class="ctm-th ctm-w15p">단계</td>
                    <td class="ctm-th ctm-w15p">연차</td>
                    <td class="ctm-th">연구개발시작일</td>
                    <td class="ctm-th">연구개발종료일</td>
                    <td class="ctm-th">개월 수</td>
                </tr>
                <%-- 부모 --%>
                <tr>
                    <td class="d-flex ctm-th__sub justify-content-around">
                        <div class="ctm-w45p text-center">1단계</div>
                        <div class="add-btn">
                            <span class="material-icons">add</span>
                        </div>
                    </td>
                    <td class="ctm-th__sub">-</td>
                    <td class="ctm-th__sub">2024-10-08</td>
                    <td class="ctm-th__sub">2025-12-31</td>
                    <td class="ctm-th__sub">15</td>
                </tr>
                <%-- 자식 --%>
                <tr>
                    <td>
                        <div class="text-center">1단계</div>
                    </td>
                    <td class="d-flex justify-content-around">
                        <div class="ctm-w45p text-center">1년차</div>
                        <div class="add-btn">
                            <span class="material-icons">add</span>
                        </div>
                    </td>
                    <td>
                        <input type="date" class="form-control ctm-datepicker" value="2024-10-08">
                    </td>
                    <td>
                        <input type="date" class="form-control ctm-datepicker" value="2024-12-30">
                    </td>
                    <td>3</td>
                </tr>
                <tr>
                    <td>
                        <div class="text-center">1단계</div>
                    </td>
                    <td class="d-flex justify-content-around">
                        <div class="ctm-w45p text-center">2년차</div>
                        <div class="add-btn">
                            <span class="material-icons">remove</span>
                        </div>
                    </td>
                    <td>
                        <input type="date" class="form-control ctm-datepicker" value="2024-12-31">
                    </td>
                    <td>
                        <input type="date" class="form-control ctm-datepicker" value="2025-12-31">
                    </td>
                    <td>12</td>
                </tr>
                <%-- 부모 --%>
                <tr>
                    <td class="d-flex ctm-th__sub justify-content-around">
                        <div class="ctm-w45p text-center">2단계</div>
                        <div class="add-btn">
                            <span class="material-icons">add</span>
                        </div>
                    </td>
                    <td class="ctm-th__sub">-</td>
                    <td class="ctm-th__sub">2026-01-01</td>
                    <td class="ctm-th__sub">2028-12-31</td>
                    <td class="ctm-th__sub">36</td>
                </tr>
                <%-- 자식 --%>
                <tr>
                    <td>
                        <div class="text-center">2단계</div>
                    </td>
                    <td class="d-flex justify-content-around">
                        <div class="ctm-w45p text-center">1년차</div>
                        <div class="add-btn">
                            <span class="material-icons">add</span>
                        </div>
                    </td>
                    <td>
                        <input type="date" class="form-control ctm-datepicker" value="2026-01-01">
                    </td>
                    <td>
                        <input type="date" class="form-control ctm-datepicker" value="2026-12-31">
                    </td>
                    <td>12</td>
                </tr>
                <tr>
                    <td>
                        <div class="text-center">2단계</div>
                    </td>
                    <td class="d-flex justify-content-around">
                        <div class="ctm-w45p text-center">2년차</div>
                        <div class="add-btn">
                            <span class="material-icons">remove</span>
                        </div>
                    </td>
                    <td>
                        <input type="date" class="form-control ctm-datepicker" value="2027-01-01">
                    </td>
                    <td>
                        <input type="date" class="form-control ctm-datepicker" value="2027-12-31">
                    </td>
                    <td>12</td>
                </tr>
                <tr>
                    <td>
                        <div class="text-center">2단계</div>
                    </td>
                    <td class="d-flex justify-content-around">
                        <div class="ctm-w45p text-center">3년차</div>
                        <div class="add-btn">
                            <span class="material-icons">remove</span>
                        </div>
                    </td>
                    <td>
                        <input type="date" class="form-control ctm-datepicker" value="2028-01-01">
                    </td>
                    <td>
                        <input type="date" class="form-control ctm-datepicker" value="2028-12-31">
                    </td>
                    <td>12</td>
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
                <tr>
                    <td class="ctm-th ctm-w15p" rowspan="6">개별연구개발</td>
                    <td class="ctm-th__sub ctm-w5p" rowspan="2">1단계</td>
                    <td class="ctm-th__sub ctm-w10p">
                        <span class="required-item">* </span>
                        단계목표내용
                    </td>
                    <td>
                        <textarea class="form-control" minlength="25" maxlength="2000" rows="3"></textarea>
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
                    <td class="ctm-th__sub ctm-w10p">
                        <span class="required-item">* </span>
                        연구개발내용
                    </td>
                    <td>
                        <textarea class="form-control" minlength="100" maxlength="2000" rows="3"></textarea>
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
                    <td class="ctm-th__sub ctm-w5p" rowspan="2">2단계</td>
                    <td class="ctm-th__sub ctm-w10p">
                        <span class="required-item">* </span>
                        단계목표내용
                    </td>
                    <td>
                        <textarea class="form-control" minlength="25" maxlength="2000" rows="3"></textarea>
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
                    <td class="ctm-th__sub ctm-w10p">
                        <span class="required-item">* </span>
                        연구개발내용
                    </td>
                    <td>
                        <textarea class="form-control" minlength="100" maxlength="2000" rows="3"></textarea>
                        <div class="ctm-f">
                            <span class="fz14">최소 100자 이상</span>
                            <div>
                                <span>0</span>
                                <span> / 2000</span>
                            </div>
                        </div>
                    </td>
                </tr>
                <%--                <tr>--%>
                <%--                    <td class="ctm-th__sub ctm-w5p" rowspan="2">3단계</td>--%>
                <%--                    <td class="ctm-th__sub ctm-w10p">--%>
                <%--                        <span class="required-item">* </span>--%>
                <%--                        단계목표내용--%>
                <%--                    </td>--%>
                <%--                    <td>--%>
                <%--                        <textarea class="form-control" minlength="25" maxlength="2000" rows="3"></textarea>--%>
                <%--                        <div class="ctm-f">--%>
                <%--                            <span class="fz14">최소 25자 이상</span>--%>
                <%--                            <div>--%>
                <%--                                <span>0</span>--%>
                <%--                                <span> / 2000</span>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                    </td>--%>
                <%--                </tr>--%>
                <%--                <tr>--%>
                <%--                    <td class="ctm-th__sub ctm-w10p">--%>
                <%--                        <span class="required-item">* </span>--%>
                <%--                        연구개발내용--%>
                <%--                    </td>--%>
                <%--                    <td>--%>
                <%--                        <textarea class="form-control" minlength="100" maxlength="2000" rows="3"></textarea>--%>
                <%--                        <div class="ctm-f">--%>
                <%--                            <span class="fz14">최소 100자 이상</span>--%>
                <%--                            <div>--%>
                <%--                                <span>0</span>--%>
                <%--                                <span> / 2000</span>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                    </td>--%>
                <%--                </tr>--%>
            </table>
        </div>
    </div>
</div>
