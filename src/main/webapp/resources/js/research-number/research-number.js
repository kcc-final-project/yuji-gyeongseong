$(document).ready(function () {

  $(".datepicker_input").datepicker({
    format: "yyyy-mm-dd",
    autoclose: true,
    todayHighlight: true,
    language: "ko",
    orientation: "bottom auto",
  });
  $(".calendar-icon").click(function () {
    $(this).closest(".input-group").find(".datepicker_input").focus();
  });

  $("#selectAllCheckbox").click(function () {
    $(".rowCheckbox").prop("checked", this.checked);
  });

  $("#addTechnicalButton").click(function () {
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
        //             <td><input type="checkbox" class="select-institution" data-name="${institution.name}"></td>
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

  $(document).on("change", ".select-institution", function () {
    $(".select-institution").not(this).prop("checked", false);

    if (this.checked) {
      var institutionName = $(this).data("name");
      $("#degreeInstitutionName").val(institutionName);
    } else {
      $("#degreeInstitutionName").val("");
    }
  });

  $("#addInstitutionBtn").click(function () {
    $("#institutionSearchModal").modal("hide");
  });

  $("#institutionSearchModal").on("hide.bs.modal", function () {
    // 모달이 닫힐 때 선택 삭제.
    $(".select-institution").prop("checked", false);
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
    var searchKeyword = $("#workInstitutionNameSearch").val().toLowerCase();
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

  $(document).on("change", ".select-work-institution", function () {
    $(".select-work-institution").not(this).prop("checked", false);
    if (this.checked) {
      var institutionName = $(this).data("name");
      $("#workInstitutionName").val(institutionName);
    } else {
      $("#workInstitutionName").val("");
    }
  });

  $("#addWorkInstitutionBtn").click(function () {
    $("#workInstitutionSearchModal").modal("hide");
  });

  $("#workInstitutionSearchModal").on("hide.bs.modal", function () {
    $(".select-work-institution").prop("checked", false);
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

  const majorMap = {
    engineering: [
      "화공·고분자·에너지",
      "기계공학",
      "전자·전기",
      "컴퓨터공학",
      "토목·건축",
    ],
    science: ["물리학", "화학", "생명과학", "지구과학", "수학"],
    humanities: ["철학", "역사학", "심리학", "사회학", "경제학"],
    medicine: ["의학", "간호학", "치의학", "약학", "한의학"],
    art: ["미술", "음악", "무용", "체육", "디자인"],
  };

  // 첫 번째 셀렉트 박스의 선택에 따라 두 번째 셀렉트 박스를 업데이트하는 함수
  function updateMajorSubcategory() {
    const category = document.getElementById("major-category").value;
    const subcategorySelect = document.getElementById("major-subcategory");

    subcategorySelect.innerHTML = "";

    majorMap[category].forEach(function (major) {
      const option = document.createElement("option");
      option.value = major;
      option.text = major;
      subcategorySelect.add(option);
    });
  }

  window.onload = updateMajorSubcategory;
});
