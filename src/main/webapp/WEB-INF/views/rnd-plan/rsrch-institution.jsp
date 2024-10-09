<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<link rel="stylesheet" href="/resources/css/rnd-plan/common-rnd.css"/>

<div class="main">
    <%-- 연구개발기관 정보 --%>
    <div class="mt-5">
        <div class="header-section">
            <div class="header-section__title">
                <h5>연구개발기관 정보</h5>
            </div>
            <div class="header-section__btn">
                <div class="ctm-btn-hover">
                    <span class="material-icons ctm-icon">help</span>
                    기관유형별 표준 간접비고시율
                </div>
            </div>
        </div>
        <div class="body-section">
            <table class="table table-bordered mt-2">
                <thead>
                <tr>
                    <td class="ctm-th">기관역할</td>
                    <td class="ctm-th">연구개발기관명</td>
                    <td class="ctm-th">사업자 등록번호</td>
                    <td class="ctm-th">기업유형</td>
                    <td class="ctm-th">소재지</td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        <input class="form-control ctm-td" value="주관연구개발기관" disabled readonly type="text">
                    </td>
                    <td>
                        <input class="form-control ctm-td" value="강남대학교" disabled readonly type="text">
                    </td>
                    <td>
                        <input class="form-control ctm-td" value="123-25-89675" disabled readonly type="text">
                    </td>
                    <td>
                        <input class="form-control ctm-td" value="대학(4년이상)" disabled readonly type="text">
                    </td>
                    <td>
                        <input class="form-control ctm-td" value="경기도 광주시" disabled readonly type="text">
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <%-- 연구원 구성 --%>
    <div class="mt-5">
        <div class="header-section">
            <div class="header-section__title">
                <h5>연구원 구성</h5>
            </div>
            <div class="header-section__btn">
                <div class="ctm-btn ctm-btn-normal ctm-w45p ctm-h30 fz14">
                    <span class="material-icons ctm-icon">share</span>
                    연구원 정보 불러오기
                </div>
                <div class="ctm-btn ctm-btn-outline fz14 ms-4 me-2">
                    <span class="material-icons ctm-icon ctm-icon-main-clr">group_remove</span>
                    연구원 삭제
                </div>
                <div class="ctm-btn ctm-btn-outline fz14">
                    <span class="material-icons ctm-icon ctm-icon-main-clr">group_add</span>
                    연구원 추가
                </div>
            </div>
        </div>
        <div class="body-section">
            <table class="table table-bordered mt-2 table-hover align-middle">
                <thead>
                <tr>
                    <td class="ctm-th ctm-w5p" rowspan="2"></td>
                    <td class="ctm-th ctm-w15p align-middle" rowspan="2">인력역할</td>
                    <td class="ctm-th ctm-w15p align-middle" rowspan="2">참여구분</td>
                    <td class="ctm-th align-middle" rowspan="2">성명</td>
                    <td class="ctm-th" colspan="5">참여연차</td>
                    <td class="ctm-th align-middle" rowspan="2">직위</td>
                    <td class="ctm-th ctm-w15p align-middle" rowspan="2">국가연구자번호</td>
                </tr>
                <tr>
                    <td class="ctm-th__sub ctm-w5p fw-bold">1-1</td>
                    <td class="ctm-th__sub ctm-w5p fw-bold">1-2</td>
                    <td class="ctm-th__sub ctm-w5p fw-bold">2-1</td>
                    <td class="ctm-th__sub ctm-w5p fw-bold">2-2</td>
                    <td class="ctm-th__sub ctm-w5p fw-bold">3-1</td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        <input class="form-check-input ctm-td-btn-center ctm-rdo-btn" type="radio"
                               name="flexRadioDefault"
                               id="flexRadioDefault1">
                    </td>
                    <td>
                        <select class="form-select form-select-sm">
                            <option selected value="1">연구책임자</option>
                            <option value="2">참여연구자</option>
                            <option value="3">연구지원인력</option>
                        </select>
                    </td>
                    <td>
                        <select class="form-select form-select-sm">
                            <option selected value="1">내부연구원</option>
                            <option value="2">외부연구원</option>
                            <option value="3">학생</option>
                        </select>
                    </td>
                    <td class="text-center">황철원</td>
                    <td>
                        <input class="form-check-input ctm-td-btn-center" type="checkbox" value="" checked/>
                    </td>
                    <td>
                        <input class="form-check-input ctm-td-btn-center" type="checkbox" value="" checked/>
                    </td>
                    <td>
                        <input class="form-check-input ctm-td-btn-center" type="checkbox" value="" checked/>
                    </td>
                    <td>
                        <input class="form-check-input ctm-td-btn-center" type="checkbox" value="" checked/>
                    </td>
                    <td>
                        <input class="form-check-input ctm-td-btn-center" type="checkbox" value="" checked/>
                    </td>
                    <td class="text-center">학부연구생</td>
                    <td class="text-center">192347283</td>
                </tr>
                <tr>
                    <td>
                        <input class="form-check-input ctm-td-btn-center ctm-rdo-btn" type="radio"
                               name="flexRadioDefault"/>
                    </td>
                    <td>
                        <select class="form-select form-select-sm">
                            <option selected value="1">연구책임자</option>
                            <option value="2">참여연구자</option>
                            <option value="3">연구지원인력</option>
                        </select>
                    </td>
                    <td>
                        <select class="form-select form-select-sm">
                            <option selected value="1">내부연구원</option>
                            <option value="2">외부연구원</option>
                            <option value="3">학생</option>
                        </select>
                    </td>
                    <td class="text-center">김상학</td>
                    <td>
                        <input class="form-check-input ctm-td-btn-center" type="checkbox" value="" checked/>
                    </td>
                    <td>
                        <input class="form-check-input ctm-td-btn-center" type="checkbox" value="" checked/>
                    </td>
                    <td>
                        <input class="form-check-input ctm-td-btn-center" type="checkbox" value="" checked/>
                    </td>
                    <td>
                        <input class="form-check-input ctm-td-btn-center" type="checkbox" value="" checked/>
                    </td>
                    <td>
                        <input class="form-check-input ctm-td-btn-center" type="checkbox" value="" checked/>
                    </td>
                    <td class="text-center">학생</td>
                    <td class="text-center">125647231</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <%-- 연구원 연차별 참여기간 --%>
    <div class="mt-5">
        <div class="header-section">
            <div class="header-section__title">
                <h6>> 연구원 연차별 참여기간</h6>
            </div>
        </div>
        <div class="body-section">
            <table class="table table-bordered mt-2 table-hover align-middle">
                <thead>
                <tr>
                    <td class="ctm-th ctm-w10p align-middle" rowspan="2">연구자명</td>
                    <td class="ctm-th ctm-w5p align-middle fz14" rowspan="2">참여<br/>연차</td>
                    <td class="ctm-th ctm-w5p align-middle fz14" rowspan="2">참여<br/>여부</td>
                    <td class="ctm-th text-center" colspan="4">학위 및 전공</td>
                    <td class="ctm-th text-center" colspan="2">참여정보</td>
                </tr>
                <tr>
                    <td class="ctm-th__sub ctm-w10p text-center">최종학위</td>
                    <td class="ctm-th__sub ctm-w15p text-center">전공계열</td>
                    <td class="ctm-th__sub ctm-w15p text-center">전공명</td>
                    <td class="ctm-th__sub ctm-w7p text-center">취득연도</td>
                    <td class="ctm-th__sub text-center">참여시작일자</td>
                    <td class="ctm-th__sub text-center">참여종료일자</td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="text-center">황철원</td>
                    <td class="text-center">1-1</td>
                    <td>
                        <input class="form-check-input ctm-td-btn-center" type="checkbox" value="" checked/>
                    </td>
                    <td>
                        <select class="form-select form-select-sm">
                            <option selected value="1">전문학사</option>
                            <option value="2">학사</option>
                            <option value="3">전문석사</option>
                            <option value="4">석사</option>
                            <option value="5">전문박사</option>
                            <option value="6">박사</option>
                        </select>
                    </td>
                    <td>
                        <select class="form-select form-select-sm">
                            <option selected value="1">기타</option>
                        </select>
                    </td>
                    <td>
                        <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                    </td>
                    <td>
                        <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                    </td>
                    <td>
                        <input type="date" class="form-control form-control-sm text-center" value="2024-10-08">
                    </td>
                    <td>
                        <input type="date" class="form-control form-control-sm text-center" value="2024-10-08">
                    </td>
                </tr>
                <tr>
                    <td class="text-center">황철원</td>
                    <td class="text-center">1-2</td>
                    <td>
                        <input class="form-check-input ctm-td-btn-center" type="checkbox" value="" checked/>
                    </td>
                    <td>
                        <select class="form-select form-select-sm">
                            <option selected value="1">전문학사</option>
                            <option value="2">학사</option>
                            <option value="3">전문석사</option>
                            <option value="4">석사</option>
                            <option value="5">전문박사</option>
                            <option value="6">박사</option>
                        </select>
                    </td>
                    <td>
                        <select class="form-select form-select-sm">
                            <option selected value="1">기타</option>
                        </select>
                    </td>
                    <td>
                        <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                    </td>
                    <td>
                        <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                    </td>
                    <td>
                        <input type="date" class="form-control form-control-sm text-center" value="2024-10-08">
                    </td>
                    <td>
                        <input type="date" class="form-control form-control-sm text-center" value="2024-10-08">
                    </td>
                </tr>
                <tr>
                    <td class="text-center">황철원</td>
                    <td class="text-center">2-1</td>
                    <td>
                        <input class="form-check-input ctm-td-btn-center" type="checkbox" value="" checked/>
                    </td>
                    <td>
                        <select class="form-select form-select-sm">
                            <option selected value="1">전문학사</option>
                            <option value="2">학사</option>
                            <option value="3">전문석사</option>
                            <option value="4">석사</option>
                            <option value="5">전문박사</option>
                            <option value="6">박사</option>
                        </select>
                    </td>
                    <td>
                        <select class="form-select form-select-sm">
                            <option selected value="1">기타</option>
                        </select>
                    </td>
                    <td>
                        <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                    </td>
                    <td>
                        <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                    </td>
                    <td>
                        <input type="date" class="form-control form-control-sm text-center" value="2024-10-08">
                    </td>
                    <td>
                        <input type="date" class="form-control form-control-sm text-center" value="2024-10-08">
                    </td>
                </tr>
                <tr>
                    <td class="text-center">황철원</td>
                    <td class="text-center">2-2</td>
                    <td>
                        <input class="form-check-input ctm-td-btn-center" type="checkbox" value="" checked/>
                    </td>
                    <td>
                        <select class="form-select form-select-sm">
                            <option selected value="1">전문학사</option>
                            <option value="2">학사</option>
                            <option value="3">전문석사</option>
                            <option value="4">석사</option>
                            <option value="5">전문박사</option>
                            <option value="6">박사</option>
                        </select>
                    </td>
                    <td>
                        <select class="form-select form-select-sm">
                            <option selected value="1">기타</option>
                        </select>
                    </td>
                    <td>
                        <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                    </td>
                    <td>
                        <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                    </td>
                    <td>
                        <input type="date" class="form-control form-control-sm text-center" value="2024-10-08">
                    </td>
                    <td>
                        <input type="date" class="form-control form-control-sm text-center" value="2024-10-08">
                    </td>
                </tr>
                <tr>
                    <td class="text-center">황철원</td>
                    <td class="text-center">3-1</td>
                    <td>
                        <input class="form-check-input ctm-td-btn-center" type="checkbox" value="" checked/>
                    </td>
                    <td>
                        <select class="form-select form-select-sm">
                            <option selected value="1">전문학사</option>
                            <option value="2">학사</option>
                            <option value="3">전문석사</option>
                            <option value="4">석사</option>
                            <option value="5">전문박사</option>
                            <option value="6">박사</option>
                        </select>
                    </td>
                    <td>
                        <select class="form-select form-select-sm">
                            <option selected value="1">기타</option>
                        </select>
                    </td>
                    <td>
                        <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                    </td>
                    <td>
                        <input class="form-control form-control-sm" value="" readonly disabled type="text"/>
                    </td>
                    <td>
                        <input type="date" class="form-control form-control-sm text-center" value="2024-10-08">
                    </td>
                    <td>
                        <input type="date" class="form-control form-control-sm text-center" value="2024-10-08">
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
