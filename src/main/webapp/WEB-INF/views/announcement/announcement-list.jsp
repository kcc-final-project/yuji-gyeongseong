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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css">
    <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.min.js"></script>
</head>
<body>
<div class="common-main">
    <div class="announcement-container">
        <div class="announcement-title">
            <h2>사업공고</h2>
        </div>
        <div class="reception-status-wrap">
            <button type="button" class="btn btn-outline-secondary expected tab-btn">접수예정</button>
            <button type="button" class="btn btn-outline-secondary accepting tab-btn active">접수중</button>
            <button type="button" class="btn btn-outline-secondary deadline tab-btn">접수마감</button>
        </div>
        <div class="floating-area">
            <div class="search-box-area">
                <p>통합검색</p>
                <input type="search" class="form-control rounded search-box" placeholder="검색어를 입력하세요."
                       aria-label="Search"
                       aria-describedby="search-addon"/>
                <button type="button" class="search-btn">검색</button>
                <button class="refresh-btn">
                    <span class="material-icons">restart_alt</span>
                </button>
            </div>
            <div class="contents-filter-wrap floating-area">
                <div class="filter-wrap ">
                    <p>사업년도</p>
                    <select class="form-select form-select-sm select-form" aria-label=".form-select-sm example">
                        <option value="1">2024</option>
                        <option value="2">2023</option>
                        <option value="3">2022</option>
                        <option value="4">2021</option>
                    </select>
                    <p>전체 23건</p>
                </div>
                <div class="user-filter-wrap">
                    <input id="tag-input" class="tag-area" placeholder="원하는 태그를 추가하세요" value=""/>
                </div>
                <div class="filter-Latest-wrap floating-area">
                    <select class="form-select form-select-sm latest-form" aria-label=".form-select-sm example">
                        <option value="1">최신순</option>
                        <option value="2">마감순</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="contents-wrap">
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
                                    <input class="form-check-input ok" type="checkbox" value="범부처">
                                    <label class="form-check-label">
                                        범부처
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="국토교통부">
                                    <label class="form-check-label">
                                        국토교통부
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="기상청">
                                    <label class="form-check-label">
                                        기상청
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="농촌진흥청">
                                    <label class="form-check-label">
                                        농촌진흥청
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="문화체육관광부">
                                    <label class="form-check-label">
                                        문화체육관광부
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="보건복지부">
                                    <label class="form-check-label">
                                        보건복지부
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="해양수산부">
                                    <label class="form-check-label">
                                        해양수산부
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="환경부">
                                    <label class="form-check-label">
                                        환경부
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="국방부">
                                    <label class="form-check-label">
                                        국방부
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="소방청">
                                    <label class="form-check-label">
                                        소방청
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="조달청">
                                    <label class="form-check-label">
                                        조달청
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="대통령경호처">
                                    <label class="form-check-label">
                                        대통령경호처
                                    </label>
                                </div>
                            </div>
                            <div class="common-checkbox-area-2">
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="교육부">
                                    <label class="form-check-label">
                                        교육부
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="농림축산식품부">
                                    <label class="form-check-label">
                                        농림축산식품부
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="국가유산청">
                                    <label class="form-check-label">
                                        국가유산청
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="방위사업청">
                                    <label class="form-check-label">
                                        방위사업청
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="산림청">
                                    <label class="form-check-label">
                                        산림청
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="행정안전부">
                                    <label class="form-check-label">
                                        행정안전부
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="법무부">
                                    <label class="form-check-label">
                                        법무부
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="경찰청">
                                    <label class="form-check-label">
                                        경찰청
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="해양경찰청">
                                    <label class="form-check-label">
                                        해양경찰청
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="질병관리청">
                                    <label class="form-check-label">
                                        질병관리청
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="국민안전처">
                                    <label class="form-check-label">
                                        국민안전처
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="우주항공청">
                                    <label class="form-check-label">
                                        우주항공청
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
                                    <input class="form-check-input ok2" type="checkbox" value="한국과학기술기획평가원">
                                    <label class="form-check-label">
                                        한국과학기술기획평가원
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국연구재단">
                                    <label class="form-check-label">
                                        한국연구재단
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="국토교통과학기술진흥원">
                                    <label class="form-check-label">
                                        국토교통과학기술진흥원
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="정보통신기획평가원">
                                    <label class="form-check-label">
                                        정보통신기획평가원
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국산업기술기획평가원">
                                    <label class="form-check-label">
                                        한국산업기술기획평가원
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국산업기술진흥원">
                                    <label class="form-check-label">
                                        한국산업기술진흥원
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국에너지기술평가원">
                                    <label class="form-check-label">
                                        한국에너지기술평가원
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국보건산업진흥원">
                                    <label class="form-check-label">
                                        한국보건산업진흥원
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="농촌진흥청">
                                    <label class="form-check-label">
                                        농촌진흥청
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="해양수산과학기술진흥원">
                                    <label class="form-check-label">
                                        해양수산과학기술진흥원
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="농림식품기술기획평가원">
                                    <label class="form-check-label">
                                        농림식품기술기획평가원
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국환경산업기술원">
                                    <label class="form-check-label">
                                        한국환경산업기술원
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국기상산업기술원">
                                    <label class="form-check-label">
                                        한국기상산업기술원
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="식품의약품안전평가원">
                                    <label class="form-check-label">
                                        식품의약품안전평가원
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
                                    <input class="form-check-input ok3" type="checkbox" value="수학">
                                    <label class="form-check-label">
                                        수학
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="물리학">
                                    <label class="form-check-label">
                                        물리학
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="화학">
                                    <label class="form-check-label">
                                        화학
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="지구과학">
                                    <label class="form-check-label">
                                        지구과학
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="생명과학">
                                    <label class="form-check-label">
                                        생명과학
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="농림수산식품">
                                    <label class="form-check-label">
                                        농림수산식품
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="보건의료">
                                    <label class="form-check-label">
                                        보건의료
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="기계">
                                    <label class="form-check-label">
                                        기계
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="재료">
                                    <label class="form-check-label">
                                        재료
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="화공">
                                    <label class="form-check-label">
                                        화공
                                    </label>
                                </div>

                            </div>
                            <div class="common-checkbox-area-2">
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="전기/전자">
                                    <label class="form-check-label">
                                        전기/전자
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="정보/통신">
                                    <label class="form-check-label">
                                        정보/통신
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="에너지/자원">
                                    <label class="form-check-label">
                                        에너지/자원
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="환경">
                                    <label class="form-check-label">
                                        환경
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="건설/교통">
                                    <label class="form-check-label">
                                        건설/교통
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="뇌과학">
                                    <label class="form-check-label">
                                        뇌과학
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="인지/감성과학">
                                    <label class="form-check-label">
                                        인지/감성과학
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="인문학">
                                    <label class="form-check-label">
                                        인문학
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="사회과학">
                                    <label class="form-check-label">
                                        사회과학
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok3" type="checkbox" value="원자력">
                                    <label class="form-check-label">
                                        원자력
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="anno-list-area" id="announcementContainer">

                </div>
            </div>
        </div>
    </div>
    <div class="go-to-top fixed-box">
        <button class="go-to-btn ">
            <span class="material-icons arrow ">arrow_circle_up</span>
        </button>
    </div>
</div>
<script src="/resources/js/announcement/announcement-list.js"></script>
</body>
</html>
