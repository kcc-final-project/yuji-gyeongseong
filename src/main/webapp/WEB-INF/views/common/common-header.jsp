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
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <!-- Jstree -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/themes/default/style.min.css"/>
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
    <!-- Jquery UI -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <!-- Bootstrap5 Script -->
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
    ></script>
    <!-- SweetAlert2 Script -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
    <!-- Jstree Script -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/jstree.min.js"></script>

    <!-- WebSocket 클라이언트 라이브러리 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stompjs@2.3.3/lib/stomp.min.js"></script>

    <!-- Animate.css 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

    <%--    알림용 js--%>
    <script src="/resources/js/research-number/notification.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- SweetAlert2 -->


</head>
<body>
<div class="common-header">
    <div class="container d-flex h-100 pe-0">
        <div
                class="row row-cols-2 justify-content-between align-items-center w-100"
        >
            <div class="col-2 d-flex align-items-center ps-5 h-100" style="cursor: pointer">
                <a href="/" style="color: inherit; text-decoration: none;">
                    <img src="/resources/img/common/logo.svg" class="logo" alt="logo"/>
                </a>

            </div>
            <div class="col-10 d-flex align-items-center h-100">
                <c:choose>
                    <c:when test="${not empty sessionScope.username}">
                        <!-- 로그인 O -->
                        <div class="row w-100">
                            <div class="col-7">
                                <a href="/anno" style="color: inherit; text-decoration: none;">
                                    <span class="common-header__item common-header__item__pointer">사업공고</span>
                                </a>
                            </div>
                            <div style="width: 420px; display: flex; justify-content: flex-end; gap: 25px;">
                <span
                        class="common-header__item tracking-widest"
                        >${sessionScope.username}
                  <span class="rsrchNo" style=" color: #ff8f27;"
                          <c:if test="${not empty sessionScope.rsrchNo}">
                              >${sessionScope.rsrchNo}
                          </c:if>

                  </span>
                  </span> <a href="/business-timeline" style="text-decoration: none; color: black">
                                <span class="common-header__item common-header__item__pointer">워크라운지</span>
                            </a>

                                <a href="/member/logout" style="color: inherit; text-decoration: none;">
                                    <span class="common-header__item common-header__item__pointer">로그아웃</span>
                                </a>

                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>

                        <!-- 로그인 X -->
                        <div class="row w-100">
                            <div class="col-10">
                                <a href="/anno" style="color: inherit; text-decoration: none;">
                                    <span class="common-header__item">사업공고</span>
                                </a>
                            </div>
                            <div class="col-2 h-100 d-flex justify-content-between">

                                <a href="/member/sign/in" style="color: inherit; text-decoration: none;">
                                    <span class="common-header__item common-header__item__pointer">로그인</span>
                                </a>
                                <a href="/member/sign/up3" style="color: inherit; text-decoration: none;">
                                    <span class="common-header__item common-header__item__pointer">회원가입</span>
                                </a>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
</body>
</html>
