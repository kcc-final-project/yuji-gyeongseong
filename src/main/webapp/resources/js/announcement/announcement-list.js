$(function () {
    // 공고 목록 로드
    loadAnnouncements();

    function loadAnnouncements() {
        $.ajax({
            url: '/anno/accepting', // 공고 데이터를 가져올 API 엔드포인트
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

    function loadExpectedAnnouncements(){
        $.ajax({
            url:'/anno/expected',
            method: 'GET',
            success: function(data){
                renderAnnouncements(data);
            },
            error:function(){
                alert('공고 목록을 불러오는 데 실패했습니다.');
            }
        })
    }

    function loadDeadlineAnnouncements(){
        $.ajax({
            url:'/anno/deadline',
            method:'GET',
            success: function(data){
                renderAnnouncements(data)
            },
            error:function(){
                alert('공고 목록을 불러오는 데 실패했습니다.');
            }
        })
    }



    function renderAnnouncements(announcements) {

        $('#announcementContainer').empty(); // 기존 목록 비우기

        announcements.forEach(function (announcementRequest) { // 클래스 이름에 맞게 수정
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
                    <p class="total_ann_no">공고번호: ${announcementRequest.totalAnnNo}</p>
                    <p class="ann_type">공모유형: ${announcementRequest.annType}</p>
                    <p class="started_at">공고일자: ${announcementRequest.startedAt}</p>
                    <button class="view-details-btn">상세보기</button>
                </div>
            </div>
        `;
            $('#announcementContainer').append(announcementHtml); // HTML 추가
        });
    }


    const buttons = document.querySelectorAll('.reception-status-wrap button');
    buttons.forEach(button => {
        button.addEventListener('click', function () {

            let btnStatus = button.textContent;
            buttons.forEach(btn => btn.classList.remove('active'));
            this.classList.add('active');

            if(btnStatus==="접수예정"){
                console.log("접수예정 클릭");
                loadExpectedAnnouncements()
            }else if(btnStatus==="접수마감"){
                console.log("접수마감 클릭");
                loadDeadlineAnnouncements();
            }else{
                console.log("접수중 클릭");
                loadAnnouncements()
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
});