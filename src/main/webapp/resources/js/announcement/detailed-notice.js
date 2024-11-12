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
                setModalData(response);
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        });


        $.ajax({
            url: '/anno/detail/file/' + subAnnNo,
            type: 'GET',
            dataType: 'json',
            success: function(response) {
                console.log("response:", response);

                const tableBody = $('.file-body'); // 정확한 선택자인지 확인하세요.
                tableBody.empty();

                response.forEach((file, index) => {
                    console.log("file:", file);

                    const row = `
                <tr>
                    <td class="index-number" style="text-align: center">${index + 1}</td>
                    <td>${file.fileName || '파일 이름 없음'}</td>
                    <td style="text-align: center">공모 관련 문서</td>
                    <td style="text-align: center">
                        <span class="material-icons pdf">picture_as_pdf</span>
                    </td>
                    <td style="text-align: center" >
                        <a style="color: black" href="/files/download?filePath=${file.uploadPath || '#'}">
                            <span class="material-icons">download</span>
                        </a>
                    </td>
                </tr>
            `;
                    tableBody.append(row);
                });
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