$(function () {
    $('#submit-btn').on('click', () => {
        let name = $('#name').val();
        let birth = $('#birth').val();
        let tel = $('#tel').val();
        const telRegex = /^010\d{8}$/; // 휴대폰 번호 정규 표현식
        const birthRegex = /^(19|20)\d{2}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])$/; // 생년월일 정규 표현식


        $('#tel').css('border-bottom', '');
        $('#birth').css('border-bottom', '');


        if (name === "" || birth === "" || tel === "") {
            Swal.fire({
                icon: "warning",
                text: "항목 값을 모두 입력해주시기 바랍니다.",
                confirmButtonText: "확인",
                confirmButtonColor: "#2e406a",
            });


            if (name === "") $('#name').css('border-bottom', '2px solid red');
            if (birth === "") $('#birth').css('border-bottom', '2px solid red');
            if (tel === "") $('#tel').css('border-bottom', '2px solid red');
        } else {
            let isValid = true;

            // 유효성 검사
            if (!telRegex.test(tel)) {
                $('#tel').css('border-bottom', '2px solid red');
                isValid = false; // 유효성 체크 실패
            }

            if (!birthRegex.test(birth)) {
                $('#birth').css('border-bottom', '2px solid red');
                isValid = false; // 유효성 체크 실패
            }

            // 모든 입력이 올바를 경우 데이터 처리
            if (isValid) {
                let data = {
                    name: name,
                    birth: birth,
                    tel: tel
                };

                alert("인증코드를 전송했습니다.");
                $('#name, #birth, #tel').prop('disabled', true);
                $('.modal-body').css('height', '700px');
                $('#cert-title, #certNum, #certNum-btn-area').css('display', 'block');
                $('#certNum-btn-area').css('display', 'flex');


                $.ajax({
                    url: '/sms/send',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({ phoneNum: tel }),
                    success: function (response) {
                        let number = response;
                        $('#cert-btn').on('click', () => {
                            let certNum = $('#certNum').val();
                            if (certNum === number) {
                                alert("인증이 완료되었습니다!");

                                $.ajax({
                                    url: '/sms/store',
                                    type: 'POST',
                                    contentType: 'application/json',
                                    data: JSON.stringify({ name: name, birth: birth, tel: tel }),
                                    success: function () {
                                        window.location.href = "/member/sign/up2";
                                    },
                                    error: function () {
                                        alert("세션 저장에 실패했습니다. 다시 시도해주세요.");
                                    }
                                });
                            } else {
                                alert("인증에 실패하셨습니다! 다시 시도해주세요.");
                            }
                        });
                    }
                });
            }
        }
    });
});
