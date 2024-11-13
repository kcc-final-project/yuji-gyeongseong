$(function () {

    // detail-btn 클릭 이벤트
    $(document).on('click', '.detail-btn', function () {
        let subAnnNo = $(this).data("announcement-no");
        $.ajax({
            url: '/anno/detail/zoom-in/' + subAnnNo,
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

                const tableBody = $('.file-body'); // 정확한 선택자인지 확인하세요.
                tableBody.empty();

                response.forEach((file, index) => {

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

    $(document).on('click', '.apply-btn', function () {
        let subAnnoNo = $(this).closest('.card').data('subannno');

        if (isLoggedIn) {
            const researcherNumber = $('.rsrchNo').text().trim();

            if(researcherNumber!== ""){
                window.location.href = '/rnd-plans/' + subAnnoNo;
            }else{
                Swal.fire({
                    icon: "warning",
                    text: "국가연구자 번호 발급이 완료된 후 신청이 가능합니다.",
                    confirmButtonText: "확인",
                    confirmButtonColor: "#2e406a",
                });
            }



        } else {
            Swal.fire({
                icon: "warning",
                text: "로그인 후 이용 가능합니다.",
                confirmButtonText: "확인",
                confirmButtonColor: "#2e406a",
            });
        }
    });



    //위에 테이블 details-btn 클릭 이벤트
    $(document).on('click', '.details-btn', function() {
        const annNo = $(this).closest('tr').find('.anno-title').data('annno');
        const title = $(this).closest('tr').find('.anno-title').text();
        $('.title').text("공고명: " + title);

        $.ajax({
            url:'/anno/tech',
            type: 'GET',
            data: { annNo: annNo },
            success: function(response) {
                renderCards(response);
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        });
    });


    function renderCards(data) {
        const container = $('.card-container');
        container.html('');
        data.subAnnouncements.forEach(item => {
            const cardHtml = `
                <div class="card" data-subAnnNo="${item.subAnnNo}">
                    <h3 class="card-name">공모분야명</h3>
                    <h5 class="card-title">${item.subTitle}</h5>
                    <div class="card-info">
                        <p class="card-info-field">기술분야</p>
                        <p class="card-info-category">공모유형</p>
                    </div>
                    <div class="card-info">
                        <p class="field-contents">${item.techFieldName}</p>
                        <p class="card-info-category category-contents">${data.annType}</p>
                    </div>
                    <div class="buttons">
                        <button class="detail-btn"
                                data-bs-toggle="modal"
                                data-bs-target="#exampleModal"
                                data-announcement-no="${item.subAnnNo}">상세보기</button>
                        <button class="apply-btn">접수하기</button>
                    </div>
                </div>
            `;
            container.append(cardHtml);
        });
    }

});

function setModalData(data) {
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
