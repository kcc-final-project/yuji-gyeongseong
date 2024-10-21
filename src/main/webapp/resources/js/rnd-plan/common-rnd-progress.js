const MIN_STEP = 1;
const MAX_STEP = 6;
const STEP_PATHS = [
  "/basic", // 기본정보
  "/task-summary", // 과제요약
  "/rsrch-institution", // 연구기관
  "/rnd-expenses", // 연구개발비
  "/additional-file", // 첨부파일
  "/final-submit", // 최종제출
];

var currentStep = 1;

$(function () {
  initializeProgressBar();
  handleScrollEffect();
});

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
  const subAnnNo = $("#sub-ann-no").text();
  const memNo = 0;
  const rndPlanNo = 0;

  const path = STEP_PATHS[currentStep - 1];
  const $spinnerContainer = $(".spinner-container");
  const $contentContainer = $("#content-container");

  $spinnerContainer.show();

  $.ajax({
    url: `/rnd-plans${path}?subAnnNo=${subAnnNo}&memNo=${memNo}&rndPlanNo=${rndPlanNo}`,
    type: "GET",
    success: (res) => {
      $contentContainer.html(res);
    },
    error: (err) => {
      console.log(err.responseJSON);
    },
    complete: () => {
      $spinnerContainer.hide();
      scrollToTop();
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
