const sessionDuration = 60 * 60 - 1;
const TIME_INTERVAL = 1000;
const ALERT_TIME = 15 * 60;

let timer;
let remainingTime = sessionDuration;

$(function () {
  setupEventHandlers();
  startSessionTimer();
});

// 이벤트 핸들러
function setupEventHandlers() {
  $(".extend-session").on("click", resetSessionTimer);
  $(".anchor-btn").on("click", scrollToTop);
}

// 세션 타이머 시작
function startSessionTimer() {
  updateTimerDisplay(remainingTime);

  timer = setInterval(() => {
    remainingTime--;
    updateTimerDisplay(remainingTime);

    if (remainingTime === ALERT_TIME) {
      alert("남은 시간이 15분 남았습니다. 세션을 연장해주세요.");
    }

    if (remainingTime <= 0) {
      clearInterval(timer);
      sessionExpired();
    }
  }, TIME_INTERVAL);
}

// 타이머 시간
function updateTimerDisplay(time) {
  const minutes = Math.floor(time / 60);
  const seconds = time % 60;
  $(".remaining-time span:first").text(`${minutes}분 ${seconds}초`);
}

// 세션 타이머 리셋
function resetSessionTimer() {
  clearInterval(timer);
  remainingTime = sessionDuration;
  updateTimerDisplay(remainingTime);
  startSessionTimer();
  showToastAboutTimer();
}

// 세션 만료 알림
function sessionExpired() {
  alert("세션 시간이 만료되었습니다. 다시 로그인 해주세요.");
}

// 화면 최상단으로 스크롤 이동
function scrollToTop() {
  $("html").scrollTop(0);
}

// 토스트 알림 활성화
function showToastAboutTimer() {
  const toast = new bootstrap.Toast($("#success-toast2"), {
    autohide: true,
    delay: 1800,
  });
  toast.show();
}
