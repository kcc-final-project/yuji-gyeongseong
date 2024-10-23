$(document).ready(function () {
  $("#composeButton").on("click", function () {
    $("#committee-standby").hide();
    $("#committee-info").show();
    $(".committee-summary").show();
  });

    // 연구자에게 알림 전송
    $("#sendButton").click(function() {
        $("input[name='committee']:checked").each(function() { // 체크된 모든 체크박스를 순회
            var committeeId = $(this).closest('tr').data('committee-id'); // 해당 체크박스가 속한 행의 data-committee-id 값을 가져옴
            sendNotificationToCommitteeMembers(committeeId);
        });
    });
});

// 알림을 받을 위원회 연구원 검색 함수
function sendNotificationToCommitteeMembers(committeeId) {
    $.ajax({
        url: `/api/v1/research_number/researchers/${committeeId}`,
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            data.forEach(function(item) {
                sendNotification(item.member.memNo);
            });
        },
        error: function(error) {
            console.error("연구원 검색 실패 : ", error);
        }
    });
}

// 각 연구원 알림 함수
function sendNotification(memberId, memberName) {
    let EvalNotiRequest = {
        content: "평가할겁니까?!? 으이?!?!?",
        notiType: "평가위원",
        dataCategory: "service",
        memNo: memberId
    };

    $.ajax({
        url: "/api/v1/research_number/register/eval/" + memberId,
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(EvalNotiRequest),
        success: function(response) {
            console.log("알림 전송 성공");
        },
        error: function(error) {
            console.log("알림 전송 실패 : ", error);
        }
    });
}

function loadResearcherInfo(committeeId) {
    $.ajax({
        url: `/api/v1/research_number/researchers/${committeeId}`,
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            const researcherContainer = document.getElementById('researcherContainer');
            researcherContainer.innerHTML = '';  // 기존 내용 삭제

            data.forEach(function(item) {
                const member = item.member;
                const evaluationMember = item.evaluationMember;

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
        error: function(error) {
            console.error('연구원 불러오기 실패 : :', error);
        }
    });
}