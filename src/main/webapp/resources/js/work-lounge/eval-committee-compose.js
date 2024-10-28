$(document).ready(function () {
  $("#composeButton").on("click", function () {
    $("#committee-standby").hide();
    $("#committee-info").show();
    $(".committee-summary").show();
  });

  // 테이블 평가위원 이름 눌렀을 시
  $(".committee-table tbody tr").on("click", function () {
    $(".committee-table tbody tr").removeClass("selected-row");
    $(this).addClass("selected-row");

    // 연구원 정보 불러오기
    var committeeId = $(this).data("committee-id");
    loadResearcherInfo(committeeId);
  });

  // 연구자에게 알림 전송
  $("#sendButton").click(function () {
    alert("알림 전송");
    $("input[name='committee']:checked").each(function () {
      var committeeRow = $(this).closest("tr");
      var committeeId = committeeRow.data("committee-id");
      var startDate = committeeRow.data("start-date");
      var endDate = committeeRow.data("end-date");
      var title = committeeRow.data("title");
      sendNotificationToCommitteeMembers(
          committeeId,
          startDate,
          endDate,
          title,
      );
    });
  });
});

// 알림을 받을 위원회 연구원 검색 함수
function sendNotificationToCommitteeMembers(
    committeeId,
    startDate,
    endDate,
    title,
) {
  $.ajax({
    url: `/api/v1/research_number/researchers/${committeeId}`,
    type: "GET",
    dataType: "json",
    success: function (data) {
      data.forEach(function (item) {
        sendNotification(
            item.member.memNo,
            committeeId,
            startDate,
            endDate,
            title,
        );
      });
    },
    error: function (error) {
      console.error("연구원 검색 실패 : ", error);
    },
  });
}

// 각 연구원 알림 함수
function sendNotification(memberId, committeeId, startDate, endDate, title) {
  let content = `평가를 진행하시겠습니까 ? <br> 평가명 : ${title} <br> 평가 기간: ${startDate} ~ ${endDate}`;

  let EvalNotiRequest = {
    content: content,
    notiType: "평가위원",
    dataCategory: "committee",
    // 평가위원회 번호 보내기
    notiContentNo: committeeId,
    memNo: memberId,
  };

  $.ajax({
    url: "/api/v1/research_number/register/eval/" + memberId,
    type: "POST",
    contentType: "application/json",
    data: JSON.stringify(EvalNotiRequest),
    success: function (response) {},
    error: function (error) {
      console.log("알림 전송 실패 : ", error);
    },
  });
}

function loadResearcherInfo(committeeId) {
  $.ajax({
    url: `/api/v1/research_number/researchers/${committeeId}`,
    type: "GET",
    dataType: "json",
    success: function (data) {
      const researcherContainer = document.getElementById(
          "researcherContainer",
      );
      researcherContainer.innerHTML = ""; // 기존 내용 삭제

      data.forEach(function (item) {
        const member = item.member;
        const evaluationMember = item.evaluationMember;

        const card = `
                    <div class="card">
                        <div class="card-row">
                            <span class="card-label">기관명</span>
                            <span class="card-value">${member.institutionName}</span>
                        </div>
                        <div class="card-row">
                            <span class="card-label">이름</span>
                            <span class="card-value">${member.name}</span>
                            <span class="card-label">국가연구자번호</span>
                            <span class="card-value">${member.rsrchNo}</span>
                        </div>
                        <div class="card-row">
                            <div class="card-status">
                                <span class="status ${evaluationMember.recvStatusEng}">${evaluationMember.recvStatus}</span>
                            </div>
                            <span class="card-label">소속기관</span>
                            <span class="card-value">${member.iarType}</span>
                        </div>
                    </div>
                `;
        researcherContainer.innerHTML += card;
      });
    },
    error: function (error) {
      console.error("연구원 불러오기 실패 : :", error);
    },
  });
}
