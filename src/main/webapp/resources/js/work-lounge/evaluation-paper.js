const radios1 = document.querySelectorAll(
    'input[name="score1"], input[name="score2"], input[name="score3"], input[name="score4"], input[name="score5"], input[name="score6"], input[name="score7"], input[name="score8"], input[name="score9"], input[name="score10"]',
);
const radios2 = document.querySelectorAll(
    'input[name="score11"], input[name="score12"], input[name="score13"], input[name="score14"], input[name="score15"], input[name="score16"], input[name="score17"], input[name="score18"], input[name="score19"], input[name="score20"]',
);
const resultElement1 = document.getElementById("result1");
const resultElement2 = document.getElementById("result2");
let totalScore1 = 0;
let totalScore2 = 0;

radios1.forEach((radio) => {
  radio.addEventListener("change", () => {
    totalScore1 = 0;

    radios1.forEach((radio) => {
      if (radio.checked) {
        totalScore1 += parseInt(radio.value);
      }
    });

    resultElement1.textContent = totalScore1;
  });
});

radios2.forEach((radio) => {
  radio.addEventListener("change", () => {
    totalScore2 = 0;

    radios2.forEach((radio) => {
      if (radio.checked) {
        totalScore2 += parseInt(radio.value);
      }
    });

    resultElement2.textContent = totalScore2;
  });
});

var isRequestInProgress = false;
var loadedPapers = {};
var totalScores = {};
var defaultUrl = "/api/v1/work_lounge/evaluation-paper/서식1/공통";

loadData(defaultUrl, "default");

$(".evpaper").click(function (e) {
  e.preventDefault();

  var paperType = $(this).data("id");
  var paperName = $(this).data("form-id");

  var url =
      "/api/v1/work_lounge/evaluation-paper/" + paperName + "/" + paperType;

  if (isRequestInProgress || loadedPapers[paperType]) return;

  isRequestInProgress = true;

  if (!totalScores[url]) {
    totalScores[url] = 0;
    $("#" + paperType + " .result").text(totalScores[url]);
  }

  $("input[type='radio']").prop("checked", false);

  loadData(url, paperType);
});

$(document).ready(function () {
  loadData(defaultUrl, "common");
});

function loadData(url, paperType) {
  $.ajax({
    url: url,
    type: "GET",
    dataType: "json",
    success: function (data) {
      let html = ``;

      data.forEach(function (item, index) {
        html += `
          <tr>
              <th colspan="5" class="table-active blue">
                  ${index + 1}. ${item.content}
              </th>
          </tr>
          <tr>
              <td class="d-flex justify-content-between letter">
                  ${createRadioButton(`score${index + 1}`, `excellent${index + 1}`, 10, "매우 우수함(10점)")}
                  ${createRadioButton(`score${index + 1}`, `superiority${index + 1}`, 8, "우수함(8점)")}
                  ${createRadioButton(`score${index + 1}`, `normal${index + 1}`, 6, "보통(6점)")}
                  ${createRadioButton(`score${index + 1}`, `improvement${index + 1}`, 4, "개선 필요(4점)")}
                  ${createRadioButton(`score${index + 1}`, `shortfall${index + 1}`, 2, "미달(2점)")}
              </td>
          </tr>
        `;
      });

      if (paperType === "common") {
        $(".common tbody").empty().append(html);
      } else {
        $(`.data-table.${paperType} tbody`).empty().append(html);
      }

      $("input[type='radio']").change(function () {
        updateTotalScore(paperType);
      });
    },
    error: function (xhr, status, error) {
      console.error("AJAX 요청 오류:", status, error);
    },
    complete: function () {
      isRequestInProgress = false;
      loadedPapers[paperType] = true;
    },
  });
}

function updateTotalScore(paperType) {
  let totalScore = 0;

  $(`input[type='radio']:checked`).each(function () {
    totalScore += parseInt($(this).val());
  });

  if (paperType === "common") {
    $("#result1").text(totalScore);
    localStorage.setItem(`totalScore_${paperType}`, totalScore);
  } else {
    $("#result2").text(totalScore);

    localStorage.setItem(`totalScore_${paperType}`, totalScore);
  }
}

function createRadioButton(name, id, value, label) {
  return `
      <div class="form-check">
          <input class="form-check-input" type="radio" name="${name}" id="${id}" value="${value}" />
          <label class="form-check-label" for="${id}">${label}</label>
      </div>
  `;
}
