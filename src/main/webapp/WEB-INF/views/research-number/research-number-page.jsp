<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>유지경성</title>

    <!-- research-page CSS -->
    <link rel="stylesheet" href="/resources/css/research-number/research-number.css"/>

    <!-- Date Picker CSS & JavaScript -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"></script>

    <!-- Material Icons CSS -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined">

    <!-- jsTree 라이브러리 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/themes/default/style.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/jstree.min.js"></script>

    <%--    fancytree 라이브러리 추가--%>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery.fancytree/2.38.0/skin-win8/ui.fancytree.min.css"
          rel="stylesheet">
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.fancytree/2.38.0/jquery.fancytree-all-deps.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.fancytree/2.38.0/jquery.fancytree.gridnav.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.fancytree/2.38.0/jquery.fancytree.table.min.js"></script>


</head>
<body>
<div class="common-main">
    <div class="research_title">
        <p>연구자 번호 발급</p>
    </div>

    <div class="academic-info">
        <div class="title_warning">
            <p class="title">학력정보</p>
            <button id="addAcademicInfoButton" class="ctm-btn-normal" style="width: 150px">학력정보추가</button>
            <p class="warning">* 필수 항목</p>
        </div>

        <hr>

        <div class="academic-list" id="academicList">
            <div class="list">
                <div class="inline-wrap">
                    <label>학력구분<span class="warn">*</span></label>
                    <select id="degreeType1" name="degreeType" class="form-select" aria-label="Default select example">
                        <option value="학사">학사</option>
                        <option value="석사">석사</option>
                        <option value="박사">박사</option>
                        <option value="고등학교">고등학교</option>
                        <option value="준석사">준석사</option>
                        <option value="전문학사">전문학사</option>
                    </select>
                </div>

                <div class="inline-wrap">
                    <label>취득국가<span class="warn">*</span></label>
                    <select id="degreeCountry1" name="degreeCountry" class="form-select"
                            aria-label="Default select example">
                        <option value="대한민국">대한민국</option>
                        <option value="미국">미국</option>
                        <option value="일본">일본</option>
                        <option value="중국">중국</option>
                        <option value="독일">독일</option>
                        <option value="프랑스">프랑스</option>
                        <option value="영국">영국</option>
                        <option value="인도">인도</option>
                        <option value="호주">호주</option>
                    </select>
                </div>

                <div class="inline-wrap">
                    <label>전공명<span class="warn">*</span></label>
                    <input type="text" id="majorName1" name="majorName" class="form-input" placeholder="전공명을(를) 입력하세요">
                </div>
            </div>
            <div class="list">

                <div class="inline-wrap">
                    <label>취득연월<span class="warn">*</span></label>
                    <div class="input-group">
                        <input type="date" id="degreeDate1" name="degreeDate" class="form-input">
                    </div>
                </div>

                <div class="inline-wrap">
                    <label>취득기관명<span class="warn">*</span></label>
                    <div class="input-group">
                        <input type="text" name="degreeInstitutionName1" id="degreeInstitutionName1"
                               class="form-control" placeholder="취득기관명" readonly>
                        <span class="input-group-text">
                    <i class="material-icons-outlined search-icon" data-bs-toggle="modal"
                       data-bs-target="#institutionSearchModal" data-index="1">search</i>
                </span>
                    </div>
                </div>

                <div class="inline-wrap">
                    <label>전공계열<span class="warn">*</span></label>
                    <div class="major">
                        <select id="majorCategory1" name="majorCategory" class="form-select-two majorCategory"
                                aria-label="Default select example" onchange="updateMajorSubcategory()">
                            <option value="공학계열">공학계열</option>
                            <option value="자연과학계열">자연과학계열</option>
                            <option value="인문사회계열">인문사회계열</option>
                            <option value="의약계열">의약계열</option>
                            <option value="예술체육계열">예술체육계열</option>
                            <option value="비즈니스경영계열">비즈니스경영계열</option>
                            <option value="정보기술계열">정보기술계열</option>
                        </select>

                        <select id="majorSubcategory1" name="majorSubcategory" class="form-select-two majorSubcategory"
                                aria-label="Default select example">
                        </select>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="career-info" style="margin-top: 50px">
        <div class="title_career">
            <label class="title">경력정보</label>
            <button id="addCareerInfoButton" class="ctm-btn-normal" style="margin-left: 35px; width: 150px">경력정보추가
            </button>
        </div>

        <hr>

        <div class="career-list">
            <div class="list">

                <div class="inline-wrap">
                    <label>근무기관명<span class="warn">*</span></label>
                    <div class="input-group">
                        <input type="text" name="workInstitutionName1" id="workInstitutionName1" class="form-control"
                               placeholder="근무기관명" readonly>
                        <span class="input-group-text">
                        <i class="material-icons-outlined search-icon" data-bs-toggle="modal"
                           data-bs-target="#workInstitutionSearchModal" data-index="1">search</i>
                    </span>
                    </div>
                </div>

                <div class="inline-wrap">
                    <label>근무부서<span class="warn">*</span></label>
                    <input type="text" id="workDepartment1" name="workDepartment" class="form-input"
                           placeholder="근무부서을(를) 입력하세요">
                </div>
            </div>
            <div class="list">
                <div class="inline-wrap">
                    <label>고용형태<span class="warn">*</span></label>
                    <select id="employmentType1" name="employmentType" class="form-select"
                            aria-label="Default select example">
                        <option value="정규직">정규직</option>
                        <option value="계약직">계약직</option>
                        <option value="프리랜서">프리랜서</option>
                        <option value="인턴">인턴</option>
                    </select>
                </div>

                <div class="inline-wrap">
                    <label>근무기간<span class="warn">*</span></label>
                    <div class="calen">
                        <div class="input-group input-group-small">
                            <input type="date" id="workStartDate1" name="workStartDate" class="form-control"
                                   aria-label="Start Date">
                        </div>
                        <span style="margin: 0 10px;">~</span>
                        <div class="input-group input-group-small">
                            <input type="date" id="workEndDate1" name="workEndDate" class="form-control"
                                   aria-label="End Date">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="technical-info" style="margin-top: 50px">
        <div class="title_warning">
            <p class="title">기술분야정보</p>
            <div class="buttons">
                <button id="deleteTechnicalButton" class="ctm-btn-normal wid delete-button">
                    <span class="material-icons-outlined">delete</span>기술분야 삭제
                </button>
                <button id="addTechnicalButton" class="ctm-btn-normal wid add-button">
                    <span class="material-icons">add_to_photos</span>기술분야 추가
                </button>
            </div>
        </div>

        <hr>

        <div class="technical-table-container">
            <table id="technicalInfoTable" class="table table-bordered">
                <thead>
                <tr>
                    <th><input type="checkbox" id="selectAllCheckbox"></th>
                    <th>기술분류그룹명</th>
                    <th>기술분류코드</th>
                    <th>기술분류명</th>
                </tr>
                </thead>
                <tbody id="technicalInfoTableBody">
                </tbody>
            </table>
        </div>

    </div>

    <div class="issuance-info">
        <button id="cancelButton" class="ctm-btn-normal delete-button" style="width: 100px">
            취소
        </button>
        <button id="issuanceButton" class="ctm-btn-normal wid add-button">
            연구자 번호 발급
        </button>
    </div>


    <div class="modal fade" id="addTechnicalModal" tabindex="-1" aria-labelledby="addTechnicalModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addTechnicalModalLabel">기술분류</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <div class="search">
                            <%--                            <label for="searchInput" style="width: 200px">기술분류명:</label>--%>
                            <input type="text" id="searchInput" class="form-control" placeholder="검색어를 입력하세요">
                        </div>
                    </div>

                    <!-- 트리 구조 영역 -->
                    <%--<div id="technicalTree" class="technical-tree-container"></div>--%>

                    <div id="tree" class="fancytree-connectors fancytree-ext-table technical-tree-container">
                        <table>
                            <thead>
                            <tr>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <!-- Fancytree가 이 tbody를 채움 -->
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary wid" data-bs-dismiss="modal">취소</button>
                    <button type="button" id="addTechnicalConfirmBtn" class="btn ctm-btn-normal wid">선택</button>
                </div>
            </div>


        </div>
    </div>
</div>


<div class="modal fade" id="institutionSearchModal" tabindex="-1" role="dialog"
     aria-labelledby="institutionSearchModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="institutionSearchModalLabel">기관 조회 팝업</h5>

                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="search">
                        <input type="text" id="instituteNameSearch" class="form-control" placeholder="취득기관명">
                        <button class="btn ctm-btn-normal searchBtn" id="searchInstitution"><i
                                class="material-icons-outlined">search</i></button>
                    </div>
                </div>

                <div class="institution-table-container">
                    <table id="institutionTable" class="table table-bordered">
                        <thead>
                        <tr>
                            <th>선택</th>
                            <th>기관명</th>
                            <th>기관분류</th>
                            <th>사업자번호</th>
                        </tr>
                        </thead>
                        <tbody id="institutionTableBody">

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary wid" data-bs-dismiss="modal">닫기</button>
                <button type="button" id="addInstitutionBtn" class="btn ctm-btn-normal wid">선택</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="workInstitutionSearchModal" tabindex="-1" role="dialog"
     aria-labelledby="workInstitutionSearchModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="workInstitutionSearchModalLabel">근무기관 조회</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="search">
                        <input type="text" id="workInstitutionNameSearch" class="form-control" placeholder="근무기관명">
                        <button class="btn ctm-btn-normal searchBtn" id="searchWorkInstitution"><i
                                class="material-icons-outlined">search</i></button>
                    </div>
                </div>
                <div class="institution-table-container">
                    <table id="workInstitutionTable" class="table table-bordered mt-3">
                        <thead>
                        <tr>
                            <th>선택</th>
                            <th>기관명</th>
                            <th>기관분류</th>
                            <th>사업자번호</th>
                        </tr>
                        </thead>
                        <tbody id="workInstitutionTableBody">
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary wid" data-bs-dismiss="modal">닫기</button>
                <button type="button" id="addWorkInstitutionBtn" class="btn ctm-btn-normal wid">선택</button>
            </div>
        </div>
    </div>
</div>

<script src="/resources/js/research-number/research-number.js"></script>
</body>
</html>