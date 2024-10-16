<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/resources/css/sign-in-sign-up/sign-up-3.css"/>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=adc05e07391cc2a24481a3bc047af95d&libraries=services"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<script>

    function pwCheck() {
        if ($('#password').val() == $('#password-confirm').val()) {
            $('#pwConfirm').text('비밀번호가 일치합니다.').css('color', 'green')
        } else {
            $('#pwConfirm').text('비밀번호가 일치하지 않습니다.').css('color', 'red')
        }
    }

    $(function () {
        $('#affiliation-type').on('change', function () {
            if ($(this).val() === "프리랜서" || $(this).val() === "은퇴 고경력자") {
                $('#organization').prop("disabled", true);
                $('#department').prop("disabled", true);
                $('#position').prop("disabled", true);
                $('#institution-email').prop("disabled", true);
                $('#mail-btn').prop("disabled", true);
                $('#institution-email-certification').prop("disabled", true);
            } else {
                $('#organization').prop("disabled", false);
                $('#department').prop("disabled", false);
                $('#position').prop("disabled", false);
                $('#institution-email').prop("disabled", false);
                $('#mail-btn').prop("disabled", false);
                $('#institution-email-certification').prop("disabled", false);
            }
        })

        $('.modal-content-area').on('click', function () {
            let title = $(this).find('.content-title').text();
            let number = $(this).find('.content-number').text();
            let location = $(this).find('.content-location').text();
            let type = $(this).find('.content-type').text();

            console.log(title);
            console.log(number);
            console.log(location);
            console.log(type);
            $('#exampleModal').modal('hide'); // Bootstrap의 모달 닫기 메서드
            $('.modal-backdrop').remove(); // 오버레이 제거
            $('#organization').val(title);
        })

        var index = 1;
        $('.add-organ-btn').on('click', function () {
            index++;

            let organization = $('#organization').val();
            let department = $('#department').val();
            let position = $('#position').val();

            if (organization === "") {
                swal('실패', "소속기관은 필수 입력사항입니다.", 'error');
            } else {

                $('.table-body-area').append(
                    '<tr>' +
                    '<td class="add-organization-' + index + '">' + '</td>' +
                    '<td class="add-department-' + index + '">' + '</td>' +
                    '<td class="add-position-' + index + '">' + '</td>' +
                    '</tr>'
                );

                $(".add-organization-" + index).text(organization);
                $(".add-department-" + index).text(department);
                $(".add-position-" + index).text(position);

                $('#organization').val("");
                $('#department').val("");
                $('#position').val("");
            }
        });

        let previousValue = $('#affiliation-type').val();
        $('#affiliation-type').on('change', function () {
            let currentValue = $(this).val();  // 현재 선택된 값
            if (previousValue === "등록기관" && currentValue !== "등록기관") {

                Swal.fire({
                    title: '정말 바꾸시겠습니까?',
                    text: "다른 항목으로 변경하면 입력된 값들이 초기화됩니다.",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#2E406A',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '확인',
                    cancelButtonText: '취소'
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire(
                            '변경 완료',
                            '변경 되었습니다.',
                            'success',
                        )
                    }
                })
            }
            $('#organization').val("");
            $('#department').val("");
            $('#position').val("");
            previousValue = currentValue;
        });
    })
</script>

<div class="common-main">
    <div class="container-area">
        <form>
            <div class="title-tab-area">
                <h2 class="common-title">회원가입</h2>
                <div class="common-tab">
                    <button class="common-btn">본인인증</button>
                    <button class="common-btn">약관동의</button>
                    <button class="common-btn" id="authentication-tab">가입양식 작성</button>
                    <button class="common-btn">가입완료</button>
                </div>
            </div>
            <div class="change-tab-contents-area">
                <div class="container mt-5">
                    <h3 class="mb-4">개인정보</h3>
                    <hr>
                    <div class="form-area">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="user-id" class="form-label">아이디 <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="user-id" placeholder="ex) dream1752">
                                    <button class="btn btn-outline-secondary" type="button">중복체크</button>
                                </div>
                                <small class="text-muted">최대 16자 영문 숫자 조합으로 가능합니다.</small>
                            </div>
                            <div class="col-md-6">
                                <label for="user-name" class="form-label">이름 <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="user-name" value="김상학" disabled>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="password" class="form-label">비밀번호 <span class="text-danger">*</span></label>
                                <input type="password" class="form-control" id="password" oninput="pwCheck()" value="">
                                <small class="text-muted">9자 이상 영문 대소문자, 숫자, 특수문자 동일 조합</small>
                            </div>
                            <div class="col-md-6">
                                <label for="password-confirm" class="form-label">비밀번호 확인 <span
                                        class="text-danger">*</span></label>
                                <input type="password" class="form-control" id="password-confirm" oninput="pwCheck()"
                                       value="">
                                <small id="pwConfirm"></small>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="birth-date" class="form-label">생년월일 <span
                                        class="text-danger">*</span></label>
                                <input type="date" class="form-control" id="birth-date" value="1997-09-03" disabled>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">성별 <span class="text-danger">*</span></label>
                                <div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="male"
                                               value="male" checked>
                                        <label class="form-check-label" for="male">남성</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="female"
                                               value="female">
                                        <label class="form-check-label" for="female">여성</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="phone" class="form-label">휴대전화번호 <span class="text-danger">*</span></label>
                                <input type="tel" class="form-control" id="phone" value="010-2598-1748" disabled>
                            </div>
                            <div class="col-md-6">
                                <label for="email" class="form-label">이메일 <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <input type="email" class="form-control" id="email"
                                           placeholder="example@naver.com">
                                    <button class="btn btn-outline-secondary" type="button">인증코드 발송</button>
                                </div>
                                <div class="d-flex align-items-center" style=" margin-top: 20px">
                                    <input type="text" class="form-control text-center me-2" style="width: 300px;">
                                    <button class="btn btn-outline-secondary" type="button">인증</button>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="form-label">주소 <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="sample5_address"
                                           placeholder="주소검색 버튼을 통해 주소를 추가해보세요." value="주소 검색">
                                    <button class="btn btn-outline-secondary" type="button"
                                            onclick="sample5_execDaumPostcode()">주소검색
                                    </button>
                                </div>
                                <label class="form-label" style="margin-top: 5px;">상세주소</label>
                                <input type="text" class="form-control" id="detailed-address"
                                       placeholder="상세 주소를 입력해 주세요.">

                            </div>
                            <div class="col-md-6">
                                <label for="detailed-address" class="form-label">&nbsp;</label>
                                <div id="map" style="width:570px;height:250px;display:none"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <h3 class="mb-4" style="margin-top: 189px;">기관정보</h3>
                <hr>
                <div class="table-responsive mb-4">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>기관명</th>
                            <th>부서명</th>
                            <th>소속부서</th>
                        </tr>
                        </thead>
                        <tbody class="table-body-area">

                        </tbody>
                    </table>
                </div>
                <hr>
                <div class="foot">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="affiliation-type" class="form-label">소속유형 <span
                                    class="text-danger">*</span></label>
                            <select class="form-select" id="affiliation-type">
                                <option value="" disabled selected>선택</option>
                                <option>프리랜서</option>
                                <option>은퇴 고경력자</option>
                                <option>등록기관</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="organization" class="form-label">소속기관</label>
                            <div class="input-group organi-group">
                                <input type="text" class="form-control" id="organization" readonly disabled>
                                <span class="material-icons search-icon" data-bs-toggle="modal"
                                      data-bs-target="#exampleModal">search</span>

                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="department" class="form-label">소속부서</label>
                            <input type="text" class="form-control" id="department" disabled>
                        </div>
                        <div class="col-md-6">
                            <label for="position" class="form-label">직위</label>
                            <input type="text" class="form-control" id="position" disabled>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="institution-email" class="form-label">기관 웹 메일</label>
                            <div class="input-group">
                                <input type="email" class="form-control" id="institution-email"
                                       value="" placeholder="ex) dream1752@inu.ac.kr" disabled>
                                <button class="btn btn-outline-secondary" type="button" id="mail-btn" disabled>메일 발송
                                </button>
                            </div>
                            <small class="text-success">※ 메일이 인증되었습니다.</small>
                        </div>

                        <button type="button" class="add-organ-btn">기관추가</button>
                    </div>

                </div>
                <hr>

                <div class="final-btn-wrap">
                    <button class="cancel-btn">취소</button>
                    <button type="submit" class="apply-btn">저장</button>
                </div>
            </div>
        </form>
        <div class="space"></div>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel">기관검색</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="organ-filter-wrap">
                            <div class="organ-filter-header-area">
                                <p>기관명</p>
                                <input type="text" class="form-control" id="organization-name">
                                <p>사업자번호</p>
                                <input type="text" class="form-control" id="business-number">
                                <p>기관유형</p>
                                <select class="form-select" id="institution-type">
                                    <option value="" disabled="" selected="">선택</option>
                                    <option value="대기업">대기업</option>
                                    <option value="중견기업">중견기업</option>
                                    <option value="중소기업">중소기업</option>
                                    <option value="공기업">공기업</option>
                                    <option value="외국기업">외국기업</option>
                                    <option value="대학(4년이상)">대학(4년이상)</option>
                                    <option value="대학(4년미만)">대학(4년미만)</option>
                                    <option value="초중고교">초중고교</option>
                                    <option value="외국대학">외국대학</option>
                                    <option value="국공립연">국공립연</option>
                                    <option value="정부출연연">정부출연연</option>
                                    <option value="지자체출연연">지자체출연연</option>
                                    <option value="전문생산연">전문생산연</option>
                                    <option value="외국연구소">외국연구소</option>
                                    <option value="중앙정부">중앙정부</option>
                                    <option value="지방자치단체">지방자치단체</option>
                                    <option value="일반병원">일반병원</option>
                                    <option value="국공립병원">국공립병원</option>
                                </select>
                                <button id="select-filter-btn">검색</button>
                            </div>
                            <div class="organ-filter-body-area">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th scope="col">기관이름</th>
                                        <th scope="col">사업자번호</th>
                                        <th scope="col">소재지</th>
                                        <th scope="col">기관유형</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="modal-content-area">
                                        <td class="content-title">한전원자력연료(주)</td>
                                        <td class="content-number">314-81-00849</td>
                                        <td class="content-location">대전광역시 유성구</td>
                                        <td class="content-type">대기업</td>
                                    </tr>
                                    <tr class="modal-content-area">
                                        <td>한전원자력연료(주)</td>
                                        <td>314-81-00849</td>
                                        <td>대전광역시 유성구</td>
                                        <td>대기업</td>
                                    </tr>
                                    <tr class="modal-content-area">
                                        <td>한전원자력연료(주)</td>
                                        <td>314-81-00849</td>
                                        <td>대전광역시 유성구</td>
                                        <td>대기업</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary cancel-modal-btn" data-bs-dismiss="modal">취소
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        var mapContainer = document.getElementById('map'),
            mapOption = {
                center: new daum.maps.LatLng(37.537187, 127.005476),
                level: 5
            };
        var map = new daum.maps.Map(mapContainer, mapOption);
        var geocoder = new daum.maps.services.Geocoder();
        var marker = new daum.maps.Marker({
            position: new daum.maps.LatLng(37.537187, 127.005476),
            map: map
        });

        function sample5_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    var addr = data.address;

                    document.getElementById("sample5_address").value = addr;

                    geocoder.addressSearch(data.address, function (results, status) {

                        if (status === daum.maps.services.Status.OK) {
                            var result = results[0];

                            var coords = new daum.maps.LatLng(result.y, result.x);

                            mapContainer.style.display = "block";
                            map.relayout();
                            map.setCenter(coords);
                            marker.setPosition(coords)
                        }
                    });
                }
            }).open();
        }
    </script>
</div>
</body>
</html>
