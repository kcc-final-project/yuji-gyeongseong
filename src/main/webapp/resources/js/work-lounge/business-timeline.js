$(document).ready(function () {
  connectWebSocket();

  $("#approveButton").on("click", function () {
    Swal.fire({
      title: "평가위원 제안을 수락하시겠습니까 ?",
      text: "정보를 확인해주세요 !",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#2e406a",
      cancelButtonColor: "#dddbdb",
      confirmButtonText: "승인",
      cancelButtonText: "거부",
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire({
          title: "신청되었습니다!",
          text: "평가위원회 참여 완료되었습니다.",
          icon: "success",
          confirmButtonColor: "#2e406a",
        });
      }
    });
  });

  $(".notification-card").each(function () {
    var category = $(this).data("category");

    if (category === "service") {
      $(this).find(".icon-container span").text("notifications");
    } else if (category === "committee") {
      $(this).find(".icon-container span").text("diversity_3");
    } else if (category === "manager") {
      $(this).find(".icon-container span").text("person_outline");
    } else {
      $(this).find(".icon-container span").text("info");
    }
  });

  $(".filter-button").on("click", function () {
    $(".filter-button").removeClass("active");
    $(this).addClass("active");

    let filter = $(this).attr("id");

    $(".notification-card").each(function () {
      let category = $(this).attr("data-category");

      if (filter === "all") {
        $(this).show();
      } else {
        if (category && category.toLowerCase() === filter.toLowerCase()) {
          $(this).show();
        } else {
          $(this).hide();
        }
      }
    });
  });
});

function approveButton(notificationNo, memNo, notiContentNo) {
  let evalMemberRequest;

  if (event.target.innerText === "승인") {
    alert("평가 제안 승인");
    evalMemberRequest = {
      recvStatus: "승인완료",
      recvStatusEng: "approved",
    };
  } else {
    alert("평가 제안 거부");
    evalMemberRequest = {
      recvStatus: "미승인",
      recvStatusEng: "not-approved",
    };
  }

  // 평가위원 승인/거부 상태 저장
  $.ajax({
    url:
      "/api/v1/research-number/update/evalMember/" +
      memNo +
      "/" +
      notiContentNo,
    type: "POST",
    contentType: "application/json",
    data: JSON.stringify(evalMemberRequest),
    success: function (response) {
    },
    error: function (error) {
      console.log("알림 전송 실패 : ", error);
    },
  });

  // 알림 읽음 상태 변경
  $.ajax({
    url: "/api/v1/research-number/update/noti/" + notificationNo,
    type: "POST",
    contentType: "application/json",
    success: function (response) {
    },
    error: function (error) {
      console.log("알림 상태 변경 실패 : ", error);
    },
  });

  // 버튼 선택 후 텍스트로 변환
  document.getElementById(`action-${notificationNo}`).style.display = "none";

  const selectedText = document.createElement("span");
  selectedText.innerText = "선택완료";
  document
    .getElementById(`action-${notificationNo}`)
    .parentNode.appendChild(selectedText);
}


// WebSocket 연결 및 알림 수신 함수
function connectWebSocket() {
  var socket = new SockJS('/ws');
  var stompClient = Stomp.over(socket);

  stompClient.connect({}, function (frame) {
    console.log('Connected: ' + frame);

    // 사용자별 큐에 구독
    stompClient.subscribe('/user/' + 'yun9869' + '/topic/notifications', function (message) {
      var noti = JSON.parse(message.body);
      displayNotification(noti);
    });
  }, function (error) {
    console.error('WebSocket 연결 실패:', error);
  });
}

// 알림 표시 함수
function displayNotification(noti) {
  console.log('웹소캣됐당')
  Swal.fire({
    title: `[${noti.notiType} 알림]`,
    html: noti.content, // HTML 형식의 콘텐츠
    icon: 'info',
    confirmButtonColor: "#2e406a",
    confirmButtonText: "확인"
  });
}
