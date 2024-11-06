$(function () {
    $('#announcement-button').addClass('active');
    $('.announcement-details').css("display", "block");

    function showField(targetClass, activeButton) {
        $('.announcement-details, .public-notice-field, .attachment-field').css("display", "none");
        $(targetClass).css("display", "block");

        $('#announcement-button, #competition-field-button, #attachment-file-button').removeClass('active');
        $(activeButton).addClass('active');
    }

    $('#announcement-button').on('click', function () {
        showField('.announcement-details', this);
    });
    $('#competition-field-button').on('click', function () {
        showField('.public-notice-field', this);
    });
    $('#attachment-file-button').on('click', function () {
        showField('.attachment-field', this);
    });

    //상세보기 아이콘 클릭
    $('.zoom-in-btn').on('click', function() {
        let subAnnNo = $(this).data('announcement-no');
        $.ajax({
            url: '/anno/detail/zoom-in/'+subAnnNo,
            type: 'GET',
            success: function(response) {
                console.log('Success:', response);
                setModalData(response);
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        });
    });

    $('#apply-btn').on('click', function() {
        let annNo = $(this).data('annno');
        window.location.href=`/anno/apply/${annNo}`
    });




    function setModalData(data){
        $('#subAnnUniNo').text(data.subAnnUniNo);
        $('#subTitle').text(data.subTitle);
        $('#specInstitution').text(data.specInstitution);
        $('#specInstitutionNo').text(data.specInstitutionNo);
        $('#techFieldName').text(data.techFieldName);
        $('#totalSubsidy').text(data.totalSubsidy);
        $('#totalDevMonth').text(data.totalDevMonth);
        $('#mgrName').text(data.mgrName);
        $('#mgrTel').text(data.mgrTel);
        $('#planningYear').text(data.planningYear);
        $('#annType').text(data.annType);
        $('#oneYearSubsidy').text(data.oneYearSubsidy);
        $('#oneYearDevMonth').text(data.oneYearDevMonth);
    }
});