// WebSocket 연결 및 알림 수신 함수
function connectWebSocket() {
  var socket = new SockJS("/ws");
  var stompClient = Stomp.over(socket);

  stompClient.connect(
      {},
      function (frame) {
        console.log("Connected: " + frame);

        // 사용자별 큐에 구독 (일관된 경로 사용)
        stompClient.subscribe("/user/queue/notifications", function (message) {
          var noti = JSON.parse(message.body);
          displayNotification(noti);
        });
      },
      function (error) {
        console.error("WebSocket 연결 실패:", error);
        // 재연결 시도 (선택 사항)
        setTimeout(connectWebSocket, 5000);
      }
  );
}

// 알림 표시 함수
function displayNotification(noti) {
  console.log("웹소켓 통해 알림 수신됨");

  const Toast = Swal.mixin({
    toast: true,
    position: 'bottom-right',
    showConfirmButton: false,
    timer: 5000,
    timerProgressBar: true,
    showClass: {
      popup: 'animate__animated animate__fadeInRight'
    },
    hideClass: {
      popup: 'animate__animated animate__fadeOutRight'
    },
    didOpen: (toast) => {
      toast.addEventListener('click', () => {
        // 알림 클릭 시 이동
        window.location.href = noti.redirectPath || "/business-timeline";
      });
    }
  });

  Toast.fire({
    icon: 'info',
    title: `[${noti.notiType} 알림] ${noti.content}`,
  });
}

// 페이지 로드 시 WebSocket 연결
document.addEventListener("DOMContentLoaded", function () {
  connectWebSocket();
});
