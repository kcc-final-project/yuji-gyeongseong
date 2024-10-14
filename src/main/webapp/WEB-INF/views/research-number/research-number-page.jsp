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

        <div class="academic-list">
            <div class="list">
                <div class="inline-wrap">
                    <p>학력구분</p>
                    <p class="warn">*</p>
                    <select name="degreeType" class="form-select" aria-label="Default select example">
                        <option value="1">학사</option>
                        <option value="2">석사</option>
                        <option value="3">박사</option>
                        <option value="4">고등학교</option>
                        <option value="5">준석사</option>
                        <option value="6">전문학사</option>
                    </select>
                </div>

                <div class="inline-wrap">
                    <p>취득국가</p>
                    <p class="warn">*</p>
                    <select name="degreeCountry" class="form-select" aria-label="Default select example">
                        <option value="kr">대한민국</option>
                        <option value="us">미국</option>
                        <option value="jp">일본</option>
                        <option value="cn">중국</option>
                        <option value="de">독일</option>
                        <option value="fr">프랑스</option>
                        <option value="uk">영국</option>
                        <option value="in">인도</option>
                        <option value="au">호주</option>
                    </select>
                </div>

                <div class="inline-wrap">
                    <p>전공명</p>
                    <p class="warn">*</p>
                    <input type="text" name="majorName" class="form-input" placeholder="전공명을(를) 입력하세요">
                </div>
            </div>
            <div class="list">

                <div class="inline-wrap">
                    <p>취득연월</p>
                    <p class="warn">*</p>

                    <div class="input-group">
                        <input type="text" name="degreeDate" class="datepicker_input form-control" placeholder="취득연월"
                               required
                               aria-label="Date input 3 (using aria-label)">
                        <span class="input-group-text">
                            <i class="material-icons-outlined calendar-icon">calendar_month</i>
                        </span>
                    </div>
                </div>

                <div class="inline-wrap">
                    <p>취득기관명</p>
                    <p class="warn">*</p>

                    <div class="input-group">
                        <input type="text" name="degreeInstitutionName" id="degreeInstitutionName" class="form-control"
                               placeholder="취득기관명">
                        <span class="input-group-text">
                    <i class="material-icons-outlined search-icon" data-toggle="modal"
                       data-target="#institutionSearchModal">search</i>
                </span>
                    </div>
                </div>

                <div class="inline-wrap">
                    <p>전공계열</p>
                    <p class="warn">*</p>
                    <div class="major">
                        <select id="major-category" name="majorCategory" class="form-select-two"
                                aria-label="Default select example" onchange="updateMajorSubcategory()">
                            <option value="engineering">공학계열</option>
                            <option value="science">자연과학계열</option>
                            <option value="humanities">인문사회계열</option>
                            <option value="medicine">의약계열</option>
                            <option value="art">예술체육계열</option>
                        </select>

                        <select id="major-subcategory" name="majorSubcategory" class="form-select-two"
                                aria-label="Default select example">
                        </select>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="career-info">
        <div class="title_warning">
            <p class="title">경력정보</p>
            <p class="warning">* 필수 항목</p>
        </div>

        <hr>

        <div class="academic-list">
            <div class="list">

                <div class="inline-wrap">
                    <p>근무기관명</p>
                    <p class="warn">*</p>
                    <div class="input-group">
                        <input type="text" name="workInstitutionName" id="workInstitutionName" class="form-control"
                               placeholder="근무기관명">
                        <span class="input-group-text">
            <i class="material-icons-outlined search-icon" data-bs-toggle="modal"
               data-bs-target="#workInstitutionSearchModal">search</i>
                        </span>
                    </div>
                </div>

                <div class="inline-wrap">
                    <p>근무부서</p>
                    <p class="warn">*</p>
                    <input type="text" name="workDepartment" class="form-input" placeholder="근무부서을(를) 입력하세요">
                </div>
            </div>
            <div class="list">
                <div class="inline-wrap">
                    <p>고용형태</p>
                    <p class="warn">*</p>
                    <select name="employmentType" class="form-select" aria-label="Default select example">
                        <option value="1">정규직</option>
                        <option value="2">계약직</option>
                        <option value="3">프리랜서</option>
                        <option value="4">인턴</option>
                    </select>
                </div>

                <div class="inline-wrap">
                    <p>근무기간</p>
                    <p class="warn">*</p>

                    <div class="calen">

                        <div class="input-group input-group-small">

                            <input type="text" name="workStartDate" class="datepicker_input form-control"
                                   placeholder="근무시작기간" required
                                   aria-label="Start Date">
                            <span class="input-group-text">
                                <i class="material-icons-outlined calendar-icon">calendar_month</i>
                            </span>
                        </div>

                        <span style="margin: 0 10px;">~</span>

                        <div class="input-group input-group-small">
                            <input type="text" name="workEndDate" class="datepicker_input form-control"
                                   placeholder="근무종료기간" required
                                   aria-label="End Date">
                            <span class="input-group-text">
                                <i class="material-icons-outlined calendar-icon">calendar_month</i>
                            </span>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="technical-info">
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

                    <div class="form-group mb-3">
                        <label for="searchInput" style="width: 200px">기술분류명:</label>
                        <input type="text" id="searchInput" class="form-control" placeholder="검색어를 입력하세요">
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
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="institutionSearchModalLabel">기관 조회 팝업</h5>

                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <input type="text" id="instituteNameSearch" class="form-control" placeholder="취득기관명">
                        </div>
                        <div class="col-md-3">
                            <button class="btn ctm-btn-normal searchBtn" id="searchInstitution"><i
                                    class="material-icons-outlined">search</i></button>
                        </div>
                    </div>
                </div>

                <div class="institution-table-container">
                    <table id="institutionTable" class="table table-bordered mt-3">
                        <thead>
                        <tr>
                            <th>선택</th>
                            <th>기관ID</th>
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
                    <div class="row">
                        <div class="col-md-6">
                            <input type="text" id="workInstitutionNameSearch" class="form-control" placeholder="근무기관명">
                        </div>
                        <div class="col-md-6">
                            <button class="btn ctm-btn-normal searchBtn" id="searchWorkInstitution"><i
                                    class="material-icons-outlined">search</i></button>
                        </div>
                    </div>
                </div>
                <div class="institution-table-container">
                    <table id="workInstitutionTable" class="table table-bordered mt-3">
                        <thead>
                        <tr>
                            <th>선택</th>
                            <th>기관ID</th>
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