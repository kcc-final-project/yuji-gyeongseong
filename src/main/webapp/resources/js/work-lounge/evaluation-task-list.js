function onSelectChange() {
  const select = document.getElementById("sortSelect").value;
  const table = document
    .getElementById("myTable")
    .getElementsByTagName("tbody")[0];
  const rows = Array.from(table.rows);

  if (select === "start") {
    rows.sort(
      (a, b) => new Date(b.cells[2].innerText) - new Date(a.cells[2].innerText),
    );
  } else if (select === "end") {
    rows.sort(
      (a, b) => new Date(a.cells[3].innerText) - new Date(b.cells[3].innerText),
    );
  }

  while (table.firstChild) {
    table.removeChild(table.firstChild);
  }

  rows.forEach((row) => table.appendChild(row));
}

function filterTable() {
  var filterType = document.getElementById("filterType").value;
  var filterValue = document.getElementById("filterValue").value.toLowerCase();
  var table = document.getElementById("myTable");
  var tr = table.getElementsByTagName("tr");

  for (var i = 1; i < tr.length; i++) {
    var tds = tr[i].getElementsByTagName("td");
    if (filterType === "all") {
      tr[i].style.display = "";
    } else {
      var td = tds[filterType];
      if (td) {
        var txtValue = td.textContent || td.innerText;
        tr[i].style.display =
          txtValue.toLowerCase().indexOf(filterValue) > -1 ? "" : "none";
      }
    }
  }
}

$(document).ready(function () {
  $(".committee-link").click(function (e) {
    e.preventDefault();
    var committeeName = $(this).data("id");

    if (
      $("#evaluation-table").length &&
      $("#evaluation-table").data("committee-name") === committeeName
    ) {
      $("#evaluation-header").remove();
      $(".line").remove();
      $("#evaluation-table").remove();
      return;
    }

    if ($("#evaluation-table").length) {
      $("#evaluation-header").remove();
      $(".line").remove();
      $("#evaluation-table").remove();
    }

    $.ajax({
      url: "/api/v1/work_lounge/evaluation-task-list/" + committeeName,
      method: "GET",
      success: function (response) {
        var rowCount = response.length;
        var headerHtml =
          '<div id="evaluation-header" class="d-flex align-items-center my-3 mt-5">';
        headerHtml += "<h4><b>평가과제목록</b></h4>";
        headerHtml +=
          '<h5 class="d-flex text-muted mb-0 ms-3 mt-2"><b>[' +
          committeeName +
          ']</b><p class="ms-1 mt-1">조회결과</p></h5>';

        headerHtml +=
          '<h5 class="text-muted mb-2 ms-auto mt-1">총 ' +
          rowCount +
          "건</h5></div>";
        headerHtml += '<div class="line"></div>';
        var tableHtml =
          headerHtml + '<div style="max-height: 300px; overflow-y: auto">';
        tableHtml +=
          '<table id="evaluation-table" class="table table-bordered text-center table-hover mt-3" data-committee-name="' +
          committeeName +
          '">';
        tableHtml +=
          '<thead><tr class="domain"><th>과제명</th><th>주관연구기관</th><th>연구책임자</th><th>평가완료일자</th><th>평가상태</th><th>의견공유</th><th>평가</th></tr></thead>';
        tableHtml += "<tbody>";
        response.forEach(function (item) {
          tableHtml +=
            '<tr class="letter"><td>' +
            item.taskName +
            "</td><td>" +
            item.rndInstitution +
            "</td><td>" +
            item.name +
            "</td><td>" +
            item.evalCompletedAt +
            "</td><td>" +
            item.evalStatus +
            "</td>";
          tableHtml +=
            '<td><button type="button" class="btn btn-sm btn-back-orange" onclick="window.location.href=\'http://localhost:8082/work-lounge/evaluation-table\'">의견공유</button></td>';
          tableHtml +=
            '<td><button type="button" class="btn btn-sm btn-back-indigo" onclick="window.location.href=\'http://localhost:8082/work-lounge/evaluation-table\'">평가</button></td></tr>';
        });
        tableHtml += "</tbody></table></div>";

        $("#myTable").after(tableHtml);
      },
      error: function (xhr, status, error) {
        console.error("Error fetching data: ", error);
      },
    });
  });
});
