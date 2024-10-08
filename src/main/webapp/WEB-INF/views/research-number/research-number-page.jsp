<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>

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
</head>
<body>
<div class="common-main">
    <div class="research_title">
        <p>연구자 번호 발급</p>
    </div>

    <div class="academic-info">
        <div class="title_warning">
            <p class="title">학력정보</p>
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
                        <input type="text" name="degreeInstitutionName" class="form-control"
                               placeholder="취득기관명">
                        <span class="input-group-text">
                            <i class="material-icons-outlined calendar-icon">search</i>
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

                        <!-- 세부 전공 선택 -->
                        <select id="major-subcategory" name="majorSubcategory" class="form-select-two"
                                aria-label="Default select example">
                            <!-- 세부 전공 목록은 자바스크립트로 업데이트 -->
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
                        <input type="text" name="workInstitutionName" class="form-control"
                               placeholder="근무기관명">
                        <span class="input-group-text">
                            <i class="material-icons-outlined calendar-icon">search</i>
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
                            <!-- 근무 시작 기간 입력 -->
                            <input type="text" name="workStartDate" class="datepicker_input form-control"
                                   placeholder="근무시작기간" required
                                   aria-label="Start Date">
                            <span class="input-group-text">
                                <i class="material-icons-outlined calendar-icon">calendar_month</i>
                            </span>
                        </div>

                        <span style="margin: 0 10px;">~</span> <!-- 구분자 -->

                        <div class="input-group input-group-small">
                            <!-- 근무 종료 기간 입력 -->
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
                <!-- 새로운 기술분야 행 추가 -->
                <tr>
                    <td><input type="checkbox" class="rowCheckbox"></td>
                    <td>테스트</td>
                    <td>테스트</td>
                    <td>테스트</td>
                </tr>

                <tr>
                    <td><input type="checkbox" class="rowCheckbox"></td>
                    <td>테스트 2</td>
                    <td>테스트 2</td>
                    <td>테스트 2</td>
                </tr>
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
</div>

<script>
    $(document).ready(function () {
        // Datepicker 초기화
        $('.datepicker_input').datepicker({
            format: "yyyy-mm-dd", // 날짜 형식 (년-월-일)
            autoclose: true, // 날짜 선택 시 자동으로 닫힘
            todayHighlight: true, // 오늘 날짜 강조 표시
            language: "ko", // 한국어 설정
            orientation: "bottom auto" // 달력 위치 설정 (아이콘 위/아래 자동 조정)
        });

        // 달력 아이콘 클릭 시 달력 열기
        $('.calendar-icon').click(function () {
            $(this).closest('.input-group').find('.datepicker_input').focus();
        });

        // 전체 선택 체크박스 클릭 시 모든 행의 체크박스 선택/해제
        $('#selectAllCheckbox').click(function () {
            $('.rowCheckbox').prop('checked', this.checked);
        });
    });

    // 전공계열에 따른 세부 전공 매핑
    const majorMap = {
        "engineering": ["화공·고분자·에너지", "기계공학", "전자·전기", "컴퓨터공학", "토목·건축"],
        "science": ["물리학", "화학", "생명과학", "지구과학", "수학"],
        "humanities": ["철학", "역사학", "심리학", "사회학", "경제학"],
        "medicine": ["의학", "간호학", "치의학", "약학", "한의학"],
        "art": ["미술", "음악", "무용", "체육", "디자인"]
    };

    // 첫 번째 셀렉트 박스의 선택에 따라 두 번째 셀렉트 박스를 업데이트하는 함수
    function updateMajorSubcategory() {
        const category = document.getElementById("major-category").value;
        const subcategorySelect = document.getElementById("major-subcategory");

        // 기존 옵션 제거
        subcategorySelect.innerHTML = "";

        // 해당 전공계열에 맞는 세부 전공 추가
        majorMap[category].forEach(function (major) {
            const option = document.createElement("option");
            option.value = major;
            option.text = major;
            subcategorySelect.add(option);
        });
    }

    // 페이지 로드 시 기본값으로 첫 번째 옵션에 맞는 세부 전공 설정
    window.onload = updateMajorSubcategory;
</script>
</body>
</html>