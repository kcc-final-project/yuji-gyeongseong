$(function () {
        // 최종 제출 버튼 요소 가져오기
        const finalSubmitButton = document.getElementById('finalSubmitButton');

        // 버튼 클릭 이벤트 리스너 추가
        finalSubmitButton.addEventListener('click', function () {
            // SweetAlert2를 사용한 확인 팝업
            Swal.fire({
                title: '최종 제출 확인',
                text: "정말로 최종 제출하시겠습니까?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#2E406A',
                cancelButtonColor: '#d33',
                confirmButtonText: '네, 제출합니다',
                cancelButtonText: '취소'
            }).then((result) => {

                // 로그인 회원의 번호
                let memberId = 1;

                let EvalNotiRequest ={
                    content: "연구 개발 계획서 최종 제출이 완료되었습니다.",
                    notiType: "연구자",
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
                            Swal.fire(
                                '제출 완료!',
                                '연구개발 계획서가 성공적으로 제출되었습니다.',
                                'success'
                            ).then(() => {
                                window.location.href = '/';
                            });
                        },
                        error:function (error){
                            alert("후보단 등록 실패")
                            console.log(error, "error");
                        }
                    });

                }
            })
        });
    });