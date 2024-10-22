$(document).ready(function () {
  let academicInfoCount = 1;
  let careerInfoCount = 1;

  $("#addAcademicInfoButton").click(function () {
    academicInfoCount++;

    const newAcademicInfo = `
        <p class="title">추가학력정보</p>
        <hr class="academic-separator" style="background-color: #939292 ">
        <div class="academic-list" id="academicList${academicInfoCount}">
        <div class="academic-list" id="academicList${academicInfoCount}">
            <div class="list" id="list${academicInfoCount}">
                <div class="inline-wrap">
                    <p>학력구분</p>
                    <p class="warn">*</p>
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
                    <p>취득국가</p>
                    <p class="warn">*</p>
                    <select id="degreeCountry${academicInfoCount}" name="degreeCountry" class="form-select"
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
                    <p>전공명</p>
                    <p class="warn">*</p>
                    <input type="text" id="majorName${academicInfoCount}" name="majorName" class="form-input" placeholder="전공명을(를) 입력하세요">
                </div>
            </div>
            <div class="list" id="list${academicInfoCount}Additional">

                <div class="inline-wrap">
                    <p>취득연월</p>
                    <p class="warn">*</p>

                    <div class="input-group">
                        <input type="date" id="degreeDate${academicInfoCount}" name="degreeDate" class="form-input"
                               style="margin-left: 10px">
                    </div>
                </div>

                <div class="inline-wrap">
                    <p>취득기관명</p>
                    <p class="warn">*</p>

                    <div class="input-group">
                        <input type="text" name="degreeInstitutionName${academicInfoCount}" id="degreeInstitutionName${academicInfoCount}" class="form-control"
                               placeholder="취득기관명">
                        <span class="input-group-text">
                    <i class="material-icons-outlined search-icon" data-bs-toggle="modal"
                       data-bs-target="#institutionSearchModal"  data-index="${academicInfoCount}">search</i>
                </span>
                    </div>
                </div>

                <div class="inline-wrap">
                    <p>전공계열</p>
                    <p class="warn">*</p>
                    <div class="major">
                        <select id="majorCategory${academicInfoCount}" name="majorCategory" class="form-select-two majorCategory"
                                aria-label="Default select example" onchange="updateMajorSubcategory()">
                            <option value="공학계열">공학계열</option>
                            <option value="자연과학계열">자연과학계열</option>
                            <option value="인문사회계열">인문사회계열</option>
                            <option value="의약계열">의약계열</option>
                            <option value="예술체육계열">예술체육계열</option>
                        </select>

                        <select id="majorSubcategory${academicInfoCount}" name="majorSubcategory" class="form-select-two majorSubcategory"
                                aria-label="Default select example">
                        </select>
                    </div>
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
                    <p>근무기관명</p>
                    <p class="warn">*</p>
                    <div class="input-group">
                        <input type="text" name="workInstitutionName${careerInfoCount}" id="workInstitutionName${careerInfoCount}" class="form-control"
                               placeholder="근무기관명">
                        <span class="input-group-text">
                            <i class="material-icons-outlined search-icon" data-bs-toggle="modal" data-bs-target="#workInstitutionSearchModal" data-index="${careerInfoCount}">search</i>
                        </span>
                    </div>
                </div>

                <div class="inline-wrap">
                    <p>근무부서</p>
                    <p class="warn">*</p>
                    <input type="text" id="workDepartment${careerInfoCount}" name="workDepartment" class="form-input" placeholder="근무부서를 입력하세요">
                </div>
            </div>
            <div class="list" id="careerList${careerInfoCount}Additional">
                <div class="inline-wrap">
                    <p>고용형태</p>
                    <p class="warn">*</p>
                    <select id="employmentType${careerInfoCount}" name="employmentType" class="form-select" aria-label="Default select example">
                        <option value="정규직">정규직</option>
                        <option value="계약직">계약직</option>
                        <option value="프리랜서">프리랜서</option>
                        <option value="인턴">인턴</option>
                    </select>
                </div>

                <div class="inline-wrap">
                    <p>근무기간</p>
                    <p class="warn">*</p>

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
  ];

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
        institution.id +
        "</td>" +
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
    ];

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
                <td>${institution.id}</td>
                <td>${institution.name}</td>
                <td>${institution.category}</td>
                <td>${institution.registrationNumber}</td>
            </tr>
        `;
    });
    $("#institutionTableBody").html(tbodyHtml);
  });

  var workInstitutions = [
    {
      id: 1,
      name: "kcc정보통신",
      category: "기업",
      registrationNumber: "1000000001",
    },
    { id: 2, name: "삼성", category: "기업", registrationNumber: "1000000002" },
    { id: 3, name: "LG", category: "기업", registrationNumber: "1000000003" },
  ];

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
        institution.id +
        "</td>" +
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
    var workInstitutions = [
      {
        id: 1,
        name: "kcc정보통신",
        category: "기업",
        registrationNumber: "1000000001",
      },
      {
        id: 2,
        name: "삼성",
        category: "기업",
        registrationNumber: "1000000002",
      },
      { id: 3, name: "LG", category: "기업", registrationNumber: "1000000003" },
    ];

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
                <td><input type="checkbox" class="select-work-institution" data-name="${institution.name}"></td>
                <td>${institution.id}</td>
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
          title: "생명과학",
          key: "LA",
          folder: true,
          checkbox: false,
          children: [
            {
              title: "분자세포생물학",
              key: "LA01",
              folder: true,
              checkbox: false,
              children: [
                { title: "신호전달", key: "LA0101" },
                { title: "세포구조/운동", key: "LA0102" },
                { title: "세포변화/사멸", key: "LA0103" },
                { title: "막 생물학", key: "LA0104" },
                { title: "유전자 발현 조절", key: "LA0105" },
                { title: "달리 분류되지 않은 분자세포 생물학", key: "LA0199" },
              ],
            },
          ],
        },
        {
          title: "화학",
          key: "CH",
          folder: true,
          checkbox: false,
          children: [
            {
              title: "물리화학",
              key: "CH01",
              folder: true,
              checkbox: false,
              children: [
                { title: "양자화학", key: "CH0101" },
                { title: "화학 반응속도론", key: "CH0102" },
                { title: "달리 분류되지 않은 물리화학", key: "CH0199" },
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

    for (let i = 1; i <= academicInfoCount; i++) {
      let academicInfo = {
        abilityType: $(`#degreeType${i}`).val(),
        orgName: $(`#degreeInstitutionName${i}`).val(),
        acquiredCountry: $(`#degreeCountry${i}`).val(),
        majorAffiliation: $(`#majorCategory${i}`).val(),
        majorField: $(`#majorSubcategory${i}`).val(),
        majorName: $(`#majorName${i}`).val(),
        acquiredAt: $(`#degreeDate${i}`).val(),
      };
      academicInfos.push(academicInfo);
    }

    for (let i = 1; i <= careerInfoCount; i++) {
      let careerInfo = {
        orgName: $(`#workInstitutionName${i}`).val(),
        deptName: $(`#workDepartment${i}`).val(),
        careerType: $(`#employmentType${i}`).val(),
        startedAt: $(`#workStartDate${i}`).val(),
        endedAt: $(`#workEndDate${i}`).val(),
      };
      careerInfos.push(careerInfo);
    }

    $("#technicalInfoTableBody tr").each(function () {
      let technicalInfo = {
        techGroupName: $(this).find("td").eq(1).text(),
        techCode: $(this).find("td").eq(2).text(),
        techName: $(this).find("td").eq(3).text(),
      };
      technicalInfos.push(technicalInfo);
    });

    // 학력 및 경력 및 기술분야 정보를 함께 저장하는 AJAX 요청
    let SubmitResearchRequest = {
      academicInfos: academicInfos,
      careerInfos: careerInfos,
      technicalInfos: technicalInfos,
    };

    console.log("academicInfos:", academicInfos);
    console.log("careerInfos:", careerInfos);
    console.log("technicalInfos:", technicalInfos);

    // 로그인 회원의 번호
    let memberId = 1;

    // ajax 예제
    $.ajax({
      url: "/api/v1/research_number/register/" + memberId,
      type: "POST",
      contentType: "application/json",
      data: JSON.stringify(SubmitResearchRequest),
      success: function (response) {
        alert("학력 정보 저장 완료");
      },
      error: function (error) {
        alert("학력 정보 저장 중 오류 발생");
        console.log("error : ", error);
      },
    });
  });
});

const majorMap = {
  공학계열: [
    "화공·고분자·에너지",
    "기계공학",
    "전자·전기",
    "컴퓨터공학",
    "토목·건축",
  ],
  자연과학계열: ["물리학", "화학", "생명과학", "지구과학", "수학"],
  인문사회계열: ["철학", "역사학", "심리학", "사회학", "경제학"],
  의약계열: ["의학", "간호학", "치의학", "약학", "한의학"],
  예술체육계열: ["미술", "음악", "무용", "체육", "디자인"],
};

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