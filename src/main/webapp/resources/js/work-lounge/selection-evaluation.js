$(document).ready(function () {
  $(".truncate-text").each(function () {
    var $this = $(this);
    var text = $this.text();
    var maxLength = 50;
    if (text.length > maxLength) {
      $this.data("full-text", text);
      $this.text(text.substring(0, maxLength) + "...");
    }
  });

  $(".truncate-text").on("click", function () {
    var $this = $(this);
    var fullText = $this.data("full-text");
    if ($this.text().includes("...")) {
      $this.text(fullText);
    } else {
      var maxLength = 60;
      $this.text(fullText.substring(0, maxLength) + "...");
    }
  });
});

$(document).ready(function () {
  $(".truncate-text1").each(function () {
    var $this = $(this);
    var text = $this.text();
    var maxLength = 49;
    if (text.length > maxLength) {
      $this.data("full-text", text);
      $this.text(text.substring(0, maxLength) + "...");
    }
  });

  $(".truncate-text1").on("click", function () {
    var $this = $(this);
    var fullText = $this.data("full-text");
    if ($this.text().includes("...")) {
      $this.text(fullText);
    } else {
      var maxLength = 49;
      $this.text(fullText.substring(0, maxLength) + "...");
    }
  });
});

$(document).ready(function () {
  $(".clickable-row").on("click", function () {
    var nextRow = $(this).next(".hidden-row");
    nextRow.toggle();

    var icon = $(this).find(".icon i");
    if (nextRow.is(":visible")) {
      icon.removeClass("down").addClass("up");
    } else {
      icon.removeClass("up").addClass("down");
    }

    $(this).toggleClass("blue");
  });
});

function filterTable(status) {
  const table = document.querySelector(".table-hover tbody"); // 테이블 tbody 요소 선택
  const rows = table.querySelectorAll("tr.clickable-row"); // 모든 'clickable-row' tr 요소 선택
  let visibleRowCount = 0;

  // 각 행을 순회하며 필터링
  rows.forEach((row) => {
    // 평가 상태를 나타내는 span.status 선택
    const statusCell = row.querySelector("td span.status");

    if (statusCell) {
      const statusText = statusCell.textContent.trim(); // 상태 텍스트 추출

      // 선택한 상태와 일치하는 행을 보이도록 설정
      if (statusText === status) {
        row.style.display = ""; // 행 보이기
        const hiddenRow = row.nextElementSibling; // 다음 형제 요소(숨겨진 행)
        if (hiddenRow && hiddenRow.classList.contains("hidden-row")) {
          hiddenRow.style.display = ""; // 숨겨진 행 보이기
        }
        visibleRowCount++;
      } else {
        row.style.display = "none"; // 상태가 일치하지 않으면 행 숨기기
        const hiddenRow = row.nextElementSibling;
        if (hiddenRow && hiddenRow.classList.contains("hidden-row")) {
          hiddenRow.style.display = "none"; // 숨겨진 행 숨기기
        }
      }
    }
  });

  // 필터링 후 총 visibleRowCount 업데이트
  document.getElementById("totalRows").textContent = `총 ${visibleRowCount}건`;
}

function resetTable() {
  const table = document.querySelector(".table-hover tbody");
  const rows = table.querySelectorAll("tr.clickable-row");
  let totalRowCount = 0;

  // 모든 행을 보이도록 설정
  rows.forEach((row) => {
    row.style.display = "";
    const hiddenRow = row.nextElementSibling;
    if (hiddenRow && hiddenRow.classList.contains("hidden-row")) {
      hiddenRow.style.display = "";
    }
    totalRowCount++;
  });

  // 필터 선택을 "미평가"로 설정
  const selectElement = document.querySelector("select");
  selectElement.value = "미평가"; // "미평가"로 설정

  // 필터링 후 총 visibleRowCount 업데이트
  document.getElementById("totalRows").textContent = `총 ${totalRowCount}건`;
}


document.addEventListener("DOMContentLoaded", resetTable);
