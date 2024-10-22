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
async function initializeProgressBar() {
  updateProgressBar();

  await loadStepContent(currentStep);
  await getRndPlanData();

  const rndPlanNo = localStorage.getItem("rndPlanNo");
  if (currentStep === 1 && rndPlanNo) {
    await getBasicData(rndPlanNo);
  }
}

// 이동할 단계에 대한 이벤트 처리
async function changeStep(stepNumber) {
  if (MIN_STEP <= stepNumber && stepNumber <= MAX_STEP) {
    currentStep = stepNumber;
    updateProgressBar();

    await loadStepContent(currentStep);
    await getRndPlanData();

    const rndPlanNo = localStorage.getItem("rndPlanNo");
    if (currentStep === 1 && rndPlanNo) {
      await getBasicData(rndPlanNo);
    }
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
async function loadStepContent(currentStep) {
  const subAnnNo = $("#sub-ann-no").text();
  const path = STEP_PATHS[currentStep - 1];

  const $spinnerContainer = $(".spinner-container");
  const $contentContainer = $("#content-container");

  $spinnerContainer.show();

  try {
    const res = await $.ajax({
      url: `/rnd-plans${path}?subAnnNo=${subAnnNo}`,
      type: "GET",
    });

    $contentContainer.html(res);
  } catch (err) {
    console.log(err.responseJSON);
  } finally {
    $spinnerContainer.hide();
    scrollToTop();
  }
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

async function getBasicData(rndPlanNo) {
  if (rndPlanNo === undefined && isNaN(rndPlanNo)) {
    return;
  }

  const $spinnerContainer = $(".spinner-container");
  $spinnerContainer.show();

  $.ajax({
    url: `/api/v1/rnd-plans/basic/${rndPlanNo}`,
    type: "GET",
    dataType: "json",
    success: ({ data }) => {
      applyTechFieldsData(data);
      applyTaskNameAndTaskNo(data);
    },
    error: (err) => {
      console.log("[submitBasicData()] " + err.statusText + " - " + err.status);
    },
    complete: () => {
      $spinnerContainer.hide();
    },
  });
}

function applyTechFieldsData({ rndFields }) {
  rndFields.forEach(function (data, index) {
    const fieldInput = $("#research-field-" + (index + 1));
    const weightInput = $("#research-weight-" + (index + 1));

    fieldInput.val(data.name);
    weightInput.val(data.weight);
  });
}

function applyTaskNameAndTaskNo({ taskName, rndTaskNo }) {
  $("#ipt-task-title").val(taskName);
  $("#dpy-task-title").val(taskName);
  $("#dpy-rnd-task-no").val(rndTaskNo);
}

async function getRndPlanData() {
  const rndPlanNo = localStorage.getItem("rndPlanNo");

  if (rndPlanNo) {
    try {
      const { data } = await $.ajax({
        url: `/api/v1/rnd-plans/${rndPlanNo}`,
        type: "GET",
      });

      applyRndPlan(data);
    } catch (err) {
      console.log(err.responseJSON);
    }
  }
}

function applyRndPlan({
  taskName,
  rndTaskNo,
  researcherName,
  institutionName,
}) {
  $("#ipt-task-title").val(taskName);
  $("#dpy-task-title").val(taskName);
  $("#dpy-rnd-task-no").val(rndTaskNo);
  $("#dpy-researcher").val(researcherName);
  $("#dpy-institution").val(institutionName);
}
