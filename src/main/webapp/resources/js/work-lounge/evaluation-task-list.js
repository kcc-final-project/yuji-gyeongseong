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

$(".committee-link").on("click", function (e) {
  e.preventDefault();
  var committeeId = $(this).data("id");
  var committeeName = $(this).text();
  $("#selectedCommitteeName").text(committeeName);
  $("#evaluationTaskList").show();

  $.ajax({
    url: "/getResearchPlans",
    method: "GET",
    data: { committeeId: committeeId },
    dataType: "json",
    success: function (data) {
      var researchPlans = data.researchPlans;
      var tableBody = $("#task-table tbody");
      tableBody.empty();
      $.each(researchPlans, function (index, plan) {
        var row = $("<tr>");
        row.append($("<td>").text(plan.planName));
        row.append($("<td>").text(plan.startDate));
        row.append($("<td>").text(plan.endDate));
        row.append($("<td>").text(plan.status));
        row.append(
          $("<td>").append(
            $("<button>")
              .addClass("btn btn-outline-primary btn-sm opinion-share-btn")
              .text("의견공유")
              .data("id", plan.planId)
              .on("click", function () {
                window.location.href =
                  "/opinionSharePage?planId=" + plan.planId;
              }),
          ),
        );
        row.append(
          $("<td>").append(
            $("<button>")
              .addClass("btn btn-outline-primary btn-sm evaluation-btn")
              .text("평가")
              .data("id", plan.planId)
              .attr("data-bs-toggle", "modal")
              .attr("data-bs-target", "#evaluationModal")
              .on("click", function () {
                $("#evaluationModal").modal("show");
                $("#evaluationForm").data("planId", plan.planId);
              }),
          ),
        );
        tableBody.append(row);
      });

      $("#taskTotalCount").text(researchPlans.length);
    },
    error: function (error) {
      console.error("Error fetching research plans:", error);
    },
  });
});
