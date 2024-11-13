$(function () {
    loadAnnouncements();

    function loadAnnouncements() {
        $.ajax({
            url: '/anno/topAcception',
            method: 'GET',
            success: function (data) {
                renderAnnouncements(data);
            },
            error: function () {
                alert('공고 목록을 불러오는 데 실패했습니다.');
            }
        });
    }

    function loadExpectedAnnouncements() {
        $.ajax({
            url: '/anno/topExpected',
            method: 'GET',
            success: function (data) {
                renderAnnouncements(data);
            },
            error: function () {
                alert('공고 목록을 불러오는 데 실패했습니다.');
            }
        });
    }

    function renderAnnouncements(announcements) {
        $('.anno-contents-body').empty();

        for (let i = 0; i < Math.min(9, announcements.length); i++) {
            var announcementRequest = announcements[i];
            var announcementHtml = `
        <div class="anno-content-area">
            <div>
                <span class="common-span-style competent_ministry">
                    ${announcementRequest.competentMinistry}
                </span>
                <em class="spec-style spec_institution" data-annNo = ${announcementRequest.annNo} >
                    ${announcementRequest.specInstitution}
                </em>
            </div>
            <p class="total-title">
                ${announcementRequest.totalTitle}
            </p>
            <small class="state">
                ${announcementRequest.status}
            </small>
        </div>
        `;
            $('.anno-contents-body').append(announcementHtml);
        }

        $('.anno-content-area').click(function () {
            var AnnNo = $(this).find('.spec-style').attr('data-annNo');
            window.location.href = `/anno/detail/${AnnNo}`;
        })

    }

    $('#accepting').addClass('active');

    $(document).ready(function(){
        $('#expected').click(function(){
            loadExpectedAnnouncements();
            $(this).addClass('active');
            $('#accepting').removeClass('active');
        });

        $('#accepting').click(function(){
            loadAnnouncements();
            $(this).addClass('active');
            $('#expected').removeClass('active');
        });
    });



    $('.common-anno-btn').click(() => {
        $('.common-anno-btn').removeClass('active');
        $(this).addClass('active');
    });

    $('.work-lounge').click(function () {
        window.location.href = '/business-timeline';
    })

    $('.researcher-number').click(function(){
        window.location.href = '/research-number'
    })

    $('.evaluation-committee').click(function(){
        window.location.href='/eval-committee'
    })

})
