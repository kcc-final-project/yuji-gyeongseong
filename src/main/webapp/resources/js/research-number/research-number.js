$(document).ready(function () {
    // Datepicker 초기화
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
    /*
      // 트리 구조 데이터 설정
      let treeData = [
        {
          id: "1",
          text: "생명과학",
          children: [
            {
              id: "1.1",
              text: "분자세포생물학",
              children: [
                {
                  id: "1.1.1",
                  text: "신호전달",
                },
                {
                  id: "1.1.2",
                  text: "세포구조/운동",
                },
                {
                  id: "1.1.3",
                  text: "세포변화/사멸",
                },
              ],
            },
          ],
        },
        {
          id: "2",
          text: "화학",
          children: [
            {
              id: "2.1",
              text: "물리화학",
            },
            {
              id: "2.2",
              text: "유기화학",
            },
          ],
        },
      ];

      // 트리 초기화
      $("#technicalTree").jstree({
        core: {
          data: treeData,
        },
        plugins: ["checkbox", "search"],
        checkbox: {
          three_state: false, // 부모/자식 선택 관계 해제
          cascade: "up", // 부모와 자식 간 선택 관계 설정
        },
      });

      // 검색 기능
      $("#searchTechnical").on("click", function () {
        let searchString = $("#technicalGroupNameSearch").val();
        $("#technicalTree").jstree("search", searchString);
      });

      // 모달에서 선택된 값 추가
      $("#addTechnicalConfirmBtn").click(function () {
        let selectedNodes = $("#technicalTree").jstree("get_selected", true);
        let selectedHtml = "";

        selectedNodes.forEach(function (node) {
          selectedHtml += `
                    <tr>
                        <td><input type="checkbox" class="rowCheckbox"></td>
                        <td>${node.text}</td>
                        <td>${node.id}</td>
                    </tr>
                    `;
        });

        if (selectedHtml) {
          $("#technicalInfoTableBody").append(selectedHtml);
          $("#addTechnicalModal").modal("hide");
        } else {
          alert("항목을 선택해 주세요.");
        }
      });*/

    $("#degreeInstitutionName")
        .next(".input-group-text")
        .find(".search-icon")
        .click(function () {
            $("#institutionSearchModal").modal("show");
        });

    // 예제 더미 데이터
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
            // console.log(institution.name);
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

        // 체크박스 상태에 따라 기관명 설정
        if (this.checked) {
            var institutionName = $(this).data("name");
            $("#degreeInstitutionName").val(institutionName);
        } else {
            $("#degreeInstitutionName").val(""); // 체크박스가 선택 해제되면 입력 비우기
        }
    });

    $("#addInstitutionBtn").click(function () {
        $("#institutionSearchModal").modal("hide"); // 모달 창 닫기
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


    $("#tree").fancytree({
        extensions: ["table", "gridnav"],
        checkbox: true,
        table: {
            checkboxColumnIdx: 0,
            nodeColumnIdx: 1
        },
        source: [
            {title: "생명과학", key: "1", folder: true, children: [
                    {title: "분자세포생물학", key: "1.1", folder: true, children: [
                            {title: "신호전달", key: "1.1.1"},
                            {title: "세포구조/운동", key: "1.1.2"},
                            {title: "세포변화/사멸", key: "1.1.3"}
                        ]}
                ]},
            {title: "화학", key: "2", folder: true, children: [
                    {title: "물리화학", key: "2.1"},
                    {title: "유기화학", key: "2.2"}
                ]}
        ],
        renderColumns: function(event, data) {
            var node = data.node,
                $tdList = $(node.tr).find(">td");
            $tdList.eq(2).text(node.key);
        }
    }).fancytree("getTree").$container.addClass("fancytree-connectors");

});

// 전공계열에 따른 세부 전공 매핑
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
