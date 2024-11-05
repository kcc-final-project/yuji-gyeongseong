<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-header.jsp" %>
<%@ include file="../common/common-work-lounge-tap.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Insert title here</title>
  <link rel="stylesheet" href="/resources/css/sign-in-sign-up/edit-personal-info.css"/>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=adc05e07391cc2a24481a3bc047af95d&libraries=services"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<div class="common-main">
  <div class="container-area">
    <form>
      <div class="change-tab-contents-area">
        <div class="container mt-5">
          <h3 class="mb-4">개인정보</h3>
          <hr>
          <div class="span-area">
            <span style="margin-right: 17px">※ 이름, 생년월일, 휴대전화번호 변경 시 본인 확인이 필요합니다. </span>
            <button class="common-style-span-btn tel-btn" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal2">휴대폰 본인인증</button>
          </div>
          <div class="form-area">
            <div class="row mb-3">
              <div class="col-md-6">
                <label for="user-id" class="form-label">아이디 <span class="text-danger">*</span></label>
                <small class="success-id"></small>
                <div class="input-group">

                  <input type="text" class="form-control" id="user-id" placeholder="ex) dream1752"
                         oninput="idCheck()" value="${principal.username}" data-memNo="${principal.memNo}" disabled>
<%--                  <button class="btn btn-outline-secondary" id="duplication-btn" type="button" disabled>중복체크--%>
<%--                  </button>--%>
                </div>
                <small class="text-muted">8자 이상 최대 16자 영문 숫자 조합으로 가능합니다.</small>

              </div>

              <div class="col-md-6">
                <label for="user-name" class="form-label">이름 <span class="text-danger">*</span></label>
                <input type="text" class="form-control"  id="user-name" value="${principal.name}" disabled>

              </div>

            </div>


            <div class="row mb-3">
<%--              <div class="col-md-6">--%>
<%--                <label for="password" class="form-label">비밀번호 <span class="text-danger">*</span></label>--%>
<%--                <small class="success-pw"></small>--%>
<%--                <input type="password" class="form-control" id="password" oninput="pwCheck()" disabled value="${principal.password}">--%>
<%--                <small class="text-muted">9자 이상 16자 이하 영문 대소문자, 숫자, 특수문자 동일 조합</small>--%>
<%--              </div>--%>
<%--&lt;%&ndash;              <div class="col-md-6">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <label for="password-confirm" class="form-label">비밀번호 확인 <span&ndash;%&gt;--%>
<%--&lt;%&ndash;                        class="text-danger">*</span></label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <small id="pwConfirm"></small>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <input type="password" class="form-control" id="password-confirm" oninput="pwCheck()">&ndash;%&gt;--%>

<%--&lt;%&ndash;              </div>&ndash;%&gt;--%>


            </div>

            <div class="row mb-3">
              <div class="col-md-6">
                <label for="birth-date" class="form-label">생년월일 <span
                        class="text-danger">*</span></label>
                <input type="text" class="form-control"  id="birth-date" value="${principal.birth}" disabled>
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
                <input type="tel" class="form-control"  id="phone" value="${principal.tel}" disabled>
              </div>
              <div class="col-md-6">
                <label for="email" class="form-label">기관 웹메일 <span class="text-danger">*</span></label>
                <small id="success-email"></small>
                <div class="input-group">
                  <input type="email" class="form-control" id="email" value="${principal.email}"
                         placeholder="example@naver.com" >
<%--                                    <button class="btn btn-outline-secondary" type="button" id="send-mail-btn">인증코드 발송</button>--%>
                </div>
<%--                                <div class="d-flex align-items-center" style=" margin-top: 20px">--%>
<%--                                  <input type="text" class="form-control text-center me-2" id="check-area" style="width: 300px;">--%>
<%--                                  <button class="btn btn-outline-secondary" type="button" id="email-check">인증</button>--%>
<%--                                </div>--%>
              </div>
              <div class="col-md-6">
<%--                이메일--%>

              </div>
            </div>

            <div class="row mb-3">
              <div class="col-md-6">
                <label class="form-label">주소 <span class="text-danger">*</span></label>
                <div class="input-group">
                  <input type="text" class="form-control" id="sample5_address" value="${principal.addr}"
                         placeholder="주소검색 버튼을 통해 주소를 추가해보세요." readonly value="">
                  <button class="btn btn-outline-secondary" id="address-btn" type="button"
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
        <h3 class="mb-4" style="margin-top: 40px;">기관정보</h3>
        <hr>
        <div class="table-responsive mb-4">
          <table class="table table-bordered">
            <thead>
            <tr>
              <th>기관명</th>
              <th>소속부서</th>
              <th>직위</th>
              <th></th>
            </tr>
            </thead>
            <tbody class="table-body-area">

            <tr class="common-table-row">
              <td class="orga add-organization data-initno">${principal.institutionName}</td>
              <td class="dept add-department">${principal.affilDept}</td>
              <td class="posi add-position">${principal.position} </td>
              <td><button type="button" class="orga-btn" data-index="' + index + '">삭제</button></td>
            </tr>

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
              <div style="display: flex">
                <label for="organization" class="form-label">소속기관</label>
                <span class="text-danger" id="check-organ" style="margin-left: 6px">*</span>
              </div>
              <div class="input-group organi-group">
                <input placeholder="소속기관 등록" type="text" class="form-control" id="organization" readonly disabled>
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
<%--            <div class="col-md-6">--%>
<%--              <label for="institution-email" class="form-label">기관 웹 메일</label>--%>
<%--              <div class="input-group">--%>
<%--                <input type="email" class="form-control" id="institution-email"--%>
<%--                       value="" placeholder="ex) dream1752@inu.ac.kr" disabled>--%>
<%--                <button class="btn btn-outline-secondary" type="button" id="mail-btn" disabled>메일 발송--%>
<%--                </button>--%>
<%--              </div>--%>
<%--              <small class="text-success">※ 메일이 인증되었습니다.</small>--%>
<%--            </div>--%>
            <button type="button" class="add-organ-btn">기관추가</button>
          </div>
        </div>
        <hr>
        <div class="final-btn-wrap">
          <button class="cancel-btn">취소</button>
          <button type="button" class="apply-btn">저장</button>
          <button type="button" class="delete-member-btn" data-bs-toggle="modal" data-bs-target="#exampleModal3">회원탈퇴</button>
        </div>
      </div>
    </form>
    <div class="space"></div>
<%--&lt;%&ndash;    회원탈퇴&ndash;%&gt;--%>
<%--    <div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--      <div class="modal-dialog">--%>
<%--        <div class="modal-content">--%>
<%--          <div class="modal-header">--%>
<%--            <h5 class="modal-title">회원 탈퇴</h5>--%>
<%--            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--          </div>--%>
<%--          <div class="member-modal">--%>
<%--            <p>비밀번호 확인</p>--%>
<%--            <input type="text">--%>
<%--            <button>비밀번호 확인</button>--%>
<%--          </div>--%>
<%--          <div class="modal-footer">--%>
<%--            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>--%>
<%--            <button type="button" class="btn btn-primary">Save changes</button>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>


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
                  <option value="">전체</option>
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
                  <tbody class="content-wrap-area">

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
  <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">본인인증</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="body-header">
            <h3>사용자 정보</h3>
          </div>
          <div class="body-body">
            <h4>이름</h4>
            <input class="form-control form-control-lg" id="name" type="text" placeholder="홍길동">
            <h4>생년월일</h4>
            <input class="form-control form-control-lg" id="birth" type="text" placeholder="2000-02-17">
            <h4>휴대폰번호</h4>
            <input class="form-control form-control-lg" id="tel" type="text" placeholder="-없이 숫자만 입력">




            <h5 id="cert-title" style="display: none;">인증번호 입력</h5>
            <div id="certNum-btn-area">
              <input class="form-control form-control-lg" id="certNum" type="text">
              <button class="common-submit-btn" id="cert-btn">인증</button>
            </div>

          </div>
          <div class="body-footer">
            <button class="common-submit-btn" id="submit-btn">확인</button>
          </div>
        </div>
      </div>
    </div>


<%--    회원탈퇴 모달--%>



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
          document.getElementById("sample5_address").style.border = '1px solid #dee2e6';
          document.getElementById("address-btn").style.border='1px solid #dee2e6';
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
<script src="/resources/js/sign-in-sign-up/edit-personal-info.js"></script>
</body>
</html>
