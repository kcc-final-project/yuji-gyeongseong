<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="/resources/css/rnd-plan/rnd-plan-basic.css"/>
    <title>유지경성</title>
</head>
<body>
<div class="common-main">
    <div class="main">
        <h4>(신청용) 연구개발계획서</h4>
        <jsp:include page="common-rnd-progress.jsp"/>

        <%-- 과제정보 --%>
        <div class="task-info mt-5">
            <div class="header-section">
                <div class="header-section__title">
                    <h5>과제정보</h5>
                </div>
                <div class="header-section__btn">
                    <div class="ctm-btn ctm-btn-outline">
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
                        <td><input class="form-control ctm-td" disabled readonly type="text"></td>
                        <td><input class="form-control ctm-td" disabled readonly type="text"></td>
                        <td><input class="form-control ctm-td" disabled readonly type="text"></td>
                        <td><input class="form-control ctm-td" disabled readonly type="text"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <%-- 공모분야 --%>
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
                            <input class="form-control ps-3" value="" placeholder="연구개발과제명을 입력해주세요." type="text">
                        </td>
                        <td class="ctm-w15p">
                            <div class="ctm-btn-normal">
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
</div>
<jsp:include page="common-rnd-control.jsp"/>
</body>
</html>