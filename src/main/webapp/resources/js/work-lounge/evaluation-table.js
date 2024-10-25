$(document).ready(function () {
  $(".truncate-text").each(function () {
    var $this = $(this);
    var text = $this.text();
    var maxLength = 70;
    if (text.length > maxLength) {
      $this.data("full-text", text);
      $this.text(text.substring(0, maxLength) + "...");
    }
  });

  $(".truncate-text").on("click", function () {
    var $this = $(this);
    var fullText = $this.data("full-text");
    if ($this.hasClass("full-text")) {
      var maxLength = 70;
      $this.removeClass("full-text");
      $this.text(fullText.substring(0, maxLength) + "...");
    } else {
      $this.addClass("full-text");
      $this.text(fullText);
    }
  });

  $(".truncate-text1").each(function () {
    var $this = $(this);
    var text = $this.text();
    var maxLength = 80;
    if (text.length > maxLength) {
      $this.data("full-text", text);
      $this.text(text.substring(0, maxLength) + "...");
    }
  });

  $(".truncate-text1").on("click", function () {
    var $this = $(this);
    var fullText = $this.data("full-text");
    if ($this.hasClass("full-text")) {
      var maxLength = 80;
      $this.removeClass("full-text");
      $this.text(fullText.substring(0, maxLength) + "...");
    } else {
      $this.addClass("full-text");
      $this.text(fullText);
    }
  });

  updateDivClasses();
});

function updateDivClasses() {
  const divs = document.querySelectorAll(".div-class");
  divs.forEach((div) => {
    const text = div.textContent.trim();
    switch (text) {
      case "접수중":
        div.className = "div-class badge text-bg-success";
        break;
      case "접수마감":
        div.className = "div-class badge text-bg-danger";
        break;
      case "몰루":
        div.className = "div-class badge text-bg-warning";
        break;
      case "접수시작":
        div.className = "div-class text-bg-primary";
        break;
      default:
        break;
    }
  });
}

let selectedTabId = 1;

document.getElementById("formSelect").addEventListener("change", function () {
  selectedTabId = this.value;
  createTabs(selectedTabId);
});

function createTabs(formNumber) {
  const container = document.getElementById("tabsContainer");
  container.innerHTML = "";
  const nav = document.createElement("ul");
  nav.className = "nav nav-tabs";
  nav.id = `form${formNumber}-tabs`;
  for (let i = 1; i <= 2; i++) {
    const li = document.createElement("li");
    li.className = "nav-item";
    const a = document.createElement("a");
    a.className = "nav-link";
    if (i === 1) a.classList.add("active");
    a.id = `tab${i}-${formNumber}-link`;
    a.href = `#tab${i}-${formNumber}`;
    a.dataset.toggle = "tab";
    a.textContent = `Tab ${i} - Form ${formNumber}`;
    li.appendChild(a);
    nav.appendChild(li);
  }
  container.appendChild(nav);
  const tabContent = document.createElement("div");
  tabContent.className = "tab-content";
  for (let i = 1; i <= 2; i++) {
    const tabPane = document.createElement("div");
    tabPane.className = "tab-pane fade";
    if (i === 1) tabPane.classList.add("show", "active");
    tabPane.id = `tab${i}-${formNumber}`;
    tabPane.innerHTML = getTabContent(tabPane.id);
    tabContent.appendChild(tabPane);
  }
  container.appendChild(tabContent);
}

function getTabContent(tabId) {
  return `
                <div class="container text-right">                        
                    <button type="button" class="btn btn-secondary ml-2 mt-2 mb-2" onclick="toggleEdit('${tabId}')"> 수정</button>                        
                    <button type="button" class="btn btn-secondary ml-2 mt-2 mb-2" onclick="toggleSave('${tabId}')"> 저장</button>
                </div>
                <div class="d-flex">
                <div class="col-9">
                <div class="card">
                    <div class="card-body">
                        <form>
                            <div class="form-group">
                                <label for="input-${tabId}">Input Box</label>
                                <input type="text" class="form-control" id="input-${tabId}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="textarea-${tabId}">Textarea Box</label>
                                <textarea class="form-control" id="textarea-${tabId}" rows="3" readonly></textarea>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="card mt-3">
                    <div class="card-body">
                        <form>
                            <div class="form-group">
                                <label for="input2-${tabId}">Input Box 2</label>
                                <input type="text" class="form-control" id="input2-${tabId}" readonly>
                            </div>
                            <div class="form-group">
                                <label>Radio Buttons</label><br>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="radio-${tabId}" id="radio1-${tabId}" value="option1">
                                    <label class="form-check-label" for="radio1-${tabId}">Option 1</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="radio-${tabId}" id="radio2-${tabId}" value="option2">
                                    <label class="form-check-label" for="radio2-${tabId}">Option 2</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="radio-${tabId}" id="radio3-${tabId}" value="option3">
                                    <label class="form-check-label" for="radio3-${tabId}">Option 3</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="radio-${tabId}" id="radio4-${tabId}" value="option4">
                                    <label class="form-check-label" for="radio4-${tabId}">Option 4</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="radio-${tabId}" id="radio5-${tabId}" value="option5">
                                    <label class="form-check-label" for="radio5-${tabId}">Option 5</label>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div id="newDiv-${tabId}"></div>
                <div class='d-flex justify-content-center align-items-center'>
                    <button type="button" class="btn btn-blue rounded-circle" id="btn-${tabId}" style="background-color: #2e406aff; color: white;" disabled>+</button>
                </div>
                </div>
                <div class="col-3">
                    <div class="card" style="margin-top: 150px">
                        <h4 class="text-center"><b>질문 목록</b></h4>
                        <div class="card-body" style="max-height: 340px; overflow-y: auto">
                            <div class="card d-flex justify-content-between align-items-center mt-1 blue">
                                <div>
                                    <span style="font-size: 20px">질문 1</span>
                                    <button id="question-1-${tabId}" class="question-${tabId} btn-circle btn-sm ms-2 quest" disabled>+
                                    </button>
                                </div>
                            </div>
                            <div class="card d-flex justify-content-between align-items-center mt-3 blue">
                                <div>
                                    <span style="font-size: 20px">질문 2</span>
                                    <button id="question-2-${tabId}" class="question-${tabId} btn-circle btn-sm ms-2 quest" disabled>+
                                    </button>
                                </div>
                            </div>
                            <div class="card  d-flex justify-content-between align-items-center mt-3 blue">
                                <div>
                                    <span style="font-size: 20px">질문 3</span>
                                    <button id="question-3-${tabId}" class="question-${tabId} btn-circle btn-sm ms-2" disabled>+
                                    </button>
                                </div>
                            </div>
                            <div class="card  d-flex justify-content-between align-items-center mt-3 blue">
                                <div>
                                    <span style="font-size: 20px">질문 4</span>
                                    <button id="question-4-${tabId}" class="question-${tabId} btn-circle btn-sm ms-2" disabled>+
                                    </button>
                                </div>
                            </div>
                            <div class="card d-flex justify-content-between align-items-center mt-3 blue">
                                <div>
                                    <span style="font-size: 20px">질문 5</span>
                                    <button id="question-5-${tabId}" class="question-${tabId} btn-circle btn-sm ms-2" disabled>+
                                    </button>
                                </div>
                            </div>
                            <div class="card d-flex justify-content-between align-items-center mt-3 blue">
                                <div>
                                    <span style="font-size: 20px">질문 6</span>
                                    <button id="question-6-${tabId}" class="question-${tabId} btn-circle btn-sm ms-2" disabled>+
                                    </button>
                                </div>
                            </div>
                            <div class="card d-flex justify-content-between align-items-center mt-3 blue">
                                <div>
                                    <span style="font-size: 20px">질문 7</span>
                                    <button id="question-7-${tabId}" class="question-${tabId} btn-circle btn-sm ms-2" disabled>+
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                </div>
            `;
}

let itemCount = 1;

function addDiv(tabId) {
  const newDiv = document.createElement("div");
  newDiv.className = "card mt-3";
  newDiv.innerHTML = `
                <div class="card-body">
                        <form>
                            <div class="form-group">
                                <label for="new-input-${tabId}-${itemCount}">New Input Box</label>
                              
                                <input type="text" class="form-control" id="new-input-${tabId}-${itemCount}">
                            </div>
                            <div class="form-group">
                                <label>New Radio Buttons</label><br>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="new-radio-${tabId}-${itemCount}" id="new-radio1-${tabId}-${itemCount}" value="option1">
                                    <label class="form-check-label" for="new-radio1-${tabId}-${itemCount}">Option 1</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="new-radio-${tabId}-${itemCount}" id="new-radio2-${tabId}-${itemCount}" value="option2">
                                    <label class="form-check-label" for="new-radio2-${tabId}-${itemCount}">Option 2</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="new-radio-${tabId}-${itemCount}" id="new-radio3-${tabId}-${itemCount}" value="option3">
                                    <label class="form-check-label" for="new-radio3-${tabId}-${itemCount}">Option 2</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="new-radio-${tabId}-${itemCount}" id="new-radio4-${tabId}-${itemCount}" value="option4">
                                    <label class="form-check-label" for="new-radio4-${tabId}-${itemCount}">Option 2</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="new-radio-${tabId}-${itemCount}" id="new-radio5-${tabId}-${itemCount}" value="option5">
                                    <label class="form-check-label" for="new-radio5-${tabId}-${itemCount}">Option 2</label>
                                </div>
                            </div>
                        </form>
                        <button class="delete-btn">삭제</button>
                    </div>
                </div>
            `;
  document.getElementById(`newDiv-${tabId}`).appendChild(newDiv);
  itemCount++;
  const deleteButton = newDiv.querySelector(".delete-btn");
  deleteButton.addEventListener("click", () => {
    newDiv.remove();
  });
}

document.addEventListener("DOMContentLoaded", function () {
  createTabs(1);
  document.addEventListener("click", function (e) {
    if (e.target && e.target.id.includes("btn-")) {
      const tabId = e.target.id.replace("btn-", "");
      addDiv(tabId);
    }
  });
});

function toggleEdit(tabId) {
  const input1 = document.getElementById(`input-${tabId}`);
  const input2 = document.getElementById(`input2-${tabId}`);
  const textarea = document.getElementById(`textarea-${tabId}`);
  const button = document.getElementById(`btn-${tabId}`);
  const questionButtons = document.querySelectorAll(`.question-${tabId}`);

  input1.readOnly = !input1.readOnly;
  input2.readOnly = !input2.readOnly;
  textarea.readOnly = !textarea.readOnly;
  button.disabled = !button.disabled;

  questionButtons.forEach((questionButton) => {
    questionButton.disabled = !questionButton.disabled;
  });
}

function toggleSave(tabId) {
  const input1 = document.getElementById(`input-${tabId}`);
  const input2 = document.getElementById(`input2-${tabId}`);
  const textarea = document.getElementById(`textarea-${tabId}`);
  const button = document.getElementById(`btn-${tabId}`);
  const questionButtons = document.querySelectorAll(`.question-${tabId}`);

  input1.readOnly = true;
  input2.readOnly = true;
  textarea.readOnly = true;
  button.disabled = true;

  const newInputs = document.querySelectorAll(`[id^='new-input-${tabId}-']`);
  newInputs.forEach((input) => (input.readOnly = true));

  questionButtons.forEach((questionButton) => {
    questionButton.disabled = true;
  });

  button.textContent = "+";
}
