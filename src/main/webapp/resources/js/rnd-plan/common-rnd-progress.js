const MIN_STEP = 1;
const MAX_STEP = 6;

let currentStep = 1;

// 현재 단계에 따른 진행률 변경
const displayStep = (stepNumber) => {
  if (MIN_STEP <= stepNumber && stepNumber <= MAX_STEP) {
    currentStep = stepNumber;
    updateProgressBar();
  }
};

// 프로그래스 진행률 변경
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

$(document).ready(function () {
  updateProgressBar();

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
