$(function () {
    loadAnnouncements();

    //접수중 공고 목록 조회
    function loadAnnouncements() {
        $.ajax({
            url: '/anno/accepting',
            method: 'GET',
            success: function (data) {
                // 받은 데이터를 기반으로 공고 목록 생성
                renderAnnouncements(data);
            },
            error: function () {
                alert('공고 목록을 불러오는 데 실패했습니다.');
            }
        });
    }

    //접수예정 공고 목록 조회
    function loadExpectedAnnouncements() {
        $.ajax({
            url: '/anno/expected',
            method: 'GET',
            success: function (data) {
                renderAnnouncements(data);
            },
            error: function () {
                alert('공고 목록을 불러오는 데 실패했습니다.');
            }
        })
    }

    //접수마감 공고 목록 조회
    function loadDeadlineAnnouncements() {
        $.ajax({
            url: '/anno/deadline',
            method: 'GET',
            success: function (data) {
                renderAnnouncements(data)
            },
            error: function () {
                alert('공고 목록을 불러오는 데 실패했습니다.');
            }
        })
    }

    //공고 목록 추가(공통)
    function renderAnnouncements(announcements) {
        $('#announcementContainer').empty();
        announcements.forEach(function (announcementRequest) {
            var announcementHtml = `
            <div class="anno-list shadow-sm">
                <div class="technology-field">
                    <p class="technology-title">${announcementRequest.competentMinistry} > ${announcementRequest.specInstitution}</p>
                    <div class="anno-status">
                        <p class="status">${announcementRequest.status}</p>
                    </div>
                </div>
                <div class="anno-announcement-title">
                    <p class="total_title">${announcementRequest.totalTitle}</p>
                </div>
                <div class="anno-bottom-wrap">
                    <p class="total_ann_no" data-annNo = ${announcementRequest.annNo}>공고번호: ${announcementRequest.totalAnnNo}</p>
                    <p class="ann_type">공모유형: ${announcementRequest.annType}</p>
                    <p class="created_at">공고일자: ${announcementRequest.createdAt}</p>
                    <button class="view-details-btn">상세보기</button>
                </div>
            </div>
        `;
            $('#announcementContainer').append(announcementHtml);
        });
    }
    $(document).on('click', '.view-details-btn', function() {
        // 클릭한 버튼의 부모 요소에서 공고번호 찾기
        const AnnNo = $(this).closest('.anno-bottom-wrap').find('.total_ann_no').attr('data-annNo');
        console.log(AnnNo);
        window.location.href = `/anno/detail/${AnnNo}`;
    });


    const buttons = document.querySelectorAll('.reception-status-wrap button');
    buttons.forEach(button => {
        button.addEventListener('click', function () {

            let btnStatus = button.textContent;
            buttons.forEach(btn => btn.classList.remove('active'));
            this.classList.add('active');

            if (btnStatus === "접수예정") {
                loadExpectedAnnouncements();
            } else if (btnStatus === "접수마감") {
                loadDeadlineAnnouncements();
            } else {
                loadAnnouncements();
            }
        });
    });
    $(document).ready(function () {
        let input = document.querySelector('#tag-input');
        let tagify = new Tagify(input);

        function handleCheckboxClick(checkboxClass, selectAllCheckboxId) {
            $(checkboxClass).on('click', function () {
                let clickedValue = $(this).val();
                if ($(this).is(':checked')) {
                    tagify.addTags([clickedValue]);
                } else {
                    let tags = tagify.value;
                    let index = tags.findIndex(tag => tag.value === clickedValue);
                    if (index !== -1) {
                        tagify.removeTag(tags[index].value);
                    }
                }
            });
            $(selectAllCheckboxId).on('click', function () {
                let isChecked = $(this).is(':checked');
                $(checkboxClass).prop('checked', isChecked);
                $(checkboxClass).each(function () {
                    let value = $(this).val();
                    if (isChecked) {
                        tagify.addTags([value]);
                    } else {
                        tagify.removeTag(value);
                    }
                });
            });
            tagify.on('remove', function (e) {
                let removedValue = e.detail.data.value;
                $(checkboxClass).each(function () {
                    if ($(this).val() === removedValue) {
                        $(this).prop('checked', false);
                    }
                });
            });
        }
        handleCheckboxClick('.ok', '#select-one-all-checkbox');
        handleCheckboxClick('.ok2', '#select-two-all-checkbox');
        handleCheckboxClick('.ok3', '#select-three-all-checkbox');
    });

    $('.go-to-btn').on('click', function () {
        const element = document.documentElement
        const scrollTop = function () {
            const position = element.scrollTop
            if (position > 0) {
                window.requestAnimationFrame(() => {
                    window.scrollTo(0, position - position / 0.3);
                    scrollTop();
                });
            }
        };
        scrollTop();
    });

    $('.refresh-btn').on('click', function () {
        location.reload(true);
    })

    $('.search-btn').on('click',function(){

        let date = $('.select-form').val();

        let keyword = $('.search-box').val();

        let activeText = $('.reception-status-wrap .tab-btn.active').text();

        let latest = $('.latest-form').val();

        let checkedSogan = $('.ok:checked').map(function() {
            return $(this).val();
        }).get();

        let checkedJunmun = $('.ok2:checked').map(function() {
            return $(this).val();
        }).get();

        let checkedGisul = $('.ok3:checked').map(function() {
            return $(this).val();
        }).get();
        $.ajax({
            url:'/anno/search',
            type:'GET',
            data:{
                'keyword' : keyword,
                'date' : date,
                'activeText' : activeText,
                'latest' : latest,
                'checkedSogan':checkedSogan,
                'checkedJunmun':checkedJunmun,
                'checkedGisul' :checkedGisul
            },
            success:function(data){
                console.log("성공");
                console.log(data);
                renderAnnouncements(data);
            },
            error:function(){
                console.log("실패");
            }

        })


    })
});
