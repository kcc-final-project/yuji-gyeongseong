// # 평가표
let itemCount = 1;

function addItem(text = `항목 ${++itemCount}`, radioCount = 5) {
  const item = document.createElement("div");
  item.className = "item card mb-3"; // card 클래스와 간격 추가
  item.innerHTML = `<div class="card-body survay">
                            <input type="text" class="title-input form-control mb-2" value="${text}">
                            <div class="radio-group mb-2">
                                ${generateRadioButtons(itemCount, radioCount)}
                                <span class="score"></span>
                            </div>
                            <button class="btn ctm-btn-normal remove-button" onclick="removeItem(event)">삭제</button>
                          </div>`;
  item.id = `item-${itemCount}`;
  document.getElementById("items").appendChild(item);
}

function generateRadioButtons(itemCount, radioCount) {
  const labels = ["매우 잘함", "잘함", "보통", "못함", "매우 못함"];
  let radioButtons = "";
  for (let i = 0; i < radioCount; i++) {
    radioButtons += `<label class="form-check-label me-2"><input type="radio" class="form-check-input" name="question${itemCount}" value="${
      radioCount - i
    }" onclick="showScore(event)"> ${radioCount - i}점 ${labels[i]}</label>`;
  }
  return radioButtons;
}

function addQuestion(text) {
  addItem(text);
}

function removeItem(event) {
  const item = event.target.closest(".item");
  item.parentNode.removeChild(item);
}

function showScore(event) {
  const score = event.target.value;
  const scoreSpan = event.target
    .closest(".radio-group")
    .querySelector(".score");
  scoreSpan.textContent = `선택한 점수: ${score}점`;
}

function saveSurvey() {
  const items = document.querySelectorAll(".item");
  items.forEach((item) => {
    const input = item.querySelector(".title-input");
    input.setAttribute("readonly", true);
    input.classList.add("readonly");
    const removeButton = item.querySelector(".remove-button");
    removeButton.disabled = true; // 삭제 버튼 비활성화
  });
  document.querySelector(".add-button").disabled = true;
  document.querySelector(".save-button").disabled = true;
  document.querySelector(".edit-button").disabled = false;

  // 질문 목록의 추가 버튼 비활성화
  const addQuestionButtons = document.querySelectorAll(".add-question-button");
  addQuestionButtons.forEach((button) => (button.disabled = true));
}

function enableEditing() {
  const items = document.querySelectorAll(".item");
  items.forEach((item) => {
    const input = item.querySelector(".title-input");
    input.removeAttribute("readonly");
    input.classList.remove("readonly");
    const removeButton = item.querySelector(".remove-button");
    removeButton.disabled = false; // 삭제 버튼 활성화
  });
  document.querySelector(".add-button").disabled = false;
  document.querySelector(".save-button").disabled = false;
  document.querySelector(".edit-button").disabled = true;

  // 질문 목록의 추가 버튼 활성화
  const addQuestionButtons = document.querySelectorAll(".add-question-button");
  addQuestionButtons.forEach((button) => (button.disabled = false));
}

// 초기 상태에서 버튼 비활성화
document.querySelector(".add-button").disabled = true;
document.querySelector(".save-button").disabled = true;
document.querySelector(".edit-button").disabled = false;

// 질문 목록의 추가 버튼 비활성화
const addQuestionButtons = document.querySelectorAll(".add-question-button");
addQuestionButtons.forEach((button) => (button.disabled = true));
