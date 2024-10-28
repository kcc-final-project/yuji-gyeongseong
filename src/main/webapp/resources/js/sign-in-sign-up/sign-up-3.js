function pwCheck() {
    const reg = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{9,16}$/;
    const password = $('#password').val(); // 비밀번호 입력 필드의 값을 가져옴
    if (reg.test(password)) {
        $('.success-pw').text("옳바른 비밀번호 형식입니다.").css('color', 'green');
    } else {
        $('.success-pw').text("옳바르지 않은 비밀번호 형식입니다.").css('color', 'red');
    }

    if ($('#password').val() == $('#password-confirm').val()) {
        $('#pwConfirm').text('비밀번호가 일치합니다.').css('color', 'green')
    } else {
        $('#pwConfirm').text('비밀번호가 일치하지 않습니다.').css('color', 'red')
    }
}

function idCheck() {
    const regex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{5,16}$/;
    if (regex.test($('#user-id').val())) { // 괄호를 올바르게 닫음
        $('.success-id').text("옳바른 아이디 형식입니다.").css('color', 'green');
    } else {
        $('.success-id').text("옳바르지 않은 아이디 형식입니다.").css('color', 'red');
    }
}

function importOrgan(data) {
    $('.content-wrap-area').empty();
    $.each(data, function (index, item) {
        $('.content-wrap-area').append(
            `<tr class="modal-content-area">
                        <td class="content-title">${item.name}</td>
                        <td class="content-number">${item.businessRegisterNo}</td>
                        <td class="content-location">${item.address}</td>
                        <td class="content-type">${item.companyType}</td>
                    </tr>`
        )
    })

    $('.modal-content-area').on('click', function () {
        let title = $(this).find('.content-title').text();
        let number = $(this).find('.content-number').text();
        let location = $(this).find('.content-location').text();
        let type = $(this).find('.content-type').text();

        $('#exampleModal').modal('hide');
        $('.modal-backdrop').remove();
        $('#organization').val(title);
    })
}

$(function () {
    $('#affiliation-type').on('change', function () {
        if ($(this).val() === "프리랜서" || $(this).val() === "은퇴 고경력자") {
            $('#organization, #department, #position, #institution-email, #mail-btn, #institution-email-certification').prop("disabled", true);
            $('.search-icon').css('pointer-events', 'none');
        } else {
            $('#organization, #department, #position, #institution-email, #mail-btn, #institution-email-certification').prop("disabled", false);
            $('.search-icon').css('pointer-events', 'auto');
        }
    })
    var index = 1;
    $('.add-organ-btn').on('click', function () {
        index++;
        let organization = $('#organization').val();
        let department = $('#department').val();
        let position = $('#position').val();
        if (organization === "") {
            swal('실패', "소속기관은 필수 입력사항입니다.", 'error');
        } else {
            $('.table-body-area').append(
                '<tr class="row-' + index + '">' + // 각 행에 고유한 클래스를 추가
                '<td class="orga add-organization-' + index + '">' + '</td>' +
                '<td class="dept add-department-' + index + '">' + '</td>' +
                '<td class="posi add-position-' + index + '">' + '</td>' +
                '<td>' + '<button type="button" class="orga-btn" data-index="' + index + '">삭제</button>' + '</td>' +
                '</tr>'
            );

            $(".add-organization-" + index).text(organization);
            $(".add-department-" + index).text(department);
            $(".add-position-" + index).text(position);

            $('#organization').val("");
            $('#department').val("");
            $('#position').val("");


            $('.orga-btn').on('click', function () {
                var btnIndex = $(this).data('index');
                $('.row-' + btnIndex).remove();
            });
        }
    });
    let previousValue = $('#affiliation-type').val();

    $('#affiliation-type').on('change', function () {
        let currentValue = $(this).val();
        if (previousValue === "등록기관" && currentValue !== "등록기관") {
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
                    Swal.fire(
                        '변경 완료',
                        '변경 되었습니다.',
                        'success',
                    )
                }
            })
        }
        $('#organization').val("");
        $('#department').val("");
        $('#position').val("");
        previousValue = currentValue;
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
                },
                error: function (xhr) {
                    if (xhr.status == 400) {
                        alert("아이디가 중복되었습니다.");
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
        alert("인증코드가 전송되었습니다.");
        $.ajax({
            url: '/userMailSend',
            type: 'POST',
            data: {mail: email},
            error: function (xhr, status, error) {
                alert("인증번호 전송 실패: " + error);
            }
        });
    });


    $('#email-check').on('click', () => {
        let userNumber = $('#check-area').val();
        $.ajax({
            url: '/mailCheck',
            type: 'GET',
            data: {userNumber: userNumber},
            success: (response) => {
                if (response === true) {
                    alert("이메일 인증 완료");
                    $('#send-mail-btn').prop('disabled', true);
                    $('#email-success').css('display', 'block');
                    $('#email').prop('disabled', true);
                    $('#check-area').prop('disabled', true);
                    $('#email-check').prop('disabled', true);
                } else if (response === false) {
                    alert("이메일 인증 실패");
                    $('#email-success').css('display', 'block');

                }
            }
        })
    })

    $('#mail-btn').on('click', () => {
        alert("요청하신 메일로 전송이 완료 되었습니다.");
        let institutionEmail = $('#institution-email').val();
        $.ajax({
            url: '/mailSend',
            type: 'POST',
            data: {mail: institutionEmail},
            error: function (xhr, status, error) {
                alert("메일 전송 실패: " + error);
            }
        })
    })

    $('.apply-btn').on('click',()=>{
        window.location.href="/member/sign/up4"
    })
})