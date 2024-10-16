$("#registerButton").on("click", function () {
    Swal.fire({
        title: "후보단 등록을 하시겠습니까 ?",
        text: "정보가 올바른지 확인해주세요 !",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#2e406a",
        cancelButtonColor: "#dddbdb",
        confirmButtonText: "신청",
        cancelButtonText: "취소",
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                title: "신청되었습니다!",
                text: "평가위원단 후보 등록에 성공하셨습니다.",
                icon: "success",
                confirmButtonColor: "#2e406a",
            });
        }
    });
});
