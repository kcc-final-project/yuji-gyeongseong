$("#registerButton").on("click", function () {
  Swal.fire({
    title: "후보단 등록을 하시겠습니까?",
    text: "정보가 올바른지 확인해주세요!",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#2e406a",
    cancelButtonColor: "#dddbdb",
    confirmButtonText: "신청",
    cancelButtonText: "취소",
  }).then((result) => {

    // 로그인 회원의 번호
    let memberId = 1;

    let EvalNotiRequest ={
      content: "평가위원 후보 등록이 되었습니다.",
      notiType: "평가위원",
      dataCategory: "service",
      notiContentNo : 1,
      memNo: memberId
    };

    if (result.isConfirmed) {
      $.ajax({
        url: "/api/v1/research-number/register/eval/" + memberId,
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(EvalNotiRequest),
        success: function(response) {
          Swal.fire({
            title: "신청되었습니다!",
            text: "평가위원단 후보 등록에 성공하셨습니다.",
            icon: "success",
            confirmButtonColor: "#2e406a",
          });
        },
        error:function (error){
          alert("후보단 등록 실패")
          console.log(error, "error");
        }
      });
    }
  });
});
