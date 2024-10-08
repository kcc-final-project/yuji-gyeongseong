const announcements = [
  {
    title: "2024년도 반도체 글로벌 첨단 웹 연계 활용사업2",
    status: "접수중",
    date: "2024-10-01",
    closingDate: "2024-10-17",
    fields: ["분야 1", "분야 2"],
  },
  {
    title: "2024년도 AI 연구개발 지원사업",
    status: "접수예정",
    date: "2024-09-14",
    closingDate: "2024-10-10",
    fields: ["분야 3", "분야 4"],
  },
  {
    title: "2024년도 AI 연구개발 지원사업2",
    status: "접수예정",
    date: "2024-09-15",
    closingDate: "2024-10-20",
    fields: ["분야 3", "분야 4"],
  },
];

function displayAnnouncements(filteredAnnouncements) {
  const list = document.getElementById("announcement-list");
  list.innerHTML = "";
  filteredAnnouncements.forEach((announcement) => {
    const item = document.createElement("div");
    item.className = "card announcement-item shadow";
    item.innerHTML = `
      <p>${announcement.title}</p>
      <p>상태: <span class="badge bg-primary">${announcement.status}</span></p>
      <p class="small-text">공고일: ${announcement.date}</p>
      <p class="small-text">접수 마감일: ${announcement.closingDate}</p>
    `;
    item.onclick = () => showCategoryBox(announcement, item);
    list.appendChild(item);
  });
}

function filterAndSortAnnouncements() {
  const statusFilter = document.getElementById("status-filter").value;
  const sortFilter = document.getElementById("sort-filter").value;
  let filteredAnnouncements = announcements;

  if (statusFilter !== "all") {
    filteredAnnouncements = announcements.filter(
      (announcement) => announcement.status === statusFilter,
    );
  }

  if (sortFilter === "recent") {
    filteredAnnouncements.sort((a, b) => new Date(b.date) - new Date(a.date));
  } else if (sortFilter === "closing") {
    filteredAnnouncements.sort(
      (a, b) => new Date(a.closingDate) - new Date(b.closingDate),
    );
  }

  displayAnnouncements(filteredAnnouncements);
}

function showCategoryBox(announcement, item) {
  const categoryBox = document.getElementById("category-box");
  const selectedTitle = document.getElementById("selected-announcement-title");
  categoryBox.innerHTML = "";
  selectedTitle.innerHTML = `<h2>${announcement.title}</h2>`;
  categoryBox.dataset.title = announcement.title;

  const select = document.createElement("select");
  select.className = "form-select select";
  select.setAttribute("aria-label", "Default select example");
  select.onchange = () => updateTable(announcement.title, select.value);

  const initialOption = document.createElement("option");
  initialOption.textContent = "공모분야를 선택해주세요.";
  initialOption.value = "";
  select.appendChild(initialOption);

  announcement.fields.forEach((field) => {
    const option = document.createElement("option");
    option.textContent = field;
    option.value = field;
    select.appendChild(option);
  });

  categoryBox.appendChild(select);

  item.appendChild(categoryBox);
  categoryBox.style.display = "block";
}

function updateTable(title, field) {
  const categoryTable = document
    .getElementById("category-table")
    .getElementsByTagName("tbody")[0];
  categoryTable.innerHTML = "";

  const formSelect = document.createElement("select");
  formSelect.className = "form-input";
  formSelect.innerHTML = `
        <option value="서식 1">서식 1</option>
        <option value="서식 2">서식 2</option>
        <option value="서식 3">서식 3</option>
        <option value="서식 4">서식 4</option>
    `;
  formSelect.value = getForm(field);
  formSelect.onchange = () => displayFormContent(formSelect.value);

  const newRow = categoryTable.insertRow();
  const titleCell = newRow.insertCell(0);
  const fieldCell = newRow.insertCell(1);
  const techFieldCell = newRow.insertCell(2);
  const formCell = newRow.insertCell(3);

  titleCell.textContent = title;
  fieldCell.textContent = field;
  techFieldCell.textContent = getTechField(field);
  formCell.appendChild(formSelect);

  displayFormContent(formSelect.value);
}

function displayFormContent(formType) {
  const formContent = document.getElementById("form-content");
  formContent.innerHTML = "";

  let content = "";
  switch (formType) {
    case "서식 1":
      content =
        ' <ul class="nav nav-tabs mt-5" id="myTab" role="tablist">\n' +
        '        <li class="nav-item">\n' +
        "          <a\n" +
        '            class="nav-link active"\n' +
        '            id="common-tab"\n' +
        '            data-toggle="tab"\n' +
        '            href="#common"\n' +
        '            role="tab"\n' +
        '            aria-controls="common"\n' +
        '            aria-selected="true"\n' +
        "            >공통평가지</a\n" +
        "          >\n" +
        "        </li>\n" +
        '        <li class="nav-item">\n' +
        "          <a\n" +
        '            class="nav-link"\n' +
        '            id="skill-tab"\n' +
        '            data-toggle="tab"\n' +
        '            href="#skill"\n' +
        '            role="tab"\n' +
        '            aria-controls="skill"\n' +
        '            aria-selected="false"\n' +
        "            >기술분야 평가지</a\n" +
        "          >\n" +
        "        </li>\n" +
        "      </ul>\n" +
        '      <div class="tab-content" id="myTabContent">\n' +
        "        <div\n" +
        '          class="tab-pane fade show active"\n' +
        '          id="common"\n' +
        '          role="tabpanel"\n' +
        '          aria-labelledby="common-tab"\n' +
        "        >\n" +
        '          <div class="card col-12 mb-3 mt-4 top-card">\n' +
        '            <div class="right-box-2-round"></div>\n' +
        '            <div class="card-body">\n' +
        '              <input type="text" class="form-control text-center" id="surveyTitle" placeholder="제목 없는 설문지">\n' +
        "            </div>\n" +
        '            <div class="card-body">\n' +
        "              <form>\n" +
        '                <div class="form-group">\n' +
        '                  <textarea class="form-control" id="questionDescription" rows="3" placeholder="설문지 설명"></textarea>\n' +
        "                </div>\n" +
        "              </form>\n" +
        "            </div>\n" +
        "          </div>\n" +
        "\n" +
        '          <div class="card col-12 mb-3 mt-2">\n' +
        '            <div class="card-body">\n' +
        '              <div class="row">\n' +
        '                <div class="col-8">\n' +
        '                  <h4 class="text-center mt-3"><b>설문지 항목</b></h4>\n' +
        '                  <div id="items">\n' +
        '                    <div class="item card mb-3 mt-3 survay">\n' +
        '                      <div class="card-body survey">\n' +
        '                        <input type="text" class="title-input form-control mb-2" value="질문 1" readonly>\n' +
        '                        <div class="radio-group mb-2">\n' +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="5" onclick="showScore(event)">\n' +
        "                            5점 매우 잘함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="4" onclick="showScore(event)">\n' +
        "                            4점 잘함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="3" onclick="showScore(event)">\n' +
        "                            3점 보통\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="2" onclick="showScore(event)">\n' +
        "                            2점 못함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="1" onclick="showScore(event)">\n' +
        "                            1점 매우 못함\n" +
        "                          </label>\n" +
        '                          <span class="score"></span>\n' +
        "                        </div>\n" +
        '                        <button class="btn remove-button ctm-btn-normal" onclick="removeItem(event)" disabled>삭제</button>\n' +
        "                      </div>\n" +
        "                    </div>\n" +
        "                  </div>\n" +
        '                  <div class="d-flex">\n' +
        '                    <div class="col-4"></div>\n' +
        '                    <button class="btn add-button ctm-btn-normal" onclick="addItem()" disabled">+ 항목 추가</button>\n' +
        "                  </div>\n" +
        "                </div>\n" +
        "\n" +
        '                <div class="col-4">\n' +
        '                  <h4 class="text-center mt-3"><b>질문 목록</b></h4>\n' +
        '                  <div id="questions1">\n' +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 1</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 1\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 2</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 2\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 3</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 3\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        "                  </div>\n" +
        "                </div>\n" +
        "              </div>\n" +
        "            </div>\n" +
        "          </div>\n" +
        "        </div>\n" +
        "        <div\n" +
        '          class="tab-pane fade"\n' +
        '          id="skiill"\n' +
        '          role="tabpanel"\n' +
        '          aria-labelledby="skill-tab"\n' +
        "        >\n" +
        '          <div class="card col-12 mb-3 mt-4 top-card">\n' +
        '            <div class="right-box-2-round"></div>\n' +
        '            <div class="card-body">\n' +
        '              <input type="text" class="form-control text-center" id="surveyTitle" placeholder="제목 없는 설문지">\n' +
        "            </div>\n" +
        '            <div class="card-body">\n' +
        "              <form>\n" +
        '                <div class="form-group">\n' +
        '                  <textarea class="form-control" id="questionDescription" rows="3" placeholder="설문지 설명"></textarea>\n' +
        "                </div>\n" +
        "              </form>\n" +
        "            </div>\n" +
        "          </div>\n" +
        "\n" +
        '          <div class="card col-12 mb-3 mt-2">\n' +
        '            <div class="card-body">\n' +
        '              <div class="row">\n' +
        '                <div class="col-8">\n' +
        '                  <h4 class="text-center mt-3"><b>설문지 항목</b></h4>\n' +
        '                  <div id="items">\n' +
        '                    <div class="item card mb-3 mt-3 survay">\n' +
        '                      <div class="card-body survey">\n' +
        '                        <input type="text" class="title-input form-control mb-2" value="질문 1" readonly>\n' +
        '                        <div class="radio-group mb-2">\n' +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="5" onclick="showScore(event)">\n' +
        "                            5점 매우 잘함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="4" onclick="showScore(event)">\n' +
        "                            4점 잘함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="3" onclick="showScore(event)">\n' +
        "                            3점 보통\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="2" onclick="showScore(event)">\n' +
        "                            2점 못함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="1" onclick="showScore(event)">\n' +
        "                            1점 매우 못함\n" +
        "                          </label>\n" +
        '                          <span class="score"></span>\n' +
        "                        </div>\n" +
        '                        <button class="btn remove-button ctm-btn-normal" onclick="removeItem(event)" disabled>삭제</button>\n' +
        "                      </div>\n" +
        "                    </div>\n" +
        "                  </div>\n" +
        '                  <div class="d-flex">\n' +
        '                    <div class="col-4"></div>\n' +
        '                    <button class="btn add-button ctm-btn-normal" onclick="addItem()" disabled">+ 항목 추가</button>\n' +
        "                  </div>\n" +
        "                </div>\n" +
        "\n" +
        '                <div class="col-4">\n' +
        '                  <h4 class="text-center mt-3"><b>질문 목록</b></h4>\n' +
        '                  <div id="questions1">\n' +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 1</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 1\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 2</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 2\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 3</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 3\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        "                  </div>\n" +
        "                </div>\n" +
        "              </div>\n" +
        "            </div>\n" +
        "          </div>\n" +
        "        </div>\n" +
        "      </div>";
      break;
    case "서식 2":
      content =
        ' <ul class="nav nav-tabs mt-5" id="myTab" role="tablist">\n' +
        '        <li class="nav-item">\n' +
        "          <a\n" +
        '            class="nav-link active"\n' +
        '            id="common-tab"\n' +
        '            data-toggle="tab"\n' +
        '            href="#common"\n' +
        '            role="tab"\n' +
        '            aria-controls="common"\n' +
        '            aria-selected="true"\n' +
        "            >공통평가지</a\n" +
        "          >\n" +
        "        </li>\n" +
        '        <li class="nav-item">\n' +
        "          <a\n" +
        '            class="nav-link"\n' +
        '            id="skill-tab"\n' +
        '            data-toggle="tab"\n' +
        '            href="#skill"\n' +
        '            role="tab"\n' +
        '            aria-controls="skill"\n' +
        '            aria-selected="false"\n' +
        "            >기술분야 평가지</a\n" +
        "          >\n" +
        "        </li>\n" +
        "      </ul>\n" +
        '      <div class="tab-content" id="myTabContent">\n' +
        "        <div\n" +
        '          class="tab-pane fade show active"\n' +
        '          id="common"\n' +
        '          role="tabpanel"\n' +
        '          aria-labelledby="common-tab"\n' +
        "        >\n" +
        '          <div class="card col-12 mb-3 mt-4 top-card">\n' +
        '            <div class="right-box-2-round"></div>\n' +
        '            <div class="card-body">\n' +
        '              <input type="text" class="form-control text-center" id="surveyTitle" placeholder="제목 없는 설문지">\n' +
        "            </div>\n" +
        '            <div class="card-body">\n' +
        "              <form>\n" +
        '                <div class="form-group">\n' +
        '                  <textarea class="form-control" id="questionDescription" rows="3" placeholder="설문지 설명"></textarea>\n' +
        "                </div>\n" +
        "              </form>\n" +
        "            </div>\n" +
        "          </div>\n" +
        "\n" +
        '          <div class="card col-12 mb-3 mt-2">\n' +
        '            <div class="card-body">\n' +
        '              <div class="row">\n' +
        '                <div class="col-8">\n' +
        '                  <h4 class="text-center mt-3"><b>설문지 항목</b></h4>\n' +
        '                  <div id="items">\n' +
        '                    <div class="item card mb-3 mt-3 survay">\n' +
        '                      <div class="card-body survay">\n' +
        '                        <input type="text" class="title-input form-control mb-2" value="질문 1" readonly>\n' +
        '                        <div class="radio-group mb-2">\n' +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="5" onclick="showScore(event)">\n' +
        "                            5점 매우 잘함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="4" onclick="showScore(event)">\n' +
        "                            4점 잘함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="3" onclick="showScore(event)">\n' +
        "                            3점 보통\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="2" onclick="showScore(event)">\n' +
        "                            2점 못함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="1" onclick="showScore(event)">\n' +
        "                            1점 매우 못함\n" +
        "                          </label>\n" +
        '                          <span class="score"></span>\n' +
        "                        </div>\n" +
        '                        <button class="btn remove-button ctm-btn-normal" onclick="removeItem(event)" disabled>삭제</button>\n' +
        "                      </div>\n" +
        "                    </div>\n" +
        "                  </div>\n" +
        '                  <div class="d-flex">\n' +
        '                    <div class="col-4"></div>\n' +
        '                    <button class="btn add-button ctm-btn-normal" onclick="addItem()" disabled">+ 항목 추가</button>\n' +
        "                  </div>\n" +
        "                </div>\n" +
        "\n" +
        '                <div class="col-4">\n' +
        '                  <h4 class="text-center mt-3"><b>질문 목록</b></h4>\n' +
        '                  <div id="questions1">\n' +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 1</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 1\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 2</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 2\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 3</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 3\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        "                  </div>\n" +
        "                </div>\n" +
        "              </div>\n" +
        "            </div>\n" +
        "          </div>\n" +
        "        </div>\n" +
        "        <div\n" +
        '          class="tab-pane fade"\n' +
        '          id="skiill"\n' +
        '          role="tabpanel"\n' +
        '          aria-labelledby="skill-tab"\n' +
        "        >\n" +
        '          <div class="card col-12 mb-3 mt-4 top-card">\n' +
        '            <div class="right-box-2-round"></div>\n' +
        '            <div class="card-body">\n' +
        '              <input type="text" class="form-control text-center" id="surveyTitle" placeholder="제목 없는 설문지">\n' +
        "            </div>\n" +
        '            <div class="card-body">\n' +
        "              <form>\n" +
        '                <div class="form-group">\n' +
        '                  <textarea class="form-control" id="questionDescription" rows="3" placeholder="설문지 설명"></textarea>\n' +
        "                </div>\n" +
        "              </form>\n" +
        "            </div>\n" +
        "          </div>\n" +
        "\n" +
        '          <div class="card col-12 mb-3 mt-2">\n' +
        '            <div class="card-body">\n' +
        '              <div class="row">\n' +
        '                <div class="col-8">\n' +
        '                  <h4 class="text-center mt-3"><b>설문지 항목</b></h4>\n' +
        '                  <div id="items">\n' +
        '                    <div class="item card mb-3 mt-3 survay">\n' +
        '                      <div class="card-body survay">\n' +
        '                        <input type="text" class="title-input form-control mb-2" value="질문 1" readonly>\n' +
        '                        <div class="radio-group mb-2">\n' +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="5" onclick="showScore(event)">\n' +
        "                            5점 매우 잘함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="4" onclick="showScore(event)">\n' +
        "                            4점 잘함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="3" onclick="showScore(event)">\n' +
        "                            3점 보통\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="2" onclick="showScore(event)">\n' +
        "                            2점 못함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="1" onclick="showScore(event)">\n' +
        "                            1점 매우 못함\n" +
        "                          </label>\n" +
        '                          <span class="score"></span>\n' +
        "                        </div>\n" +
        '                        <button class="btn remove-button ctm-btn-normal" onclick="removeItem(event)" disabled>삭제</button>\n' +
        "                      </div>\n" +
        "                    </div>\n" +
        "                  </div>\n" +
        '                  <div class="d-flex">\n' +
        '                    <div class="col-4"></div>\n' +
        '                    <button class="btn add-button ctm-btn-normal" onclick="addItem()" disabled">+ 항목 추가</button>\n' +
        "                  </div>\n" +
        "                </div>\n" +
        "\n" +
        '                <div class="col-4">\n' +
        '                  <h4 class="text-center mt-3"><b>질문 목록</b></h4>\n' +
        '                  <div id="questions1">\n' +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 1</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 1\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 2</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 2\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 3</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 3\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        "                  </div>\n" +
        "                </div>\n" +
        "              </div>\n" +
        "            </div>\n" +
        "          </div>\n" +
        "        </div>\n" +
        "      </div>";
      break;
    case "서식 3":
      content =
        ' <ul class="nav nav-tabs mt-5" id="myTab" role="tablist">\n' +
        '        <li class="nav-item">\n' +
        "          <a\n" +
        '            class="nav-link active"\n' +
        '            id="common-tab"\n' +
        '            data-toggle="tab"\n' +
        '            href="#common"\n' +
        '            role="tab"\n' +
        '            aria-controls="common"\n' +
        '            aria-selected="true"\n' +
        "            >공통평가지</a\n" +
        "          >\n" +
        "        </li>\n" +
        '        <li class="nav-item">\n' +
        "          <a\n" +
        '            class="nav-link"\n' +
        '            id="skill-tab"\n' +
        '            data-toggle="tab"\n' +
        '            href="#skill"\n' +
        '            role="tab"\n' +
        '            aria-controls="skill"\n' +
        '            aria-selected="false"\n' +
        "            >기술분야 평가지</a\n" +
        "          >\n" +
        "        </li>\n" +
        "      </ul>\n" +
        '      <div class="tab-content" id="myTabContent">\n' +
        "        <div\n" +
        '          class="tab-pane fade show active"\n' +
        '          id="common"\n' +
        '          role="tabpanel"\n' +
        '          aria-labelledby="common-tab"\n' +
        "        >\n" +
        '          <div class="card col-12 mb-3 mt-4 top-card">\n' +
        '            <div class="right-box-2-round"></div>\n' +
        '            <div class="card-body">\n' +
        '              <input type="text" class="form-control text-center" id="surveyTitle" placeholder="제목 없는 설문지">\n' +
        "            </div>\n" +
        '            <div class="card-body">\n' +
        "              <form>\n" +
        '                <div class="form-group">\n' +
        '                  <textarea class="form-control" id="questionDescription" rows="3" placeholder="설문지 설명"></textarea>\n' +
        "                </div>\n" +
        "              </form>\n" +
        "            </div>\n" +
        "          </div>\n" +
        "\n" +
        '          <div class="card col-12 mb-3 mt-2">\n' +
        '            <div class="card-body">\n' +
        '              <div class="row">\n' +
        '                <div class="col-8">\n' +
        '                  <h4 class="text-center mt-3"><b>설문지 항목</b></h4>\n' +
        '                  <div id="items">\n' +
        '                    <div class="item card mb-3 mt-3 survay">\n' +
        '                      <div class="card-body survey">\n' +
        '                        <input type="text" class="title-input form-control mb-2" value="질문 1" readonly>\n' +
        '                        <div class="radio-group mb-2">\n' +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="5" onclick="showScore(event)">\n' +
        "                            5점 매우 잘함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="4" onclick="showScore(event)">\n' +
        "                            4점 잘함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="3" onclick="showScore(event)">\n' +
        "                            3점 보통\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="2" onclick="showScore(event)">\n' +
        "                            2점 못함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="1" onclick="showScore(event)">\n' +
        "                            1점 매우 못함\n" +
        "                          </label>\n" +
        '                          <span class="score"></span>\n' +
        "                        </div>\n" +
        '                        <button class="btn remove-button ctm-btn-normal" onclick="removeItem(event)" disabled>삭제</button>\n' +
        "                      </div>\n" +
        "                    </div>\n" +
        "                  </div>\n" +
        '                  <div class="d-flex">\n' +
        '                    <div class="col-4"></div>\n' +
        '                    <button class="btn add-button ctm-btn-normal" onclick="addItem()" disabled">+ 항목 추가</button>\n' +
        "                  </div>\n" +
        "                </div>\n" +
        "\n" +
        '                <div class="col-4">\n' +
        '                  <h4 class="text-center mt-3"><b>질문 목록</b></h4>\n' +
        '                  <div id="questions1">\n' +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 1</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 1\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 2</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 2\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 3</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 3\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        "                  </div>\n" +
        "                </div>\n" +
        "              </div>\n" +
        "            </div>\n" +
        "          </div>\n" +
        "        </div>\n" +
        "        <div\n" +
        '          class="tab-pane fade"\n' +
        '          id="skiill"\n' +
        '          role="tabpanel"\n' +
        '          aria-labelledby="skill-tab"\n' +
        "        >\n" +
        '          <div class="card col-12 mb-3 mt-4 top-card">\n' +
        '            <div class="right-box-2-round"></div>\n' +
        '            <div class="card-body">\n' +
        '              <input type="text" class="form-control text-center" id="surveyTitle" placeholder="제목 없는 설문지">\n' +
        "            </div>\n" +
        '            <div class="card-body">\n' +
        "              <form>\n" +
        '                <div class="form-group">\n' +
        '                  <textarea class="form-control" id="questionDescription" rows="3" placeholder="설문지 설명"></textarea>\n' +
        "                </div>\n" +
        "              </form>\n" +
        "            </div>\n" +
        "          </div>\n" +
        "\n" +
        '          <div class="card col-12 mb-3 mt-2">\n' +
        '            <div class="card-body">\n' +
        '              <div class="row">\n' +
        '                <div class="col-8">\n' +
        '                  <h4 class="text-center mt-3"><b>설문지 항목</b></h4>\n' +
        '                  <div id="items">\n' +
        '                    <div class="item card mb-3 mt-3 survay">\n' +
        '                      <div class="card-body survey">\n' +
        '                        <input type="text" class="title-input form-control mb-2" value="질문 1" readonly>\n' +
        '                        <div class="radio-group mb-2">\n' +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="5" onclick="showScore(event)">\n' +
        "                            5점 매우 잘함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="4" onclick="showScore(event)">\n' +
        "                            4점 잘함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="3" onclick="showScore(event)">\n' +
        "                            3점 보통\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="2" onclick="showScore(event)">\n' +
        "                            2점 못함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="1" onclick="showScore(event)">\n' +
        "                            1점 매우 못함\n" +
        "                          </label>\n" +
        '                          <span class="score"></span>\n' +
        "                        </div>\n" +
        '                        <button class="btn remove-button ctm-btn-normal" onclick="removeItem(event)" disabled>삭제</button>\n' +
        "                      </div>\n" +
        "                    </div>\n" +
        "                  </div>\n" +
        '                  <div class="d-flex">\n' +
        '                    <div class="col-4"></div>\n' +
        '                    <button class="btn add-button ctm-btn-normal" onclick="addItem()" disabled">+ 항목 추가</button>\n' +
        "                  </div>\n" +
        "                </div>\n" +
        "\n" +
        '                <div class="col-4">\n' +
        '                  <h4 class="text-center mt-3"><b>질문 목록</b></h4>\n' +
        '                  <div id="questions1">\n' +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 1</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 1\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 2</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 2\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 3</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 3\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        "                  </div>\n" +
        "                </div>\n" +
        "              </div>\n" +
        "            </div>\n" +
        "          </div>\n" +
        "        </div>\n" +
        "      </div>";
      break;
    case "서식 4":
      content =
        ' <ul class="nav nav-tabs mt-5" id="myTab" role="tablist">\n' +
        '        <li class="nav-item">\n' +
        "          <a\n" +
        '            class="nav-link active"\n' +
        '            id="common-tab"\n' +
        '            data-toggle="tab"\n' +
        '            href="#common"\n' +
        '            role="tab"\n' +
        '            aria-controls="common"\n' +
        '            aria-selected="true"\n' +
        "            >공통평가지</a\n" +
        "          >\n" +
        "        </li>\n" +
        '        <li class="nav-item">\n' +
        "          <a\n" +
        '            class="nav-link"\n' +
        '            id="skill-tab"\n' +
        '            data-toggle="tab"\n' +
        '            href="#skill"\n' +
        '            role="tab"\n' +
        '            aria-controls="skill"\n' +
        '            aria-selected="false"\n' +
        "            >기술분야 평가지</a\n" +
        "          >\n" +
        "        </li>\n" +
        "      </ul>\n" +
        '      <div class="tab-content" id="myTabContent">\n' +
        "        <div\n" +
        '          class="tab-pane fade show active"\n' +
        '          id="common"\n' +
        '          role="tabpanel"\n' +
        '          aria-labelledby="common-tab"\n' +
        "        >\n" +
        '          <div class="card col-12 mb-3 mt-4 top-card">\n' +
        '            <div class="right-box-2-round"></div>\n' +
        '            <div class="card-body">\n' +
        '              <input type="text" class="form-control text-center" id="surveyTitle" placeholder="제목 없는 설문지">\n' +
        "            </div>\n" +
        '            <div class="card-body">\n' +
        "              <form>\n" +
        '                <div class="form-group">\n' +
        '                  <textarea class="form-control" id="questionDescription" rows="3" placeholder="설문지 설명"></textarea>\n' +
        "                </div>\n" +
        "              </form>\n" +
        "            </div>\n" +
        "          </div>\n" +
        "\n" +
        '          <div class="card col-12 mb-3 mt-2">\n' +
        '            <div class="card-body">\n' +
        '              <div class="row">\n' +
        '                <div class="col-8">\n' +
        '                  <h4 class="text-center mt-3"><b>설문지 항목</b></h4>\n' +
        '                  <div id="items">\n' +
        '                    <div class="item card mb-3 mt-3 survay">\n' +
        '                      <div class="card-body survey">\n' +
        '                        <input type="text" class="title-input form-control mb-2" value="질문 1" readonly>\n' +
        '                        <div class="radio-group mb-2">\n' +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="5" onclick="showScore(event)">\n' +
        "                            5점 매우 잘함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="4" onclick="showScore(event)">\n' +
        "                            4점 잘함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="3" onclick="showScore(event)">\n' +
        "                            3점 보통\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="2" onclick="showScore(event)">\n' +
        "                            2점 못함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="1" onclick="showScore(event)">\n' +
        "                            1점 매우 못함\n" +
        "                          </label>\n" +
        '                          <span class="score"></span>\n' +
        "                        </div>\n" +
        '                        <button class="btn remove-button ctm-btn-normal" onclick="removeItem(event)" disabled>삭제</button>\n' +
        "                      </div>\n" +
        "                    </div>\n" +
        "                  </div>\n" +
        '                  <div class="d-flex">\n' +
        '                    <div class="col-4"></div>\n' +
        '                    <button class="btn add-button ctm-btn-normal" onclick="addItem()" disabled">+ 항목 추가</button>\n' +
        "                  </div>\n" +
        "                </div>\n" +
        "\n" +
        '                <div class="col-4">\n' +
        '                  <h4 class="text-center mt-3"><b>질문 목록</b></h4>\n' +
        '                  <div id="questions1">\n' +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 1</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 1\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 2</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 2\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 3</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 3\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        "                  </div>\n" +
        "                </div>\n" +
        "              </div>\n" +
        "            </div>\n" +
        "          </div>\n" +
        "        </div>\n" +
        "        <div\n" +
        '          class="tab-pane fade"\n' +
        '          id="skiill"\n' +
        '          role="tabpanel"\n' +
        '          aria-labelledby="skill-tab"\n' +
        "        >\n" +
        '          <div class="card col-12 mb-3 mt-4 top-card">\n' +
        '            <div class="right-box-2-round"></div>\n' +
        '            <div class="card-body">\n' +
        '              <input type="text" class="form-control text-center" id="surveyTitle" placeholder="제목 없는 설문지">\n' +
        "            </div>\n" +
        '            <div class="card-body">\n' +
        "              <form>\n" +
        '                <div class="form-group">\n' +
        '                  <textarea class="form-control" id="questionDescription" rows="3" placeholder="설문지 설명"></textarea>\n' +
        "                </div>\n" +
        "              </form>\n" +
        "            </div>\n" +
        "          </div>\n" +
        "\n" +
        '          <div class="card col-12 mb-3 mt-2">\n' +
        '            <div class="card-body">\n' +
        '              <div class="row">\n' +
        '                <div class="col-8">\n' +
        '                  <h4 class="text-center mt-3"><b>설문지 항목</b></h4>\n' +
        '                  <div id="items">\n' +
        '                    <div class="item card mb-3 mt-3 survay">\n' +
        '                      <div class="card-body survey">\n' +
        '                        <input type="text" class="title-input form-control mb-2" value="질문 1" readonly>\n' +
        '                        <div class="radio-group mb-2">\n' +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="5" onclick="showScore(event)">\n' +
        "                            5점 매우 잘함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="4" onclick="showScore(event)">\n' +
        "                            4점 잘함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="3" onclick="showScore(event)">\n' +
        "                            3점 보통\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="2" onclick="showScore(event)">\n' +
        "                            2점 못함\n" +
        "                          </label>\n" +
        '                          <label class="form-check-label me-2">\n' +
        '                            <input type="radio" class="form-check-input" name="question1" value="1" onclick="showScore(event)">\n' +
        "                            1점 매우 못함\n" +
        "                          </label>\n" +
        '                          <span class="score"></span>\n' +
        "                        </div>\n" +
        '                        <button class="btn remove-button ctm-btn-normal" onclick="removeItem(event)" disabled>삭제</button>\n' +
        "                      </div>\n" +
        "                    </div>\n" +
        "                  </div>\n" +
        '                  <div class="d-flex">\n' +
        '                    <div class="col-4"></div>\n' +
        '                    <button class="btn add-button ctm-btn-normal" onclick="addItem()" disabled">+ 항목 추가</button>\n' +
        "                  </div>\n" +
        "                </div>\n" +
        "\n" +
        '                <div class="col-4">\n' +
        '                  <h4 class="text-center mt-3"><b>질문 목록</b></h4>\n' +
        '                  <div id="questions1">\n' +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 1</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 1\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 2</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 2\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        '                    <div class="card question d-flex justify-content-between align-items-center mt-2">\n' +
        "                      <span>질문 3</span>\n" +
        '                      <button class="btn btn-sm add-question-button ctm-btn-small" onclick="addQuestion(\'질문 3\')" disabled>+ 추가</button>\n' +
        "                    </div>\n" +
        "                  </div>\n" +
        "                </div>\n" +
        "              </div>\n" +
        "            </div>\n" +
        "          </div>\n" +
        "        </div>\n" +
        "      </div>";
      break;
    default:
      content = "<p>선택된 서식이 없습니다.</p>";
  }

  formContent.innerHTML = content;
}

function getTechField(field) {
  const techFields = {
    "분야 1": "기술 분야 1",
    "분야 2": "기술 분야 2",
    "분야 3": "기술 분야 3",
    "분야 4": "기술 분야 4",
  };
  return techFields[field] || "기술 분야 없음";
}

function getForm(field) {
  const forms = {
    "분야 1": "서식 1",
    "분야 2": "서식 2",
    "분야 3": "서식 3",
    "분야 4": "서식 4",
  };
  return forms[field] || "서식 없음";
}

document
  .getElementById("status-filter")
  .addEventListener("change", filterAndSortAnnouncements);
document
  .getElementById("sort-filter")
  .addEventListener("change", filterAndSortAnnouncements);

displayAnnouncements(announcements);
