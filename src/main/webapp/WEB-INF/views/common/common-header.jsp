<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>유지경성</title>
    <!-- Bootstrap5 -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
    />
    <!-- Google Material Icons -->
    <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/icon?family=Material+Icons"
    />
    <!-- Global CSS -->
    <link rel="stylesheet" href="/resources/css/common/global.css"/>
    <!-- Common-layout CSS-->
    <link rel="stylesheet" href="/resources/css/common/common-header.css"/>
    <!-- Jquery -->
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
            integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    ></script>
    <!-- Bootstrap5 Script -->
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
    ></script>
</head>
<body>
<div class="common-header">
    <div class="container d-flex h-100 pe-0">
        <div
                class="row row-cols-2 justify-content-between align-items-center w-100"
        >
            <div class="col-2 d-flex align-items-center ps-5 h-100">
                <img src="/resources/img/common/logo.svg" class="logo" alt="logo"/>
            </div>
            <div class="col-10 d-flex align-items-center h-100">
                <!-- 로그인 X -->
                <!-- <div class="row w-100">
                <div class="col-10">
                  <span class="common-header__item">사업공고</span>
                </div>
                <div class="col-2 h-100 d-flex justify-content-between">
                  <span class="common-header__item common-header__item__pointer">로그인</span>
                  <span class="common-header__item common-header__item__pointer">회원가입</span>
                </div>
              </div> -->

                <!-- 로그인 O -->
                <div class="row w-100">
                    <div class="col-7">
                        <span class="common-header__item common-header__item__pointer">사업공고</span>
                    </div>
                    <div class="col-5 h-100 d-flex justify-content-between">
                <span
                        class="common-header__item tracking-widest"
                        style="letter-spacing: 5px"
                >황철원
                  <span style="letter-spacing: 0px; color: #ff8f27"
                  >(192347283)
                  </span></span
                >
                        <span class="common-header__item common-header__item__pointer">워크라운지</span>
                        <span class="common-header__item common-header__item__pointer">로그아웃</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
