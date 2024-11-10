<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<link rel="stylesheet" href="/resources/css/rnd-plan/common-rnd.css"/>

<div class="main">
    <div class="mt-5">
        <div class="header-section">
            <div class="header-section__title">
                <h5>재원별 연구개발비 구성</h5>
            </div>
            <div class="header-section__btn">
                <div class="ctm-btn ctm-btn-outline standard-inquiry" style="width : 240px; height: 35px">
                    <span class="material-icons ctm-icon">add_to_photos</span>연구개발비 구성 기준 조회
                </div>
            </div>
        </div>

        <div class="header-explain-section__info">
            <span class="material-icons ctm-icon">info</span>
            <h5 class="fz14" style="margin-left: 10px">재원별 연구비 합계에는 위탁기관 연구개발비를 제외한 합계가 표시됩니다.</h5>
        </div>

        <div class="mt-1">
            <div class="body-section">
                <table class="table table-bordered mt-2 table-hover align-middle  research-expenses-table">
                    <thead>
                    <tr>
                        <td class="ctm-th ctm-w5p align-middle" rowspan="2">단계</td>
                        <td class="ctm-th ctm-w5p align-middle fz14" rowspan="2">연차</td>
                        <td class="ctm-th ctm-w10p align-middle fz14" rowspan="2">기관 역할</td>
                        <td class="ctm-th ctm-w5p text-center" colspan="2">정부지원금</td>
                        <td class="ctm-th ctm-w20p text-center" colspan="5">연구개발기관 부담금</td>
                        <td class="ctm-th ctm-w10p text-center" colspan="3">재원별 연구비 합계(A)</td>
                    </tr>
                    <tr>
                        <td class="ctm-th__sub ctm-w7p text-center">현금</td>
                        <td class="ctm-th__sub ctm-w5p text-center">비율(%)</td>
                        <td class="ctm-th__sub ctm-w7p text-center">현금</td>
                        <td class="ctm-th__sub ctm-w5p text-center">비율(%)</td>
                        <td class="ctm-th__sub ctm-w7p text-center">현물</td>
                        <td class="ctm-th__sub ctm-w5p text-center">비율(%)</td>
                        <td class="ctm-th__sub ctm-w5p text-center">소계</td>
                        <td class="ctm-th__sub ctm-w6p  text-center">현금</td>
                        <td class="ctm-th__sub ctm-w6p  text-center">현물</td>
                        <td class="ctm-th__sub ctm-w6p  text-center">소계</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="text-center ctm-th__sub">1단계</td>
                        <td class="text-center">1년차</td>
                        <td class="text-center">주관연구기관</td>
                         
                        <td>
                            <input class="form-control form-control-sm gov-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm gov-rate-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-rate-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-inkind-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-inkind-rate-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center ctm-th__sub">1단계</td>
                        <td class="text-center">2년차</td>
                        <td class="text-center">주관연구기관</td>
                         
                        <td>
                            <input class="form-control form-control-sm gov-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm gov-rate-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-rate-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-inkind-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-inkind-rate-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center ctm-th__sub">2단계</td>
                        <td class="text-center">1년차</td>
                        <td class="text-center">주관연구기관</td>
                         
                        <td>
                            <input class="form-control form-control-sm gov-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm gov-rate-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-rate-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-inkind-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-inkind-rate-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center ctm-th__sub">2단계</td>
                        <td class="text-center">2년차</td>
                        <td class="text-center">주관연구기관</td>
                         
                        <td>
                            <input class="form-control form-control-sm gov-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm gov-rate-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-rate-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-inkind-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-inkind-rate-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center ctm-th__sub">3단계</td>
                        <td class="text-center">1년차</td>
                        <td class="text-center">주관연구기관</td>
                         
                        <td>
                            <input class="form-control form-control-sm gov-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm gov-rate-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-rate-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-inkind-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-inkind-rate-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm inst-burden-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="mt-5">
        <div class="header-section">
            <div class="header-section__title">
                <h5>비목별 연구개발비 구성</h5>
            </div>
        </div>
        <div class="mt-1">
            <div class="body-section">
                <table class="table table-bordered mt-2 table-hover align-middle budget-expenses-table">
                    <thead>
                    <tr>
                        <td class="ctm-th ctm-w5p align-middle" rowspan="2">단계</td>
                        <td class="ctm-th ctm-w5p align-middle fz14" rowspan="2">연차</td>
                        <td class="ctm-th ctm-w10p align-middle fz14" rowspan="2">기관 역할</td>
                        <td class="ctm-th ctm-w5p text-center" colspan="2">총 인건비</td>
                        <td class="ctm-th ctm-w5p text-center" colspan="2">연구시설.장비비</td>
                        <td class="ctm-th ctm-w5p text-center" colspan="2">연구개발부담비</td>
                        <td class="ctm-th ctm-w5p text-center" colspan="2">연구수당</td>
                        <td class="ctm-th ctm-w10p text-center" colspan="3">비목별 연구비 합계(B)</td>
                    </tr>
                    <tr>
                        <td class="ctm-th__sub ctm-w6p  text-center">현금</td>
                        <td class="ctm-th__sub ctm-w6p  text-center">현물</td>
                        <td class="ctm-th__sub ctm-w6p  text-center">현금</td>
                        <td class="ctm-th__sub ctm-w6p  text-center">현물</td>
                        <td class="ctm-th__sub ctm-w6p  text-center">현금</td>
                        <td class="ctm-th__sub ctm-w6p  text-center">현물</td>
                        <td class="ctm-th__sub ctm-w6p  text-center">현금</td>
                        <td class="ctm-th__sub ctm-w6p  text-center">현물</td>
                        <td class="ctm-th__sub ctm-w6p  text-center">현금</td>
                        <td class="ctm-th__sub ctm-w6p  text-center">현물</td>
                        <td class="ctm-th__sub ctm-w6p  text-center">소계</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="text-center ctm-th__sub">1단계</td>
                        <td class="text-center">1년차</td>
                        <td class="text-center">주관연구기관</td>
                         
                        <!-- 총 인건비 -->
                        <td>
                            <input class="form-control form-control-sm budget-labor-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-labor-inkind-input" value="" type="text"/>
                        </td>
                        <!-- 연구시설.장비비 -->
                        <td>
                            <input class="form-control form-control-sm budget-facility-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-facility-inkind-input" value="" type="text"/>
                        </td>
                        <!-- 연구개발부담비 -->
                        <td>
                            <input class="form-control form-control-sm budget-development-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-development-inkind-input" value="" type="text"/>
                        </td>
                        <!-- 연구수당 -->
                        <td>
                            <input class="form-control form-control-sm budget-allowance-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-allowance-inkind-input" value="" type="text"/>
                        </td>
                        <!-- 비목별 연구비 합계(B) -->
                        <td>
                            <input class="form-control form-control-sm budget-total-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-total-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-total-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center ctm-th__sub">1단계</td>
                        <td class="text-center">2년차</td>
                        <td class="text-center">주관연구기관</td>
                         
                        <!-- 총 인건비 -->
                        <td>
                            <input class="form-control form-control-sm budget-labor-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-labor-inkind-input" value="" type="text"/>
                        </td>
                        <!-- 연구시설.장비비 -->
                        <td>
                            <input class="form-control form-control-sm budget-facility-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-facility-inkind-input" value="" type="text"/>
                        </td>
                        <!-- 연구개발부담비 -->
                        <td>
                            <input class="form-control form-control-sm budget-development-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-development-inkind-input" value="" type="text"/>
                        </td>
                        <!-- 연구수당 -->
                        <td>
                            <input class="form-control form-control-sm budget-allowance-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-allowance-inkind-input" value="" type="text"/>
                        </td>
                        <!-- 비목별 연구비 합계(B) -->
                        <td>
                            <input class="form-control form-control-sm budget-total-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-total-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-total-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center ctm-th__sub" >2단계</td>
                        <td class="text-center">1년차</td>
                        <td class="text-center">주관연구기관</td>
                         
                        <!-- 총 인건비 -->
                        <td>
                            <input class="form-control form-control-sm budget-labor-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-labor-inkind-input" value="" type="text"/>
                        </td>
                        <!-- 연구시설.장비비 -->
                        <td>
                            <input class="form-control form-control-sm budget-facility-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-facility-inkind-input" value="" type="text"/>
                        </td>
                        <!-- 연구개발부담비 -->
                        <td>
                            <input class="form-control form-control-sm budget-development-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-development-inkind-input" value="" type="text"/>
                        </td>
                        <!-- 연구수당 -->
                        <td>
                            <input class="form-control form-control-sm budget-allowance-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-allowance-inkind-input" value="" type="text"/>
                        </td>
                        <!-- 비목별 연구비 합계(B) -->
                        <td>
                            <input class="form-control form-control-sm budget-total-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-total-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-total-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center ctm-th__sub" >2단계</td>
                        <td class="text-center">2년차</td>
                        <td class="text-center">주관연구기관</td>
                         
                        <!-- 총 인건비 -->
                        <td>
                            <input class="form-control form-control-sm budget-labor-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-labor-inkind-input" value="" type="text"/>
                        </td>
                        <!-- 연구시설.장비비 -->
                        <td>
                            <input class="form-control form-control-sm budget-facility-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-facility-inkind-input" value="" type="text"/>
                        </td>
                        <!-- 연구개발부담비 -->
                        <td>
                            <input class="form-control form-control-sm budget-development-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-development-inkind-input" value="" type="text"/>
                        </td>
                        <!-- 연구수당 -->
                        <td>
                            <input class="form-control form-control-sm budget-allowance-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-allowance-inkind-input" value="" type="text"/>
                        </td>
                        <!-- 비목별 연구비 합계(B) -->
                        <td>
                            <input class="form-control form-control-sm budget-total-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-total-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-total-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center ctm-th__sub">3단계</td>
                        <td class="text-center">1년차</td>
                        <td class="text-center">주관연구기관</td>
                         
                        <!-- 총 인건비 -->
                        <td>
                            <input class="form-control form-control-sm budget-labor-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-labor-inkind-input" value="" type="text"/>
                        </td>
                        <!-- 연구시설.장비비 -->
                        <td>
                            <input class="form-control form-control-sm budget-facility-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-facility-inkind-input" value="" type="text"/>
                        </td>
                        <!-- 연구개발부담비 -->
                        <td>
                            <input class="form-control form-control-sm budget-development-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-development-inkind-input" value="" type="text"/>
                        </td>
                        <!-- 연구수당 -->
                        <td>
                            <input class="form-control form-control-sm budget-allowance-cash-input" value="" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-allowance-inkind-input" value="" type="text"/>
                        </td>
                        <!-- 비목별 연구비 합계(B) -->
                        <td>
                            <input class="form-control form-control-sm budget-total-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-total-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm budget-total-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="mt-5">
        <div class="header-section">
            <div class="header-section__title">
                <h4>연구개발비 사용 계획</h4>
            </div>
        </div>

        <div class="header-section">
            <h5 class="fz14" style="margin-left: 10px">재원별 비목별 연구비 비교</h5>
        </div>

        <div class="header-explain-section__info">
            <span class="material-icons ctm-icon">info</span>
            <h5 class="fz14" style="margin-left: 10px">연구기관의 해당 연차를 선택한 후 비목별 연구비 구성을 작성합니다.</h5>
        </div>

        <div class="header-explain-warn-section__info">
            <span class="material-icons ctm-icon">info</span>
            <h5 class="fz14" style="margin-left: 10px">기관별 모든연차의 비목별 연구비를 작성해 주세요. (저장 시 모든연차의 연구비 작성기준을 체크합니다. 임시저장기능은 작성기준 체크없이 저장됩니다.)</h5>
        </div>

        <div class="mt-1">
            <div class="body-section">
                <table class="table table-bordered mt-2 table-hover align-middle total_expenses">
                    <thead>
                    <tr>
                        <td class="ctm-th ctm-w5p align-middle" rowspan="2">단계</td>
                        <td class="ctm-th ctm-w5p align-middle fz14" rowspan="2">연차</td>
                        <td class="ctm-th ctm-w10p align-middle fz14" rowspan="2">기관 역할</td>
                        <td class="ctm-th ctm-w10p text-center" colspan="3">재원별 연구비 합계(A)</td>
                        <td class="ctm-th ctm-w10p text-center" colspan="3">비목별 연구비 합계(B)</td>
                        <td class="ctm-th ctm-w10p text-center" colspan="3">차액(A-B)</td>
                    </tr>
                    <tr>
                        <td class="ctm-th__sub ctm-w6p  text-center">현금</td>
                        <td class="ctm-th__sub ctm-w6p  text-center">현물</td>
                        <td class="ctm-th__sub ctm-w6p  text-center">소계</td>
                        <td class="ctm-th__sub ctm-w6p  text-center">현금</td>
                        <td class="ctm-th__sub ctm-w6p  text-center">현물</td>
                        <td class="ctm-th__sub ctm-w6p  text-center">소계</td>
                        <td class="ctm-th__sub ctm-w6p  text-center">현금</td>
                        <td class="ctm-th__sub ctm-w6p  text-center">현물</td>
                        <td class="ctm-th__sub ctm-w6p  text-center">소계</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="text-center ctm-th__sub">1단계</td>
                        <td class="text-center">1년차</td>
                        <td class="text-center">주관연구기관</td>
                         
                        <!-- 재원별 연구비 합계(A) -->
                        <td>
                            <input class="form-control form-control-sm total-a-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-a-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-a-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                        <!-- 비목별 연구비 합계(B) -->
                        <td>
                            <input class="form-control form-control-sm total-b-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-b-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-b-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                        <!-- 차액(A-B) -->
                        <td>
                            <input class="form-control form-control-sm total-diff-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-diff-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-diff-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center ctm-th__sub">1단계</td>
                        <td class="text-center">2년차</td>
                        <td class="text-center">주관연구기관</td>
                         
                        <!-- 재원별 연구비 합계(A) -->
                        <td>
                            <input class="form-control form-control-sm total-a-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-a-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-a-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                        <!-- 비목별 연구비 합계(B) -->
                        <td>
                            <input class="form-control form-control-sm total-b-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-b-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-b-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                        <!-- 차액(A-B) -->
                        <td>
                            <input class="form-control form-control-sm total-diff-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-diff-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-diff-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center ctm-th__sub">2단계</td>
                        <td class="text-center">1년차</td>
                        <td class="text-center">주관연구기관</td>
                         
                        <!-- 재원별 연구비 합계(A) -->
                        <td>
                            <input class="form-control form-control-sm total-a-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-a-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-a-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                        <!-- 비목별 연구비 합계(B) -->
                        <td>
                            <input class="form-control form-control-sm total-b-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-b-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-b-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                        <!-- 차액(A-B) -->
                        <td>
                            <input class="form-control form-control-sm total-diff-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-diff-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-diff-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center ctm-th__sub">2단계</td>
                        <td class="text-center">2년차</td>
                        <td class="text-center">주관연구기관</td>
                         
                        <!-- 재원별 연구비 합계(A) -->
                        <td>
                            <input class="form-control form-control-sm total-a-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-a-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-a-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                        <!-- 비목별 연구비 합계(B) -->
                        <td>
                            <input class="form-control form-control-sm total-b-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-b-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-b-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                        <!-- 차액(A-B) -->
                        <td>
                            <input class="form-control form-control-sm total-diff-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-diff-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-diff-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center ctm-th__sub">3단계</td>
                        <td class="text-center">1년차</td>
                        <td class="text-center">주관연구기관</td>
                         
                        <!-- 재원별 연구비 합계(A) -->
                        <td>
                            <input class="form-control form-control-sm total-a-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-a-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-a-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                        <!-- 비목별 연구비 합계(B) -->
                        <td>
                            <input class="form-control form-control-sm total-b-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-b-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-b-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                        <!-- 차액(A-B) -->
                        <td>
                            <input class="form-control form-control-sm total-diff-cash-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-diff-inkind-input" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm total-diff-subtotal-input" value="" readonly disabled type="text"/>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>


<script src="/resources/js/rnd-plan/rnd-expenses.js"></script>

