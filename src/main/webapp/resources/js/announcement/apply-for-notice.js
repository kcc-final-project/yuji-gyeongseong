$(function(){
    $('.detail-btn').on('click',function(){
        let subAnnNo = $(this).data("announcement-no");
        $.ajax({
            url: '/anno/detail/zoom-in/'+subAnnNo,
            type:'GET',
            success: function(response) {
                console.log('Success:', response);
                setModalData(response);
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        })
    })


    $('.apply-btn').on('click', function() {
        // Find the closest parent with the class 'card' and get its data-subAnnNo
        let subAnnoNo = $(this).closest('.card').data('subannno');
        console.log(subAnnoNo);
        $.ajax({
            url: '/rnd-plans',
            type: 'GET',
            data: {subAnnNo: subAnnoNo},
            success:function(){
                alert("ok");
            },
            errors:function (){
                alert("no");
            }
        })
    });

})


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