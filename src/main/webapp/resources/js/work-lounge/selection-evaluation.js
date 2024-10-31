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
  const table = document.querySelector(".table-hover tbody");
  const rows = table.querySelectorAll("tr.clickable-row");
  let visibleRowCount = 0;

  rows.forEach((row) => {
    const statusCell = row.querySelector("td span.badge");
    const statusText = statusCell.textContent.trim();

    if (statusText === status) {
      row.style.display = "";
      const hiddenRow = row.nextElementSibling;
      if (hiddenRow && hiddenRow.classList.contains("hidden-row")) {
        hiddenRow.style.display = "";
      }
      visibleRowCount++;
    } else {
      row.style.display = "none";
      const hiddenRow = row.nextElementSibling;
      if (hiddenRow && hiddenRow.classList.contains("hidden-row")) {
        hiddenRow.style.display = "none";
      }
    }
  });

  document.getElementById("totalRows").textContent = `총 ${visibleRowCount}건`;
}

function resetTable() {
  const table = document.querySelector(".table-hover tbody");
  const rows = table.querySelectorAll("tr.clickable-row");
  let totalRowCount = 0;

  rows.forEach((row) => {
    row.style.display = "";
    const hiddenRow = row.nextElementSibling;
    if (hiddenRow && hiddenRow.classList.contains("hidden-row")) {
      hiddenRow.style.display = "";
    }
    totalRowCount++;
  });

  document.getElementById("totalRows").textContent = `총 ${totalRowCount}건`;
}

document.addEventListener("DOMContentLoaded", resetTable);
