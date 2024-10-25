$(document).ready(function () {
  let academicInfoCount = 1;
  let careerInfoCount = 1;

  $("#addAcademicInfoButton").click(function () {
    academicInfoCount++;

    const newAcademicInfo = `
        <p class="title">추가학력정보</p>
        <hr class="academic-separator" style="background-color: #939292 ">
        <div class="academic-list" id="academicList${academicInfoCount}">
            <div class="list" id="list${academicInfoCount}">
                <div class="inline-wrap">
                <label>학력구분<span class="warn">*</span></label>
                <select id="degreeType${academicInfoCount}" name="degreeType" class="form-select" aria-label="Default select example">
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
                <select id="degreeCountry${academicInfoCount}" name="degreeCountry" class="form-select">
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
                <input type="text" id="majorName${academicInfoCount}" name="majorName" class="form-input" placeholder="전공명을(를) 입력하세요">
            </div>
            </div>

            <div class="list" id="list${academicInfoCount}Additional">
                <div class="inline-wrap">
                    <label>취득연월<span class="warn">*</span></label>
                    <div class="input-group">
                        <input type="date" id="degreeDate${academicInfoCount}" name="degreeDate" class="form-input">
                    </div>
                </div>

                <div class="inline-wrap">
                    <label>취득기관명<span class="warn">*</span></label>
                    <div class="input-group">
                        <input type="text" name="degreeInstitutionName${academicInfoCount}" id="degreeInstitutionName${academicInfoCount}" class="form-control" placeholder="취득기관명">
                        <span class="input-group-text">
                            <i class="material-icons-outlined search-icon" data-bs-toggle="modal" data-bs-target="#institutionSearchModal" data-index="${academicInfoCount}">search</i>
                        </span>
                    </div>
                </div>

                <div class="inline-wrap">
                    <label>전공계열<span class="warn">*</span></label>
                    <div class="major">
                        <select id="majorCategory${academicInfoCount}" name="majorCategory" class="form-select-two majorCategory" onchange="updateMajorSubcategory()">
                            <option value="공학계열">공학계열</option>
                            <option value="자연과학계열">자연과학계열</option>
                            <option value="인문사회계열">인문사회계열</option>
                            <option value="의약계열">의약계열</option>
                            <option value="예술체육계열">예술체육계열</option>
                            <option value="비즈니스경영계열">비즈니스경영계열</option>
                            <option value="정보기술계열">정보기술계열</option>
                        </select>

                        <select id="majorSubcategory${academicInfoCount}" name="majorSubcategory" class="form-select-two majorSubcategory">
                        </select>
                    </div>
                </div>
        </div>
    `;

    $(".academic-info").append(newAcademicInfo);
  });

  // 경력정보 추가 버튼 클릭 이벤트
  $("#addCareerInfoButton").click(function () {
    careerInfoCount++;

    const newCareerInfo = `
        <p class="title">추가경력정보</p>
        <hr class="career-separator" style="background-color: #939292 ">
        <div class="career-list" id="careerList${careerInfoCount}">
            <div class="list" id="careerList${careerInfoCount}">
                <div class="inline-wrap">
                    <label>근무기관명<span class="warn">*</span></label>
                    <div class="input-group">
                        <input type="text" name="workInstitutionName${careerInfoCount}" id="workInstitutionName${careerInfoCount}" class="form-control"
                               placeholder="근무기관명">
                        <span class="input-group-text">
                            <i class="material-icons-outlined search-icon" data-bs-toggle="modal" data-bs-target="#workInstitutionSearchModal" data-index="${careerInfoCount}">search</i>
                        </span>
                    </div>
                </div>

                <div class="inline-wrap">
                    <label>근무부서<span class="warn">*</span></label>
                    <input type="text" id="workDepartment${careerInfoCount}" name="workDepartment" class="form-input" placeholder="근무부서를 입력하세요">
                </div>
            </div>
            <div class="list" id="careerList${careerInfoCount}Additional">
                <div class="inline-wrap">
                    <label>고용형태<span class="warn">*</span></label>
                    <select id="employmentType${careerInfoCount}" name="employmentType" class="form-select" aria-label="Default select example">
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
                            <input type="date" id="workStartDate${careerInfoCount}" name="workStartDate${careerInfoCount}"
                                   class="form-control" aria-label="Start Date">
                        </div>

                        <span style="margin: 0 10px;">~</span>

                        <div class="input-group input-group-small">
                            <input type="date" id="workEndDate${careerInfoCount}" name="workEndDate${careerInfoCount}" class="form-control" aria-label="End Date">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    `;

    $(".career-info").append(newCareerInfo);
  });

  $("#selectAllCheckbox").click(function () {
    $(".rowCheckbox").prop("checked", this.checked);
  });

  $("#addTechnicalButton").click(function () {
    // 테이블에 현재 있는 기술분야의 개수를 계산
    var numberOfTechnicalFields = $("#technicalInfoTableBody tr").length;

    // 기술분야가 3개 이상이면 추가하지 않음
    if (numberOfTechnicalFields >= 3) {
      alert("기술분야는 최대 3개까지만 추가할 수 있습니다.");
      return; // 추가 프로세스 중지
    }
    $("#addTechnicalModal").modal("show");
  });

  $("#degreeInstitutionName")
      .next(".input-group-text")
      .find(".search-icon")
      .click(function () {
        $("#institutionSearchModal").modal("show");
      });

  $("#searchInstitution").click(function () {
    var searchKeyword = $("#instituteNameSearch").val().toLowerCase();
    var filteredInstitutions = institutions.filter(function (institution) {
      return institution.name.toLowerCase().includes(searchKeyword);
    });

    var tbodyHtml = "";
    filteredInstitutions.forEach(function (institution) {
      tbodyHtml +=
          "<tr>" +
          '<td><input type="checkbox" class="select-institution" data-name="' +
          institution.name +
          '"></td>' +
          "<td>" +
          institution.name +
          "</td>" +
          "<td>" +
          institution.category +
          "</td>" +
          "<td>" +
          institution.registrationNumber +
          "</td>" +
          "</tr>";
    });
    $("#institutionTableBody").html(tbodyHtml);
  });

  // 검색 아이콘 클릭 이벤트: 모달을 열고 현재 입력 필드의 인덱스를 모달에 저장
  $(document).on("click", ".search-icon", function () {
    var index = $(this).data("index"); // 클릭된 아이콘에서 인덱스 추출
    $("#institutionSearchModal").data("target-index", index); // 모달에 인덱스 설정
  });

  // 기관 선택 체크박스 변경 이벤트: 선택된 기관을 해당 인덱스의 입력 필드에 설정
  $(document).on("change", ".select-institution", function () {
    if (this.checked) {
      var institutionName = $(this).data("name");
      var targetIndex = $("#institutionSearchModal").data("target-index"); // 모달에서 설정된 인덱스 사용
      $(`#degreeInstitutionName${targetIndex}`).val(institutionName); // 올바른 입력 필드에 값 설정
    }
  });

  $("#addInstitutionBtn").click(function () {
    $("#institutionSearchModal").modal("hide");
  });

  // 모달이 닫힐 때 선택값을 초기화하는 함수
  $("#institutionSearchModal").on("hidden.bs.modal", function () {
    $(".select-institution").prop("checked", false);
    $("#institutionSearchModal").removeData("target-index"); // 인덱스 데이터 제거
    $("#instituteNameSearch").val("");
  });

  // 모달 열릴 때 전체 리스트 띄우기
  $("#institutionSearchModal").on("shown.bs.modal", function () {
    // 엔터 검색 기능
    $("#instituteNameSearch").keypress(function (event) {
      if (event.which === 13) {
        $("#searchInstitution").click();
        event.preventDefault();
      }
    });

    var tbodyHtml = "";
    institutions.forEach(function (institution) {
      tbodyHtml += `
            <tr>
                <td><input type="checkbox" class="select-institution" data-name="${institution.name}"></td>
                <td>${institution.name}</td>
                <td>${institution.category}</td>
                <td>${institution.registrationNumber}</td>
            </tr>
        `;
    });
    $("#institutionTableBody").html(tbodyHtml);
  });

  $("#searchWorkInstitution").click(function () {
    var searchKeyword = $("#workInstitutionNameSearch").val();
    var filteredWorkInstitutions = workInstitutions.filter(
        function (institution) {
          return institution.name.toLowerCase().includes(searchKeyword);
        },
    );

    var tbodyHtml = "";
    filteredWorkInstitutions.forEach(function (institution) {
      tbodyHtml +=
          "<tr>" +
          '<td><input type="checkbox" class="select-work-institution" data-name="' +
          institution.name +
          '"></td>' +
          "<td>" +
          institution.name +
          "</td>" +
          "<td>" +
          institution.category +
          "</td>" +
          "<td>" +
          institution.registrationNumber +
          "</td>" +
          "</tr>";
    });
    $("#workInstitutionTableBody").html(tbodyHtml);
  });

  // 검색 아이콘 클릭 이벤트: 모달을 열고 현재 입력 필드의 인덱스를 모달에 저장
  $(document).on("click", ".search-icon", function () {
    var index = $(this).data("index"); // 클릭된 아이콘에서 인덱스 추출
    $("#workInstitutionSearchModal").data("target-index", index); // 모달에 인덱스 설정
  });

  $(document).on("change", ".select-work-institution", function () {
    $(".select-work-institution").not(this).prop("checked", false);
    if (this.checked) {
      var workInstitutionName = $(this).data("name");
      var targetIndex = $("#workInstitutionSearchModal").data("target-index"); // 모달에서 설정된 인덱스 사용
      $(`#workInstitutionName${targetIndex}`).val(workInstitutionName); // 올바른 입력 필드에 값 설정
    } else {
      $("#workInstitutionName1").val("");
    }
  });

  $("#addWorkInstitutionBtn").click(function () {
    $("#workInstitutionSearchModal").modal("hide");
  });

  $("#workInstitutionSearchModal").on("hidden.bs.modal", function () {
    $(".select-work-institution").prop("checked", false);
    $("#workInstitutionSearchModal").removeData("target-index"); // 인덱스 데이터 제거
    $("#workInstitutionNameSearch").val("");
  });

  // 기관 모달 열릴 때 전체 리스트 띄우기
  $("#workInstitutionSearchModal").on("shown.bs.modal", function () {
    // 엔터 검색 기능
    $("#workInstitutionNameSearch").keypress(function (event) {
      if (event.which === 13) {
        $("#searchWorkInstitution").click();
        event.preventDefault();
      }
    });

    var tbodyHtml = "";
    workInstitutions.forEach(function (institution) {
      tbodyHtml += `
            <tr>
                <td><input type="checkbox" class="select-work-institution" data-name="${institution.name}" style="font-size: 80px"></td>
                <td>${institution.name}</td>
                <td>${institution.category}</td>
                <td>${institution.registrationNumber}</td>
            </tr>
        `;
    });
    $("#workInstitutionTableBody").html(tbodyHtml);
  });

  $("#tree")
      .fancytree({
        extensions: ["table", "gridnav", "filter"],
        checkbox: true,
        table: {
          checkboxColumnIdx: 0,
          nodeColumnIdx: 1,
        },
        source: [
          {
            title: "물리학",
            key: "PH",
            folder: true,
            checkbox: false,
            children: [
              {
                title: "양자물리",
                key: "PH01",
                folder: true,
                checkbox: false,
                children: [
                  { title: "양자역학", key: "PH0101" },
                  { title: "양자장론", key: "PH0102" },
                  { title: "양자중력", key: "PH0103" },
                  { title: "양자컴퓨팅", key: "PH0104" },
                  { title: "양자정보", key: "PH0105" },
                  { title: "달리 분류되지 않은 양자물리", key: "PH0199" },
                ],
              },
            ],
          },
          {
            title: "지구과학",
            key: "EA",
            folder: true,
            checkbox: false,
            children: [
              {
                title: "대기과학",
                key: "EA01",
                folder: true,
                checkbox: false,
                children: [
                  { title: "기후학", key: "EA0101" },
                  { title: "대기화학", key: "EA0102" },
                  { title: "대기역학", key: "EA0103" },
                  { title: "달리 분류되지 않은 대기과학", key: "EA0199" },
                ],
              },
            ],
          },
          {
            title: "공학",
            key: "EN",
            folder: true,
            checkbox: false,
            children: [
              {
                title: "기계공학",
                key: "EN01",
                folder: true,
                checkbox: false,
                children: [
                  { title: "로보틱스", key: "EN0101" },
                  { title: "자동차 공학", key: "EN0102" },
                  { title: "항공우주 공학", key: "EN0103" },
                  { title: "달리 분류되지 않은 기계공학", key: "EN0199" },
                ],
              },
            ],
          },
          {
            title: "정보기술",
            key: "IT",
            folder: true,
            checkbox: false,
            children: [
              {
                title: "컴퓨터 과학",
                key: "IT01",
                folder: true,
                checkbox: false,
                children: [
                  { title: "알고리즘", key: "IT0101" },
                  { title: "데이터베이스", key: "IT0102" },
                  { title: "인공지능", key: "IT0103" },
                  { title: "사이버보안", key: "IT0104" },
                  { title: "달리 분류되지 않은 컴퓨터 과학", key: "IT0199" },
                ],
              },
            ],
          },
          {
            title: "의학",
            key: "MD",
            folder: true,
            checkbox: false,
            children: [
              {
                title: "임상의학",
                key: "MD01",
                folder: true,
                checkbox: false,
                children: [
                  { title: "내과", key: "MD0101" },
                  { title: "외과", key: "MD0102" },
                  { title: "소아과", key: "MD0103" },
                  { title: "산부인과", key: "MD0104" },
                  { title: "달리 분류되지 않은 임상의학", key: "MD0199" },
                ],
              },
            ],
          },
        ],

        filter: {
          autoApply: true, // 입력할 때 자동으로 필터 적용
          counter: true, // 일치하는 노드 개수를 카운트
          fuzzy: false, // 퍼지 검색 여부
          hideExpandedCounter: true,
          highlight: true, // 검색어와 일치하는 부분을 강조 표시
        },

        renderColumns: function (event, data) {
          var node = data.node,
              $tdList = $(node.tr).find(">td");
          $tdList.eq(2).text(node.key);
        },
      })
      .fancytree("getTree")
      .$container.addClass("fancytree-connectors");

  // 검색 기능 연결
  $("#searchInput").keyup(function () {
    var match = $(this).val();

    var tree = $("#tree").fancytree("getTree");

    // 검색어로 필터 적용
    tree.filterNodes(match, false);

    // 필터링된 노드를 모두 펼침
    tree.visit(function (node) {
      if (
          node.match ||
          (node.children && node.children.some((child) => child.match))
      ) {
        node.setExpanded(true);
      }
    });
  });

  // 선택 버튼 클릭 이벤트 - 트리에서 선택된 항목들을 테이블에 추가
  $("#addTechnicalConfirmBtn").click(function () {
    // 트리에서 선택된 노드 가져오기
    let selectedNodes = $("#tree").fancytree("getTree").getSelectedNodes();
    let selectedHtml = "";

    selectedNodes.forEach(function (node) {
      if (!node.folder) {
        // 폴더가 아닌 소분류 노드만 추가
        let topLevelNode = node;

        // 최상위 부모 노드 찾기
        while (topLevelNode.parent && !topLevelNode.parent.isRootNode()) {
          topLevelNode = topLevelNode.parent;
        }

        selectedHtml += `
                    <tr>
                        <td><input type="checkbox" class="rowCheckbox"></td>
                        <td>${topLevelNode ? topLevelNode.title : ""}</td> <!-- 기술분류그룹명 (최상위 부모 노드) -->
                        <td>${node.key}</td> <!-- 기술분류코드 -->
                        <td>${node.title}</td> <!-- 기술분류명 -->
                    </tr>
                `;
      }
    });

    // 테이블에서 선택된 항목 삭제 기능
    $("#deleteTechnicalButton").click(function () {
      // 체크된 체크박스를 찾고 해당하는 행을 삭제합니다.
      $("#technicalInfoTableBody .rowCheckbox:checked").each(function () {
        $(this).closest("tr").remove();
      });
    });

    // 선택된 항목이 있다면 테이블에 추가하고 모달을 닫음
    if (selectedHtml) {
      $("#technicalInfoTableBody").append(selectedHtml);
      $("#addTechnicalModal").modal("hide");
    } else {
      alert("소분류 항목을 선택해 주세요.");
    }
  });
  $("#issuanceButton").click(function () {
    let academicInfos = [];
    let careerInfos = [];
    let technicalInfos = [];

    let isValid = true; // 유효성 검사 플래그

    for (let i = 1; i <= academicInfoCount; i++) {
      let academicInfo = {
        abilityType: $(`#degreeType${i}`).val().trim(),
        orgName: $(`#degreeInstitutionName${i}`).val().trim(),
        acquiredCountry: $(`#degreeCountry${i}`).val().trim(),
        majorAffiliation: $(`#majorCategory${i}`).val().trim(),
        majorField: $(`#majorSubcategory${i}`).val().trim(),
        majorName: $(`#majorName${i}`).val().trim(),
        acquiredAt: $(`#degreeDate${i}`).val().trim(),
      };
      // 입력 필드의 유효성 검사
      if (
          !academicInfo.abilityType ||
          !academicInfo.orgName ||
          !academicInfo.acquiredCountry ||
          !academicInfo.majorAffiliation ||
          !academicInfo.majorField ||
          !academicInfo.majorName ||
          !academicInfo.acquiredAt
      ) {
        alert("모든 학력 정보 필드를 채워주세요.");
        isValid = false;
        break;
      }
      academicInfos.push(academicInfo);
    }

    if (!isValid) return; // 유효하지 않으면 더 이상 진행하지 않음

    for (let i = 1; i <= careerInfoCount; i++) {
      let careerInfo = {
        orgName: $(`#workInstitutionName${i}`).val().trim(),
        deptName: $(`#workDepartment${i}`).val().trim(),
        careerType: $(`#employmentType${i}`).val().trim(),
        startedAt: $(`#workStartDate${i}`).val().trim(),
        endedAt: $(`#workEndDate${i}`).val().trim(),
      };
      // 입력 필드의 유효성 검사
      if (
          !careerInfo.orgName ||
          !careerInfo.deptName ||
          !careerInfo.careerType ||
          !careerInfo.startedAt ||
          !careerInfo.endedAt
      ) {
        alert("모든 경력 정보 필드를 채워주세요.");
        isValid = false;
        break;
      }
      careerInfos.push(careerInfo);
    }

    if (!isValid) return; // 유효하지 않으면 더 이상 진행하지 않음

    $("#technicalInfoTableBody tr").each(function () {
      let technicalInfo = {
        techGroupName: $(this).find("td").eq(1).text().trim(),
        techCode: $(this).find("td").eq(2).text().trim(),
        techName: $(this).find("td").eq(3).text().trim(),
      };
      // 입력 필드의 유효성 검사
      if (
          !technicalInfo.techGroupName ||
          !technicalInfo.techCode ||
          !technicalInfo.techName
      ) {
        alert("모든 기술분야 정보 필드를 채워주세요.");
        isValid = false;
        return false; // each 루프 중단
      }
      technicalInfos.push(technicalInfo);
    });

    // 학력 및 경력 및 기술분야 정보를 함께 저장하는 AJAX 요청
    let SubmitResearchRequest = {
      academicInfos: academicInfos,
      careerInfos: careerInfos,
      technicalInfos: technicalInfos,
    };

    // 로그인 회원의 번호
    let memberId = 1;

    let EvalNotiRequest = {
      content: "윤채원님의 연구자 번호가 발급되었습니다.",
      notiType: "연구자",
      dataCategory: "service",
      memNo: memberId,
    };

    // ajax 예제
    $.ajax({
      url: "/api/v1/research_number/register/research/" + memberId,
      type: "POST",
      contentType: "application/json",
      data: JSON.stringify(SubmitResearchRequest),
      success: function (response) {
        alert("학력 정보 저장 완료");

        $.ajax({
          url: "/api/v1/research_number/register/eval/" + memberId,
          type: "POST",
          contentType: "application/json",
          data: JSON.stringify(EvalNotiRequest),
          success: function (response) {},
          error: function (error) {
            alert("저장 알림 실패");
            console.log(error, "error");
          },
        });
      },
      error: function (error) {
        alert("학력 정보 저장 중 오류 발생");
        console.log("error : ", error);
      },
    });
  });
});

// 첫 번째 셀렉트 박스의 선택에 따라 두 번째 셀렉트 박스를 업데이트하는 함수
function updateMajorSubcategory() {
  const categoryElements = document.getElementsByClassName("majorCategory");
  const subcategoryElements =
      document.getElementsByClassName("majorSubcategory");

  for (let i = 0; i < categoryElements.length; i++) {
    let categoryValue = categoryElements[i].value;
    let subcategorySelect = subcategoryElements[i]; // 동일 인덱스를 사용

    subcategorySelect.innerHTML = ""; // 하위 카테고리 초기화
    majorMap[categoryValue].forEach(function (major) {
      let option = document.createElement("option");
      option.value = major;
      option.text = major;
      subcategorySelect.appendChild(option);
    });
  }
}

$(document).ready(function () {
  window.onload = updateMajorSubcategory;
});

var institutions = [
  {
    id: 1,
    name: "서울대학교",
    category: "대학교",
    registrationNumber: "1000000001",
  },
  {
    id: 2,
    name: "연세대학교",
    category: "대학교",
    registrationNumber: "1000000002",
  },
  {
    id: 3,
    name: "고려대학교",
    category: "대학교",
    registrationNumber: "1000000003",
  },
  {
    id: 4,
    name: "성균관대학교",
    category: "대학교",
    registrationNumber: "1000000004",
  },
  {
    id: 5,
    name: "kcc대학교",
    category: "대학교",
    registrationNumber: "1000000005",
  },
  {
    id: 6,
    name: "한양대학교",
    category: "대학교",
    registrationNumber: "1000000006",
  },
  {
    id: 7,
    name: "중앙대학교",
    category: "대학교",
    registrationNumber: "1000000007",
  },
  {
    id: 8,
    name: "경희대학교",
    category: "대학교",
    registrationNumber: "1000000008",
  },
  {
    id: 9,
    name: "서강대학교",
    category: "대학교",
    registrationNumber: "1000000009",
  },
  {
    id: 10,
    name: "한국외국어대학교",
    category: "대학교",
    registrationNumber: "1000000010",
  },
  {
    id: 11,
    name: "이화여자대학교",
    category: "대학교",
    registrationNumber: "1000000011",
  },
  {
    id: 12,
    name: "동국대학교",
    category: "대학교",
    registrationNumber: "1000000012",
  },
  {
    id: 13,
    name: "홍익대학교",
    category: "대학교",
    registrationNumber: "1000000013",
  },
  {
    id: 14,
    name: "국민대학교",
    category: "대학교",
    registrationNumber: "1000000014",
  },
  {
    id: 15,
    name: "숭실대학교",
    category: "대학교",
    registrationNumber: "1000000015",
  },
  {
    id: 16,
    name: "서울시립대학교",
    category: "대학교",
    registrationNumber: "1000000016",
  },
  {
    id: 17,
    name: "서울과학기술대학교",
    category: "대학교",
    registrationNumber: "1000000017",
  },
  {
    id: 18,
    name: "가톨릭대학교",
    category: "대학교",
    registrationNumber: "1000000018",
  },
  {
    id: 19,
    name: "세종대학교",
    category: "대학교",
    registrationNumber: "1000000019",
  },
  {
    id: 20,
    name: "상명대학교",
    category: "대학교",
    registrationNumber: "1000000020",
  },
];

var workInstitutions = [
  {
    id: 1,
    name: "kcc정보통신",
    category: "기업",
    registrationNumber: "1000000001",
  },
  { id: 2, name: "삼성", category: "기업", registrationNumber: "1000000002" },
  { id: 3, name: "LG", category: "기업", registrationNumber: "1000000003" },
  {
    id: 4,
    name: "SK텔레콤",
    category: "기업",
    registrationNumber: "1000000004",
  },
  {
    id: 5,
    name: "현대자동차",
    category: "기업",
    registrationNumber: "1000000005",
  },
  { id: 6, name: "롯데", category: "기업", registrationNumber: "1000000006" },
  { id: 7, name: "한화", category: "기업", registrationNumber: "1000000007" },
  {
    id: 8,
    name: "GS칼텍스",
    category: "기업",
    registrationNumber: "1000000008",
  },
  { id: 9, name: "포스코", category: "기업", registrationNumber: "1000000009" },
  { id: 10, name: "KT", category: "기업", registrationNumber: "1000000010" },
  { id: 11, name: "CJ", category: "기업", registrationNumber: "1000000011" },
  {
    id: 12,
    name: "네이버",
    category: "기업",
    registrationNumber: "1000000012",
  },
  {
    id: 13,
    name: "카카오",
    category: "기업",
    registrationNumber: "1000000013",
  },
  {
    id: 14,
    name: "신세계",
    category: "기업",
    registrationNumber: "1000000014",
  },
  { id: 15, name: "두산", category: "기업", registrationNumber: "1000000015" },
  { id: 16, name: "한진", category: "기업", registrationNumber: "1000000016" },
  {
    id: 17,
    name: "한국전력",
    category: "기업",
    registrationNumber: "1000000017",
  },
  {
    id: 18,
    name: "한국가스공사",
    category: "기업",
    registrationNumber: "1000000018",
  },
  {
    id: 19,
    name: "LS그룹",
    category: "기업",
    registrationNumber: "1000000019",
  },
  { id: 20, name: "다음", category: "기업", registrationNumber: "1000000020" },
];

var majorMap = {
  공학계열: [
    "화공·고분자·에너지",
    "기계공학",
    "전자·전기",
    "컴퓨터공학",
    "토목·건축",
    "산업공학",
    "재료공학",
    "생명공학",
    "항공우주공학",
    "로봇공학",
  ],
  자연과학계열: [
    "물리학",
    "화학",
    "생명과학",
    "지구과학",
    "수학",
    "천문학",
    "해양학",
    "환경과학",
    "식물학",
    "동물학",
  ],
  인문사회계열: [
    "철학",
    "역사학",
    "심리학",
    "사회학",
    "경제학",
    "정치학",
    "문화학",
    "언어학",
    "문학",
    "법학",
  ],
  의약계열: [
    "의학",
    "간호학",
    "치의학",
    "약학",
    "한의학",
    "생리학",
    "병리학",
    "소아과학",
    "정신의학",
    "피부과학",
  ],
  예술체육계열: [
    "미술",
    "음악",
    "무용",
    "체육",
    "디자인",
    "극작",
    "영화학",
    "건축",
    "사진학",
    "조각",
  ],
  비즈니스경영계열: [
    "경영학",
    "마케팅",
    "회계",
    "재무",
    "인사관리",
    "국제비즈니스",
    "물류학",
    "경영정보시스템",
    "경영전략",
    "조직행동",
  ],
  정보기술계열: [
    "정보보안",
    "데이터사이언스",
    "인공지능",
    "네트워킹",
    "소프트웨어 개발",
    "시스템 분석",
    "클라우드 컴퓨팅",
    "모바일 애플리케이션 개발",
    "게임 개발",
    "빅데이터 분석",
  ],
};
