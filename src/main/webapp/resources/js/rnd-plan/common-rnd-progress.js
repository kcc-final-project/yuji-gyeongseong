const MIN_STEP = 1;
const MAX_STEP = 6;

let currentStep = 1;

// 현재 단계에 따른 진행률 변경
const displayStep = (stepNumber) => {
  if (MIN_STEP <= stepNumber && stepNumber <= MAX_STEP) {
    currentStep = stepNumber;
    updateProgressBar();

    const path = switchPathFrom(currentStep);
    loadStepContent(path);
  }
};

// 프로그래스 바 진행률 변경
const updateProgressBar = () => {
  const progressPercentage = ((currentStep - 1) / (MAX_STEP - 1)) * 100;
  $(".progress-bar").css("width", progressPercentage + "%");
  updateStepStyles();
};

// 진행률 스타일 변경
const updateStepStyles = () => {
  $(".step-group").each(function (index) {
    if (index + 1 === currentStep) {
      $(this).find(".step-circle").addClass("active-circle");
      $(this).find("span").addClass("active-step");
    } else {
      $(this).find("span").removeClass("active-step");
    }
  });
};

// 요청 경로 반환
const switchPathFrom = (currentStep) => {
  switch (currentStep) {
    case 1:
      return "/basic";
    case 2:
      return "/task-summary";
    case 3:
      return "/rsrch-institution";
    case 4:
      return "/rnd-expenses";
    case 5:
      return "/additional-file";
    case 6:
      return "/final-submit";
  }
};

// 페이지 컴포넌트 AJAX 요청
const loadStepContent = (path) => {
  $.ajax({
    url: "/rnd-plan" + path,
    type: "GET",
    success: function (res) {
      $("#step-content").html(res);
    },
    error: function (err) {
      console.log("[loadStepContent()] " + err.statusText + " - " + err.status);
    },
  });
};

$(document).ready(function () {
  updateProgressBar();

  const path = switchPathFrom(currentStep);
  loadStepContent(path);

  $(".next-step").click(function () {
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
      }, 500);
    }
  });

  $(".prev-step").click(function () {
    if (currentStep > MIN_STEP) {
      $(".step-" + currentStep).addClass(
        "animate__animated animate__fadeOutRight",
      );
      currentStep--;
      setTimeout(function () {
        $(".step")
          .removeClass("animate__animated animate__fadeOutRight")
          .hide();
        $(".step-" + currentStep)
          .show()
          .addClass("animate__animated animate__fadeInLeft");
        updateProgressBar();
      }, 500);
    }
  });
});
