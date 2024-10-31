<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main</title>
</head>
<script>


</script>
<style>
    .body {
        position: relative;
    }

    .main-image {
        width: 1693px;
        height: 625px;

    }

    .common-main {
        position: absolute;
        z-index: 1;
        left: 230px;
        top: 400px;
    }

    .main-contents-area {
        width: 100%;
        height: 70%;
    }

    .main-contents-teb {
        background-color: #f2f3f7;
        height: 25%;
        display: flex;
        justify-content: space-evenly;
        padding: 7px;
    }

    .common-tab {
        width: 33%;
        height: 100%;
        padding: 35px;
        position: relative;
        background-color: white;
    }

    .common-image {
        width: 100px;
        height: 100px;
        position: absolute;
        right: 0;
        bottom: 20px;
    }

    .anno-contents-header {
        width: 100%;
        height: 10%;
        margin-top: 12px;
        background-color: #f2f3f7;

    }

    .anno-contents-tab {
        width: 20%;
        height: 100%;
        margin-left: 3px;
        display: flex;
        justify-content: space-evenly;
    }

    /* 기본 스타일 */
    .common-anno-btn {
        border: none;
        background-color: #f2f3f7;
        color: #343232;
        font-weight: bold;
        font-size: 20px;
    }

    /* 활성화된 버튼 스타일 */
    .common-anno-btn.active {
        border-bottom: 3px solid #1F3FAA;
        color: #1F3FAA;
    }

    .common-anno-btn:hover {
        border: none;
        border-bottom: 3px solid #1F3FAA;
        background-color: #f2f3f7;
        color: #1F3FAA;
        font-size: 20px;
        font-weight: bold;
        transition: .1s;
    }

    .common-link-wrap {
        text-decoration: none;
        cursor: pointer;
    }

    .link-title {
        color: black;
        font-weight: bold;
    }

    .link-coment {
        width: 250px;
        color: black;
    }

    .anno-contents-body {
        width: 100%;
        max-height: 63%;
        height: 63%;
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;

    }

    .anno-content-area {
        width: 33.3%;
        height: 33.3%;
        border: 1px solid #44465C;
        box-sizing: border-box;
        padding: 1.8rem 1.3rem 1.3rem;
        cursor: pointer;
    }

    .anno-content-area:hover {
        box-shadow: 0 1rem 1.6rem rgba(60, 70, 92, 0.2);
        z-index: 2;
        transition: .2s;
    }

    .anno-content-area:active {
        transform: scale(0.95);
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .common-span-style {
        font-weight: 400;
        color: #0f0f1e;
        font-size: 17px;
        margin-right: 8px;
    }

    .spec-style {
        color: #757575;
        font-style: normal;
        font-size: 15px;
    }

    .total-title {
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
        font-size: 18px;
        font-weight: 600;
    }

    .state {
        color: #476ccd;
        border: 1px solid;
        padding: 5px;
    }
</style>
<body>
<img class="main-image" src="/resources/img/main/main.jpg">

<div class="common-main">
    <div class="main-contents-area">
        <div class="main-contents-teb">
            <div class="common-tab work-lounge">
                <img src="resources/img/main/work.jpg" class="common-image">
                <a class="common-link-wrap">
                    <h5 class="link-title">워크라운지 ></h5>
                    <p class="link-coment">다양한 업무 메뉴얼을 확인하실 수 있습니다.</p>
                </a>
            </div>
            <div class="common-tab researcher-number">
                <img src="resources/img/main/work.jpg" class="common-image">
                <a class="common-link-wrap">
                    <%--                    <h5 class="link-title">국가연구자번호 ></h5>--%>
                    <h5 class="link-title">국가연구자번호 ></h5>
                    <p class="link-coment">국가연구자번호를 발급 하시면 연구 계획서를 작성하실 수 있습니다.</p>
                </a>
            </div>
            <div class="common-tab evaluation-committee">
                <img src="resources/img/main/work.jpg" class="common-image">
                <a class="common-link-wrap">
                    <h5 class="link-title">평가위원 신청 ></h5>
                    <p class="link-coment">전문가 여러분을 평가위원으로 모시고자 합니다.</p>
                </a>
            </div>
        </div>
        <div class="anno-contents-header">
            <div class="anno-contents-tab">
                <button class="common-anno-btn" id="accepting">
                    <span class="common-anno-tab">사업공고</span>
                </button>
                <button class="common-anno-btn" id="expected">
                    <span class="common-anno-tab">공모예정</span>
                </button>
            </div>

        </div>
        <div class="anno-contents-body"></div>
    </div>
</div>
<script src="/resources/js/main/main.js"></script>
</body>
</html>
