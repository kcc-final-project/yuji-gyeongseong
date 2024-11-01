$(document).ready(function () {
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

  // 선택한 연구원 추가
  $("#rsrchModal .modal-footer .ctm-btn-normal").click(function () {
    // 선택된 연구원의 정보
    $("#rsrchModal .rsrch-table tbody tr").each(function () {
      if ($(this).find('input[type="checkbox"]').is(":checked")) {
        var name = $(this).find("td:nth-child(2)").text();
        var rsrch_no = $(this).find("td:nth-child(3)").text();
        var position = $(this).find("td:nth-child(6)").text();

        var newRow =
          "<tr>" +
          '<td><input class="form-check-input ctm-td-btn-center" type="radio" name="flexRadioDefault"/></td>' +
          '<td><select class="form-select form-select-sm">' +
          '<option value="1">연구책임자</option><option value="2">참여연구자</option><option value="3">연구지원인력</option>' +
          "</select></td>" +
          '<td><select class="form-select form-select-sm">' +
          '<option value="1">내부연구원</option><option value="2">외부연구원</option><option value="3">학생</option>' +
          "</select></td>" +
          '<td class="text-center">' +
          name +
          "</td>" +
          '<td><input class="form-check-input ctm-td-btn-center" type="checkbox" value="" checked/> </td>' +
          '<td><input class="form-check-input ctm-td-btn-center" type="checkbox" value="" checked/> </td>' +
          '<td><input class="form-check-input ctm-td-btn-center" type="checkbox" value="" checked/> </td>' +
          '<td><input class="form-check-input ctm-td-btn-center" type="checkbox" value="" checked/> </td>' +
          '<td><input class="form-check-input ctm-td-btn-center" type="checkbox" value="" checked/> </td>' +
          '<td class="text-center">' +
          position +
          "</td>" +
          '<td class="text-center">' +
          rsrch_no +
          "</td>" +
          "</tr>";

        $(".main .body-section .table").eq(2).find("tbody").append(newRow);
      }
    });

    // 모달 숨기기 및 페이지 새로고침
    $("#rsrchModal")
      .modal("hide")
      .on("hidden.bs.modal", function () {
        // location.reload();
      });
  });

  /*// 이벤트 위임을 사용하여 동적 요소에 대응
          $('.rsrch-table').on('click', '.select input[type="checkbox"]', function() {
            // 모든 row-checkbox 클래스를 가진 체크박스의 체크 상태를 전체 선택 체크박스 상태와 일치시킵니다.
            $('.row-checkbox').prop('checked', this.checked);
          });
        
          $('.rsrch-table').on('click', '.row-checkbox', function() {
            // 모든 체크박스가 체크되어 있으면 전체 선택도 체크, 하나라도 체크 해제되면 전체 선택도 해제
            if ($('.row-checkbox').length === $('.row-checkbox:checked').length) {
              $('.select input[type="checkbox"]').prop('checked', true);
            } else {
              $('.select input[type="checkbox"]').prop('checked', false);
            }
          });*/

  // 연구원 구성 테이블의 라디오 버튼 클릭 이벤트
  // $(".table").on("click", ".ctm-rdo-btn", function () {
  //   var $row = $(this).closest("tr"); // 클릭된 라디오 버튼의 행
  //   var name = $row.find("td:nth-child(4)").text(); // 성명 추출
  //   var position = $row.find("td:nth-child(10)").text(); // 직위 추출
  //
  //   // 연구원 연차별 참여기간 테이블의 모든 행을 순회하며 정보 업데이트
  //   $(".body-section:last .table tbody tr").each(function () {
  //     $(this).find("td:nth-child(1)").text(name); // 연구자명 업데이트
  //     $(this).find("td:nth-child(10)").text(position); // 직위 업데이트
  //   });
  // });

  // 연구원 구성 테이블의 라디오 버튼 클릭 이벤트를 부모 요소를 통해 위임
  $(".research-composition-table").on("click", ".ctm-rdo-btn", function () {
    var $row = $(this).closest("tr");
    var name = $row.find("td:nth-child(4)").text();
    var position = $row.find("td:nth-child(10)").text();

    // 연구원 연차별 참여기간 테이블의 모든 행을 순회하며 정보 업데이트
    $(".research-participation-table tbody tr").each(function () {
      $(this).find("td:nth-child(1)").text(name);
      $(this).find("td:nth-child(10)").text(position);
    });
  });
});
