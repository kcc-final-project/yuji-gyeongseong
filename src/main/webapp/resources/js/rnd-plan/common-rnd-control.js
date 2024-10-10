const sessionDuration = 60 * 60 - 1;
const TIME_INTERVAL = 1000;
const ALERT_TIME = 15 * 60;

let timer;
let remainingTime = sessionDuration;

$(function () {
  setupEventHandlers();
  startSessionTimer();
});

// 이벤트 핸들러
function setupEventHandlers() {
  $(".extend-session").on("click", resetSessionTimer);
  $(".anchor-btn").on("click", scrollToTop);
  $(".ctm-btn-init__init").on("click", showResetConfirmation);
}

// 세션 타이머 시작
function startSessionTimer() {
  updateTimerDisplay(remainingTime);

  timer = setInterval(() => {
    remainingTime--;
    updateTimerDisplay(remainingTime);

    if (remainingTime === ALERT_TIME) {
      showAlertAboutSessionExtension();
    }

    if (remainingTime <= 0) {
      clearInterval(timer);
      sessionExpired();
    }
  }, TIME_INTERVAL);
}

// 타이머 시간
function updateTimerDisplay(time) {
  const minutes = Math.floor(time / 60);
  const seconds = time % 60;
  $(".remaining-time span:first").text(`${minutes}분 ${seconds}초`);
}

// 세션 연장 컨펌 알림
function showAlertAboutSessionExtension() {
  Swal.fire({
    title: "남은 시간이 15분 남았습니다.",
    text: "작업을 마치지 못했다면 세션을 연장해주세요.",
    position: "center",
    icon: "warning",
    showCancelButton: true,
    confirmButtonText: "연장하기",
    cancelButtonText: "닫기",
    confirmButtonColor: "#ff8f27",
    cancelButtonColor: "#2e406a",
  }).then((result) => {
    if (result.isConfirmed) {
      resetSessionTimer();
    }
  });
}

// 세션 타이머 리셋
function resetSessionTimer() {
  clearInterval(timer);
  remainingTime = sessionDuration;
  updateTimerDisplay(remainingTime);
  startSessionTimer();
  showToastAboutTimer();
}

// 세션 만료 알림
function sessionExpired() {
  Swal.fire({
    title: "세션 만료",
    text: "세션 시간이 만료되었습니다. 다시 로그인 해주세요.",
    icon: "error",
    confirmButtonText: "확인",
    confirmButtonColor: "#2e406a",
    willClose: () => {
      window.location.href = "/research_number"; // TODO: 로그인 URL로 수정
    },
  });
}

// 화면 최상단으로 스크롤 이동
function scrollToTop() {
  $("html").scrollTop(0);
}

// 세션 연장 성공 알림
function showToastAboutTimer() {
  Swal.fire({
    toast: true,
    position: "bottom",
    showConfirmButton: false,
    timer: 1300,
    icon: "success",
    title: "정상적으로 세션이 연장되었습니다.",
    width: 400,
    background: "#fff",
    color: "#333",
    customClass: {
      popup: "ctm-position",
      icon: "ctm-icon-size",
    },
  });
}

// 초기화 컨펌 알림
function showResetConfirmation() {
  Swal.fire({
    title: "초기화",
    text: "모든 입력값을 초기화하시겠습니까?",
    icon: "warning",
    showCancelButton: true,
    confirmButtonText: "확인",
    cancelButtonText: "취소",
    confirmButtonColor: "#ff8f27",
    cancelButtonColor: "#2e406a",
  }).then((result) => {
    if (result.isConfirmed) {
      resetAllFields();
      scrollToTop();
    }
  });
}

// 모든 필드 초기화
function resetAllFields() {
  $("#dpy-task-title").val("");

  if ($("#ipt-task-title").length) {
    $("#ipt-task-title").val("");

    for (let i = 1; i <= 3; i++) {
      $("#research-field-" + i).val("");
      $("#research-weight-" + i).val("");
    }

    clearTechFieldModal();

    Swal.fire({
      toast: true,
      position: "bottom",
      showConfirmButton: false,
      timer: 1300,
      icon: "success",
      title: "모든 입력값이 초기화되었습니다.",
      width: 400,
      background: "#fff",
      color: "#333",
      customClass: {
        popup: "ctm-position",
        icon: "ctm-icon-size",
      },
    });
  }
}

// 기술분류 모달창 데이터 초기화
function clearTechFieldModal() {
  const $treeInstance = $(".techFieldTree").jstree(true);
  $treeInstance.uncheck_all();

  $(".techFieldSection-body tbody").empty();
}
