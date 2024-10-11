var stageData = [];
var STAGE_LIMIT = 3;
var ANIMATION_TIMEOUT = 1000;

$(function () {
  initializeStageData();
  renderStageTable();
  updateOverallPeriod();
  setupEventHandlers();
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

// 종료일 반환
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

// 테이블 렌더링
function renderStageTable() {
  const $table = $("#stage-table");

  // 기존 데이터 제거
  $table.find("tr:gt(0)").remove();

  stageData.forEach((stage) => {
    // 부모 행 추가
    const parentRow = createParentRow(stage.stageNumber);
    $table.append(parentRow);

    // 자식 행 추가
    stage.years.forEach((year, index) => {
      const isFirstYear = index === 0;
      const yearRow = createYearRow(stage.stageNumber, year, isFirstYear);
      $table.append(yearRow);
    });
  });

  // 단계별 연차의 시작일/종료일, 개월 수 갱신
  stageData.forEach((stage) => {
    stage.years.forEach((year) => {
      const $row = $(
        `tr[data-stage="${stage.stageNumber}"][data-year="${year.yearNumber}"]`,
      );

      updateDuration($row);
    });

    updateParentDates(stage.stageNumber);
  });
}

// 부모(단계) 행 생성
function createParentRow(stageNumber) {
  const isFirstStage = stageNumber === 1;
  const buttonType = addOrRemoveBtnEl(stageNumber, isFirstStage);

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

// 부모(단계) 행 버튼 분기
function addOrRemoveBtnEl(stageNumber, isFirstStage) {
  return isFirstStage
    ? `<div class="add-btn ctm-f-center">
         <span class="material-icons" onclick="addNewStage()">add</span>
       </div>`
    : `<div class="add-btn ctm-f-center">
         <span class="material-icons" onclick="removeStage(${stageNumber})">remove</span>
       </div>`;
}

// 부모(단계) 행 추가 이벤트 핸들러
function addNewStage() {
  // 최대 3단계까지 생성 가능
  if (stageData.length >= STAGE_LIMIT) {
    return;
  }

  // 이전 단계의 종료일 가져오기
  const prevStage = stageData[stageData.length - 1];
  const prevEndDate = prevStage.years[prevStage.years.length - 1].endDate;

  const newStageNumber = stageData.length + 1;
  const newStartDate = addOneDay(prevEndDate);
  const newEndDate = getEndOfYear(newStartDate); // 수정된 부분

  const newStage = {
    stageNumber: newStageNumber,
    years: [
      {
        yearNumber: 1,
        startDate: newStartDate,
        endDate: newEndDate,
      },
    ],
  };

  stageData.push(newStage);

  // 테이블 리렌더링
  renderStageTable();

  // 전체 연구개발기간 갱신
  updateOverallPeriod();
}

// 기준 날짜 +1 Day 반환
function addOneDay(dateString) {
  const date = new Date(dateString);
  date.setDate(date.getDate() + 1);

  return formatDate(date);
}

// 부모(단계) 행 제거 이벤트 핸들러
function removeStage(stageNumber) {
  // 해당 단계 삭제
  stageData = stageData.filter((stage) => stage.stageNumber !== stageNumber);

  // 단계 번호 재설정
  stageData.forEach((stage, index) => {
    stage.stageNumber = index + 1;
  });

  // 테이블 리렌더링
  renderStageTable();

  // 전체 연구개발기간 갱신
  updateOverallPeriod();
}

// 연차 행 생성 함수
function createYearRow(stageNumber, yearData, isFirstYear) {
  const addOrRemoveButton = isFirstYear
    ? `<div class="add-btn ctm-f-center">
         <span class="material-icons" onclick="addSiblingYear(${stageNumber})">add</span>
       </div>`
    : `<div class="add-btn ctm-f-center">
         <span class="material-icons" onclick="removeYear(${stageNumber}, ${yearData.yearNumber})">remove</span>
       </div>`;

  return `
    <tr data-stage="${stageNumber}" data-year="${yearData.yearNumber}">
      <td>
        <div class="text-center">${stageNumber}단계</div>
      </td>
      <td class="d-flex justify-content-around align-items-center">
        <div class="ctm-w45p text-center">${yearData.yearNumber}년차</div>
        ${addOrRemoveButton}
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

// 이벤트 핸들러 설정(?)
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

          // 다음 연차들의 시작일 및 종료일 갱신
          updateFollowingYears(stage, yearNumber - 1);

          // 부모의 날짜 및 개월 수 갱신
          updateParentDates(stageNumber);

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
        updateFollowingYears(stage, yearNumber);

        // 테이블 리렌더링
        renderStageTable();

        // 전체 연구개발기간 갱신
        updateOverallPeriod();
      }
    }
  });
}

// 다음 연차들의 시작일 및 종료일 갱신 함수
function updateFollowingYears(stage, yearIndex) {
  for (let i = yearIndex; i < stage.years.length - 1; i++) {
    const currentYear = stage.years[i];
    const nextYear = stage.years[i + 1];
    const newStartDate = addOneDay(currentYear.endDate);

    if (nextYear.startDate !== newStartDate) {
      nextYear.startDate = newStartDate;

      // 다음 연차의 시작일이 변경되었으므로, 해당 입력 필드 갱신 및 애니메이션 적용
      const $nextRow = $(
        `tr[data-stage="${stage.stageNumber}"][data-year="${nextYear.yearNumber}"]`,
      );
      const $startDateInput = $nextRow.find(".start-date");
      $startDateInput.val(newStartDate);
      animateChange($startDateInput);

      // 개월 수 갱신
      updateDuration($nextRow);
    }
  }
}

// 개월 수 갱신
function updateDuration($row) {
  const startDate = $row.find(".start-date").val();
  const endDate = $row.find(".end-date").val();

  const durationMonths = calculateMonthsDifference(startDate, endDate);

  const $durationCell = $row.find(".duration");
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

// 부모의 시작일 및 종료일 갱신
function updateParentDates(stageNumber) {
  const stage = stageData.find((s) => s.stageNumber === stageNumber);
  if (stage) {
    const startDates = stage.years.map((y) => y.startDate);
    const endDates = stage.years.map((y) => y.endDate);

    const minStartDate = startDates.reduce((a, b) => (a < b ? a : b));
    const maxEndDate = endDates.reduce((a, b) => (a > b ? a : b));

    const $startDateCell = $(`#stage-${stageNumber}-start-date`);
    const $endDateCell = $(`#stage-${stageNumber}-end-date`);

    const oldStartDate = $startDateCell.text();
    const oldEndDate = $endDateCell.text();

    if (oldStartDate !== minStartDate) {
      $startDateCell.text(minStartDate);
      animateChange($startDateCell);
    }

    if (oldEndDate !== maxEndDate) {
      $endDateCell.text(maxEndDate);
      animateChange($endDateCell);
    }

    // 자식 연차들의 개월 수 합산
    let totalDuration = 0;
    stage.years.forEach((year) => {
      const durationMonths = calculateMonthsDifference(
        year.startDate,
        year.endDate,
      );
      totalDuration += durationMonths;
    });

    const $durationCell = $(`#stage-${stageNumber}-duration`);
    const oldDuration = $durationCell.text();

    if (parseInt(oldDuration) !== totalDuration) {
      $durationCell.text(totalDuration);
      animateChange($durationCell);
    }
  }
}

// 전체 연구개발기간 갱신
function updateOverallPeriod() {
  const parentStartDates = stageData.map((stage) => {
    return stage.years[0].startDate;
  });
  const parentEndDates = stageData.map((stage) => {
    const lastYear = stage.years[stage.years.length - 1];
    return lastYear.endDate;
  });

  const overallStartDate = parentStartDates.reduce((a, b) => (a < b ? a : b));
  const overallEndDate = parentEndDates.reduce((a, b) => (a > b ? a : b));

  const $startDateInput = $("#overall-start-date");
  const $endDateInput = $("#overall-end-date");

  const oldStartDate = $startDateInput.val();
  const oldEndDate = $endDateInput.val();

  if (oldStartDate !== overallStartDate) {
    $startDateInput.val(overallStartDate);
    animateChange($startDateInput);
  }

  if (oldEndDate !== overallEndDate) {
    $endDateInput.val(overallEndDate);
    animateChange($endDateInput);
  }

  // 전체 기간은 각 단계의 개월 수 합산
  let totalDuration = 0;
  stageData.forEach((stage) => {
    const durationText = $(`#stage-${stage.stageNumber}-duration`).text();
    const duration = parseInt(durationText) || 0;
    totalDuration += duration;
  });

  const $durationInput = $("#overall-duration");
  const oldDuration = $durationInput.val();

  if (oldDuration !== `${totalDuration} 개월`) {
    $durationInput.val(`${totalDuration} 개월`);
    animateChange($durationInput);
  }
}

// 연차 추가 함수
function addSiblingYear(stageNumber) {
  const stage = stageData.find((s) => s.stageNumber === stageNumber);
  if (stage) {
    const maxYears = stageNumber === STAGE_LIMIT ? 1 : 2;
    if (stage.years.length >= maxYears) {
      return;
    }

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

    // 테이블 리렌더링
    renderStageTable();

    // 전체 연구개발기간 갱신
    updateOverallPeriod();
  }
}

// 연차 삭제 함수
function removeYear(stageNumber, yearNumber) {
  const stage = stageData.find((s) => s.stageNumber === stageNumber);
  if (stage) {
    // 연차 삭제
    stage.years = stage.years.filter((y) => y.yearNumber !== yearNumber);

    // 연차 번호 재설정
    stage.years.forEach((year, index) => {
      year.yearNumber = index + 1;
    });

    // 테이블 리렌더링
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
