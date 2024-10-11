// 정렬
function onSelectChange() {
    const select = document.getElementById("sortSelect").value;
    const table = document.getElementById("myTable").getElementsByTagName("tbody")[0];
    const rows = Array.from(table.rows);

    if (select === "start") {
        rows.sort((a, b) => new Date(b.cells[2].innerText) - new Date(a.cells[2].innerText));
    } else if (select === "end") {
        rows.sort((a, b) => new Date(a.cells[3].innerText) - new Date(b.cells[3].innerText));
    }

    while (table.firstChild) {
        table.removeChild(table.firstChild);
    }

    rows.forEach(row => table.appendChild(row));
}

// 검색
function filterTable() {
    var filterType = document.getElementById('filterType').value;
    var filterValue = document.getElementById('filterValue').value.toLowerCase();
    var table = document.getElementById('myTable');
    var tr = table.getElementsByTagName('tr');

    for (var i = 1; i < tr.length; i++) {
        var tds = tr[i].getElementsByTagName('td');
        if (filterType === 'all') {
            tr[i].style.display = '';
        } else {
            var td = tds[filterType];
            if (td) {
                var txtValue = td.textContent || td.innerText;
                tr[i].style.display = txtValue.toLowerCase().indexOf(filterValue) > -1 ? '' : 'none';
            }
        }
    }
}

// ajasx
$(".committee-link").on("click", function (e) {
    e.preventDefault();
    var committeeId = $(this).data("id");
    var committeeName = $(this).text();
    $("#selectedCommitteeName").text(committeeName); // 평가위원회명 업데이트
    $("#evaluationTaskList").show(); // 평가과제목록 테이블 표시
    // 여기서 AJAX 요청을 통해 연구계획서 과제 목록을 JSON 형식으로 가져와서 표시합니다.
    $.ajax({
        url: "/getResearchPlans", // 서버의 엔드포인트 URL
        method: "GET",
        data: { committeeId: committeeId },
        dataType: "json",
        success: function (data) {
            // 데이터를 받아와서 테이블에 표시하는 로직을 추가합니다.
            // 예시: data가 연구계획서 과제 목록일 경우
            var researchPlans = data.researchPlans;
            var tableBody = $("#task-table tbody");
            tableBody.empty(); // 기존 테이블 내용 지우기
            $.each(researchPlans, function (index, plan) {
                var row = $("<tr>");
                row.append($("<td>").text(plan.planName));
                row.append($("<td>").text(plan.startDate));
                row.append($("<td>").text(plan.endDate));
                row.append($("<td>").text(plan.status));
                row.append(
                    $("<td>").append(
                        $("<button>")
                            .addClass(
                                "btn btn-outline-primary btn-sm opinion-share-btn"
                            )
                            .text("의견공유")
                            .data("id", plan.planId)
                            .on("click", function () {
                                // 의견공유 페이지로 이동하는 로직 추가
                                window.location.href =
                                    "/opinionSharePage?planId=" + plan.planId;
                            })
                    )
                ); // 의견공유 버튼 추가
                row.append(
                    $("<td>").append(
                        $("<button>")
                            .addClass("btn btn-outline-primary btn-sm evaluation-btn")
                            .text("평가")
                            .data("id", plan.planId)
                            .attr("data-bs-toggle", "modal")
                            .attr("data-bs-target", "#evaluationModal")
                            .on("click", function () {
                                // 평가 모달을 여는 로직 추가
                                $("#evaluationModal").modal("show");
                                $("#evaluationForm").data("planId", plan.planId);
                            })
                    )
                ); // 평가 버튼 추가
                tableBody.append(row);
            });

            $("#taskTotalCount").text(researchPlans.length); // 총 건수 업데이트
        },
        error: function (error) {
            console.error("Error fetching research plans:", error);
        },
    });
});