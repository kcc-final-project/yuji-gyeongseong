$(function () {
    $('#submit-btn').on('click', () => {
        let name = $('#name').val();
        let birth = $('#birth').val();
        let tel = $('#tel').val();
        let data = {
            name: name,
            birth: birth,
            tel: tel
        };

        $.ajax({
            url: "/sms/cert",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function (response) {
                isChecked(response);
            },
            error: function (xhr) {
                alert(xhr.responseText);
            }
        })
        let number;

        function isChecked(isTrue) {
            if (isTrue) {
                alert("인증코드를 전송했습니다.");
                $('#name, #birth, #tel').prop('disabled', true);
                $('.modal-body').css('height', '700px');
                $('#cert-title, #certNum, #certNum-btn-area').css('display', 'block');
                $('#certNum-btn-area').css('display', 'flex');
                $.ajax({
                    url: '/sms/send',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({phoneNum: tel}),
                    success: function (response) {
                        number = response;
                        $('#cert-btn').on('click', () => {
                            let certNum = $('#certNum').val();
                            if (certNum === number) {
                                alert("인증이 완료되었습니다!");

                                $.ajax({
                                    url: '/sms/store', // 새로운 엔드포인트
                                    type: 'POST',
                                    contentType: 'application/json',
                                    data: JSON.stringify({name: name, birth: birth, tel: tel}),
                                    success: function () {
                                        // 저장이 성공하면 리다이렉트
                                        window.location.href = "/member/sign/up2";
                                    },
                                    error: function () {
                                        alert("세션 저장에 실패했습니다. 다시 시도해주세요.");
                                    }
                                });
                            } else {
                                alert("인증에 실패하셨습니다! 다시 시도해주세요.");
                            }
                        })
                    }
                })
            }
        }
    })
})