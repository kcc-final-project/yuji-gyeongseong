$(document).ready(function() {
    $('#approveButton').on('click', function() {
        Swal.fire({
            title: "평가위원 제안을 수락하시겠습니까 ?",
            text: "정보를 확인해주세요 !",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#2e406a",
            cancelButtonColor: "#dddbdb",
            confirmButtonText: "승인",
            cancelButtonText: "거부"
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: "신청되었습니다!",
                    text: "평가위원회 참여 완료되었습니다.",
                    icon: "success",
                    confirmButtonColor: "#2e406a"
                });
            }
        });
    });
});