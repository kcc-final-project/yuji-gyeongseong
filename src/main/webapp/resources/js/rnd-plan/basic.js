var TASK_TITLE_MAX_LEN = 60;
var ENTER_KEY_CODE = 13;

$(function () {
  initializeTaskTitle();
  setupEventHandlers();
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
  showToast();
}

// 연구개발과제명 유효성 검사
function isTaskTitleTooLong(taskTitle) {
  return taskTitle.length > TASK_TITLE_MAX_LEN;
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
function showToast() {
  const toast = new bootstrap.Toast($("#success-toast"), {
    autohide: true,
    delay: 1800,
  });
  toast.show();
}
