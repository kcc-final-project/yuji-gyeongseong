<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>유지경성</title>
    <link rel="stylesheet" href="/resources/css/announcement/announcement.css"/>
    <script>
        $(function () {
            $('.go-to-btn').on('click', function () {
                const element = document.documentElement
                const scrollTop = function () {
                    const position = element.scrollTop
                    if (position > 0) {
                        window.requestAnimationFrame(() => {
                            window.scrollTo(0, position - position / 0.3);
                            scrollTop();
                        });
                    }
                };
                scrollTop();
            });
            const buttons = document.querySelectorAll('.reception-status-wrap button');
            buttons.forEach(button => {
                button.addEventListener('click', function () {
                    buttons.forEach(btn => btn.classList.remove('active'));
                    this.classList.add('active');
                });
            });
            $('.refresh-btn').on('click', function () {
                location.reload(true);
            })
            $('#select-one-all-checkbox').on('click', function () {
                $('.ok').prop('checked', this.checked);
            });
            $('#select-two-all-checkbox').on('click', function () {
                $('.ok2').prop('checked', this.checked);
            });
            $('#select-three-all-checkbox').on('click', function () {
                $('.ok3').prop('checked', this.checked);
            });
        });

        $(document).ready(function () {
            var customPosition = 350;
            var floatingElement = $('.floating');
            var elementOffset = floatingElement.offset().top;
            $(window).on('scroll', function () {
                var scrollTop = $(window).scrollTop();
                if (scrollTop >= customPosition) {
                    floatingElement.css({
                        'position': 'fixed',
                        'top': '80px'
                    });
                } else {
                    floatingElement.css({
                        'position': 'absolute',
                        'top': elementOffset + 'px'
                    });
                }
            });
        });
    </script>
</head>
<body>
<div class="common-main">
    <div class="announcement-container">
        <div class="announcement-title">
            <h2>사업공고</h2>
        </div>
        <div class="reception-status-wrap">
            <button type="button" class="btn btn-outline-secondary expected">접수예정</button>
            <button type="button" class="btn btn-outline-secondary accepting">접수중</button>
            <button type="button" class="btn btn-outline-secondary deadline">접수마감</button>
        </div>
        <div class="search-box-area">
            <p>통합검색</p>
            <input type="search" class="form-control rounded search-box" aria-label="Search"
                   aria-describedby="search-addon"/>
            <button type="button" class="search-btn">검색</button>
            <button class="refresh-btn">
                <span class="material-icons">restart_alt</span>
            </button>
        </div>
        <div class="contents-wrap">
            <div class="contents-filter-wrap">
                <div class="filter-wrap">
                    <p>사업년도</p>
                    <select class="form-select form-select-sm select-form" aria-label=".form-select-sm example">
                        <option value="1">2024</option>
                        <option value="2">2023</option>
                        <option value="3">2022</option>
                        <option value="4">2021</option>
                    </select>
                    <p>전체 23건</p>
                </div>
                <div class="filter-Latest-wrap">
                    <select class="form-select form-select-sm latest-form" aria-label=".form-select-sm example">
                        <option value="1">최신순</option>
                        <option value="2">마감순</option>
                    </select>
                </div>
            </div>
            <div class="check-area-anno-list-wrap ">
                <div class="check-area floating">
                    <div class="common-checkbox">
                        <div class="jurisdiction-select-all">
                            <p>소관부처</p>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="select-one-all-checkbox">
                                <label class="form-check-label" for="select-one-all-checkbox">
                                    전체선택
                                </label>
                            </div>
                        </div>
                        <div class="jurisdiction-checkbox-wrap">
                            <div class="common-checkbox-area-1">
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="">
                                    <label class="form-check-label">
                                        범부처
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="">
                                    <label class="form-check-label">
                                        국방부
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="">
                                    <label class="form-check-label">
                                        환경부
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="">
                                    <label class="form-check-label">
                                        국방부
                                    </label>
                                </div>
                            </div>
                            <div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="" i>
                                    <label class="form-check-label">
                                        국토교통부
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="">
                                    <label class="form-check-label">
                                        교육부
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="" i>
                                    <label class="form-check-label">
                                        기상청
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="">
                                    <label class="form-check-label">
                                        농림축산식품부
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="common-checkbox2">
                        <div class="jurisdiction-select-all">
                            <p>전문기관</p>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="select-two-all-checkbox">
                                <label class="form-check-label">
                                    전체선택
                                </label>
                            </div>
                        </div>
                        <div class="jurisdiction-checkbox-wrap2">
                            <div class="common-checkbox-area-1">
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="">
                                    <label class="form-check-label">
                                        한국과학기술기획평가원
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="">
                                    <label class="form-check-label">
                                        한국연구재단
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="">
                                    <label class="form-check-label">
                                        국토교통과학기술진흥원
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="">
                                    <label class="form-check-label">
                                        중소기업기술정보진흥원
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="">
                                    <label class="form-check-label">
                                        정보통신기획평가원
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="">
                                    <label class="form-check-label">
                                        한국산업기술기획평가원
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="">
                                    <label class="form-check-label">
                                        한국에너지기술평가원
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="">
                                    <label class="form-check-label">
                                        농촌진흥청
                                    </label>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="common-checkbox">
                        <div class="jurisdiction-select-all">
                            <p>기술분야</p>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="select-three-all-checkbox">
                                <label class="form-check-label">
                                    전체선택
                                </label>
                            </div>
                        </div>
                        <div class="jurisdiction-checkbox-wrap">
                            <div class="common-checkbox-area-1">
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="">
                                    <label class="form-check-label">
                                        수학
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="">
                                    <label class="form-check-label">
                                        물리학
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="">
                                    <label class="form-check-label">
                                        화학
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="">
                                    <label class="form-check-label">
                                        지구과학
                                    </label>
                                </div>
                            </div>
                            <div class="common-checkbox-area-1">
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="" i>
                                    <label class="form-check-label">
                                        생명과학
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="">
                                    <label class="form-check-label">
                                        농림수산식품
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="">
                                    <label class="form-check-label">
                                        보건의료
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="">
                                    <label class="form-check-label">
                                        기계
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="anno-list-area">
                    <div class="anno-list shadow-sm">
                        <div class="technology-field">
                            <p class="technology-title">과학기술정보통신부 > 혁신형소형모듈원자로기술개발사업단</p>
                            <div class="anno-status">
                                <p>접수중</p>
                            </div>
                        </div>
                        <div class="anno-announcement-title">
                            <p>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</p>
                        </div>
                        <div class="anno-bottom-wrap">
                            <p>공고번호: 과학기술정보통신부 공고 제2024 - 0925호</p>
                            <p>공모유형: 품목지정공모</p>
                            <p>공고일자: 2024-09-23</p>
                            <button class="view-details-btn">상세보기</button>
                        </div>
                    </div>
                    <div class="anno-list shadow-sm">
                        <div class="technology-field">
                            <p class="technology-title">과학기술정보통신부 > 혁신형소형모듈원자로기술개발사업단</p>
                            <div class="anno-status">
                                <p>접수중</p>
                            </div>
                        </div>
                        <div class="anno-announcement-title">
                            <p>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</p>
                        </div>
                        <div class="anno-bottom-wrap">
                            <p>공고번호: 과학기술정보통신부 공고 제2024 - 0925호</p>
                            <p>공모유형: 품목지정공모</p>
                            <p>공고일자: 2024-09-23</p>
                            <button class="view-details-btn">상세보기</button>
                        </div>
                    </div>
                    <div class="anno-list shadow-sm">
                        <div class="technology-field">
                            <p class="technology-title">과학기술정보통신부 > 혁신형소형모듈원자로기술개발사업단</p>
                            <div class="anno-status">
                                <p>접수중</p>
                            </div>
                        </div>
                        <div class="anno-announcement-title">
                            <p>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</p>
                        </div>
                        <div class="anno-bottom-wrap">
                            <p>공고번호: 과학기술정보통신부 공고 제2024 - 0925호</p>
                            <p>공모유형: 품목지정공모</p>
                            <p>공고일자: 2024-09-23</p>
                            <button class="view-details-btn">상세보기</button>
                        </div>
                    </div>
                    <div class="anno-list shadow-sm">
                        <div class="technology-field">
                            <p class="technology-title">과학기술정보통신부 > 혁신형소형모듈원자로기술개발사업단</p>
                            <div class="anno-status">
                                <p>접수중</p>
                            </div>
                        </div>
                        <div class="anno-announcement-title">
                            <p>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</p>
                        </div>
                        <div class="anno-bottom-wrap">
                            <p>공고번호: 과학기술정보통신부 공고 제2024 - 0925호</p>
                            <p>공모유형: 품목지정공모</p>
                            <p>공고일자: 2024-09-23</p>
                            <button class="view-details-btn">상세보기</button>
                        </div>
                    </div>
                    <div class="anno-list shadow-sm">
                        <div class="technology-field">
                            <p class="technology-title">과학기술정보통신부 > 혁신형소형모듈원자로기술개발사업단</p>
                            <div class="anno-status">
                                <p>접수중</p>
                            </div>
                        </div>
                        <div class="anno-announcement-title">
                            <p>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</p>
                        </div>
                        <div class="anno-bottom-wrap">
                            <p>공고번호: 과학기술정보통신부 공고 제2024 - 0925호</p>
                            <p>공모유형: 품목지정공모</p>
                            <p>공고일자: 2024-09-23</p>
                            <button class="view-details-btn">상세보기</button>
                        </div>
                    </div>
                    <div class="anno-list shadow-sm">
                        <div class="technology-field">
                            <p class="technology-title">과학기술정보통신부 > 혁신형소형모듈원자로기술개발사업단</p>
                            <div class="anno-status">
                                <p>접수중</p>
                            </div>
                        </div>
                        <div class="anno-announcement-title">
                            <p>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</p>
                        </div>
                        <div class="anno-bottom-wrap">
                            <p>공고번호: 과학기술정보통신부 공고 제2024 - 0925호</p>
                            <p>공모유형: 품목지정공모</p>
                            <p>공고일자: 2024-09-23</p>
                            <button class="view-details-btn">상세보기</button>
                        </div>
                    </div>
                    <div class="anno-list shadow-sm">
                        <div class="technology-field">
                            <p class="technology-title">과학기술정보통신부 > 혁신형소형모듈원자로기술개발사업단</p>
                            <div class="anno-status">
                                <p>접수중</p>
                            </div>
                        </div>
                        <div class="anno-announcement-title">
                            <p>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</p>
                        </div>
                        <div class="anno-bottom-wrap">
                            <p>공고번호: 과학기술정보통신부 공고 제2024 - 0925호</p>
                            <p>공모유형: 품목지정공모</p>
                            <p>공고일자: 2024-09-23</p>
                            <button class="view-details-btn">상세보기</button>
                        </div>
                    </div>
                    <div class="anno-list shadow-sm">
                        <div class="technology-field">
                            <p class="technology-title">과학기술정보통신부 > 혁신형소형모듈원자로기술개발사업단</p>
                            <div class="anno-status">
                                <p>접수중</p>
                            </div>
                        </div>
                        <div class="anno-announcement-title">
                            <p>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</p>
                        </div>
                        <div class="anno-bottom-wrap">
                            <p>공고번호: 과학기술정보통신부 공고 제2024 - 0925호</p>
                            <p>공모유형: 품목지정공모</p>
                            <p>공고일자: 2024-09-23</p>
                            <button class="view-details-btn">상세보기</button>
                        </div>
                    </div>
                    <div class="anno-list shadow-sm">
                        <div class="technology-field">
                            <p class="technology-title">과학기술정보통신부 > 혁신형소형모듈원자로기술개발사업단</p>
                            <div class="anno-status">
                                <p>접수중</p>
                            </div>
                        </div>
                        <div class="anno-announcement-title">
                            <p>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</p>
                        </div>
                        <div class="anno-bottom-wrap">
                            <p>공고번호: 과학기술정보통신부 공고 제2024 - 0925호</p>
                            <p>공모유형: 품목지정공모</p>
                            <p>공고일자: 2024-09-23</p>
                            <button class="view-details-btn">상세보기</button>
                        </div>
                    </div>
                    <div class="anno-list shadow-sm">
                        <div class="technology-field">
                            <p class="technology-title">과학기술정보통신부 > 혁신형소형모듈원자로기술개발사업단</p>
                            <div class="anno-status">
                                <p>접수중</p>
                            </div>
                        </div>
                        <div class="anno-announcement-title">
                            <p>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</p>
                        </div>
                        <div class="anno-bottom-wrap">
                            <p>공고번호: 과학기술정보통신부 공고 제2024 - 0925호</p>
                            <p>공모유형: 품목지정공모</p>
                            <p>공고일자: 2024-09-23</p>
                            <button class="view-details-btn">상세보기</button>
                        </div>
                    </div>
                    <div class="anno-list shadow-sm">
                        <div class="technology-field">
                            <p class="technology-title">과학기술정보통신부 > 혁신형소형모듈원자로기술개발사업단</p>
                            <div class="anno-status">
                                <p>접수중</p>
                            </div>
                        </div>
                        <div class="anno-announcement-title">
                            <p>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</p>
                        </div>
                        <div class="anno-bottom-wrap">
                            <p>공고번호: 과학기술정보통신부 공고 제2024 - 0925호</p>
                            <p>공모유형: 품목지정공모</p>
                            <p>공고일자: 2024-09-23</p>
                            <button class="view-details-btn">상세보기</button>
                        </div>
                    </div>
                    <div class="anno-list shadow-sm">
                        <div class="technology-field">
                            <p class="technology-title">과학기술정보통신부 > 혁신형소형모듈원자로기술개발사업단</p>
                            <div class="anno-status">
                                <p>접수중</p>
                            </div>
                        </div>
                        <div class="anno-announcement-title">
                            <p>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</p>
                        </div>
                        <div class="anno-bottom-wrap">
                            <p>공고번호: 과학기술정보통신부 공고 제2024 - 0925호</p>
                            <p>공모유형: 품목지정공모</p>
                            <p>공고일자: 2024-09-23</p>
                            <button class="view-details-btn">상세보기</button>
                        </div>
                    </div>
                    <div class="anno-list shadow-sm">
                        <div class="technology-field">
                            <p class="technology-title">과학기술정보통신부 > 혁신형소형모듈원자로기술개발사업단</p>
                            <div class="anno-status">
                                <p>접수중</p>
                            </div>
                        </div>
                        <div class="anno-announcement-title">
                            <p>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</p>
                        </div>
                        <div class="anno-bottom-wrap">
                            <p>공고번호: 과학기술정보통신부 공고 제2024 - 0925호</p>
                            <p>공모유형: 품목지정공모</p>
                            <p>공고일자: 2024-09-23</p>
                            <button class="view-details-btn">상세보기</button>
                        </div>
                    </div>
                    <div class="anno-list shadow-sm">
                        <div class="technology-field">
                            <p class="technology-title">과학기술정보통신부 > 혁신형소형모듈원자로기술개발사업단</p>
                            <div class="anno-status">
                                <p>접수중</p>
                            </div>
                        </div>
                        <div class="anno-announcement-title">
                            <p>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</p>
                        </div>
                        <div class="anno-bottom-wrap">
                            <p>공고번호: 과학기술정보통신부 공고 제2024 - 0925호</p>
                            <p>공모유형: 품목지정공모</p>
                            <p>공고일자: 2024-09-23</p>
                            <button class="view-details-btn">상세보기</button>
                        </div>
                    </div>
                    <div class="anno-list shadow-sm">
                        <div class="technology-field">
                            <p class="technology-title">과학기술정보통신부 > 혁신형소형모듈원자로기술개발사업단</p>
                            <div class="anno-status">
                                <p>접수중</p>
                            </div>
                        </div>
                        <div class="anno-announcement-title">
                            <p>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</p>
                        </div>
                        <div class="anno-bottom-wrap">
                            <p>공고번호: 과학기술정보통신부 공고 제2024 - 0925호</p>
                            <p>공모유형: 품목지정공모</p>
                            <p>공고일자: 2024-09-23</p>
                            <button class="view-details-btn">상세보기</button>
                        </div>
                    </div>
                    <div class="anno-list shadow-sm">
                        <div class="technology-field">
                            <p class="technology-title">과학기술정보통신부 > 혁신형소형모듈원자로기술개발사업단</p>
                            <div class="anno-status">
                                <p>접수중</p>
                            </div>
                        </div>
                        <div class="anno-announcement-title">
                            <p>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</p>
                        </div>
                        <div class="anno-bottom-wrap">
                            <p>공고번호: 과학기술정보통신부 공고 제2024 - 0925호</p>
                            <p>공모유형: 품목지정공모</p>
                            <p>공고일자: 2024-09-23</p>
                            <button class="view-details-btn">상세보기</button>
                        </div>
                    </div>
                    <div class="anno-list shadow-sm">
                        <div class="technology-field">
                            <p class="technology-title">과학기술정보통신부 > 혁신형소형모듈원자로기술개발사업단</p>
                            <div class="anno-status">
                                <p>접수중</p>
                            </div>
                        </div>
                        <div class="anno-announcement-title">
                            <p>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</p>
                        </div>
                        <div class="anno-bottom-wrap">
                            <p>공고번호: 과학기술정보통신부 공고 제2024 - 0925호</p>
                            <p>공모유형: 품목지정공모</p>
                            <p>공고일자: 2024-09-23</p>
                            <button class="view-details-btn">상세보기</button>
                        </div>
                    </div>
                    <div class="anno-list shadow-sm">
                        <div class="technology-field">
                            <p class="technology-title">과학기술정보통신부 > 혁신형소형모듈원자로기술개발사업단</p>
                            <div class="anno-status">
                                <p>접수중</p>
                            </div>
                        </div>
                        <div class="anno-announcement-title">
                            <p>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</p>
                        </div>
                        <div class="anno-bottom-wrap">
                            <p>공고번호: 과학기술정보통신부 공고 제2024 - 0925호</p>
                            <p>공모유형: 품목지정공모</p>
                            <p>공고일자: 2024-09-23</p>
                            <button class="view-details-btn">상세보기</button>
                        </div>
                    </div>
                    <div class="anno-list shadow-sm">
                        <div class="technology-field">
                            <p class="technology-title">과학기술정보통신부 > 혁신형소형모듈원자로기술개발사업단</p>
                            <div class="anno-status">
                                <p>접수중</p>
                            </div>
                        </div>
                        <div class="anno-announcement-title">
                            <p>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</p>
                        </div>
                        <div class="anno-bottom-wrap">
                            <p>공고번호: 과학기술정보통신부 공고 제2024 - 0925호</p>
                            <p>공모유형: 품목지정공모</p>
                            <p>공고일자: 2024-09-23</p>
                            <button class="view-details-btn">상세보기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="go-to-top fixed-box">
        <button class="go-to-btn">
            <span class="material-icons arrow">arrow_circle_up</span>
        </button>
    </div>
</div>
</body>
</html>
