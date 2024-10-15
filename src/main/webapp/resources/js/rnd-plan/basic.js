var TASK_TITLE_MAX_LEN = 60;
var ENTER_KEY_CODE = 13;
var TECH_FIELD_MAX_COUNT = 3;

$(function () {
  initializeTaskTitle();
  setupEventHandlers();
  initializeJsTree();
});

// 연구개발과제명 input 데이터 삽입
function initializeTaskTitle() {
  const taskTitle = $("#dpy-task-title").val();
  $("#ipt-task-title").val(taskTitle);
}

// 이벤트 핸들러
function setupEventHandlers() {
  $("#sbt-task-title").on("click", updateTaskTitle);
  $("#ipt-task-title").on("keypress", updateTaskTitleFromEnter);
  $("#btn-add-selected").on("click", addSelectedTechFields);
  $("#btn-remove-selected").on("click", removeSelectedTechFields);
  $("#select-all").on("change", toggleSelectAllRows);
  $(".techFieldSection-body tbody").on("input", validateWeightSum);
  $(".techFieldSection-body tbody").on(
    "focusout",
    'input[type="number"]',
    sortTableRows,
  );
  $("#btn-modal-complete").on("click", applySelectedTechFields);
}

// 연구개발과제명 변경(엔터키)
function updateTaskTitleFromEnter(event) {
  if (event.keyCode === ENTER_KEY_CODE) {
    updateTaskTitle();
    this.blur();
  }
}

// 연구개발과제명 변경
function updateTaskTitle() {
  const inputtedTaskTitle = $("#ipt-task-title").val();

  if (isTaskTitleTooLong(inputtedTaskTitle)) {
    showValidationFeedback();
    return;
  }

  hideValidationFeedback();
  updateDisplayedTaskTitle(inputtedTaskTitle);
  showToastAboutTaskTitle();
}

// 연구개발과제명 유효성 검사
function isTaskTitleTooLong(taskTitle) {
  return taskTitle.length > TASK_TITLE_MAX_LEN || taskTitle.trim() === "";
}

// 유효성 검사에 따른 에러 텍스트 활성화
function showValidationFeedback() {
  $("#ipt-task-title").addClass("is-invalid");
  $("#task-title-feedback").show();
}

// 유효성 검사에 따른 에러 텍스트 비활성화
function hideValidationFeedback() {
  $("#ipt-task-title").removeClass("is-invalid");
  $("#task-title-feedback").hide();
}

// 과제정보(과제명) 입력값 적용
function updateDisplayedTaskTitle(taskTitle) {
  $("#dpy-task-title").val(taskTitle);
}

// 토스트 알림 활성화
function showToastAboutTaskTitle() {
  Swal.fire({
    toast: true,
    position: "bottom",
    showConfirmButton: false,
    timer: 1300,
    icon: "success",
    title: "정상적으로 연구개발과제명이 적용되었습니다.",
    width: 500,
    background: "#fff",
    color: "#333",
    customClass: {
      popup: "ctm-position",
      icon: "ctm-icon-size",
    },
  });
}

// 기술분류 트리 초기화
function initializeJsTree() {
  // TODO: 서버로부터 데이터 가져오기
  // id: LA -> id: 1 변경해야 함
  let techFieldData = [
    { id: "LA", parent: "#", text: "생명과학", type: "root" },
    { id: "LA01", parent: "LA", text: "분자세포생물학", type: "parent" },
    { id: "LA0101", parent: "LA01", text: "신호전달", type: "child" },
    { id: "LA0102", parent: "LA01", text: "세포구조/운동", type: "child" },
    { id: "LA0103", parent: "LA01", text: "세포분화/사멸", type: "child" },
    { id: "LA0104", parent: "LA01", text: "막 생물학", type: "child" },
    { id: "LA0105", parent: "LA01", text: "유전자 발현조절", type: "child" },
    { id: "LA0106", parent: "LA01", text: "기타", type: "child" },
    { id: "LA02", parent: "LA", text: "유전학·유전체학", type: "parent" },
    { id: "LA0201", parent: "LA02", text: "분자유전학", type: "child" },
    { id: "LA0202", parent: "LA02", text: "세포유전학", type: "child" },
    { id: "LA0203", parent: "LA02", text: "형질전환 생물모델", type: "child" },
    { id: "LA0204", parent: "LA02", text: "유전자 편집·치료", type: "child" },
  ];

  $(".techFieldTree")
    .jstree({
      core: {
        data: techFieldData,
        check_callback: true,
      },
      types: {
        root: {
          icon: "/resources/img/tech-field/root-icon.svg",
        },
        parent: {
          icon: "/resources/img/tech-field/parent-icon.svg",
        },
        child: {
          icon: "/resources/img/tech-field/child-icon.svg",
        },
      },
      checkbox: {
        keep_selected_style: false,
        three_state: false,
      },
      plugins: ["wholerow", "checkbox", "types"],
    })
    .on("redraw.jstree open_node.jstree", hideCheckboxes);
}

// Jstree 체크박스 숨기기
function hideCheckboxes() {
  $(".jstree-node").each(function () {
    let type = $.jstree.reference(this).get_type(this);

    if (type === "root" || type === "parent") {
      $(this).find(".jstree-checkbox").hide();
    } else if (type === "child") {
      $(this).find(".jstree-checkbox").show();
    }
  });
}

// 선택한 기술분야 추가
function addSelectedTechFields() {
  const $selectedNodes = $(".techFieldTree").jstree("get_checked", true);
  const $tableBody = $(".techFieldSection-body tbody");

  // 현재 테이블 항목 수
  let currentCount = $tableBody.children().length;

  $selectedNodes.forEach(function (node) {
    if (node.type === "child") {
      const techName = node.text;
      const existingRow = $tableBody.find('tr[data-id="' + node.id + '"]');

      // 이미 추가된 항목은 중복 추가하지 않음
      if (existingRow.length === 0 && currentCount < TECH_FIELD_MAX_COUNT) {
        const newRow = `
          <tr data-id="${node.id}">
            <td>
              <input class="form-check-input ctm-td-btn-center" type="checkbox" value=""/>
            </td>
            <td class="text-center">
              ${techName}
            </td>
            <td>
              <input class="form-control form-control-sm text-center" type="number" value="0"/>
            </td>
            <td class="text-center">${currentCount + 1}</td>
          </tr>`;

        $tableBody.append(newRow);
        currentCount++;
      } else if (
        existingRow.length === 0 &&
        currentCount >= TECH_FIELD_MAX_COUNT
      ) {
        Swal.fire({
          icon: "warning",
          text: "최대 3개의 기술분류만 추가할 수 있습니다.",
          showConfirmButton: false,
          timer: 1700,
        });
      }
    }
  });
}

// 선택한 기술분야 제거
function removeSelectedTechFields() {
  const $tableBody = $(".techFieldSection-body tbody");
  const $checkedRows = $tableBody
    .find('input[type="checkbox"]:checked')
    .closest("tr");

  // 제거할 항목들
  const idsToRemove = [];
  $checkedRows.each(function () {
    const id = $(this).data("id");
    idsToRemove.push(id);
  });

  // 테이블 행 전체 제거
  $checkedRows.remove();

  // 순위 재정렬
  $tableBody.children().each(function (index) {
    $(this)
      .find("td:last")
      .text(index + 1);
  });

  // jstree 노드 체크 해제
  const $treeInstance = $(".techFieldTree").jstree(true);
  idsToRemove.forEach(function (id) {
    $treeInstance.uncheck_node(id);
  });

  validateWeightSum();

  $("#select-all").prop("checked", false);
  $("#weight-sum-error").hide();
}

// 전체 선택/해제 토글
function toggleSelectAllRows() {
  const isChecked = $(this).is(":checked");

  $(".techFieldSection-body tbody input[type='checkbox']").prop(
    "checked",
    isChecked,
  );
}

// 가중치 합계(100) 유효성 검사
function validateWeightSum() {
  let totalWeight = 0;
  let valid = true;

  $(".techFieldSection-body tbody tr").each(function () {
    const $row = $(this);
    const value = $row.find('input[type="number"]').val();

    let num = parseInt(value, 10);

    // 입력 필드가 비어있거나 유효하지 않은 경우
    if (value === "" || isNaN(num)) {
      valid = false;
      num = 0;
    }

    totalWeight += num;
  });

  // 유효성 검사 결과에 따라 에러 메시지 표시
  if (!valid || totalWeight !== 100) {
    $("#weight-sum-error").show();
  } else {
    $("#weight-sum-error").hide();
  }
}

// 가중치 크기 따라 요소 정렬
function sortTableRows() {
  let rowData = [];

  $(".techFieldSection-body tbody tr").each(function () {
    const $row = $(this);
    const techName = $row.find("td:eq(1)").text().trim();
    const value = $row.find('input[type="number"]').val();
    const num = parseInt(value, 10);

    rowData.push({
      techName: techName,
      weight: num,
      $row: $row.detach(),
    });
  });

  // 내림차순 정렬
  rowData.sort(function (a, b) {
    return b.weight - a.weight;
  });

  // 정렬된 요소로 테이블 갱신
  const $tableBody = $(".techFieldSection-body tbody");
  rowData.forEach(function (data, index) {
    data.$row.find("td:last").text(index + 1);
    $tableBody.append(data.$row);
  });
}

// 연구분야 테이블에 데이터 반영
function applySelectedTechFields() {
  const $tableBody = $(".techFieldSection-body tbody");
  const $rows = $tableBody.find("tr");
  const rowData = [];

  if ($rows.length === 0) {
    for (let i = 1; i <= TECH_FIELD_MAX_COUNT; i++) {
      $("#research-field-" + i).val("");
      $("#research-weight-" + i).val("");
    }

    $("#techFieldModal").modal("hide");
    return;
  }

  $rows.each(function () {
    const $row = $(this);
    const value = $row.find('input[type="number"]').val();
    const techName = $row.find("td:eq(1)").text().trim();
    let num = parseInt(value, 10);

    rowData.push({
      techName: techName,
      weight: num,
    });
  });

  rowData.forEach(function (data, index) {
    const fieldInput = $("#research-field-" + (index + 1));
    const weightInput = $("#research-weight-" + (index + 1));

    fieldInput.val(data.techName);
    weightInput.val(data.weight);
  });

  $("#techFieldModal").modal("hide");
}
