$(document).ready(function () {
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

  $.ajax({
    url: "/api/notifications",
    type: "GET",
    dataType: "json",
    success: function (data) {
      let alarmsContainer = $(".alarms");
      // alarmsContainer.empty(); // 기존 알림 삭제 선택

      data.forEach((notification) => {
        let notificationCard = `
                    <div class="notification-card" data-category="${notification.category}">
                        <div class="icon-container">
                            <span class="material-icons-outlined" style="font-size: 50px">info</span>
                        </div>
                        <div class="notification-content">
                            <p class="notification-title">[${notification.category} 알림]</p>
                            <p class="notification-description">${notification.description}</p>
                        </div>
                        <div class="notification-timestamp">${notification.timestamp}</div>`;

        if (notification.actionUrl) {
          notificationCard += `
                        <div class="button-alarm">
                            <button class="reject-button" onclick="window.location.href='${notification.actionUrl}'">상세보기</button>
                        </div>`;
        }

        notificationCard += `</div>`;
        alarmsContainer.append(notificationCard);
      });
    },
    error: function (error) {
      console.log("알림 오류 발생", error);
    },
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
