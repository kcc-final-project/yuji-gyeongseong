const sessionDuration = 60 * 60 - 1;
const TIME_INTERVAL = 1000;
const ALERT_TIME = 15 * 60;

let timer;
let remainingTime = sessionDuration;

$(function () {
  setupEventHandlers();
  startSessionTimer();
});

// [컨트롤러] 이벤트 핸들러 등록
function setupEventHandlers() {
  $(".extend-session").on("click", resetSessionTimer);
  $(".anchor-btn").on("click", scrollToTop);
  $(".ctm-btn-init__init").on("click", showResetConfirmation);
  $(".ctm-btn-init__next").on("click", showNextConfirmation);
}

// [컨트롤러] '다음' 버튼 클릭 시, 유효성 검증 및 페이지 이동
function showNextConfirmation() {
  Swal.fire({
    title: "저장",
    text: "다음으로 이동하기 전에 저장하시겠습니까?",
    icon: "question",
    showCancelButton: true,
    confirmButtonText: "확인",
    cancelButtonText: "취소",
    confirmButtonColor: "#ff8f27",
    cancelButtonColor: "#2e406a",
  }).then(async (result) => {
    if (result.isConfirmed) {
      const rndPlanNo = localStorage.getItem("rndPlanNo");

      // 기본정보 유효성 검사 후 페이지 이동
      if (currentStep === 1 && validateBasicFields()) {
        await submitBasicData();
        currentStep += 1;
        updateProgressBar();

        await loadStepContent(currentStep);
        await getRndPlanData();

        // if (isTaskSummarySaved) {
        //   await getTaskSummaryData(rndPlanNo);
        // }
      }

      // 과제요약 유효성 검사 후 페이지 이동
      else if (currentStep === 2 && validateTaskSummaryFields()) {
        await submitTaskSummaryData();

        currentStep += 1;
        updateProgressBar();

        await loadStepContent(currentStep);
        await getRndPlanData();
      }

      // 연구기관 유효성 검사 후 페이지 이동
      else if (currentStep === 3) {

        // TODO: 저장 로직 처리
        currentStep += 1;

        await submitRsrchInstitutionData();

        updateProgressBar();
        loadStepContent(currentStep);
      }

      // 연구개발비 유효성 검사 후 페이지 이동
      else if (currentStep === 4) {
        // TODO: 저장 로직 처리

        currentStep += 1;

        await submitRndExpensesData();

        updateProgressBar();
        loadStepContent(currentStep);
      }

      // 첨부파일 유효성 검사 후 페이지 이동
      else if (currentStep === 5) {
        // TODO: 저장 로직 처리
        currentStep += 1;
        updateProgressBar();
        loadStepContent(currentStep);
      }

      // 필수 항목에 대한 경고창
      else {
        Swal.fire({
          icon: "warning",
          text: "필수 항목 값을 모두 입력해주시기 바랍니다.",
          confirmButtonText: "확인",
          confirmButtonColor: "#2e406a",
        });
      }
    }
  });
}

// [컨트롤러] 세션 타이머 시작
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

// [컨트롤러] 세션 타이머 시간 바인딩
function updateTimerDisplay(time) {
  const minutes = Math.floor(time / 60);
  const seconds = time % 60;
  $(".remaining-time span:first").text(`${minutes}분 ${seconds}초`);
}

// [컨트롤러] 세션 타이머 연장 알림
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

// [컨트롤러] 세션 타이머 초기화
function resetSessionTimer() {
  clearInterval(timer);
  remainingTime = sessionDuration;
  updateTimerDisplay(remainingTime);
  startSessionTimer();
  showToastAboutTimer();
}

// [컨트롤러] 세션 타이머 만료 알림
function sessionExpired() {
  Swal.fire({
    title: "세션 만료",
    text: "세션 시간이 만료되었습니다. 다시 로그인 해주세요.",
    icon: "error",
    confirmButtonText: "확인",
    confirmButtonColor: "#2e406a",
    willClose: () => {
      window.location.href = "/member/sign/in"; // TODO: 로그인 URL로 수정
    },
  });
}

// [컨트롤러] 스크롤 애니메이션 적용 (최상단으로 스크롤링)
function scrollToTop() {
  $("html, body").animate({ scrollTop: 0 }, 150, "linear");
}

// [컨트롤러] 세션 타이머 연장 알림
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

// [컨트롤러] 입력값 초기화 알림
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

// [기본정보] 입력값 초기화
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
