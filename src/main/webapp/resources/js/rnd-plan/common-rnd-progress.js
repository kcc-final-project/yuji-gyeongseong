const MIN_STEP = 1;
const MAX_STEP = 6;
const ANIMATION_TIMEOUT = 500;
const STEP_PATHS = [
  "/basic", // 기본정보
  "/task-summary", // 과제요약
  "/rsrch-institution", // 연구기관
  "/rnd-expenses", // 연구개발비
  "/additional-file", // 첨부파일
  "/final-submit", // 최종제출
];

let currentStep = 1;

$(function () {
  initializeProgressBar();
  setupEventHandlers();
  handleScrollEffect();
});

// 이벤트 핸들러
function setupEventHandlers() {
  $(".next-step").on("click", moveToNextStep);
  $(".prev-step").on("click", moveToPrevStep);
}

// 다음 단계로 이동
function moveToNextStep() {
  if (currentStep < MAX_STEP) {
    $(".step-" + currentStep).addClass(
      "animate__animated animate__fadeOutLeft",
    );
    currentStep++;
    setTimeout(function () {
      $(".step").removeClass("animate__animated animate__fadeOutLeft").hide();
      $(".step-" + currentStep)
        .show()
        .addClass("animate__animated animate__fadeInRight");
      updateProgressBar();
    }, ANIMATION_TIMEOUT);
  }
}

// 이전 단계로 이동
function moveToPrevStep() {
  if (currentStep > MIN_STEP) {
    $(".step-" + currentStep).addClass(
      "animate__animated animate__fadeOutRight",
    );
    currentStep--;
    setTimeout(function () {
      $(".step").removeClass("animate__animated animate__fadeOutRight").hide();
      $(".step-" + currentStep)
        .show()
        .addClass("animate__animated animate__fadeInLeft");
      updateProgressBar();
    }, ANIMATION_TIMEOUT);
  }
}

// 프로그래스 바 초기화
function initializeProgressBar() {
  updateProgressBar();
  loadStepContent(currentStep);
}

// 이동할 단계에 대한 이벤트 처리
function changeStep(stepNumber) {
  if (MIN_STEP <= stepNumber && stepNumber <= MAX_STEP) {
    currentStep = stepNumber;
    updateProgressBar();
    loadStepContent(currentStep);
  }
}

// 프로그래스 바 진행률 변경
function updateProgressBar() {
  const progressPercentage = ((currentStep - 1) / (MAX_STEP - 1)) * 100;
  $(".progress-bar").css("width", progressPercentage + "%");
  updateStepStyles();
}

// 프로그래스 바 진행률 스타일 변경
function updateStepStyles() {
  $(".step-group").each(function (index) {
    if (index + 1 === currentStep) {
      $(this).find(".step-circle").addClass("active-circle");
      $(this).find("span").addClass("active-step");
    } else {
      $(this).find("span").removeClass("active-step");
    }
  });
}

// 페이지 컴포넌트 AJAX 요청
function loadStepContent(currentStep) {
  const path = STEP_PATHS[currentStep - 1];
  const $spinnerContainer = $(".spinner-container");
  const $contentContainer = $("#content-container");

  $spinnerContainer.show();

  $.ajax({
    url: "/rnd-plan" + path,
    type: "GET",
    success: (res) => {
      $contentContainer.html(res);
    },
    error: (err) => {
      console.log("[loadStepContent()] " + err.statusText + " - " + err.status);
    },
    complete: () => {
      $spinnerContainer.hide();
      $("html").scrollTop(0);
    },
  });
}

// 스크롤 시 프로그래스 바 상단 고정 및 그림자 효과 부여
function handleScrollEffect() {
  const headerHeight = $(".common-header").outerHeight();

  $(window).scroll(() => {
    $(".multi-step-progress-bar").toggleClass(
      "bar-shadow",
      $(window).scrollTop() > headerHeight,
    );
  });
}
