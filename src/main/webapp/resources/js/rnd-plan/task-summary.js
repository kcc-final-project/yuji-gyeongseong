var stageData = [];
var STAGE_LIMIT = 3;
var ANIMATION_TIMEOUT = 1000;

$(function () {
  initializeStageData();
  renderStageTable();
  renderStageGoals();
  updateOverallPeriod();
  setupEventHandlers();
  setupTextareaHandlers();
});

// 초기값 설정
function initializeStageData() {
  stageData = [
    {
      stageNumber: 1,
      years: [
        {
          yearNumber: 1,
          startDate: getToday(),
          endDate: getEndOfYear(getToday()),
        },
      ],
    },
  ];
}

// 시스템 날짜 반환
function getToday() {
  const today = new Date();
  return formatDate(today);
}

// 제야 날짜 반환
function getEndOfYear(dateString) {
  const date = new Date(dateString);
  const year = date.getFullYear();
  const endDate = new Date(year, 11, 31);

  return formatDate(endDate);
}

// 날짜 형식 반환
function formatDate(date) {
  const yyyy = date.getFullYear();
  const mm = ("0" + (date.getMonth() + 1)).slice(-2);
  const dd = ("0" + date.getDate()).slice(-2);

  return `${yyyy}-${mm}-${dd}`;
}

// 연구개발단계구성 및 연구개발기간 테이블 렌더링
function renderStageTable() {
  const $table = $("#stage-table");

  // 기존 데이터 제거
  $table.find("tr:gt(0)").remove();

  stageData.forEach(({ stageNumber, years }) => {
    // 단계(부모) 행 추가
    const isFirstStage = stageNumber === 1;
    const stageRow = createStageRow(stageNumber, isFirstStage);
    $table.append(stageRow);

    // 연차(자식) 행 추가
    years.forEach((yearData) => {
      const isFirstYear = yearData.yearNumber === 1;
      const yearRow = createYearRow(stageNumber, yearData, isFirstYear);
      $table.append(yearRow);

      // 개월 수 갱신
      const $yearRow = $(
        `tr[data-stage="${stageNumber}"][data-year="${yearData.yearNumber}"]`,
      );
      updateDuration($yearRow);
    });

    // 단계(부모)의 시작일 및 종료일 갱신
    updateEachStageTotalDates(stageNumber);
  });
}

// 단계(부모) 행 생성
function createStageRow(stageNumber, isFirstStage) {
  const buttonType = stageRowBtnType(stageNumber, isFirstStage);

  return `
    <tr data-stage="${stageNumber}">
      <td class="d-flex ctm-th__sub justify-content-around align-items-center">
        <div class="ctm-w45p ctm-th__sub text-center">${stageNumber}단계</div>
        ${buttonType}
      </td>
      <td class="ctm-th__sub">-</td>
      <td class="ctm-th__sub" id="stage-${stageNumber}-start-date"></td>
      <td class="ctm-th__sub" id="stage-${stageNumber}-end-date"></td>
      <td class="ctm-th__sub" id="stage-${stageNumber}-duration"></td>
    </tr>
  `;
}

// 단계(부모) 행 버튼 분기
function stageRowBtnType(stageNumber, isFirstStage) {
  return isFirstStage
    ? `<div class="add-btn ctm-f-center" onclick="addStageHandler()">
         <span class="material-icons">add</span>
       </div>`
    : `<div class="add-btn ctm-f-center" onclick="removeStageHandler(${stageNumber})">
         <span class="material-icons">remove</span>
       </div>`;
}

// 단계(부모) 행 추가 이벤트 핸들러
function addStageHandler() {
  // 최대 3단계까지 생성 가능
  if (stageData.length >= STAGE_LIMIT) {
    return;
  }

  // 이전 단계의 종료일 가져오기
  const lastStage = stageData.length - 1;
  const prevStage = stageData[lastStage];
  const lastYear = prevStage.years.length - 1;
  const prevEndDate = prevStage.years[lastYear].endDate;

  // 새로운 단계에 대한 단계, 시작일, 종료일 설정
  const newStageNumber = stageData.length + 1;
  const newStartDate = addOneDay(prevEndDate);
  const newEndDate = getEndOfYear(newStartDate);

  const newStage = {
    stageNumber: newStageNumber,
    years: [
      {
        yearNumber: 1, // 1년차
        startDate: newStartDate,
        endDate: newEndDate,
      },
    ],
  };
  stageData.push(newStage);

  // 연구개발단계구성 및 연구개발기간 테이블 리렌더링
  renderStageTable();

  // 단계별 목표 및 내용 테이블 리렌더링
  renderStageGoals();

  // 전체 연구개발기간 갱신
  updateOverallPeriod();
}

// 기준 날짜의 +1 Day 반환
function addOneDay(dateString) {
  const date = new Date(dateString);
  date.setDate(date.getDate() + 1);

  return formatDate(date);
}

// 단계(부모) 행 제거 이벤트 핸들러
function removeStageHandler(selectedStageNumber) {
  // 해당 단계 삭제 및 단계 번호 재설정
  stageData = stageData
    .filter(({ stageNumber }) => stageNumber !== selectedStageNumber)
    .map((item, index) => ({
      ...item,
      stageNumber: index + 1,
    }));

  // 연구개발단계구성 및 연구개발기간 테이블 리렌더링
  renderStageTable();

  // 단계별 목표 및 내용 테이블 리렌더링
  renderStageGoals();

  // 전체 연구개발기간 갱신
  updateOverallPeriod();
}

// 연차(자식) 행 생성
function createYearRow(stageNumber, yearData, isFirstYear) {
  const buttonType = yearBtnType(stageNumber, yearData.yearNumber, isFirstYear);

  return `
    <tr data-stage="${stageNumber}" data-year="${yearData.yearNumber}">
      <td>
        <div class="text-center">${stageNumber}단계</div>
      </td>
      <td class="d-flex justify-content-around align-items-center">
        <div class="ctm-w45p text-center">${yearData.yearNumber}년차</div>
        ${buttonType}
      </td>
      <td>
        <input type="date" class="form-control ctm-datepicker start-date" value="${yearData.startDate}">
      </td>
      <td>
        <input type="date" class="form-control ctm-datepicker end-date" value="${yearData.endDate}">
      </td>
      <td class="duration"></td>
    </tr>
  `;
}

// 연차(자식) 행 버튼 분기
function yearBtnType(stageNumber, yearNumber, isFirstYear) {
  return isFirstYear
    ? `<div class="add-btn ctm-f-center">
         <span class="material-icons" onclick="addYearHandler(${stageNumber})">add</span>
       </div>`
    : `<div class="add-btn ctm-f-center">
         <span class="material-icons" onclick="removeYearHandler(${stageNumber}, ${yearNumber})">remove</span>
       </div>`;
}

// 이벤트 핸들러 설정
function setupEventHandlers() {
  // 시작일 변경 시 종료일 및 다음 연차 시작일 갱신
  $(document).on("change", ".start-date", function () {
    const $row = $(this).closest("tr");
    const stageNumber = parseInt($row.data("stage"));
    const yearNumber = parseInt($row.data("year"));
    const newStartDate = $(this).val();

    // stageData 갱신
    const stage = stageData.find((s) => s.stageNumber === stageNumber);
    if (stage) {
      const year = stage.years.find((y) => y.yearNumber === yearNumber);

      if (year) {
        const oldStartDate = year.startDate;

        if (oldStartDate !== newStartDate) {
          year.startDate = newStartDate;

          // 종료일 갱신
          const oldEndDate = year.endDate;
          year.endDate = getEndOfYear(newStartDate);

          const $endDateInput = $row.find(".end-date");
          if (oldEndDate !== year.endDate) {
            $endDateInput.val(year.endDate);
            animateChange($endDateInput);
          }

          // 개월 수 갱신
          updateDuration($row);

          // 다음 연차들의 시작일 갱신
          updateStartDateFollowingYears(stage, yearNumber - 1);

          // 부모의 날짜 및 개월 수 갱신
          updateEachStageTotalDates(stageNumber);

          // 전체 연구개발기간 갱신
          updateOverallPeriod();
        }
      }
    }
  });

  // 종료일 변경 시 개월 수 및 다음 연차 시작일 갱신
  $(document).on("change", ".end-date", function () {
    const $row = $(this).closest("tr");
    const stageNumber = parseInt($row.data("stage"));
    const yearNumber = parseInt($row.data("year"));
    const newEndDate = $(this).val();

    // stageData 갱신
    const stage = stageData.find((s) => s.stageNumber === stageNumber);
    if (stage) {
      const year = stage.years.find((y) => y.yearNumber === yearNumber);
      if (year) {
        year.endDate = newEndDate;

        // 다음 연차들의 시작일 갱신
        updateStartDateFollowingYears(stage, yearNumber);

        // 연구개발단계구성 및 연구개발기간 테이블 리렌더링
        renderStageTable();

        // 전체 연구개발기간 갱신
        updateOverallPeriod();
      }
    }
  });
}

// 다음 연차들의 시작일 갱신
function updateStartDateFollowingYears({ stageNumber, years }, yearIndex) {
  for (let i = yearIndex; i < years.length - 1; i++) {
    const currentYear = years[i];
    const nextYear = years[i + 1];
    const newStartDate = addOneDay(currentYear.endDate);

    if (nextYear.startDate !== newStartDate) {
      nextYear.startDate = newStartDate; // 시작일 갱신

      const $nextRow = $(
        `tr[data-stage="${stageNumber}"][data-year="${nextYear.yearNumber}"]`,
      );
      const $startDateInput = $nextRow.find(".start-date");
      $startDateInput.val(newStartDate);

      // 애니메이션 적용
      animateChange($startDateInput);

      // 개월 수 갱신
      updateDuration($nextRow);
    }
  }
}

// 개월 수 갱신
function updateDuration($yearRow) {
  const startDate = $yearRow.find(".start-date").val();
  const endDate = $yearRow.find(".end-date").val();

  const durationMonths = calculateMonthsDifference(startDate, endDate);

  const $durationCell = $yearRow.find(".duration");
  const oldDuration = $durationCell.text();

  if (parseInt(oldDuration) !== durationMonths) {
    $durationCell.text(durationMonths);
    animateChange($durationCell);
  }
}

// 개월 수 계산
function calculateMonthsDifference(startDate, endDate) {
  const start = new Date(startDate);
  const end = new Date(endDate);

  const years = end.getFullYear() - start.getFullYear();
  const months = end.getMonth() - start.getMonth();

  return years * 12 + months + 1;
}

// 단계(부모)의 시작일 및 종료일 갱신
function updateEachStageTotalDates(stageNumber) {
  const stage = stageData.find((stage) => stage.stageNumber === stageNumber);

  if (stage) {
    const startDates = stage.years.map((year) => year.startDate);
    const endDates = stage.years.map((year) => year.endDate);

    // 최소 시작일, 최대 종료일
    const minTotalStartDate = startDates.reduce((a, b) => (a < b ? a : b));
    const maxTotalEndDate = endDates.reduce((a, b) => (a > b ? a : b));

    const $startDateCell = $(`#stage-${stageNumber}-start-date`);
    const $endDateCell = $(`#stage-${stageNumber}-end-date`);

    // 이전 최소 시작일, 이전 최대 종료일
    const prevTotalStartDate = $startDateCell.text();
    const prevEndDate = $endDateCell.text();

    if (prevTotalStartDate !== minTotalStartDate) {
      $startDateCell.text(minTotalStartDate);
      animateChange($startDateCell);
    }

    if (prevEndDate !== maxTotalEndDate) {
      $endDateCell.text(maxTotalEndDate);
      animateChange($endDateCell);
    }

    // 각 단계의 총 개월 수
    let totalDuration = 0;
    stage.years.forEach(({ startDate, endDate }) => {
      const durationMonths = calculateMonthsDifference(startDate, endDate);
      totalDuration += durationMonths;
    });

    const $durationCell = $(`#stage-${stageNumber}-duration`);
    const prevTotalDuration = $durationCell.text();

    if (parseInt(prevTotalDuration) !== totalDuration) {
      $durationCell.text(totalDuration);
      animateChange($durationCell);
    }
  }
}

// 전체 연구개발기간 갱신
function updateOverallPeriod() {
  // 각 단계의 최소 시작일
  const eachStageStartDates = stageData.map(({ years }) => {
    return years[0].startDate;
  });

  // 각 단계의 최대 종료일
  const eachStageEndDates = stageData.map(({ years }) => {
    const lastYear = years[years.length - 1];
    return lastYear.endDate;
  });

  const overallStartDate = eachStageStartDates.reduce((a, b) =>
    a < b ? a : b,
  );
  const overallEndDate = eachStageEndDates.reduce((a, b) => (a > b ? a : b));

  const $startDateInput = $("#overall-start-date");
  const $endDateInput = $("#overall-end-date");

  const prevOverallStartDate = $startDateInput.val();
  const prevOverallEndDate = $endDateInput.val();

  if (prevOverallStartDate !== overallStartDate) {
    $startDateInput.val(overallStartDate);
    animateChange($startDateInput);
  }

  if (prevOverallEndDate !== overallEndDate) {
    $endDateInput.val(overallEndDate);
    animateChange($endDateInput);
  }

  // 전체 개월 수
  let totalDuration = 0;
  stageData.forEach((stage) => {
    const durationText = $(`#stage-${stage.stageNumber}-duration`).text();
    const duration = parseInt(durationText) || 0;
    totalDuration += duration;
  });

  const $durationInput = $("#overall-duration");
  const prevDuration = $durationInput.val();

  if (prevDuration !== `${totalDuration} 개월`) {
    $durationInput.val(`${totalDuration} 개월`);
    animateChange($durationInput);
  }
}

// 연차(자식) 행 추가 이벤트 핸들러
function addYearHandler(stageNumber) {
  const stage = stageData.find((stage) => stage.stageNumber === stageNumber);

  if (stage) {
    // 1단계(최대 2년차)
    // 2단계(최대 2년차)
    // 3단계(최대 1년차)
    const maxYears = stageNumber === STAGE_LIMIT ? 1 : 2;
    if (stage.years.length >= maxYears) {
      return;
    }

    // 새로운 연차 정보 설정
    const lastYearNumber = stage.years[stage.years.length - 1].yearNumber;
    const newYearNumber = lastYearNumber + 1;

    const prevEndDate = stage.years[stage.years.length - 1].endDate;
    const newStartDate = addOneDay(prevEndDate);
    const newEndDate = getEndOfYear(newStartDate);

    const newYear = {
      yearNumber: newYearNumber,
      startDate: newStartDate,
      endDate: newEndDate,
    };
    stage.years.push(newYear);

    // 연구개발단계구성 및 연구개발기간 테이블 리렌더링
    renderStageTable();

    // 전체 연구개발기간 갱신
    updateOverallPeriod();
  }
}

// 연차(자식) 행 제거 이벤트 핸들러
function removeYearHandler(stageNumber, yearNumber) {
  const stage = stageData.find((stage) => stage.stageNumber === stageNumber);

  if (stage) {
    // 연차 삭제 및 번호 재설정
    stage.years = stage.years
      .filter((year) => year.yearNumber !== yearNumber)
      .map((item, index) => ({
        ...item,
        yearNumber: index + 1,
      }));

    // 연구개발단계구성 및 연구개발기간 테이블 리렌더링
    renderStageTable();

    // 전체 연구개발기간 갱신
    updateOverallPeriod();
  }
}

// 애니메이션 적용
function animateChange($element) {
  $element.addClass("highlight");

  setTimeout(function () {
    $element.removeClass("highlight");
  }, ANIMATION_TIMEOUT);
}

// 단계별 목표 및 내용 테이블 렌더링
function renderStageGoals() {
  const $stageGoalsSection = $("#stage-goals-section");

  // 기존 내용 제거
  $stageGoalsSection.empty();

  // 단계별로 반복하여 요소 생성
  stageData.forEach((stage) => {
    const stageNumber = stage.stageNumber;

    const stageGoalContent = `
      <tr>
        ${
          stageNumber === 1
            ? `<td class="ctm-th ctm-w15p" 
                rowspan="${stageData.length * 2}">개별연구개발</td>`
            : ""
        }
        <td class="ctm-th__sub ctm-w5p" rowspan="2">${stageNumber}단계</td>
        <td class="ctm-th__sub ctm-w10p">
          <span class="required-item">* </span>
          단계목표내용
        </td>
        <td>
          <textarea class="form-control textarea-input" name="stage-goal-${stageNumber}" minlength="25" maxlength="2000" rows="3"></textarea>
          <div class="ctm-f">
            <span class="fz14">최소 25자 이상</span>
            <div>
              <span class="char-count" data-maxlength="2000">0</span>
              <span> / 2000</span>
            </div>
          </div>
          <div id="stage-goal-feedback-${stageNumber}" class="invalid-feedback error-title" style="display:none;">
            반드시 최소 25자 이상 입력해주시기 바랍니다.
          </div>
        </td>
      </tr>
      <tr>
        <td class="ctm-th__sub ctm-w10p">
          <span class="required-item">* </span>
          연구개발내용
        </td>
        <td>
          <textarea class="form-control textarea-input" name="stage-rnd-content-${stageNumber}" minlength="100" maxlength="2000" rows="3"></textarea>
          <div class="ctm-f">
            <span class="fz14">최소 100자 이상</span>
            <div>
              <span class="char-count" data-maxlength="2000">0</span>
              <span> / 2000</span>
            </div>
          </div>
          <div id="stage-rnd-content-feedback-${stageNumber}" class="invalid-feedback error-title" style="display:none;">
            반드시 최소 100자 이상 입력해주시기 바랍니다.
          </div>
        </td>
      </tr>
    `;

    $stageGoalsSection.append(stageGoalContent);
  });

  // textarea 이벤트 핸들러 갱신
  setupTextareaHandlers();
}

// textarea 이벤트 핸들러 설정
function setupTextareaHandlers() {
  $(".textarea-input").each(function () {
    const $textarea = $(this);
    const $charCount = $textarea.closest("td").find(".char-count");
    const minLength = parseInt($textarea.attr("minlength"));

    // 입력 이벤트 처리
    $textarea.on("input", function () {
      const currentLength = $textarea.val().length;
      $charCount.text(currentLength);

      // 유효한 입력값에 따른 경고 메시지 비활성화
      if (currentLength >= minLength) {
        $textarea.removeClass("invalid-border");

        const $feedbackElement = findFeedbackElement($textarea);
        if ($feedbackElement) {
          $feedbackElement.hide();
        }
      }
    });
  });
}

// 경고 메시지 비활성화 할 요소 반환
function findFeedbackElement($textarea) {
  const textareaId = $textarea.attr("id");
  const textareaName = $textarea.attr("name");

  if (textareaId === "finalGoalContent") {
    return $("#final-goal-content-feedback");
  }

  if (textareaId === "rndContent") {
    return $("#rnd-content-feedback");
  }

  if (textareaId === "rndOutcomePlan") {
    return $("#rnd-outcome-feedback");
  }

  if (textareaName && textareaName.startsWith("stage-goal-")) {
    const stageNumber = textareaName.split("stage-goal-")[1];
    return $(`#stage-goal-feedback-${stageNumber}`);
  }

  if (textareaName && textareaName.startsWith("stage-rnd-content-")) {
    const stageNumber = textareaName.split("stage-rnd-content-")[1];
    return $(`#stage-rnd-content-feedback-${stageNumber}`);
  }

  return null;
}

// 과제요약 유효성 검사
function validateTaskSummaryFields() {
  let isValid = true;
  let invalidElement = null;

  // 최종 목표 및 내용 유효성 검사
  const finalGoalContent = $("#finalGoalContent");
  const rndContent = $("#rndContent");
  const rndOutcomePlan = $("#rndOutcomePlan");

  // 1. 최종목표내용
  if (
    finalGoalContent.val().trim().length <
    parseInt(finalGoalContent.attr("minlength"))
  ) {
    isValid = false;
    $("#final-goal-content-feedback").show();
    finalGoalContent.addClass("invalid-border");

    if (!invalidElement) {
      invalidElement = finalGoalContent;
    }
  } else {
    $("#final-goal-content-feedback").hide();
    finalGoalContent.removeClass("invalid-border");
  }

  // 2. 연구개발내용
  if (rndContent.val().trim().length < parseInt(rndContent.attr("minlength"))) {
    isValid = false;
    $("#rnd-content-feedback").show();
    rndContent.addClass("invalid-border");

    if (!invalidElement) {
      invalidElement = rndContent;
    }
  } else {
    $("#rnd-content-feedback").hide();
    rndContent.removeClass("invalid-border");
  }

  // 3. 연구개발성과 활용계획 및 기대효과
  if (
    rndOutcomePlan.val().trim().length <
    parseInt(rndOutcomePlan.attr("minlength"))
  ) {
    isValid = false;
    $("#rnd-outcome-feedback").show();
    rndOutcomePlan.addClass("invalid-border");

    if (!invalidElement) {
      invalidElement = rndOutcomePlan;
    }
  } else {
    $("#rnd-outcome-feedback").hide();
    rndOutcomePlan.removeClass("invalid-border");
  }

  // 단계별 목표 및 내용 유효성 검사
  stageData.forEach((stage) => {
    const stageNumber = stage.stageNumber;

    // 1. 단계목표내용
    const stageGoalTextarea = $(`textarea[name="stage-goal-${stageNumber}"]`);
    const stageGoalFeedback = $(`#stage-goal-feedback-${stageNumber}`);
    const stageGoalMinlength = parseInt(stageGoalTextarea.attr("minlength"));

    if (stageGoalTextarea.val().trim().length < stageGoalMinlength) {
      isValid = false;
      stageGoalFeedback.show();
      stageGoalTextarea.addClass("invalid-border");

      if (!invalidElement) {
        invalidElement = stageGoalTextarea;
      }
    } else {
      stageGoalFeedback.hide();
      stageGoalTextarea.removeClass("invalid-border");
    }

    // 2. 연구개발내용
    const rndContentTextarea = $(
      `textarea[name="stage-rnd-content-${stageNumber}"]`,
    );
    const rndContentFeedback = $(`#stage-rnd-content-feedback-${stageNumber}`);
    const rndContentMinlength = parseInt(rndContentTextarea.attr("minlength"));

    if (rndContentTextarea.val().trim().length < rndContentMinlength) {
      isValid = false;
      rndContentFeedback.show();
      rndContentTextarea.addClass("invalid-border");

      if (!invalidElement) {
        invalidElement = rndContentTextarea;
      }
    } else {
      rndContentFeedback.hide();
      rndContentTextarea.removeClass("invalid-border");
    }
  });

  if (!isValid) {
    $("html, body").animate(
      {
        scrollTop: invalidElement.offset().top - 20,
      },
      500,
    );
  }

  return isValid;
}

// AJAX 과제요약 데이터 저장
async function submitTaskSummaryData() {
  const rndPlanNo = localStorage.getItem("rndPlanNo");

  const finalTgtContent = $("#finalGoalContent").val();
  const rndContent = $("#rndContent").val();
  const perfContent = $("#rndOutcomePlan").val();

  const rndPeriods = getRndPeriodsData();
  const stageContents = getStageContentsData();

  const bodyData = {
    rndPlanNo,
    finalTgtContent,
    rndContent,
    perfContent,
    rndPeriods,
    stageContents,
  };

  try {
    await $.ajax({
      url: "/api/v1/rnd-plans/task-summary",
      type: "POST",
      contentType: "application/json",
      dataType: "json",
      data: JSON.stringify(bodyData),
    });
  } catch (err) {
    console.log(
      "[submitTaskSummaryData()] " + err.statusText + " - " + err.status,
    );
  }
}

// 연구개발기간 입력 데이터 가져오기
function getRndPeriodsData() {
  const rndPeriods = [];
  const rndPlanNo = localStorage.getItem("rndPlanNo");

  stageData.forEach((stage) => {
    const stageNo = stage.stageNumber;

    stage.years.forEach((year) => {
      const yearNo = year.yearNumber;
      const startedAt = year.startDate;
      const endedAt = year.endDate;
      const mxnth = calculateMonthsDifference(startedAt, endedAt);

      rndPeriods.push({
        stageNo,
        yearNo,
        startedAt,
        endedAt,
        mxnth,
        rndPlanNo,
      });
    });
  });

  return rndPeriods;
}

// 단계별 내용 입력 데이터 가져오기
function getStageContentsData() {
  const stageContents = [];
  const rndPlanNo = localStorage.getItem("rndPlanNo");

  stageData.forEach((stage) => {
    const stageNo = stage.stageNumber;

    const stageGoalTextarea = $(`textarea[name="stage-goal-${stageNo}"]`);
    const stgTgtContent = stageGoalTextarea.val().trim();

    const rndContentTextarea = $(
      `textarea[name="stage-rnd-content-${stageNo}"]`,
    );
    const rndContent = rndContentTextarea.val().trim();

    stageContents.push({
      stageNo,
      stgTgtContent,
      rndContent,
      rndPlanNo,
    });
  });

  return stageContents;
}
