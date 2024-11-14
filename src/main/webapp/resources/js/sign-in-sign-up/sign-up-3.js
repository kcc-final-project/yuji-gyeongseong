function pwCheck() {
    const reg = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{9,16}$/;
    const password = $('#password').val(); // 비밀번호 입력 필드의 값을 가져옴
    if (reg.test(password)) {
        $('.success-pw').text("올바른 비밀번호 형식입니다.").css('color', 'green');
        $('#password').css('border','1px solid #dee2e6');
    } else {
        $('.success-pw').text("올바르지 않은 비밀번호 형식입니다.").css('color', 'red');
        $('#password').css('border','1px solid #dc3545');
    }

    if ($('#password').val() == $('#password-confirm').val()) {
        $('#pwConfirm').text('비밀번호가 일치합니다.').css('color', 'green')
        $('#password-confirm').css('border','1px solid #dee2e6');
    } else {
        $('#pwConfirm').text('비밀번호가 일치하지 않습니다.').css('color', 'red')
        $('#password-confirm').css('border','1px solid #dc3545');
    }
}

function idCheck() {
    const regex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{5,16}$/;
    if (regex.test($('#user-id').val())) { // 괄호를 올바르게 닫음
        $('.success-id').text("올바른 아이디 형식입니다.").css('color', 'green');
        $('#user-id').css('border','1px solid #dee2e6');
    } else {
        $('.success-id').text("올바르지 않은 아이디 형식입니다.").css('color', 'red');
        $('#user-id').css('border','1px solid #dc3545');
    }
}

function importOrgan(data) {
    $('.content-wrap-area').empty();
    $.each(data, function (index, item) {
        $('.content-wrap-area').append(
            `<tr class="modal-content-area">
                        <td data-institutionNo="${item.institutionNo}" class="content-title">${item.name}</td>
                        <td class="content-number">${item.businessRegisterNo}</td>
                        <td class="content-location">${item.address}</td>
                        <td class="content-type">${item.companyType}</td>
                    </tr>`
        )
    })

    $('.modal-content-area').on('click', function () {
        let title = $(this).find('.content-title').text();
        let institutionNo = $(this).find('.content-title').data('institutionno');

        $('#exampleModal').modal('hide');
        $('.modal-backdrop').remove();
        $('#organization').val(title);
        $('#email-back').val("chungbuk.ac.kr");
        $('#organization').attr('data-initno', institutionNo); // HTML에 data-initno 추가
    });

}

$(function () {
    $(document).ready(function () {

        let initialAffiliationType = $('#affiliation-type').val();

        // 페이지 로드 시 프리랜서 또는 은퇴 고경력자라면 필드 숨김 및 비활성화
        if (initialAffiliationType === "프리랜서" || initialAffiliationType === "은퇴 고경력자") {
            $('#organization, #department, #position, #institution-email, #mail-btn, #institution-email-certification').prop("disabled", true);
            $('.search-icon').css('pointer-events', 'none');
            $('#check-organ').css('display', 'none');
            $('.add-organ-btn').css('display', 'none');
            $('#email').css('display','none');

        }
    });

// affiliation-type이 변경될 때마다 조건 처리
    $('#affiliation-type').on('change', function () {
        let currentValue = $(this).val();
        let previousValue = $('#affiliation-type').data('previous') || "";

        // 조건 1: 등록기관이 선택된 경우 필드를 표시 및 활성화
        if (currentValue === "등록기관") {
            $('#organization, #department, #position, #institution-email, #mail-btn, #institution-email-certification').prop("disabled", false);
            $('.search-icon').css('pointer-events', 'auto');
            $('#check-organ').css('display', 'block');
            $('.add-organ-btn').css('display', 'block');
            $('#email').prop('disabled',false);
            $('#send-mail-btn').prop('disabled', false);
            $('#check-area').prop('disabled',false);
            $('#email-check').prop('disabled',false);
            $('.mail-danger').css('display','block');

            // 조건 2: 등록기관에서 다른 값으로 변경할 시 알림 및 필드 비활성화
        } else if (previousValue === "등록기관" && (currentValue === "프리랜서" || currentValue === "은퇴 고경력자")) {
            Swal.fire({
                title: '정말 바꾸시겠습니까?',
                text: "다른 항목으로 변경하면 입력된 값들이 초기화됩니다.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#2E406A',
                cancelButtonColor: '#d33',
                confirmButtonText: '확인',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    // 필드 비활성화 및 숨김 처리
                    $('#organization, #department,#email,#send-mail-btn,#check-area, #email-check,#position, #institution-email, #mail-btn, #institution-email-certification').prop("disabled", true);
                    $('.search-icon').css('pointer-events', 'none');
                    $('#check-organ').css('display', 'none');
                    $('.add-organ-btn').css('display', 'none');
                    $('.mail-danger').css('display','none');

                    // 필드 초기화
                    $('#organization, #email,#send-mail-btn,#check-area, #email-check,#department, #position, #institution-email').val("");

                    $('.common-table-row').remove();

                    Swal.fire(
                        '변경 완료',
                        '변경 되었습니다.',
                        'success'
                    );

                    // 현재 값을 이전 값으로 저장
                    $('#affiliation-type').data('previous', currentValue);
                } else {
                    // 취소 시 이전 값을 "등록기관"으로 유지
                    $('#affiliation-type').val("등록기관");
                    $('#affiliation-type').data('previous', "등록기관");

                }
            });

            // 조건 3: 다른 항목 선택 시 기본 필드 비활성화 및 숨김 처리
        } else {
            $('#organization, #department, #position, #institution-email, #mail-btn, #institution-email-certification').prop("disabled", true);
            $('.search-icon').css('pointer-events', 'none');
            $('#check-organ').css('display', 'none');
            $('.add-organ-btn').css('display', 'none');
        }

        // 이전 값을 데이터에 저장
        if (currentValue !== previousValue) {
            $('#affiliation-type').data('previous', currentValue);
        }
    });





    var index = 1;
    $('.add-organ-btn').on('click', function () {
        index++;
        let organization = $('#organization').val();
        let department = $('#department').val();
        let position = $('#position').val();
        let organStatus=$('#affiliation-type').val();
        let initno = $('#organization').data('initno');
        if ((organization === "") && organStatus==="등록기관" ){
            // swal('실패', "소속기관은 필수 입력사항입니다.", 'error');
        } else {
            $('.table-body-area').append(
                '<tr class="common-table-row row-' + index + '">' + // 각 행에 고유한 클래스를 추가
                '<td class="orga add-organization-' + index + '" data-initno="' + initno + '">' + '</td>' +
                '<td class="dept add-department-' + index + '">' + '</td>' +
                '<td class="posi add-position-' + index + '">' + '</td>' +
                '<td>' + '<button type="button" class="orga-btn" data-index="' + index + '">삭제</button>' + '</td>' +
                '</tr>'
            );

            $(".add-organization-" + index).text(organization);
            $(".add-department-" + index).text(department);
            $(".add-position-" + index).text(position);

            $('#organization').css('border','0.5px solid #dee2e6').val("");
            $('#department').val("");
            $('#position').val("");


            $('.orga-btn').on('click', function () {
                var btnIndex = $(this).data('index');
                $('.row-' + btnIndex).remove();
            });
        }
    });

    $('#duplication-btn').on('click', () => {
        if ($('.success-id').text() === "옳바른 아이디 형식입니다.") {
            let id = $('#user-id').val();
            $.ajax({
                url: "/member/duplicateCheck",
                contentType: "application/json",
                type: "POST",
                data: JSON.stringify({id: id}),
                success: function (response) {
                    $('.success-id').text("사용 가능한 아이디 입니다.").css('color', 'green');
                    $('#user-id').css('border','1px solid #dee2e6');
                    $('#duplication-btn').css('border','1px solid #dee2e6');

                },
                error: function (xhr) {
                    if (xhr.status == 400) {
                        Swal.fire({
                            icon: "warning",
                            text: "아이디가 중복되었습니다.",
                            confirmButtonText: "확인",
                            confirmButtonColor: "#2e406a",
                        });
                        $('#user-id').css('border','1px solid #dc3545');
                        $('#duplication-btn').css('border','1px solid #dc3545');
                        $('.success-id').text("사용할 수 없는 아이디 입니다.").css('color', 'red');
                        $('#user-id').val("");
                    }
                }
            })
        } else {
            alert("아이디를 입력해주세요.");
        }
    });

    $('.search-icon').on('click', () => {
        $.ajax({
            url: "/member/search/icon",
            type: "GET",
            success: function (data) {
                importOrgan(data);
            }
        })
    })

    $('#select-filter-btn').on('click', () => {
        let name = $('#organization-name').val();
        let businessRegisterNo = $('#business-number').val();
        let companyType = $('#institution-type').val();
        $.ajax({
            url: "/member/search/organ",
            type: "GET",
            data: {
                name: name,
                businessRegisterNo: businessRegisterNo,
                companyType: companyType
            },
            success: function (data) {
                importOrgan(data);
            }
        })
    })

    $('#send-mail-btn').on('click', () => {
        let email = $('#email').val();
        let emailBack = "@" + $('#email-back').val();
        let emailTotal = email + emailBack;
        Swal.fire(
            '전송 완료!',
            '이메일이 전송 되었습니다.',
            'success'
        )
        $.ajax({
            url: '/mail/userMailSend',
            type: 'POST',
            data: {mail: emailTotal},
            error: function (xhr, status, error) {
                alert("인증번호 전송 실패: " + error);
            }
        });
    });


    $('#email-check').on('click', () => {
        let userNumber = $('#check-area').val();
        $.ajax({
            url: '/mail/mailCheck',
            type: 'GET',
            data: {userNumber: userNumber},
            success: (response) => {
                if (response === true) {
                    Swal.fire(
                        '인증 완료!',
                        '이메일 인증이 완료되었습니다.',
                        'success'
                    )
                    $('#send-mail-btn').prop('disabled', true);
                    $('#email-success').css('display', 'block');
                    $('#check-area').css('border', '1.4px solid #dee2e6');
                    $('#email-check').css('border', '1.4px solid #dee2e6');
                    $('#email').prop('disabled', true);
                    $('#check-area').prop('disabled', true);
                    $('#email-check').prop('disabled', true);
                    $('#success-email').text("이메일 인증에 성공하셨습니다.");
                    $('#success-email').css('color','green');

                } else if (response === false) {
                    alert("이메일 인증 실패");
                    $('#email-success').css('display', 'block');
                    $('#success-email').css('color','red');
                    $('#success-email').text("이메일 인증을 다시 시도해 주세요.");
                    $('#check-area').css('border', '1.4px solid #dc3545');
                    $('#email-check').css('border', '1.4px solid #dc3545');

                }
            }
        })
    })

    $('#mail-btn').on('click', () => {
        alert("요청하신 메일로 전송이 완료 되었습니다.");
        let institutionEmail = $('#institution-email').val();
        $.ajax({
            url: '/mail/mailSend',
            type: 'POST',
            data: {mail: institutionEmail},
            error: function (xhr, status, error) {
                alert("메일 전송 실패: " + error);
            }
        })
    })

    $('.apply-btn').on('click', () => {
        let idCheck = $('.success-id').text() === "사용 가능한 아이디 입니다.";
        let pwCheck = $('.success-pw').text() === "옳바른 비밀번호 형식입니다.";
        let pwMatch = $('#pwConfirm').text() === "비밀번호가 일치합니다.";
        let emailCheck = $('#success-email').text() === "이메일 인증에 성공하셨습니다.";
        let map = $('#sample5_address').val();
        let orga = $('.orga').text();
        let errorMessages = [];
        let initno = $('.organi-group').data('initno');

        if ($('#affiliation-type').val() === "등록기관") {
            if (orga === "") {
                errorMessages.push("소속 유형을 선택해 주세요.");
                $('#organization').css('border','1.4px solid #dc3545');
            }
        }

        if (!idCheck) {
            errorMessages.push("아이디 중복체크를 실행해 주세요.");
            $('#user-id').css('border', '1.4px solid #dc3545');
            $('#duplication-btn').css('border', '1.4px solid #dc3545');
        }


        if (!pwCheck) {
            errorMessages.push("비밀번호가 옳바른 형식이 아닙니다.");
            $('#password').css('border', '1.4px solid #dc3545');
        }

        if (!pwMatch) {
            errorMessages.push("비밀번호가 일치하지 않습니다.");
            $('#password-confirm').css('border', '1.4px solid #dc3545');
        }

        if (!emailCheck) {
            errorMessages.push("이메일 인증을 진행해 주세요.");
            $('#check-area').css('border', '1.4px solid #dc3545');
            $('#email-check').css('border', '1.4px solid #dc3545');
        }

        if (map === "") {
            errorMessages.push("주소를 입력해 주세요.");
            $('#sample5_address').css('border', '1.4px solid #dc3545');
            $('#address-btn').css('border', '1.4px solid #dc3545');

        }


        // 모든 오류 메시지가 수집되었으면 alert로 표시
        if (errorMessages.length > 0) {
            Swal.fire({
                icon: "warning",
                text: "필수 항목 값을 모두 입력해주시기 바랍니다.",
                confirmButtonText: "확인",
                confirmButtonColor: "#2e406a",
            });

        }else{
            let gender = '';
            if ($('input[name="gender"]:checked').val() === "male") {
                gender = 'M';
            } else {
                gender = 'W';
            }

            formData = {
                username : $('#user-id').val(),
                password : $('#password').val(),
                name : $('#user-name').val(),
                email : $('#email').val(),
                birth : $('#birth-date').val(),
                gender : gender,
                tel : $('#phone').val(),
                addr : $('#sample5_address').val(),
                affilType : $('#affiliation-type').val(),
                affilDept : $('.dept').text(),
                position : $('.posi').text(),
                institutionNo: $('.orga').data('initno')

            }

            $.ajax({
                type: 'POST',
                url: '/member/sign/complete',
                data: JSON.stringify(formData),
                contentType: 'application/json',
                success: function(response) {
                    window.location.href = "/member/sign/up4"
                },
            });
        }
    });
})
