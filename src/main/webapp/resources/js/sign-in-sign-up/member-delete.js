$(function(){
  $('#tab-personal-info').addClass('active');

  $('.back-btn').click(()=>{
    window.history.back();
  })

  $('.check-btn').click(()=>{

    const password = $('#password').val();
    $.ajax({
      url: '/member/check/password',
      type: 'POST',
      data: JSON.stringify({ password: password }),
      contentType: 'application/json',
      success: function(response) {
        // 서버의 응답 메시지를 출력
        $('#password').attr('disabled',true);
        $('#final-del-btn').css('display','block');
        $('.check-text').css('color',"green");
        $('.check-text').css('display','block');
        $('.check-text').text(response);
      },
      error: function(xhr, status, error) {
        $('.check-text').css('color',"red");
        $('.check-text').css('display','block');
        $('.check-text').text(xhr.responseText);
      }
    });

  })


  $('#final-del-btn').click(()=>{
    const memNo = $('#user-id').data('memno');
    Swal.fire({
      title: '정말 탈퇴 하시겠습니까?',
      text: "모든 데이터가 삭제되며 다시 복구할 수 없습니다.",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#2E406A',
      cancelButtonColor: '#d33',
      confirmButtonText: '확인',
      cancelButtonText: '취소'
    }).then((result) => {
      if (result.isConfirmed) {

        // ajax요청을 여기서 보내야함.
        $.ajax({
          url: '/member/delete-member', // RESTful 엔드포인트
          type: 'DELETE', // DELETE 요청으로 변경
          data: JSON.stringify({ memNo: memNo }),
          contentType: 'application/json',
          success: function(response) {
            console.log(response);

            Swal.fire({
              title: '삭제 완료',
              text: '다음에 또 이용해주세요!',
              icon: 'success',
              confirmButtonColor: '#2E406A',
              confirmButtonText: '확인'
            }).then((result) => {
              if (result.isConfirmed) {
                window.location.href = '/';
              }
            });
          },
          error: function(xhr, status, error) {
            console.log(xhr.responseText);
          }
        });
      }
    });
  })
})