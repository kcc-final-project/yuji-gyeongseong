$(function () {
    let pageAccepting = 0;  // 접수중 페이지 번호
    let pageExpected = 0;   // 접수예정 페이지 번호
    let pageDeadline = 0;
    const size = 2;
    let isSearchActive = false;
    loadAnnouncements();


    // 기본적으로 '접수중' 공고를 불러오는 함수
    function loadAnnouncements() {
        if (isSearchActive) return;
        $.ajax({
            url: '/anno/accepting',
            method: 'GET',
            data: {page: pageAccepting ,size:size},
            success: function (data) {
                renderAnnouncements(data);
                if(data.length > 0){
                    pageAccepting++;
                }
            },
            error: function () {
                alert('공고 목록을 불러오는 데 실패했습니다.');
            }
        });
    }

    // '접수예정' 공고를 불러오는 함수
    function loadExpectedAnnouncements() {
        if (isSearchActive) return;

        $.ajax({
            url: '/anno/expected',
            method: 'GET',
            data: {page: pageExpected ,size:size},
            success: function (data) {
                renderAnnouncements(data);
                if(data.length > 0){
                    pageExpected++;
                }
            },
            error: function () {
                alert('공고 목록을 불러오는 데 실패했습니다.');
            }
        });
    }

    // '접수마감' 공고를 불러오는 함수
    function loadDeadlineAnnouncements() {
        if (isSearchActive) return;
        $.ajax({
            url: '/anno/deadline',
            method: 'GET',
            data: {page: pageDeadline ,size:size},
            success: function (data) {
                renderAnnouncements(data)
                if(data.length > 0){
                    pageDeadline++;
                }
            },
            error: function () {
                alert('공고 목록을 불러오는 데 실패했습니다.');
            }
        })
    }

    // 공고 목록을 DOM에 렌더링하는 함수
    function renderAnnouncements(announcements) {
        announcements.forEach(function (announcementRequest) {
            // 각 공고의 상태에 따라 CSS를 적용합니다.
            var statusColor = '';
            var statusBorderColor = '';

            if (announcementRequest.status === "접수중") {
                statusColor = '#28a745';
                statusBorderColor = '1.4px solid #28a745';
            } else if (announcementRequest.status === "접수마감") {
                statusColor = '#ff4d4d';
                statusBorderColor = '1.4px solid #ff4d4d';
            } else {
                statusColor = '#AAAAAA';
                statusBorderColor = '1.4px solid #AAAAAA';
            }

            var announcementHtml = `
            <div class="anno-list shadow-sm">
                <div class="technology-field">
                    <p class="technology-title">${announcementRequest.competentMinistry} > ${announcementRequest.specInstitution}</p>
                    <div class="anno-status" style="border: ${statusBorderColor};">
                        <p class="status" style="color: ${statusColor};">${announcementRequest.status}</p>
                    </div>
                </div>
                <div class="anno-announcement-title">
                    <p class="total_title">${announcementRequest.totalTitle}</p>
                </div>
                <div class="anno-bottom-wrap">
                    <p class="total_ann_no" data-annNo="${announcementRequest.annNo}">공고번호: ${announcementRequest.totalAnnNo}</p>
                    <p class="ann_type">공모유형: ${announcementRequest.annType}</p>
                    <p class="created_at">공고일자: ${announcementRequest.createdAt}</p>
                    <button class="view-details-btn">상세보기</button>
                </div>
            </div>
        `;
            $('#announcementContainer').append(announcementHtml);
        });
    }


    $(window).on('scroll', function() {
        // 현재 활성화된 상태에 따라 함수 호출
        if (isSearchActive) return;
        var activeStatus = $('.reception-status-wrap .active').text().trim();

        // 문서 끝에서 10px 남았을 때 함수 호출
        if ($(window).scrollTop() + $(window).height() >= $(document).height() - 10) {
            if (activeStatus === "접수중") {
                loadAnnouncements();
            } else if (activeStatus === "접수예정") {
                loadExpectedAnnouncements();
            } else{
                loadDeadlineAnnouncements();
            }
        }
    });



    // '상세보기' 버튼 클릭 시 상세 페이지로 이동하는 이벤트 리스너
    $(document).on('click', '.view-details-btn', function() {
        // 클릭한 버튼의 부모 요소에서 공고번호 찾기
        const AnnNo = $(this).closest('.anno-bottom-wrap').find('.total_ann_no').attr('data-annNo');
        window.location.href = `/anno/detail/${AnnNo}`;
    });

// 접수 상태 버튼에 대한 이벤트 리스너
    const buttons = document.querySelectorAll('.reception-status-wrap button');
    buttons.forEach(button => {
        button.addEventListener('click', function () {
            let btnStatus = button.textContent.trim();
            buttons.forEach(btn => btn.classList.remove('active'));
            this.classList.add('active');

            $('#announcementContainer').empty();


            if (btnStatus === "접수예정") {
                pageExpected = 0;
                loadExpectedAnnouncements();
            } else if (btnStatus === "접수마감") {
                pageDeadline = 0;
                loadDeadlineAnnouncements();
            } else {
                pageAccepting = 0;
                loadAnnouncements();
            }
        });
    });


    function performSearch() {
        const activeButton = document.querySelector('.reception-status-wrap button.active').textContent;

        // 기존 공고 목록 비우기
        $('#announcementContainer').empty();
        isSearchActive = true;
        let date = $('.select-form').val();
        let latest = $('.latest-form').val();
        let keyword = $('.search-box').val();
        let activeText = $('.reception-status-wrap .tab-btn.active').text().trim();
        let checkedSogan = $('.ok:checked').map(function () {
            return $(this).val();
        }).get();
        let checkedJunmun = $('.ok2:checked').map(function () {
            return $(this).val();
        }).get();
        let checkedGisul = $('.ok3:checked').map(function () {
            return $(this).val();
        }).get();



        if (checkedSogan.length === 0 && checkedJunmun.length === 0 && checkedGisul.length === 0) {
            isSearchActive = false;
            if(activeButton==="접수예정"){
                pageExpected =0;
                loadExpectedAnnouncements();
            }else if(activeButton==="접수중"){
                pageAccepting =0;
                loadAnnouncements();
            }else{
                pageDeadline =0;
                loadDeadlineAnnouncements();
            }

        }else{
            $.ajax({
                url: '/anno/search',
                type: 'GET',
                data: {
                    'keyword': keyword,
                    'date': date,
                    'activeText': activeText,
                    'latest': latest,
                    'checkedSogan': checkedSogan,
                    'checkedJunmun': checkedJunmun,
                    'checkedGisul': checkedGisul
                },
                success: function (data) {
                    renderAnnouncements(data);
                },
                error: function () {
                    console.log("error")
                }
            });
        }

    }



    // 검색 버튼에 대한 이벤트 리스너
    $('.search-btn').on('click', function(){
        $('#announcementContainer').empty();
        performSearch();
    });

    // Tagify를 초기화하여 태그 입력을 관리
    $(document).ready(function () {
        let input = document.querySelector('#tag-input');
        let tagify = new Tagify(input);

        // 체크박스 클릭을 처리하고 Tagify와 동기화하는 함수
        function handleCheckboxClick(checkboxClass, selectAllCheckboxId) {
            tagify.on('remove', function (e) {
                let removedValue = e.detail.data.value;
                $(checkboxClass).each(function () {
                    if ($(this).val() === removedValue) {
                        $(this).prop('checked', false);
                    }
                });

            });

            $(checkboxClass).on('click', function () {
                let clickedValue = $(this).val();
                if ($(this).is(':checked')) {
                    tagify.addTags([clickedValue]);
                    performSearch(); // 체크박스가 체크되었을 때만 검색 수행
                } else {
                    // 체크박스가 해제되면 태그 제거 및 공고 목록 삭제
                    let tags = tagify.value;
                    let index = tags.findIndex(tag => tag.value === clickedValue);
                    if (index !== -1) {
                        tagify.removeTag(tags[index].value);
                        performSearch();
                    }

                }
            });

            $(selectAllCheckboxId).on('click', function () {
                let isChecked = $(this).is(':checked');
                $(checkboxClass).prop('checked', isChecked);
                if (isChecked) {
                    $(checkboxClass).each(function () {
                        let value = $(this).val();
                        tagify.addTags([value]);
                    });
                    $('#announcementContainer').empty();
                    performSearch(); // '전체선택' 체크되었을 때만 검색 수행
                } else {
                    $(checkboxClass).each(function () {
                        let value = $(this).val();
                        tagify.removeTag(value);
                    });
                    // 공고 목록 비우기 (검색 요청은 안 함)
                    $('#announcementContainer').empty();
                }
            });
        }

        handleCheckboxClick('.ok', '#select-one-all-checkbox');
        handleCheckboxClick('.ok2', '#select-two-all-checkbox');
        handleCheckboxClick('.ok3', '#select-three-all-checkbox');
    });


    // 상단으로 이동 버튼 기능
    $('.go-to-btn').on('click', function () {
        const element = document.documentElement;
        const scrollTop = function () {
            const position = element.scrollTop;
            if (position > 0) {
                window.requestAnimationFrame(() => {
                    window.scrollTo(0, position - position / 0.3);
                    scrollTop();
                });
            }
        };
        scrollTop();
    });

    // 새로고침 버튼 기능
    $('.refresh-btn').on('click', function () {
        location.reload(true);
        isSearchActive = false;
    });

    // 추가 필터에 대한 이벤트 리스너 (사업년도, 최신순 등)
    $('.select-form, .latest-form').on('change', function(){
        performSearch();
    });

    // 참고: 체크박스는 이미 handleCheckboxClick 함수에서 performSearch()를 호출하도록 설정됨
});
