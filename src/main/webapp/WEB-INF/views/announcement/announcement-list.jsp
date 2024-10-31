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
    <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify@4.31.6/dist/tagify.min.js"></script>
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
                        <option value="2024">2024</option>
                        <option value="2023">2023</option>
                        <option value="2022">2022</option>
                        <option value="2021">2021</option>
                    </select>
                    <p>전체 23건</p>
                </div>
                <div class="user-filter-wrap">
                    <input id="tag-input" class="tag-area" placeholder="원하는 태그를 추가하세요" value=""/>
                </div>
                <div class="filter-Latest-wrap floating-area">
                    <select class="form-select form-select-sm latest-form" aria-label=".form-select-sm example">
                        <option value="최신순">최신순</option>
                        <option value="마감순">마감순</option>
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
                                    <input class="form-check-input ok" type="checkbox" value="범부처" id="ministry0">
                                    <label class="form-check-label" for="ministry0">범부처</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="과학기술정보통신부" id="ministry1">
                                    <label class="form-check-label" for="ministry1">과학기술정보통신부</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="산업통상자원부" id="ministry2">
                                    <label class="form-check-label" for="ministry2">산업통상자원부</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="중소벤처기업부" id="ministry3">
                                    <label class="form-check-label" for="ministry3">중소벤처기업부</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="국토교통부" id="ministry4">
                                    <label class="form-check-label" for="ministry4">국토교통부</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="교육부" id="ministry5">
                                    <label class="form-check-label" for="ministry5">교육부</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="기상청" id="ministry6">
                                    <label class="form-check-label" for="ministry6">기상청</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="농림축산식품부" id="ministry7">
                                    <label class="form-check-label" for="ministry7">농림축산식품부</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="농촌진흥청" id="ministry8">
                                    <label class="form-check-label" for="ministry8">농촌진흥청</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="국가유산청" id="ministry9">
                                    <label class="form-check-label" for="ministry9">국가유산청</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="문화체육관광부" id="ministry10">
                                    <label class="form-check-label" for="ministry10">문화체육관광부</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="방위사업청" id="ministry11">
                                    <label class="form-check-label" for="ministry11">방위사업청</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="보건복지부" id="ministry12">
                                    <label class="form-check-label" for="ministry12">보건복지부</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="산림청" id="ministry13">
                                    <label class="form-check-label" for="ministry13">산림청</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="식품의약품안전처" id="ministry14">
                                    <label class="form-check-label" for="ministry14">식품의약품안전처</label>
                                </div>



                            </div>
                            <div class="common-checkbox-area-2">
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="원자력안전위원회" id="ministry15">
                                    <label class="form-check-label" for="ministry15">원자력안전위원회</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="해양수산부" id="ministry16">
                                    <label class="form-check-label" for="ministry16">해양수산부</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="행정안전부" id="ministry17">
                                    <label class="form-check-label" for="ministry17">행정안전부</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="환경부" id="ministry18">
                                    <label class="form-check-label" for="ministry18">환경부</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="법무부" id="ministry19">
                                    <label class="form-check-label" for="ministry19">법무부</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="국방부" id="ministry20">
                                    <label class="form-check-label" for="ministry20">국방부</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="경찰청" id="ministry21">
                                    <label class="form-check-label" for="ministry21">경찰청</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="소방청" id="ministry22">
                                    <label class="form-check-label" for="ministry22">소방청</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="해양경찰청" id="ministry23">
                                    <label class="form-check-label" for="ministry23">해양경찰청</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="조달청" id="ministry24">
                                    <label class="form-check-label" for="ministry24">조달청</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="질병관리청" id="ministry25">
                                    <label class="form-check-label" for="ministry25">질병관리청</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="개인정보보호위원회" id="ministry26">
                                    <label class="form-check-label" for="ministry26">개인정보보호위원회</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="국민안전처" id="ministry27">
                                    <label class="form-check-label" for="ministry27">국민안전처</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="대통령경호처" id="ministry28">
                                    <label class="form-check-label" for="ministry28">대통령경호처</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok" type="checkbox" value="우주항공청" id="ministry29">
                                    <label class="form-check-label" for="ministry29">우주항공청</label>
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
                                    <input class="form-check-input ok2" type="checkbox" value="한국과학기술기획평가원" id="institution1">
                                    <label class="form-check-label" for="institution1">한국과학기술기획평가원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국연구재단" id="institution2">
                                    <label class="form-check-label" for="institution2">한국연구재단</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="국토교통과학기술진흥원" id="institution3">
                                    <label class="form-check-label" for="institution3">국토교통과학기술진흥원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="중소기업기술정보진흥원" id="institution4">
                                    <label class="form-check-label" for="institution4">중소기업기술정보진흥원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="정보통신기획평가원" id="institution5">
                                    <label class="form-check-label" for="institution5">정보통신기획평가원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국산업기술기획평가원" id="institution6">
                                    <label class="form-check-label" for="institution6">한국산업기술기획평가원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국산업기술진흥원" id="institution7">
                                    <label class="form-check-label" for="institution7">한국산업기술진흥원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국에너지기술평가원" id="institution8">
                                    <label class="form-check-label" for="institution8">한국에너지기술평가원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국보건산업진흥원" id="institution9">
                                    <label class="form-check-label" for="institution9">한국보건산업진흥원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="농촌진흥청" id="institution10">
                                    <label class="form-check-label" for="institution10">농촌진흥청</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="해양수산과학기술진흥원" id="institution11">
                                    <label class="form-check-label" for="institution11">해양수산과학기술진흥원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="농림식품기술기획평가원" id="institution12">
                                    <label class="form-check-label" for="institution12">농림식품기술기획평가원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국환경산업기술원" id="institution13">
                                    <label class="form-check-label" for="institution13">한국환경산업기술원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국기상산업기술원" id="institution14">
                                    <label class="form-check-label" for="institution14">한국기상산업기술원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="식품의약품안전평가원" id="institution15">
                                    <label class="form-check-label" for="institution15">식품의약품안전평가원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="국방기술품질원" id="institution16">
                                    <label class="form-check-label" for="institution16">국방기술품질원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국콘텐츠진흥원" id="institution17">
                                    <label class="form-check-label" for="institution17">한국콘텐츠진흥원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="국립문화유산연구원" id="institution18">
                                    <label class="form-check-label" for="institution18">국립문화유산연구원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국원자력안전재단" id="institution19">
                                    <label class="form-check-label" for="institution19">한국원자력안전재단</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="국립재난안전연구원" id="institution20">
                                    <label class="form-check-label" for="institution20">국립재난안전연구원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국임업진흥원" id="institution21">
                                    <label class="form-check-label" for="institution21">한국임업진흥원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="범부처전주기의료기기연구개발사업단" id="institution22">
                                    <label class="form-check-label" for="institution22">범부처전주기의료기기연구개발사업단</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="범부처재생의료기술개발사업단" id="institution23">
                                    <label class="form-check-label" for="institution23">범부처재생의료기술개발사업단</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="재단법인 국가신약개발사업단" id="institution24">
                                    <label class="form-check-label" for="institution24">재단법인 국가신약개발사업단</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국농업기술진흥원" id="institution25">
                                    <label class="form-check-label" for="institution25">한국농업기술진흥원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="과학기술사업화진흥원" id="institution26">
                                    <label class="form-check-label" for="institution26">과학기술사업화진흥원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국인터넷진흥원" id="institution27">
                                    <label class="form-check-label" for="institution27">한국인터넷진흥원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="과학치안진흥센터" id="institution28">
                                    <label class="form-check-label" for="institution28">과학치안진흥센터</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국탄소산업진흥원" id="institution29">
                                    <label class="form-check-label" for="institution29">한국탄소산업진흥원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국여성과학기술인육성재단" id="institution30">
                                    <label class="form-check-label" for="institution30">한국여성과학기술인육성재단</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="혁신형소형모듈원자로기술개발사업단" id="institution31">
                                    <label class="form-check-label" for="institution31">혁신형소형모듈원자로기술개발사업단</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국원자력연구원" id="institution32">
                                    <label class="form-check-label" for="institution32">한국원자력연구원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="국립암센터" id="institution33">
                                    <label class="form-check-label" for="institution33">국립암센터</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="연구개발특구진흥재단" id="institution34">
                                    <label class="form-check-label" for="institution34">연구개발특구진흥재단</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="한국기초과학지원연구원" id="institution35">
                                    <label class="form-check-label" for="institution35">한국기초과학지원연구원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="나노종합기술원" id="institution36">
                                    <label class="form-check-label" for="institution36">나노종합기술원</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="우주항공청" id="institution37">
                                    <label class="form-check-label" for="institution37">우주항공청</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input ok2" type="checkbox" value="소형모듈원자로규제연구추진단" id="institution38">
                                    <label class="form-check-label" for="institution38">소형모듈원자로규제연구추진단</label>
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
