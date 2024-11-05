$(document).ready(function () {
  const subAnnNo = getSubAnnNoFromUrl();

  // 평가위원회 존재 여부를 확인
  checkEvalCommitteeExists(subAnnNo);

  updateCommitteeList(subAnnNo);

  $("#composeButton").on("click", function () {});

  // 테이블 평가위원 이름 눌렀을 시
  // 기존 이벤트 핸들러를 이벤트 위임 방식으로 변경
  $(".committee-table tbody").on("click", "tr", function () {
    $(".committee-table tbody tr").removeClass("selected-row");
    $(this).addClass("selected-row");

    var committeeId = $(this).data("committee-id");
    loadResearcherInfo(committeeId);
  });

  // 연구자에게 알림 전송
  $("#sendButton").click(function () {
    alert("알림 전송");
    $("input[name='committee']:checked").each(function () {
      var committeeRow = $(this).closest("tr");
      var committeeId = committeeRow.data("committee-id");
      var startDate = committeeRow.data("start-date");
      var endDate = committeeRow.data("end-date");
      var title = committeeRow.data("title");
      sendNotificationToCommitteeMembers(
        committeeId,
        startDate,
        endDate,
        title,
      );
    });
  });

  // 비율 입력 시 합계 검증
  $(".ratio-input input").on("input", function () {
    adjustRatios();
  });
  /*
      function adjustRatios() {
        let industryRate = parseInt($('#researchInstituteRate').val()) || 0;
        let educationRate = parseInt($('#educationInstituteRate').val()) || 0;
        let researchRate = parseInt($('#professionalInstituteRate').val()) || 0;
        let total = industryRate + educationRate + researchRate;
  
        if (total > 100) {
          alert("비율의 합계는 100%를 초과할 수 없습니다.");
          // 마지막으로 변경된 값을 이전 값으로 되돌리거나 조정
          // 예시: 비율을 비례적으로 조정
          let excess = total - 100;
          if (researchRate >= excess) {
            $('#professionalInstituteRate').val(researchRate - excess);
          } else if (educationRate >= excess) {
            $('#educationInstituteRate').val(educationRate - excess);
          } else {
            $('#researchInstituteRate').val(industryRate - excess);
          }
        } else if (total < 100) {
          // 필요에 따라 경고 또는 자동 조정
          // 예시: 연구기관 비율을 자동으로 증가
          let deficit = 100 - total;
          $('#professionalInstituteRate').val(researchRate + deficit);
        }
      }*/
});

// 평가위원회 존재 여부 확인
function checkEvalCommitteeExists(subAnnNo) {
  $.ajax({
    url: `/api/v1/evaluation/committees/${subAnnNo}`,
    type: "GET",
    success: function (data) {
      // 서버로부터 응답을 받고, 평가위원회가 존재하는 경우
      if (data.length === 0) {
        // 평가위원회가 존재하지 않는 경우
        $("#committee-standby").show();
        $("#committee-info").hide();
        $(".committee-summary").hide();
      } else {
        // 평가위원회 관련 요소 표시
        $("#composeButton").hide();
        $("#recomposeButton").show();
        $("#committee-standby").hide();
        $("#committee-info").show();
        $(".committee-summary").show();
      }
    },
    error: function (error) {
      console.error("평가위원회 확인 실패:", error);
    },
  });
}

// 알림을 받을 위원회 연구원 검색 함수
function sendNotificationToCommitteeMembers(
  committeeId,
  startDate,
  endDate,
  title,
) {
  $.ajax({
    url: `/api/v1/research-number/researchers/${committeeId}`,
    type: "GET",
    dataType: "json",
    success: function (data) {
      data.forEach(function (item) {
        sendNotification(
          item.member.memNo,
          committeeId,
          startDate,
          endDate,
          title,
        );
      });
    },
    error: function (error) {
      console.error("연구원 검색 실패 : ", error);
    },
  });
}

// URL에서 subAnnNo 추출
function getSubAnnNoFromUrl() {
  const path = window.location.pathname;
  const segments = path.split("/");
  return segments[segments.length - 1];
}

// 각 연구원 알림 함수
function sendNotification(memberId, committeeId, startDate, endDate, title) {
  let content = `평가를 진행하시겠습니까 ? <br> 평가명 : ${title} <br> 평가 기간: ${startDate} ~ ${endDate}`;

  let EvalNotiRequest = {
    content: content,
    notiType: "평가위원",
    dataCategory: "committee",
    // 평가위원회 번호 보내기
    notiContentNo: committeeId,
    memNo: memberId,
  };

  $.ajax({
    url: "/api/v1/research-number/register/noti/" + memberId,
    type: "POST",
    contentType: "application/json",
    data: JSON.stringify(EvalNotiRequest),
    success: function (response) {},
    error: function (error) {
      console.log("알림 전송 실패 : ", error);
    },
  });
}

// 해당 연구원 조회 함수
/*
function loadResearcherInfo(committeeId) {
  $.ajax({
    url: `/api/v1/research-number/researchers/${committeeId}`,
    type: "GET",
    dataType: "json",
    success: function (data) {
      const researcherContainer = document.getElementById(
        "researcherContainer",
      );
      researcherContainer.innerHTML = ""; // 기존 내용 삭제

      data.forEach(function (item) {
        const member = item.member;
        const evaluationMember = item.evaluationMember;

        // 기관 유형에 따라 클래스 할당
        let institutionClass = "";
        switch(member.iarType) {
          case "산업체":
            institutionClass = "industry";
            break;
          case "교육기관":
            institutionClass = "education";
            break;
          case "연구기관":
            institutionClass = "research";
            break;
          default:
            institutionClass = "";
        }


        const card = `
                    <div class="card">
                        <div class="card-row">
                            <span class="card-label">기관명</span>
                            <span class="card-value">${member.institutionName}</span>
                        </div>
                        <div class="card-row">
                            <span class="card-label">이름</span>
                            <span class="card-value">${member.name}</span>
                            <span class="card-label">국가연구자번호</span>
                            <span class="card-value">${member.rsrchNo}</span>
                        </div>
                        <div class="card-row">
                            <div class="card-status">
                                <span class="status ${evaluationMember.recvStatusEng}">${evaluationMember.recvStatus}</span>
                            </div>
                            <span class="card-label">소속기관</span>
                            <span class="card-value">${member.iarType}</span>
                        </div>
                    </div>
                `;
        researcherContainer.innerHTML += card;
      });
    },
    error: function (error) {
      console.error("연구원 불러오기 실패 : :", error);
    },
  });
}*/

// eval-committee-compose.js

function loadResearcherInfo(committeeId) {
  $.ajax({
    url: `/api/v1/research-number/researchers/${committeeId}`,
    type: "GET",
    dataType: "json",
    success: function (data) {
      const researcherContainer = document.getElementById("researcherContainer");
      researcherContainer.innerHTML = ""; // 기존 내용 삭제

      // 기관 유형별로 데이터를 그룹화
      const groupedData = data.reduce((acc, item) => {
        const type = item.member.iarType;
        if (!acc[type]) acc[type] = [];
        acc[type].push(item);
        return acc;
      }, {});

      // 각 그룹별로 섹션 생성
      for (const [type, items] of Object.entries(groupedData)) {
        // 섹션 헤더 추가

        // 각 연구원 카드 추가
        items.forEach(function (item) {
          const member = item.member;
          const evaluationMember = item.evaluationMember;

          // 기관 유형에 따라 클래스 할당
          let institutionClass = "";
          switch(type) {
            case "산업체":
              institutionClass = "industry";
              break;
            case "교육기관":
              institutionClass = "education";
              break;
            case "연구기관":
              institutionClass = "research";
              break;
            default:
              institutionClass = "";
          }

          const card = `
            <div class="card ">
                <div class="card-row">
                    <span class="card-label">기관명</span>
                    <span class="card-value">${member.institutionName}</span>
                </div>
                <div class="card-row">
                    <span class="card-label">이름</span>
                    <span class="card-value">${member.name}</span>
                    <span class="card-label">국가연구자번호</span>
                    <span class="card-value">${member.rsrchNo}</span>
                </div>
                <div class="card-row">
                    <div class="card-status">
                        <span class="status ${evaluationMember.recvStatusEng}">${evaluationMember.recvStatus}</span>
                    </div>
                    <span class="card-label">소속기관</span>
                    <span class="card-value ${institutionClass}">${type}</span>
                </div>
            </div>
          `;
          researcherContainer.innerHTML += card;
        });
      }
    },
    error: function (error) {
      console.error("연구원 불러오기 실패 : :", error);
    },
  });
}

// 평가위원 구성 함수
function setEvalCommittee(subAnnNo) {
  // 비율 객체 생성
  let evalPercent = {
    researchInstituteRate: parseInt($("#researchInstituteRate").val(), 10) || 0,
    educationInstituteRate:
      parseInt($("#educationInstituteRate").val(), 10) || 0,
    professionalInstituteRate:
      parseInt($("#professionalInstituteRate").val(), 10) || 0,
  };

  // 비율 합계 검증 (클라이언트 측 추가)
  const total =
    evalPercent.researchInstituteRate +
    evalPercent.educationInstituteRate +
    evalPercent.professionalInstituteRate;
  if (total !== 100) {
    Swal.fire({
      icon: "error",
      title: "비율 합계 오류",
      text: "산업체, 교육기관, 연구기관 비율의 합계는 100%여야 합니다.",
    });
    return;
  }

  Swal.fire({
    title: "평가위원회 구성",
    html: `
      <p>다음 비율로 평가위원회를 구성하시겠습니까?</p>
      <div style="text-align: center;">
        <strong>산업체 비율:</strong> ${evalPercent.researchInstituteRate}%<br>
        <strong>교육기관 비율:</strong> ${evalPercent.educationInstituteRate}%<br>
        <strong>연구기관 비율:</strong> ${evalPercent.professionalInstituteRate}%<br>
      </div>
      <p><br>정보가 올바른지 확인해주세요!</p>
    `,
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#2e406a",
    cancelButtonColor: "#dddbdb",
    confirmButtonText: "신청",
    cancelButtonText: "취소",
  }).then((result) => {
    if (result.isConfirmed) {

      $("#committee-standby").hide();
      $("#committee-info").show();
      $(".committee-summary").show();
      // location.reload();

      let evalPercent = {
        researchInstituteRate:
          parseInt($("#researchInstituteRate").val(), 10) || 0,
        educationInstituteRate:
          parseInt($("#educationInstituteRate").val(), 10) || 0,
        professionalInstituteRate:
          parseInt($("#professionalInstituteRate").val(), 10) || 0,
      };

      // 비율 합계 검증 (클라이언트 측 추가)
      const total =
        evalPercent.researchInstituteRate +
        evalPercent.educationInstituteRate +
        evalPercent.professionalInstituteRate;
      if (total !== 100) {
        Swal.fire({
          icon: "error",
          title: "비율 합계 오류",
          text: "산업체, 교육기관, 연구기관 비율의 합계는 100%여야 합니다.",
        });
        return;
      }

      $.ajax({
        url: `/api/v1/evaluation/register/eval-committee/${subAnnNo}`,
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(evalPercent),
        success: function () {
          Swal.fire({
            icon: "success",
            title: "평가위원회가 성공적으로 구성되었습니다.",
            showConfirmButton: false,
            timer: 1500,
          });
          updateCommitteeList(subAnnNo);
        },
        error: function (error) {
          console.error("평가위원회 구성 실패 : ", error);
          Swal.fire({
            icon: "error",
            title: "평가위원회 구성 실패",
            text: "서버 오류가 발생했습니다. 다시 시도해주세요.",
          });
        },
      });
    }
  });
}

// 평가위원회 재구성 함수
function resetEvalCommittee(subAnnNo) {
  // $.ajax({
  //   url: `#`,
  //   type: "POST",
  //   dataType: "json",
  //   success: function () {
  //   },
  //   error: function (error) {
  //   },
  // });
}

// 평가위원회 목록 갱신 함수
function updateCommitteeList(subAnnNo) {
  $.ajax({
    url: `/api/v1/evaluation/committees/${subAnnNo}`,
    type: "GET",
    dataType: "json",
    success: function (data) {
      const tbody = $(".committee-table tbody");
      tbody.empty();

      data.forEach(function (committee) {
        const formatDate = (dateStr) => {
          return dateStr.slice(0, 10);
        };

        const row = `
          <tr data-committee-id="${committee.evalCommitteeNo}"
              data-start-date="${formatDate(committee.evalStartedAt)}"
              data-end-date="${formatDate(committee.evalClosedAt)}"
              data-title="${committee.name}">
            <td><input type="checkbox" name="committee"  checked/></td>
            <td class="subAnnounceName">${committee.name}</td>
            <td>${formatDate(committee.evalStartedAt)}</td>
            <td>${formatDate(committee.evalClosedAt)}</td>
            <td><span class="status stayed">승인대기</span></td>
          </tr>
        `;
        tbody.append(row); // 각 평가위원회를 테이블에 추가
      });
    },
    error: function (error) {
      console.error("평가위원회 목록 갱신 실패: ", error);
    },
  });
}
