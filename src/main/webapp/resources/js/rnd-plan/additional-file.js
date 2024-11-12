$(function () {
    $('.uploadFile').on("change", function() {
        var file = this.files[0];
        if (file) {
            var name = file.name;
            var size = file.size; // 바이트 단위 크기
            var sizeInKB = (size / 1024).toFixed(2) + ' KB';

            var date = new Date(); // 현재 날짜 및 시간
            var dateString = date.getFullYear() + '-' +
                ('0' + (date.getMonth() + 1)).slice(-2) + '-' +
                ('0' + date.getDate()).slice(-2) + ' ' +
                ('0' + date.getHours()).slice(-2) + ':' +
                ('0' + date.getMinutes()).slice(-2);

            $(this).closest('tr').find('.fileSize').val(sizeInKB);
            $(this).closest('tr').find('.fileDate').val(dateString);
            $(this).closest('tr').find('.filename').val(name);
        }
    });

    //file upload
    $('.ctm-btn-init__next').click(function(e) {
        e.preventDefault(); // 기본 폼 제출 방지

        var formData = new FormData();
        var allFilesSelected = false;

        $('.uploadFile').each(function() {
            var files = this.files;
            if (files.length > 0) {
                allFilesSelected = true;
                for (var i = 0; i < files.length; i++) {
                    formData.append('files', files[i]);
                }
            }
        });

        $.ajax({
            url: '/files/upload',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                console.log("업로드 성공", response);
                alert("파일이 성공적으로 업로드되었습니다.");
            },
            error: function(jqXHR, textStatus) {
                console.log("업로드 실패", textStatus);
            }
        });
    });
});
