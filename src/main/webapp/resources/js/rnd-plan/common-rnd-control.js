$(function () {
  setupEventHandlers();
});

function setupEventHandlers() {
  $(".anchor-btn").on("click", scrollToTop);
}

// 화면 최상단으로 스크롤 이동
function scrollToTop() {
  $("html").scrollTop(0);
}
