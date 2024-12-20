<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="/resources/css/rnd-plan/common-rnd.css"/>



<script>
    var rndPeriods = [
        <c:forEach var="period" items="${taskSummaryResponse.rndPeriods}" varStatus="status">
        {
            startedAt: '${fn:substring(period.startedAt, 0, 10)}',
            endedAt: '${fn:substring(period.endedAt, 0, 10)}'
        }<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];

</script>


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
                        <input class="form-control ctm-td" id="rnd-institution-iarType"
                               value="${rndPlanRsrch.institution.iarType}" disabled readonly type="text">
                    </td>
                    <td>
                        <input class="form-control ctm-td" id="rnd-institution-name"
                               value="${rndPlanRsrch.institution.name}" disabled readonly type="text">
                    </td>
                    <td>
                        <input class="form-control ctm-td" id="rnd-institution-regNo"
                               value="${rndPlanRsrch.institution.businessRegisterNo}" disabled readonly type="text">
                    </td>
                    <td>
                        <input class="form-control ctm-td" id="rnd-institution-cpType"
                               value="${rndPlanRsrch.institution.companyType}" disabled readonly type="text">
                    </td>
                    <td>
                        <input class="form-control ctm-td" id="rnd-institution-address"
                               value="${rndPlanRsrch.institution.address}" disabled readonly type="text">
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
            <div class="header-section__btn ctm-w35p">
                <div id = "deleteResearcherButton"  class="ctm-btn ctm-btn-outline ctm-w45p fz14">
                    <span class="material-icons ctm-icon me-2">delete</span>
                    <span>연구원 삭제</span>
                </div>
                <div class="ctm-btn ctm-btn-normal ctm-w35p ctm-h30 fz14  ms-3" id = "temptemp">
                    <span class="material-icons ctm-icon me-2">share</span>
                    <span>불러오기</span>
                </div>
                <div class="ctm-btn ctm-btn-outline ctm-w45p fz14 ms-3" data-bs-toggle="modal"
                     data-bs-target="#rsrchModal">
                    <span class="material-icons ctm-icon ctm-icon-main-clr">group_add</span>
                    <span>연구원 추가</span>
                </div>
            </div>
        </div>
        <div class="body-section">
            <table class="table table-bordered mt-2 table-hover align-middle research-composition-table">
                <thead>
                <tr>
                    <td class="ctm-th ctm-w5p" rowspan="2"></td>
                    <td class="ctm-th ctm-w15p align-middle" rowspan="2">인력역할</td>
                    <td class="ctm-th ctm-w15p align-middle" rowspan="2">참여구분</td>
                    <td class="ctm-th align-middle" rowspan="2">성명</td>
                    <td class="ctm-th align-middle" rowspan="2">직위</td>
                    <td class="ctm-th ctm-w15p align-middle" rowspan="2">국가연구자번호</td>
                </tr>
                </thead>
                <tbody>
                <tr data-id="0">
                    <td>
                        <input class="form-check-input ctm-td-btn-center ctm-rdo-btn" type="radio" checked
                               name="researcherSelect"
                               id="researcherSelect0">
                    </td>
                    <td>
                        <select class="form-select form-select-sm manpowerRole">
                            <option selected value="연구책임자">연구책임자</option>
                            <option value="참여연구자">참여연구자</option>
                            <option value="연구지원인력">연구지원인력</option>
                        </select>
                    </td>
                    <td>
                        <select class="form-select form-select-sm partType">
                            <option selected value="내부연구원">내부연구원</option>
                            <option value="외부연구원">외부연구원</option>
                            <option value="학생">학생</option>
                        </select>
                    </td>
                    <td class="text-center">${rndPlanRsrch.member.name}</td>
                    <td class="text-center">${rndPlanRsrch.member.position}</td>
                    <td class="text-center">${rndPlanRsrch.member.rsrchNo}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <%-- 연구원 인력 모달창 --%>
    <div class="modal fade overflow-hidden" id="rsrchModal" tabindex="-1" aria-labelledby="rsrchModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-xl ctm-rsrchModal-position">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fz16" id="techFieldModalLabel">연구원 검색</h1>
                </div>
                <div class="modal-body ctm-rsrch-mbody">
                    <table class="table table-bordered mt-2 align-middle">
                        <tr>
                            <td class="ctm-th ctm-w20p">성명</td>
                            <td class="ctm-th">
                                <input id="name" class="form-control form-control-sm" type="text">
                            </td>
                            <td class="ctm-th ctm-w20p">국가연구자번호</td>
                            <td class="ctm-th">
                                <input id="rsrchNo" class="form-control form-control-sm" type="text">
                            </td>
                            <td rowspan="2">
                                <button type="button" id="search-button" class="ctm-btn-orange-search">검색</button>
                            </td>
                        </tr>
                        <tr>
                            <td class="ctm-th ctm-w20p">소속기관</td>
                            <td class="ctm-th">
                                <input id="institution" class="form-control form-control-sm" type="text">
                            </td>
                            <td class="ctm-th ctm-w20p">부서</td>
                            <td class="ctm-th">
                                <input id="department" class="form-control form-control-sm" type="text">
                            </td>
                        </tr>
                    </table>

                    <div class="ctm-f-col-center">
                        <div class="ctm-w100p">
                            <div class="ctm-f-center-between mb-2">
                                <h5 class="rsrch-section__title">인력목록</h5>
                                <span>전체 <span>1</span>건</span>
                            </div>

                            <div class="rsrch-table">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <td class="ctm-th ctm-tb-w58 select">
                                            <input id="select-all" class="form-check-input ctm-td-btn-center"
                                                   type="checkbox"
                                                   value=""/>
                                        </td>
                                        <td class="ctm-th ctm-tb-w117">성명</td>
                                        <td class="ctm-th ctm-tb-w176">연구자번호</td>
                                        <td class="ctm-th ctm-tb-w234">소속기관</td>
                                        <td class="ctm-th ctm-tb-w176">부서</td>
                                        <td class="ctm-th ctm-tb-w190">직위</td>
                                        <td class="ctm-th ctm-tb-w117">생년월일</td>
                                    </tr>
                                    </thead>
                                </table>
                                <div class="ctm-tb-scroll2">
                                    <table class="table table-sm table-bordered table-striped table-hover">
                                        <tbody>

                                        <c:forEach var="member" items="${memberList}">
                                            <tr>
                                                <td class="text-center ctm-w5p">
                                                    <input class="form-check-input ctm-td-btn-center row-checkbox"
                                                           type="checkbox"
                                                           value=""/>
                                                </td>
                                                <td class="text-center ctm-w10p name">${member.name}</td>
                                                <td class="text-center ctm-w15p rsrchNo">${member.rsrch_no}</td>
                                                <td class="text-center ctm-w20p institution">${member.institution_name}</td>
                                                <td class="text-center ctm-w15p department">${member.affil_dept}</td>
                                                <td class="text-center ctm-w15p">${member.position}</td>
                                                <td class="text-center ctm-w10p">${member.birth}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="ctm-w100p ctm-f-center gap-3 mt-3 my-3">
                            <div class="ctm-arrow-btn__row ctm-f-center" id="btn-add-selected">
                                <span class="material-icons">keyboard_arrow_down</span>
                            </div>
                            <div class="ctm-arrow-btn__row ctm-f-center" id="btn-remove-selected">
                                <span class="material-icons">keyboard_arrow_up</span>
                            </div>
                        </div>

                        <div class="ctm-w100p">
                            <div class="ctm-f-center-between mb-2">
                                <h5 class="rsrch-section__title">선택 인력목록</h5>
                                <span>전체 <span>1</span>건</span>
                            </div>

                            <div class="rsrch-table">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <td class="ctm-th ctm-tb-w58">
                                            <input id="select-all2" class="form-check-input ctm-td-btn-center"
                                                   type="checkbox"
                                                   value=""/>
                                        </td>
                                        <td class="ctm-th ctm-tb-w117">성명</td>
                                        <td class="ctm-th ctm-tb-w176">연구자번호</td>
                                        <td class="ctm-th ctm-tb-w234">소속기관</td>
                                        <td class="ctm-th ctm-tb-w176">부서</td>
                                        <td class="ctm-th ctm-tb-w190">직위</td>
                                        <td class="ctm-th ctm-tb-w117">생년월일</td>
                                    </tr>
                                    </thead>
                                </table>
                                <div class="ctm-tb-scroll2">
                                    <table class="table table-sm table-bordered table-hover">
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer ctm-f-center gap-3">
                    <button type="button" class="ctm-btn ctm-btn-outline ctm-w10p ctm-h38 ctm-f-center"
                            data-bs-dismiss="modal">취소
                    </button>
                    <button type="button" class="ctm-btn ctm-btn-normal ctm-w10p">완료
                    </button>
                </div>
            </div>
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
            <table class="table table-bordered mt-2 table-hover align-middle research-participation-table">
                <thead>
                <tr>
                    <td class="ctm-th ctm-w10p align-middle" rowspan="2">연구자명</td>
                    <td class="ctm-th ctm-w5p align-middle fz14" rowspan="2">참여<br/>연차</td>
                    <td class="ctm-th ctm-w5p align-middle fz14" rowspan="2">참여<br/>여부</td>
                    <td class="ctm-th text-center" colspan="3">학위 및 전공</td>
                    <td class="ctm-th text-center" colspan="2">참여정보</td>
                </tr>
                <tr>
                    <td class="ctm-th__sub ctm-w10p text-center">최종학위</td>
                    <td class="ctm-th__sub ctm-w15p text-center">전공명</td>
                    <td class="ctm-th__sub ctm-w7p text-center">취득연도</td>
                    <td class="ctm-th__sub text-center">참여시작일자</td>
                    <td class="ctm-th__sub text-center">참여종료일자</td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="text-center">${rndPlanRsrch.member.name}</td>
                    <td class="text-center">1-1</td>
                    <td>
                        <input class="form-check-input ctm-td-btn-center" type="checkbox" value="" checked/>
                    </td>
                    <td>
                        <select class="form-select form-select-sm">
                            <option selected value="전문학사">전문학사</option>
                            <option value="학사">학사</option>
                            <option value="전문석사">전문석사</option>
                            <option value="석사">석사</option>
                            <option value="전문박사">전문박사</option>
                            <option value="박사">박사</option>
                        </select>
                    </td>
                    <td>
                        <input class="form-control form-control-sm" value=""  type="text"/>
                    </td>
                    <td>
                        <input class="form-control form-control-sm" value="" type="text"/>
                    </td>
                    <td>
                        <input type="date" class="form-control form-control-sm text-center" value=${taskSummaryResponse.rndPeriods[1].startedAt}>
                    </td>
                    <td>
                        <input type="date" class="form-control form-control-sm text-center" value="${taskSummaryResponse.rndPeriods[1].endedAt}">
                    </td>
                </tr>
                <tr>
                    <td class="text-center">${rndPlanRsrch.member.name}</td>
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
                        <input class="form-control form-control-sm" value=""  type="text"/>
                    </td>
                    <td>
                        <input class="form-control form-control-sm" value=""  type="text"/>
                    </td>
                    <td>
                        <input type="date" class="form-control form-control-sm text-center" value=${taskSummaryResponse.rndPeriods[1].startedAt}>
                    </td>
                    <td>
                        <input type="date" class="form-control form-control-sm text-center" value="${taskSummaryResponse.rndPeriods[1].endedAt}">
                    </td>
                </tr>
                <tr>
                    <td class="text-center">${rndPlanRsrch.member.name}</td>
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
                        <input class="form-control form-control-sm" value=""   type="text"/>
                    </td>
                    <td>
                        <input class="form-control form-control-sm" value=""  type="text"/>
                    </td>
                    <td>
                        <input type="date" class="form-control form-control-sm text-center" value=${taskSummaryResponse.rndPeriods[2].startedAt}>
                    </td>
                    <td>
                        <input type="date" class="form-control form-control-sm text-center" value="${taskSummaryResponse.rndPeriods[2].endedAt}">
                    </td>
                </tr>
                <tr>
                    <td class="text-center">${rndPlanRsrch.member.name}</td>
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
                        <input class="form-control form-control-sm" value=""  type="text"/>
                    </td>
                    <td>
                        <input class="form-control form-control-sm" value=""  type="text"/>
                    </td>
                    <td>
                        <input type="date" class="form-control form-control-sm text-center" value=${taskSummaryResponse.rndPeriods[3].startedAt}>
                    </td>
                    <td>
                        <input type="date" class="form-control form-control-sm text-center" value="${taskSummaryResponse.rndPeriods[3].endedAt}">
                    </td>
                </tr>
                <tr>
                    <td class="text-center">${rndPlanRsrch.member.name}</td>
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
                        <input class="form-control form-control-sm" value=""  type="text"/>
                    </td>
                    <td>
                        <input class="form-control form-control-sm" value=""  type="text"/>
                    </td>
                    <td>
                        <input type="date" class="form-control form-control-sm text-center" value=${taskSummaryResponse.rndPeriods[4].startedAt}>
                    </td>
                    <td>
                        <input type="date" class="form-control form-control-sm text-center" value="${taskSummaryResponse.rndPeriods[4].endedAt}">
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="/resources/js/rnd-plan/rsrch-institution.js"></script>
