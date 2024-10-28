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
    <link rel="stylesheet" href="/resources/css/sign-in-sign-up/sign-up-2.css"/>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<script>
    $(function () {
        $('#check-all-agree-btn').on('click', function () {
            var isChecked = $(this).prop('checked');
            $('.agr').prop('checked', isChecked);
        });

        $('.final-agree-btn').on('click', function () {
            const btn1 = $('#agree-btn-1').prop('checked');
            const btn2 = $('#agree-btn-2').prop('checked');
            const btn3Agree = $('#agree-btn-3').prop('checked');
            const btn3Disagree = $('#agree-btn-3-no').prop('checked');
            if (!btn1 || !btn2) {
                if (!btn1) {
                    swal('실패', "이용약관에 동의 하지 않으면 회원 가입을 할 수 없습니다.", 'error');
                } else {
                    swal('실패', "개인정보 수집·이용 동의(필수)에 동의 하지 않으면 회원 가입을 할 수 없습니다.", 'error');
                }
                return;
            }

            if (!btn3Agree && !btn3Disagree) {
                swal('실패', "선택하지 않은 항목이 존재합니다!", 'warning');
                return;
            }
            window.location.href = '/member/sign/up3';
        });
    });
</script>
<div class="common-main">
    <div class="container-area">
        <div class="title-tab-area">
            <h2 class="common-title">회원가입</h2>
            <div class="common-tab">
                <button class="common-btn">본인인증</button>
                <button class="common-btn" id="authentication-tab">약관동의</button>
                <button class="common-btn">가입양식 작성</button>
                <button class="common-btn">가입완료</button>
            </div>
        </div>
        <div class="change-tab-contents-area">
            <div class="agree-area">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="check-all-agree-btn">
                    <label class="form-check-label" for="check-all-agree-btn">
                        모두 동의합니다.
                    </label>
                </div>
                <p>유지경성 통합연구지원시스템 이용약관, 개인정보 필수항목 수집 동의, 개인정보 선택항목 수집 동의, 개인정보의 제 3자 제공 및 활용 동의에 모두 동의합니다.</p>
            </div>
            <h4 class="use-title">이용약관</h4>
            <div class="terms-of-use-area">
                <div class="terms-of-use-contents">
                    <p><strong>제 1장 총칙</strong><br>제 1조(목적)
                        본 이용약관(이하"약관")은 유지경성에서 제공하는 모든 서비스의 가입조건 및 절차, 이용에 관한 제반 사항과 기타 필요한 사항을 규정함을 목적으로 합니다.</p>

                    <p><strong>제 2조(약관의 효력과 변경)</strong><br>
                        1. 유지경성은 귀하가 본 약관 내용에 동의하는 경우, 유지경성의 서비스 제공 행위 및 귀하의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.<br>
                        2. 유지경성은 본 약관을 사전 고지없이 변경할 수 있고, 변경된 약관은 유지경성 내에 공지하거나 휴대전화 문자(장문자 포함) 또는 전자우편을 통해 회원에게 공지하며,
                        공지와 동시에 그 효력이
                        발생됩니다. 이용자가 변경된 약관에 동의하지 않는 경우, 이용자는 본인의 회원등록을 취소(회원탈퇴)할 수 있으며 계속 사용의 경우는 약관 변경에 대한 동의로 간주됩니다.
                    </p>

                    <p>
                        <strong>제 3조(약관 외 준칙)</strong><br>
                        1. 본 약관은 유지경성에서 제공하는 별도의 이용에 관한 규정과 함께 적용됩니다.<br>
                        2. 본 약관에 명시되지 않은 사항은 전기통신기본법,전기통신사업법,정보통신윤리위원회심의규정,정보통신윤리강령,프로그램보호법 및 기타 관련 법령의 규정에 의합니다.
                    </p>

                    <p>
                        <strong>제 4조(용어의 정리)</strong><br>
                        본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
                        1. 이용자 : 본 약관에 따라 유지경성에서 제공하는 서비스를 받는 자<br>
                        2. 가입 : 유지경성에서 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위<br>
                        3. 회원 : 본 약관에 동의하고 유지경성에 신규 가입한 이용자<br>
                        4. 연구자회원 : 유지경성의 약관에 동의하고 국가연구자번호를 발급하여 보유하고 있는 회원으로 유지경성에서 제공하는 서비스를 이용하기 위하여 회원의 약관에 동의하고
                        연구자회원으로 전환한 회원<br>
                        5. 회원ID : 회원의 식별 및 서비스 이용을 위하여 자신이 선정한 문자 및 숫자의 조합<br>
                        6. 비밀번호 : 이용자와 회원ID가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 자신이 선정한 문자, 숫자 및 특수문자의 조합
                    </p>
                </div>
            </div>
            <div class="agree-radio-btn-1-area">
                <p>위 조건에 따른 이용약관에 동의 하시겠습니까?</p>
                <div class="form-check">
                    <input class="form-check-input agr" type="radio" name="flexRadioDefault1" id="agree-btn-1">
                    <label class="form-check-label">
                        동의
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="flexRadioDefault1">
                    <label class="form-check-label">
                        동의하지 않음
                    </label>
                </div>
            </div>
            <h4 class="use-title">개인정보 수집/이용 동의(필수)</h4>
            <div class="terms-of-use-area">
                <div class="terms-of-use-contents">
                    <p>
                        개인정보 수집/이용(개인정보 보호법 제 15조)<br>
                        º (수집/이용 목적) 유지경성 회원가입, 제공 서비스 등 업무이용<br>
                        º (수집/이용 항목)<br>
                        -필수항목 : 회원인력ID(자동생성), 이름(국문/영문), 아이디(ID), 비밀번호, 이메일, 성별, 생년월일, 소속유형, 소속기관, 주소
                    </p>
                    <p>
                        º (보유/이용 기간) <strong>회원가입 완료 이후</strong><br>
                        -휴먼계정 전환 후 2년 이내 로그인 기록이 없는 경우 파기<br>
                        -회원탈퇴 시 지체 없이 파기 <br>
                    </p>
                    <p>
                        º 만 14세 미만 아동의 개인정보를 처리하지 않습니다.
                    </p>
                    <p>
                        ※ 위의 동의를 거부할 권리가 있으며, 동의 거부에 따라 회원가입 제한, 서비스 이용 등의 불이익이 있을 수 있습니다.
                    </p>
                </div>
            </div>
            <div class="agree-radio-btn-2-area">
                <p>위 조건에 따른 개인정보 수집/이용 동의(필수)에 동의 하시겠습니까?</p>
                <div class="form-check">
                    <input class="form-check-input agr" type="radio" name="flexRadioDefault2" id="agree-btn-2">
                    <label class="form-check-label">
                        동의
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="flexRadioDefault2" id="dgree-btn-2">
                    <label class="form-check-label">
                        동의하지 않음
                    </label>
                </div>
            </div>
            <h4 class="use-title">개인정보 수집/이용 동의(선택)</h4>
            <div class="terms-of-use-area">
                <div class="terms-of-use-contents">
                    <p>
                        개인정보 수집/이용(개인정보 보호법 제 15조)<br>
                        º (수집/이용 목적) 유지경성 회원가입, 제공 서비스 등 업무이용<br>
                        º (수집/이용 항목)<br>
                        -선택항목: 소속기관, 소속부서, 직위, 기관 웹 메일주소<br>
                    </p>
                    <p>
                        º (보유/이용 기간) <strong>회원가입 완료 이후</strong><br>
                        -휴먼계정 전환 후 2년 이내 로그인 기록이 없는 경우 파기<br>
                        -회원탈퇴 시 지체 없이 파기 <br>
                    </p>
                    <p>
                        ※ 위의 동의를 거부할 권리가 있으며, 동의 거부에 따라 회원가입 제한, 서비스 이용 등의 불이익이 있을 수 있습니다.
                    </p>
                </div>
            </div>
            <div class="agree-radio-btn-3-area">
                <p>위 조건에 따른 개인정보 수집/이용 동의(선택)에 동의 하시겠습니까?</p>
                <div class="form-check">
                    <input class="form-check-input agr" type="radio" name="flexRadioDefault3" id="agree-btn-3">
                    <label class="form-check-label">
                        동의
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="flexRadioDefault3" id="agree-btn-3-no">
                    <label class="form-check-label">
                        동의하지 않음
                    </label>
                </div>
            </div>
            <div class="final-agree-btn-area">
                <button class="final-agree-btn">동의합니다.</button>
                <button class="final-dgree-btn">동의하지 않습니다.</button>
            </div>
            <div class="footer-area"></div>
        </div>
    </div>
</div>
</body>
</html>
