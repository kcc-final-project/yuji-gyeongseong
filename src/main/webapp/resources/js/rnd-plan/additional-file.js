$(function () {
    $('.uploadFile').on("change", function() {
        var file = this.files[0];
        if (file) {
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
        }
    });
});