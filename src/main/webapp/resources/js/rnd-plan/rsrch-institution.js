// 전역 변수 선언
var researchers = window.researchers || []; // 연구원 객체들을 저장할 배열
var selectedResearcherId = window.selectedResearcherId || null; // 현재 선택된 연구원의 ID
var researcherIdCounter = window.researcherIdCounter || 0; // 연구원 ID를 위한 카운터


$(document).ready(function () {
  // 연구원 배열 초기화
  researchers = [];

  // 페이지 로딩 시 서버에서 가져온 데이터로 테이블 업데이트
  if (researchers.length > 0) {
    updateResearcherCompositionTable();
    selectedResearcherId = researchers[0].id;
    updateParticipationTable(researchers[0]);
  }


  // "선택 추가" 버튼 클릭 이벤트
  $("#btn-add-selected").click(function () {
    $('.rsrch-table:first .table tbody input[type="checkbox"]:checked').each(
        function () {
          var row = $(this).closest("tr");
          $(".rsrch-table:last .table tbody").append(row.clone());
          $(this).prop("checked", false);
        },
    );
  });

  // "선택 제거" 버튼 클릭 이벤트
  $("#btn-remove-selected").click(function () {
    $('.rsrch-table:last .table tbody input[type="checkbox"]:checked').each(
        function () {
          $(this).closest("tr").remove(); // 선택된 행을 삭제
        },
    );
  });

// 페이지 로딩 시 기존 연구원들을 researchers 배열에 추가
  $(".research-composition-table tbody tr").each(function () {
    var $row = $(this);
    var name = $row.find("td:nth-child(4)").text().trim();
    var rsrchNo = $row.find("td:nth-child(6)").text().trim();
    var position = $row.find("td:nth-child(5)").text().trim();

    // 기본값 설정
    var manpowerRole = '참여연구자'; // 기본값 설정
    var partType = '내부연구원';    // 기본값 설정

    // 연구원 객체 생성
    var researcher = {
      id: researcherIdCounter++,
      manpowerRole: manpowerRole,
      partType: partType,
      name: name,
      position: position,
      participationData: {}
    };

    // 배열에 추가
    researchers.push(researcher);

    // 테이블 행에 data-id 속성 추가
    $row.attr('data-id', researcher.id);
  });

// 선택한 연구원 추가
  $("#rsrchModal .modal-footer .ctm-btn-normal").click(function () {
    $("#rsrchModal .rsrch-table tbody tr").each(function () {
      if ($(this).find('input[type="checkbox"]').is(":checked")) {
        var name = $(this).find("td:nth-child(2)").text().trim();
        var rsrchNo = $(this).find("td:nth-child(3)").text().trim();
        var position = $(this).find("td:nth-child(6)").text().trim();

        // 기본값 설정
        var manpowerRole = '참여연구자';
        var partType = '내부연구원';

        // 연구원 객체 생성
        var researcher = {
          id: researcherIdCounter++,
          manpowerRole: manpowerRole,
          partType: partType,
          name: name,
          position: position,
          participationData: {}
        };

        // 배열에 추가
        researchers.push(researcher);

        // 테이블에 행 추가 (data-id 속성으로 연구원 ID 저장)
        var newRow =
            "<tr data-id='" + researcher.id + "'>" +
            '<td><input class="form-check-input ctm-td-btn-center ctm-rdo-btn" type="radio" name="researcherSelect"/></td>' +
            '<td><select class="form-select form-select-sm manpowerRole-select" data-id="' + researcher.id + '">' +
            '<option value="연구책임자" ' + (researcher.manpowerRole === '연구책임자' ? 'selected' : '') + '>연구책임자</option>' +
            '<option value="참여연구자" ' + (researcher.manpowerRole === '참여연구자' ? 'selected' : '') + '>참여연구자</option>' +
            '<option value="연구지원인력" ' + (researcher.manpowerRole === '연구지원인력' ? 'selected' : '') + '>연구지원인력</option>' +
            "</select></td>" +
            '<td><select class="form-select form-select-sm part-type-select" data-id="' + researcher.id + '">' +
            '<option value="내부연구원" ' + (researcher.partType === '내부연구원' ? 'selected' : '') + '>내부연구원</option>' +
            '<option value="외부연구원" ' + (researcher.partType === '외부연구원' ? 'selected' : '') + '>외부연구원</option>' +
            '<option value="학생" ' + (researcher.partType === '학생' ? 'selected' : '') + '>학생</option>' +
            "</select></td>" +
            '<td class="text-center">' + name + "</td>" +
            '<td class="text-center">' + position + "</td>" +
            '<td class="text-center">' + rsrchNo + "</td>" +
            "</tr>";

        $(".research-composition-table tbody").append(newRow);
      }
    });

    $("#rsrchModal").modal("hide");
  });

  // 인력역할 선택 변경 이벤트
  $(".research-composition-table").on("change", ".manpowerRole-select", function() {
    var researcherId = $(this).data('id');
    var selectedValue = $(this).val();

    var researcher = researchers.find(function(r) {
      return r.id === researcherId;
    });

    if (researcher) {
      researcher.manpowerRole = selectedValue;
    }
  });

// 참여구분 선택 변경 이벤트
  $(".research-composition-table").on("change", ".part-type-select", function() {
    var researcherId = $(this).data('id');
    var selectedValue = $(this).val();

    var researcher = researchers.find(function(r) {
      return r.id === researcherId;
    });

    if (researcher) {
      researcher.partType = selectedValue;
    }
  });

  // 연구원 선택 이벤트
  $(".research-composition-table").on("click", ".ctm-rdo-btn", function () {
    var $row = $(this).closest("tr");
    var researcherId = $row.data('id');
    selectedResearcherId = researcherId;

    var researcher = researchers.find(function(r) {
      return r.id === researcherId;
    });

    updateParticipationTable(researcher);
  });


  function updateParticipationTable(researcher) {
    var periods = ['1-1', '1-2', '2-1', '2-2', '3-1'];
    var $tbody = $(".research-participation-table tbody");

    $tbody.empty(); // 기존 행 제거

    periods.forEach(function(period, index) {

      var parts = period.split('-');
      var stageNo = parts[0];
      var yearNo = parts[1];

      // rndPeriods에서 해당하는 값

      var rndPeriod = rndPeriods[index];

      var data = researcher.participationData[period] || {
        stageNo: stageNo,
        yearNo: yearNo,
        isParticipated: 'true',
        finalDegree: '전문학사',
        major: '',
        year: '',
        startDate: rndPeriod ? rndPeriod.startedAt : '',
        endDate: rndPeriod ? rndPeriod.endedAt : ''
      };

      // researcher.participationData에 저장
      researcher.participationData[period] = data;

      // 테이블 행 생성
      var rowHtml = '<tr>' +
          '<td class="text-center">' + researcher.name + '</td>' +
          '<td class="text-center">' + period + '</td>' +
          '<td><input class="form-check-input ctm-td-btn-center isParticipated-checkbox " type="checkbox" ' +
          (data.isParticipated ? 'checked' : '') + ' data-period="' + period + '" /></td>' +
          '<td><select class="form-select form-select-sm finalDegree-select" data-period="' + period + '">' +
          '<option value="전문학사" ' + (data.finalDegree === '전문학사' ? 'selected' : '') + '>전문학사</option>' +
          '<option value="학사" ' + (data.finalDegree === '학사' ? 'selected' : '') + '>학사</option>' +
          '<option value="전문석사" ' + (data.finalDegree === '전문석사' ? 'selected' : '') + '>전문석사</option>' +
          '<option value="석사" ' + (data.finalDegree === '석사' ? 'selected' : '') + '>석사</option>' +
          '<option value="전문박사" ' + (data.finalDegree === '전문박사' ? 'selected' : '') + '>전문박사</option>' +
          '<option value="박사" ' + (data.finalDegree === '박사' ? 'selected' : '') + '>박사</option>' +
          '</select></td>' +
          '<td><input class="form-control form-control-sm major-input" value="' + data.major + '" type="text" data-period="' + period + '"/></td>' +
          '<td><input class="form-control form-control-sm year-input" value="' + data.year + '" type="text" data-period="' + period + '"/></td>' +
          '<td><input type="date" class="form-control form-control-sm text-center start-date-input" value="' + data.startDate + '" data-period="' + period + '"></td>' +
          '<td><input type="date" class="form-control form-control-sm text-center end-date-input" value="' + data.endDate + '" data-period="' + period + '"></td>' +
          '</tr>';

      $tbody.append(rowHtml);
    });
  }

  // 참여기간 테이블의 입력 값 변경 시 이벤트 처리
  $(".research-participation-table").on("change", "input, select", function () {
    if (selectedResearcherId === null) {
      return;
    }

    var $input = $(this);
    var period = $input.data('period');
    var researcher = researchers.find(function(r) {
      return r.id === selectedResearcherId;
    });

    if (!researcher.participationData[period]) {
      researcher.participationData[period] = {};
    }

    var data = researcher.participationData[period];

    if ($input.hasClass('isParticipated-checkbox')) {
      data.isParticipated = $input.is(':checked');
    } else if ($input.hasClass('finalDegree-select')) {
      data.finalDegree = $input.val();
    } else if ($input.hasClass('major-input')) {
      data.major = $input.val();
    } else if ($input.hasClass('year-input')) {
      data.year = $input.val();
    } else if ($input.hasClass('start-date-input')) {
      data.startDate = $input.val();
    } else if ($input.hasClass('end-date-input')) {
      data.endDate = $input.val();
    }
  });

// 연구원 삭제 이벤트
  $("#deleteResearcherButton").click(function () {
    if (selectedResearcherId === null) {
      alert('선택된 연구원이 없습니다.');
      return;
    }

    researchers = researchers.filter(function(r) {
      return r.id !== selectedResearcherId;
    });

    $(".research-composition-table tbody tr").each(function () {
      var $row = $(this);
      if ($row.data('id') === selectedResearcherId) {
        $row.remove();
      }
    });

    $(".research-participation-table tbody").empty();
    selectedResearcherId = null;
  });

  // 연구원 연차별 참여기간 테이블에서 첫 번째 행의 입력 요소에 이벤트 리스너 추가
  $(".research-participation-table").on("change", "tr:first-child input, tr:first-child select", function () {
    if (selectedResearcherId === null) {
      return;
    }

    var $firstRowInput = $(this);

    // startDate와 endDate는 복사하지 않음
    if ($firstRowInput.hasClass('start-date-input') || $firstRowInput.hasClass('end-date-input')) {
      return; // 함수를 종료하여 복사하지 않음
    }

    var inputIndex = $firstRowInput.closest('td').index(); // 입력 요소의 열 인덱스
    var newValue;

    // 체크박스인 경우
    if ($firstRowInput.is(':checkbox')) {
      newValue = $firstRowInput.is(':checked');
    } else {
      newValue = $firstRowInput.val();
    }

    // 첫 번째 행을 제외한 나머지 행들을 순회하며 동일한 입력 요소 업데이트
    $(".research-participation-table tbody tr").not(':first').each(function () {
      var $row = $(this);
      var $input = $row.find('td').eq(inputIndex).find('input, select');

      // 체크박스인 경우
      if ($firstRowInput.is(':checkbox')) {
        $input.prop('checked', newValue);
      } else {
        // 값 설정
        $input.val(newValue);
      }
    });

    // 데이터 모델 업데이트
    var researcher = researchers.find(function (r) {
      return r.id === selectedResearcherId;
    });

    // 첫 번째 행의 데이터 키 결정
    var dataKey;
    if ($firstRowInput.hasClass('isParticipated-checkbox')) {
      dataKey = 'isParticipated';
    } else if ($firstRowInput.hasClass('finalDegree-select')) {
      dataKey = 'finalDegree';
    } else if ($firstRowInput.hasClass('major-input')) {
      dataKey = 'major';
    } else if ($firstRowInput.hasClass('year-input')) {
      dataKey = 'year';
    } else {
      return; // 다른 입력 요소는 처리하지 않음
    }

    // 나머지 행들의 period를 가져와 데이터 모델 업데이트
    $(".research-participation-table tbody tr").not(':first').each(function () {
      var $row = $(this);
      var period = $row.find('td').eq(1).text();

      if (!researcher.participationData[period]) {
        researcher.participationData[period] = {};
      }

      researcher.participationData[period][dataKey] = newValue;
    });
  });


  // 연구원 필러별로 검색 이벤트
  $('#search-button').click(function() {

    var nameValue = $('#name').val();
    var rsrchNoValue = $('#rsrchNo').val();
    var institutionValue = $('#institution').val();
    var departmentValue = $('#department').val();

    $('.rsrch-table:first tbody tr').each(function() {
      var $row = $(this);

      var nameElement = $row.find('.name');
      var rsrchNoElement = $row.find('.rsrchNo');
      var institutionElement = $row.find('.institution');
      var departmentElement = $row.find('.department');

      // 요소가 존재하는지 확인
      if (nameElement.length === 0 || rsrchNoElement.length === 0 || institutionElement.length === 0 || departmentElement.length === 0) {
        console.error('요소를 찾을 수 없습니다:', $row);
        return; // 다음 행으로 넘어감
      }

      var name = nameElement.text();
      var rsrchNo = rsrchNoElement.text();
      var institution = institutionElement.text();
      var department = departmentElement.text();


      var showRow = true;

      if (nameValue && name.indexOf(nameValue) === -1) {
        showRow = false;
      }
      if (rsrchNoValue && rsrchNo.indexOf(rsrchNoValue) === -1) {
        showRow = false;
      }
      if (institutionValue && institution.indexOf(institutionValue) === -1) {
        showRow = false;
      }
      if (departmentValue && department.indexOf(departmentValue) === -1) {
        showRow = false;
      }

      if (showRow) {
        $row.show();
      } else {
        $row.hide();
      }
    });
  });
});


// [연구기관] AJAX 연구기관 데이터 등록하기
async function submitRsrchInstitutionData() {

  const rsrchMembersData =  researchers
  const rndPlanNo = localStorage.getItem("rndPlanNo");

  const bodyData = {
    currentStep,
    rndPlanNo,
    rsrchMembersData
  }

  console.log("제발요 bodyData data:", bodyData); // 데이터 확인
  try {
    const { data } = await $.ajax({
      url: "/api/v1/rnd-plans/rsrch-institution",
      type: "POST",
      contentType: "application/json",
      dataType: "json",
      data: JSON.stringify(bodyData),
    });

    currentStepFromDB = data;

  } catch (err) {
    console.log(
        "[submitRsrchInstitutionData()] " + err.statusText + " - " + err.status,
    );
  }
}

// [연구기관] 데이터 페이지에 적용
function applyRsrchInstitutionData(data) {
  // 연구원 배열 초기화 및 서버 데이터로 채우기
  researchers = data.researchers || [];
  researcherIdCounter = researchers.length;

  // 연구원 구성 테이블 업데이트
  updateResearcherCompositionTable();

  // 첫 번째 연구원 선택 및 참여 기간 테이블 업데이트
  if (researchers.length > 0) {
    selectedResearcherId = researchers[0].id;
    updateParticipationTable(researchers[0]);
  }
}

// 연구원 구성 테이블 업데이트 함수
function updateResearcherCompositionTable() {
  const $tbody = $(".research-composition-table tbody");
  $tbody.empty();

  researchers.forEach((researcher) => {
    const newRow =
        `<tr data-id='${researcher.id}'>
        <td><input class="form-check-input ctm-td-btn-center ctm-rdo-btn" type="radio" name="researcherSelect"/></td>
        <td>
          <select class="form-select form-select-sm manpowerRole-select" data-id="${researcher.id}">
            <option value="연구책임자" ${researcher.manpowerRole === '연구책임자' ? 'selected' : ''}>연구책임자</option>
            <option value="참여연구자" ${researcher.manpowerRole === '참여연구자' ? 'selected' : ''}>참여연구자</option>
            <option value="연구지원인력" ${researcher.manpowerRole === '연구지원인력' ? 'selected' : ''}>연구지원인력</option>
          </select>
        </td>
        <td>
          <select class="form-select form-select-sm part-type-select" data-id="${researcher.id}">
            <option value="내부연구원" ${researcher.partType === '내부연구원' ? 'selected' : ''}>내부연구원</option>
            <option value="외부연구원" ${researcher.partType === '외부연구원' ? 'selected' : ''}>외부연구원</option>
            <option value="학생" ${researcher.partType === '학생' ? 'selected' : ''}>학생</option>
          </select>
        </td>
        <td class="text-center">${researcher.name}</td>
        <td class="text-center">${researcher.position}</td>
        <td class="text-center">${researcher.rsrchNo}</td>
      </tr>`;
    $tbody.append(newRow);
  });
}
