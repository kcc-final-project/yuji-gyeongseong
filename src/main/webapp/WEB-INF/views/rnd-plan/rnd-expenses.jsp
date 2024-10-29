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
                <div class="ctm-btn ctm-btn-outline" data-bs-toggle="modal" style="width : 240px; height: 35px"
                     data-bs-target="#progressHistoryModal">
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
                <table class="table table-bordered mt-2 table-hover align-middle">
                    <thead>
                    <tr>
                        <td class="ctm-th ctm-w5p align-middle" rowspan="2">단계</td>
                        <td class="ctm-th ctm-w5p align-middle fz14" rowspan="2">연차</td>
                        <td class="ctm-th ctm-w10p align-middle fz14" rowspan="2">기관 역할</td>
                        <td class="ctm-th ctm-w10p align-middle fz14" rowspan="2">연구개발기관명</td>
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
                        <td class="text-center ctm-th__sub" rowspan="2">1단계</td>
                        <td class="text-center">1년차</td>
                        <td class="text-center">주관연구기관</td>
                        <td class="text-center">서울대학교</td>
                        <td>
                            <input class="form-control form-control-sm" value="55,250" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="250" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="55,500" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1,000" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="56,500" readonly disabled type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">2년차</td>
                        <td class="text-center">주관연구기관</td>
                        <td class="text-center">서울대학교</td>
                        <td>
                            <input class="form-control form-control-sm" value="55,250" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="250" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="55,500" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1,000" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="56,500" readonly disabled type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center ctm-th__sub" rowspan="2">2단계</td>
                        <td class="text-center">1년차</td>
                        <td class="text-center">주관연구기관</td>
                        <td class="text-center">서울대학교</td>
                        <td>
                            <input class="form-control form-control-sm" value="55,250" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="250" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="55,500" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1,000" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="56,500" readonly disabled type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">2년차</td>
                        <td class="text-center">주관연구기관</td>
                        <td class="text-center">서울대학교</td>
                        <td>
                            <input class="form-control form-control-sm" value="55,250" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="250" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="55,500" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1,000" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="56,500" readonly disabled type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center ctm-th__sub">3단계</td>
                        <td class="text-center">1년차</td>
                        <td class="text-center">주관연구기관</td>
                        <td class="text-center">서울대학교</td>
                        <td>
                            <input class="form-control form-control-sm" value="55,250" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="250" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="55,500" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1,000" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="56,500" readonly disabled type="text"/>
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
                <table class="table table-bordered mt-2 table-hover align-middle">
                    <thead>
                    <tr>
                        <td class="ctm-th ctm-w5p align-middle" rowspan="2">단계</td>
                        <td class="ctm-th ctm-w5p align-middle fz14" rowspan="2">연차</td>
                        <td class="ctm-th ctm-w10p align-middle fz14" rowspan="2">기관 역할</td>
                        <td class="ctm-th ctm-w10p align-middle fz14" rowspan="2">연구개발<br/>기관명</td>
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
                        <td class="text-center ctm-th__sub" rowspan="2">1단계</td>
                        <td class="text-center">1년차</td>
                        <td class="text-center">주관연구기관</td>
                        <td class="text-center">서울대학교</td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="55,500" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1,000" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="56,500" readonly disabled type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">2년차</td>
                        <td class="text-center">주관연구기관</td>
                        <td class="text-center">서울대학교</td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="55,500" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1,000" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="56,500" readonly disabled type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center ctm-th__sub" rowspan="2">2단계</td>
                        <td class="text-center">1년차</td>
                        <td class="text-center">주관연구기관</td>
                        <td class="text-center">서울대학교</td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="55,500" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1,000" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="56,500" readonly disabled type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">2년차</td>
                        <td class="text-center">주관연구기관</td>
                        <td class="text-center">서울대학교</td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="55,500" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1,000" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="56,500" readonly disabled type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center ctm-th__sub">3단계</td>
                        <td class="text-center">1년차</td>
                        <td class="text-center">주관연구기관</td>
                        <td class="text-center">서울대학교</td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="25,000" type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="55,500" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1,000" readonly disabled type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="56,500" readonly disabled type="text"/>
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
                <table class="table table-bordered mt-2 table-hover align-middle">
                    <thead>
                    <tr>
                        <td class="ctm-th ctm-w5p align-middle" rowspan="2">단계</td>
                        <td class="ctm-th ctm-w5p align-middle fz14" rowspan="2">연차</td>
                        <td class="ctm-th ctm-w10p align-middle fz14" rowspan="2">기관 역할</td>
                        <td class="ctm-th ctm-w10p align-middle fz14" rowspan="2">연구개발기관명</td>
                        <td class="ctm-th ctm-w10p text-center" colspan="3">재원별 연구비 합계(A)</td>
                        <td class="ctm-th ctm-w10p text-center" colspan="3">재원별 연구비 합계(B)</td>
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
                        <td class="text-center ctm-th__sub" rowspan="2">1단계</td>
                        <td class="text-center">1년차</td>
                        <td class="text-center">주관연구기관</td>
                        <td class="text-center">서울대학교</td>
                        <td>
                            <input class="form-control form-control-sm" value="5,520" readonly type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="350" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="250" readonly type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="2,800" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1,000" readonly type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="8,600" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="9,500" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="5,500" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1,000" readonly  type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">2년차</td>
                        <td class="text-center">주관연구기관</td>
                        <td class="text-center">서울대학교</td>
                        <td>
                            <input class="form-control form-control-sm" value="5,520" readonly type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="350" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="250" readonly type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="2,800" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1,000" readonly type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="8,600" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="9,500" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="5,500" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1,000" readonly  type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center ctm-th__sub" rowspan="2">2단계</td>
                        <td class="text-center">1년차</td>
                        <td class="text-center">주관연구기관</td>
                        <td class="text-center">서울대학교</td>
                        <td>
                            <input class="form-control form-control-sm" value="5,520" readonly type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="350" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="250" readonly type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="2,800" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1,000" readonly type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="8,600" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="9,500" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="5,500" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1,000" readonly  type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center">2년차</td>
                        <td class="text-center">주관연구기관</td>
                        <td class="text-center">서울대학교</td>
                        <td>
                            <input class="form-control form-control-sm" value="5,520" readonly type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="350" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="250" readonly type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="2,800" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1,000" readonly type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="8,600" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="9,500" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="5,500" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1,000" readonly  type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center ctm-th__sub">3단계</td>
                        <td class="text-center">1년차</td>
                        <td class="text-center">주관연구기관</td>
                        <td class="text-center">서울대학교</td>
                        <td>
                            <input class="form-control form-control-sm" value="5,520" readonly type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="350" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="250" readonly type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="2,800" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1,000" readonly type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="8,600" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="9,500" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="5,500" readonly  type="text"/>
                        </td>
                        <td>
                            <input class="form-control form-control-sm" value="1,000" readonly  type="text"/>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
