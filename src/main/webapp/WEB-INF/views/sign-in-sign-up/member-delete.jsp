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
    <link rel="stylesheet" href="/resources/css/common/common-work-lounge-tap.css"/>
    <link rel="stylesheet" href="/resources/css/sign-in-sign-up/member-delete.css"/>
</head>

</head>
<body>
<div class="common-main">
    <div class="container mt-5">
        <h3 class="mb-4" style="font-weight: bold;">회원탈퇴</h3>
        <hr>
        <div class="span-area">
            <span style="margin-right: 17px">※ 회원 탈퇴 시 모든 데이터가 삭제되며, 복구할 수 없습니다. 신중하게 결정해 주세요. </span>
        </div>
        <div class="form-area">
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="user-id" class="form-label">아이디 <span class="text-danger">*</span></label>
                    <small class="success-id"></small>
                    <div class="input-group">

                        <input type="text" class="form-control" id="user-id" placeholder="ex) dream1752" oninput="idCheck()" value="${principal.username}" data-memno="${principal.memNo}" disabled="">

                    </div>
                </div>

                <div class="col-md-6">
                    <label for="user-name" class="form-label">이름 <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="user-name" value="${principal.name}" disabled="">

                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6 mb-5">
                    <label for="birth-date" class="form-label">생년월일 <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="birth-date" value="${principal.birth}" disabled="">
                </div>
                <div class="col-md-6">
                    <label class="form-label">성별 <span class="text-danger">*</span></label>
                    <div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="male" value="male" checked="" disabled>
                            <label class="form-check-label" for="male">남성</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="female" value="female" disabled>
                            <label class="form-check-label" for="female">여성</label>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="user-name" class="form-label">비밀번호확인 <span class="text-danger">*</span></label>
                    <div style="display: flex; align-items: center" >
                        <input type="text" class="form-control" id="password" >
                        <button class="check-btn">비밀번호 확인</button>
                    </div>
                    <small class="check-text"></small>

                </div>
            </div>

        </div>
        <button id="final-del-btn">회원 탈퇴</button>
        <hr class="mt-4">
        <button class="back-btn">뒤로</button>
    </div>

</div>


<script src="/resources/js/sign-in-sign-up/member-delete.js"></script>
</body>
</html>
