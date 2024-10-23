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

// [공통] AJAX 페이지(jsp) 가져오기
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

// [프로그래스 바] 초기화
async function initializeProgressBar() {
  updateProgressBar();

  await loadStepContent(currentStep);
  await getRndPlanData();

  const rndPlanNo = localStorage.getItem("rndPlanNo");
  if (currentStep === 1 && rndPlanNo) {
    await getBasicData(rndPlanNo);
  }

}

// [프로그래스 바] 단계 이동에 대한 이벤트 핸들러
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

    if (currentStep === 2 && rndPlanNo) {
      await getTaskSummaryData(rndPlanNo);
    }
  }
}

// [프로그래스 바] 진행률 변경
function updateProgressBar() {
  const progressPercentage = ((currentStep - 1) / (MAX_STEP - 1)) * 100;
  $(".progress-bar").css("width", progressPercentage + "%");
  updateStepStyles();
}

// [프로그래스 바] 스타일 애니메이션 적용
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

// [프로그래스 바] 스크롤 애니메이션 적용 (box-shadow)
function handleScrollEffect() {
  const headerHeight = $(".common-header").outerHeight();

  $(window).scroll(() => {
    $(".multi-step-progress-bar").toggleClass(
      "bar-shadow",
      $(window).scrollTop() > headerHeight,
    );
  });
}

// [기본정보] AJAX 기본정보 데이터 가져오기
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
      console.log("[getBasicData()] " + err.statusText + " - " + err.status);
    },
    complete: () => {
      $spinnerContainer.hide();
    },
  });
}

// [기본정보] 연구분야 JSON 데이터 바인딩
function applyTechFieldsData({ rndFields }) {
  rndFields.forEach(function (data, index) {
    const fieldInput = $("#research-field-" + (index + 1));
    const weightInput = $("#research-weight-" + (index + 1));

    fieldInput.val(data.name);
    weightInput.val(data.weight);
  });
}

// [기본정보] 과제명 및 연구과제번호 JSON 데이터 바인딩
function applyTaskNameAndTaskNo({ taskName, rndTaskNo }) {
  $("#ipt-task-title").val(taskName);
  $("#dpy-task-title").val(taskName);
  $("#dpy-rnd-task-no").val(rndTaskNo);
}

// [과제정보] AJAX 과제정보 데이터 가져오기
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

// [과제정보] 과제정보 JSON 데이터 바인딩
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

// [과제요약] AJAX 과제요약 데이터 가져오기
async function getTaskSummaryData(rndPlanNo) {
  if (rndPlanNo === undefined && isNaN(rndPlanNo)) {
    return;
  }

  const $spinnerContainer = $(".spinner-container");
  $spinnerContainer.show();

  $.ajax({
    url: `/api/v1/rnd-plans/task-summary/${rndPlanNo}`,
    type: "GET",
    dataType: "json",
    success: ({ data }) => {
      applyRndPeriodData(data.rndPeriods);

      applyFinalContentData(
        data.finalTgtContent,
        data.rndContent,
        data.perfContent,
      );

      applyStageContentData(data.stageContents);
    },
    error: (err) => {
      console.log(
        "[getTaskSummaryData()] " + err.statusText + " - " + err.status,
      );
    },
    complete: () => {
      $spinnerContainer.hide();
    },
  });
}

// [과제요약] 연구개발기간 JSON 데이터 바인딩
function applyRndPeriodData(rndPeriods) {
  const stageDataMap = {};

  for (const rndPeriod of rndPeriods) {
    const stageNumber = rndPeriod.stageNo;
    const years = {
      yearNumber: rndPeriod.yearNo,
      startDate: rndPeriod.startedAt,
      endDate: rndPeriod.endedAt,
    };

    if (!stageDataMap[stageNumber]) {
      stageDataMap[stageNumber] = {
        stageNumber: stageNumber,
        years: [years],
      };
    } else {
      stageDataMap[stageNumber].years.push(years);
    }
  }

  // 배열 변환 후 오름차순 정렬
  stageDataArr = Object.values(stageDataMap);
  stageDataArr.sort((a, b) => a.stageNumber - b.stageNumber);
  stageDataArr.forEach((stage) => {
    stage.years.sort((a, b) => a.yearNumber - b.yearNumber);
  });

  stageData = stageDataArr;
  renderStageTable();
  updateOverallPeriod();
}

// [과제요약] 최종목표 및 내용 JSON 데이터 바인딩
function applyFinalContentData(finalTgtContent, rndContent, perfContent) {
  $("#finalGoalContent").val(finalTgtContent);
  $("#rndContent").val(rndContent);
  $("#rndOutcomePlan").val(perfContent);
}

// [과제요약] 단계별 목표 및 내용 JSON 데이터 바인딩
function applyStageContentData(stageContents) {
  renderStageGoals();

  for (const stageContent of stageContents) {
    const stageNumber = stageContent.stageNo;

    $(`textarea[name=stage-goal-${stageNumber}]`).val(
      stageContent.stgTgtContent,
    );

    $(`textarea[name=stage-rnd-content-${stageNumber}]`).val(
      stageContent.rndContent,
    );
  }
}
