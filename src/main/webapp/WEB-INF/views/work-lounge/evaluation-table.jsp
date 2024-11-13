<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-work-lounge-tap.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>전자평가표</title>
    <link rel="stylesheet" href="/resources/css/work-lounge/evaluation-table.css"/>
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>--%>
    <style>
        .d-flex {
            display: flex;
        }

        .scroll-container {
            max-height: 700px;
            overflow-y: auto;
        }

        .scroll-container1 {
            max-height: 572px;
            overflow-y: auto;
        }

        .form-select {
            width: 100px;
            margin-right: 10px;
        }
    </style>
</head>
<body class="mt-5">
<div class="main-container" style="width: 100%; height: 756px; margin-top: 50px; margin-left: 20px">
    <%--    <div class="marin-header"--%>
    <%--         style="width: 100%; height: 10%; display: flex; justify-content: center; align-items: center;">--%>
    <%--        <h2>전자평가표</h2>--%>
    <%--    </div>--%>
    <div class="d-flex justify-content-center ps-1">
        <div class="card col-4 scroll-container shadow-lg p-2" style="width: 405px">
            <div class="mt-2 d-flex justify-content-center align-center mt-1">
                <select class="form-select" aria-label="상태 선택">
                    <option value="all">전체</option>
                    <option value="접수예정">접수예정</option>
                    <option value="접수중">접수중</option>
                    <option value="접수마감">접수마감</option>
                </select>
                <select id="filterOption" class="form-select" aria-label="정렬 선택">
                    <option value="recent">최신순</option>
                    <option value="closing">마감순</option>
                </select>
            </div>
            <div class="mt-3 mb-1" id="announceList">
                <c:forEach items="${announceList}" var="announce" varStatus="status">
                    <div class="card mb-3" style="background-color: white;" data-publish-date="${announce.startedAt}"
                         data-deadline-date="${announce.closedAt}">
                        <div class="card-body d-flex flex-column shadow">
                            <h5 class="card-title truncate-text letter">
                                <c:out value="${announce.totalTitle}"/>
                            </h5>
                            <p class="card-text">
                                <span class="div-class"><c:out value="${announce.status}"/></span>
                            <h5 class="d-flex letter">공고일: <c:out value="${announce.startedAt}"/></h5>
                            <h5 class="d-flex letter">접수마감일: <c:out value="${announce.closedAt}"/></h5>
                            </p>
                            <select data-id="${announce.totalTitle}"
                                    class="form-select mt-2 w-100 test announcement-select shadow-sm letter1"
                                    aria-label="공모 분야 선택">
                                <option selected disabled>공모분야를 선택해주세요.</option>
                                <c:forEach items="${announce.subTitles}" var="subTitle">

                                    <option class="paper" data-subtitle="${subTitle.subTitle}"
                                            value="${subTitle.subAnnNo}"><c:out value="${subTitle.subTitle}"/></option>

                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="col-8" style="margin-left: 30px">
            <div class="col-9">
                <table class="table table-bordered text-center committee-top rounded-table shadow-sm">

                </table>
            </div>
            <div class="col-12" style="margin-top: 0;">
                <div id="surveyContainer" class="survey-container col-12">

                    <div class="container mt-4 survey guidance-message">
                        <div class="row justify-content-center">
                            <!-- 안내 메시지 카드 -->
                            <div class="col-12 col-md-8">
                                <div class="card shadow-lg">
                                    <div class="card-header text-center bg-info text-white" style="background-color: #2e406aff !important;">
                                        <h4>공모분야 선택 안내</h4>
                                    </div>
                                    <div class="card-body">
                                        <!-- 안내 문구 -->
                                        <p class="lead">
                                            이 부분은 공모분야를 선택한 후에 해당 공모와 관련된 설문지 양식이 표시되는 영역입니다.
                                            각 공모는 특정 분야와 관련된 질문을 포함하고 있으며, 공모분야를 선택하면 그에 맞는 설문 내용이 이곳에 자동으로 로드됩니다.
                                        </p>
                                        <p class="lead">
                                            공모분야를 먼저 선택하고 설문을 작성해 주세요.
                                        </p>
                                        <!-- 공모분야 선택을 유도하는 버튼 -->
                                        <div class="d-flex justify-content-center">
                                            <button class="btn btn-primary btn-lg" type="button" id="selectCategoryBtn" style="background-color: #2e406aff !important;">
                                                공모분야 선택하기
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>

<script src="/resources/js/work-lounge/evaluation-table.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const statusSelect = document.querySelector('select[aria-label="상태 선택"]');
        const announceCards = document.querySelectorAll('.card.mb-3');

        statusSelect.addEventListener('change', function () {
            const selectedStatus = statusSelect.value;

            announceCards.forEach(card => {
                const status = card.querySelector('.div-class').textContent.trim();

                if (selectedStatus === 'all') {
                    card.style.display = 'block';
                } else if (selectedStatus === status) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        });

        document.getElementById('filterOption').addEventListener('change', function () {
            const option = this.value;
            const announcements = Array.from(announceCards);
            const sortedAnnouncements = announcements.sort((a, b) => {
                const dateA = option === 'recent'
                    ? new Date(a.dataset.publishDate)
                    : new Date(a.dataset.deadlineDate);
                const dateB = option === 'recent'
                    ? new Date(b.dataset.publishDate)
                    : new Date(b.dataset.deadlineDate);

                return option === 'recent' ? dateB - dateA : dateA - dateB;
            });

            const announceList = document.getElementById('announceList');
            announceList.innerHTML = '';
            sortedAnnouncements.forEach(card => announceList.appendChild(card));
        });
    });


    $(document).ready(function () {
        $(".announcement-select").change(function () {
            var selectedValue = $(this).val();
            var selectedOption = $(this).find("option:selected");
            var committeeTitle = selectedOption.data("subtitle");

            if (selectedValue !== "") {
                // 안내 메시지 카드를 숨김
                $(".guidance-message").hide();
            }

            $.ajax({
                url: 'http://localhost:8082/api/v1/work_lounge/evaluation-table/' + committeeTitle,
                type: 'GET',
                dataType: 'json',
                success: function (data) {

                    const committeeTop = $('.committee-top');

                    committeeTop.empty();

                    committeeTop.append(`
                    <thead>
                        <tr class="domain">
                            <td>공고분야명</td>
                            <td>공모분야</td>
                            <td>기술분야</td>
                            <td>서식구성</td>
                        </tr>
                    </thead>
                    <tbody>
                `);

                    $.each(data, function (index, item) {
                        const $row = $('<tr class="letter1">');

                        $row.append('<td>' + item.subTitle + '</td>');
                        $row.append('<td>' + item.taskType + '</td>');
                        $row.append('<td class="paper" data-field="' + item.techFieldName + '">' + item.techFieldName + '</td>');

                        const $select = $('<select class="form-select mt-2 w-100 p-0 shadow-sm letter1" aria-label="공모 분야 선택"></select>');
                        $select.append('<option selected  disabled style="text-align: center;">공모분야를 선택해주세요.</option>');
                        $select.append('<option value="0" data-subtitle="default" style="text-align: center;">Default</option>');

                        $.each(item.formTypes, function (i, formType) {
                            $select.append(
                                '<option style="text-align: center;" class="paper" data-subtitle="' + formType.formType + '" value="' + formType.evaluationTableNo + '">' +
                                formType.formType +
                                '</option>'
                            );
                        });

                        $select.on('change', function () {
                            const selectedOption = $(this).find('option:selected');
                            const subtitle = selectedOption.data('subtitle');
                            const field = $row.find('td.paper').data('field');
                            const lastPart = field.split('>').pop().trim();
                            console.log(field);
                            console.log(subtitle);
                            console.log(lastPart);

                            if (selectedOption.val() === "0") {

                                createDefaultTab(subtitle, lastPart);
                            } else {
                                $.ajax({
                                    // url: 'http://localhost:8082/api/v1/work_lounge/evaluation-table/단백질 구조와 기능/' + subtitle,
                                    url: 'http://localhost:8082/api/v1/work_lounge/evaluation-table/' + lastPart + '/' + subtitle,
                                    type: 'GET',
                                    dataType: 'json',
                                    success: function (data) {
                                        // console.log(url)


                                        var tabsContainer = $('<ul class="nav nav-tabs me-4"></ul>');
                                        var tabContentContainer = $('<div class="tab-content"></div>');
                                        var types = {};

                                        $.each(data, function (index, item) {
                                            var type = item.type;
                                            if (!types[type]) {
                                                types[type] = {
                                                    navItem: $('<li class="nav-item"></li>'),
                                                    navLink: $('<a class="nav-link custom-nav-link letter1" href="#tab-' + type + '" data-toggle="tab"></a>').text(type),
                                                    content: $('<div class="tab-pane fade card mt-1 me-4" id="tab-' + type + '"></div>')
                                                        .html(
                                                            '<div class="container text-end">' +
                                                            '<button type="button" class="btn btn-secondary ml-2 mt-2 mb-2 modify letter1"> 수정</button>' +
                                                            '<button type="button" class="btn btn-secondary ms-2 ml-2 mt-2 mb-2 save letter1"> 저장</button>' +
                                                            '</div>' +
                                                            '<div class="question">' +
                                                            '<div class="form-floating p-2">' +
                                                            '<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea">' + item.title + '</textarea>' +
                                                            '<label for="floatingTextarea">제목</label>' +
                                                            '</div>' +
                                                            '<div class="form-floating mt-2 p-2">' +
                                                            '<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px">' + item.description + '</textarea>' +
                                                            '<label for="floatingTextarea2">설명</label>' +
                                                            '</div>' +
                                                            '</div>' +
                                                            '<div class="question">' +
                                                            '<div class="form-floating mt-2 p-2">' +
                                                            '<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea">' + item.content + '</textarea>' +
                                                            '<label for="floatingInputValue">질문 항목</label>' +
                                                            '<button type="button" class="btn btn-danger btn-sm remove-question letter1">삭제</button>' +
                                                            '</div>' +
                                                            '<div class="form-floating mb-3 d-flex justify-content-center">' +
                                                            '<div class="form-check form-check-inline me-4">' +
                                                            '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio1">' +
                                                            '<label class="form-check-label letter1" for="floatingRadio1">매우 우수함(10점)</label>' +
                                                            '</div>' +
                                                            '<div class="form-check form-check-inline me-4">' +
                                                            '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio2">' +
                                                            '<label class="form-check-label letter1" for="floatingRadio2">우수함(8점)</label>' +
                                                            '</div>' +
                                                            '<div class="form-check form-check-inline me-4">' +
                                                            '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio3">' +
                                                            '<label class="form-check-label letter1" for="floatingRadio3">보통(6점)</label>' +
                                                            '</div>' +
                                                            '<div class="form-check form-check-inline me-4">' +
                                                            '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio4">' +
                                                            '<label class="form-check-label letter1" for="floatingRadio4">개선 필요(4점)</label>' +
                                                            '</div>' +
                                                            '<div class="form-check form-check-inline me-4">' +
                                                            '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio5">' +
                                                            '<label class="form-check-label letter1" for="floatingRadio5">미달(2점)</label>' +
                                                            '</div>' +
                                                            '</div>' +
                                                            '</div>'
                                                        )
                                                };

                                                $(document).on('click', '.remove-question', function () {
                                                    $(this).closest('.question').remove();
                                                });

                                                types[type].navItem.append(types[type].navLink);
                                                tabsContainer.append(types[type].navItem);
                                                tabContentContainer.append(types[type].content);

                                            } else {
                                                types[type].content.append(
                                                    '<form class="form-floating mt-2 p-2 question">' +
                                                    '<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea">' + item.content + '</textarea>' +
                                                    '<label for="floatingInputValue">질문 항목</label>' +
                                                    '<div class="form-floating mb-3 d-flex justify-content-center">' +
                                                    '<div class="form-check form-check-inline me-4">' +
                                                    '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio1">' +
                                                    '<label class="form-check-label letter1" for="floatingRadio1">매우 우수함(10점)</label>' +
                                                    '</div>' +
                                                    '<div class="form-check form-check-inline me-4">' +
                                                    '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio2">' +
                                                    '<label class="form-check-label letter1" for="floatingRadio2">우수함(8점)</label>' +
                                                    '</div>' +
                                                    '<div class="form-check form-check-inline me-4">' +
                                                    '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio3">' +
                                                    '<label class="form-check-label letter1" for="floatingRadio3">보통(6점)</label>' +
                                                    '</div>' +
                                                    '<div class="form-check form-check-inline me-4">' +
                                                    '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio4">' +
                                                    '<label class="form-check-label letter1" for="floatingRadio4">개선 필요(4점)</label>' +
                                                    '</div>' +
                                                    '<div class="form-check form-check-inline me-4">' +
                                                    '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio5">' +
                                                    '<label class="form-check-label letter1" for="floatingRadio5">미달(2점)</label>' +
                                                    '</div>' +
                                                    '</div>' +
                                                    '<button type="button" class="btn btn-danger btn-sm remove-question letter1">삭제</button>' +
                                                    '</form>'
                                                );
                                            }

                                            if (index === 0) {
                                                types[type].navLink.addClass('active');
                                                types[type].content.addClass('show active');
                                            }
                                        });

                                        // 반복문이 끝난 후 추가할 내용
                                        $.each(types, function (type, value) {
                                            value.content.append(`
                                                <div id="targetArea"></div>
                                                <div class="d-flex justify-content-center align-items-center">
                                                    <button type="button" class="btn btn-blue rounded-circle" style="background-color: #2e406aff; color: white;" disabled>+</button>
                                                </div>
                                            `);
                                        });


                                        var tabsWrapper = $('<div class="tabs-wrapper" style="width: 75%; float: left; max-height: 490px; overflow-y: auto;"></div>');
                                        tabsWrapper.append(tabsContainer);
                                        tabsWrapper.append(tabContentContainer);

                                        $('#surveyContainer').empty();
                                        $('#surveyContainer').append(tabsWrapper);

                                        $(document).ready(function () {
                                            $.ajax({
                                                // url: 'http://localhost:8082/api/v1/work_lounge/evaluation-question/생명과학',
                                                url: 'http://localhost:8082/api/v1/work_lounge/evaluation-question/' + lastPart,
                                                method: 'GET',
                                                success: function (data) {

                                                    var newDiv = $(
                                                        '<div class="new-div p-0" style="width: 25%; float: left;">' +
                                                        '<div class="card shadow" style="margin-top: 40px">' +
                                                        '<h4 class="text-center letter"><b>질문 목록</b></h4>' +
                                                        '<div class="card-body" style="max-height: 360px; overflow-y: auto; padding: 5%">' +
                                                        '</div>' +
                                                        '</div>' +
                                                        '</div>'
                                                    );

                                                    $.each(data, function (index, item) {
                                                        var questionItem = $(
                                                            '<div class="card d-flex justify-content-between align-items-center mt-1 blue p-2">' +
                                                            '<div>' +
                                                            '<span class="letter1">' + item.content + '</span>' +
                                                            '<button class="btn-circle btn-sm ms-2 quest" disabled>+</button>' +
                                                            '</div>' +
                                                            '</div>'
                                                        );

                                                        newDiv.find('.card-body').append(questionItem);
                                                    });

                                                    $('#surveyContainer').append(newDiv);
                                                },
                                                error: function (xhr, status, error) {
                                                    console.error('AJAX Error: ', status, error);
                                                }
                                            });
                                        });


                                    },
                                    error: function (xhr, status, error) {
                                        console.error('AJAX Error: ', status, error);
                                    }
                                });
                            }


                        });

                        $row.append($('<td>').append($select));

                        committeeTop.find('tbody').append($row);
                    });

                    committeeTop.append('</tbody>');
                },
                error: function (xhr, status, error) {
                    console.error('AJAX Error: ', status, error);
                }
            });

        });
    });

    $(document).on('click', '.btn-circle.quest', function () {
        var questionText = $(this).prev('span').text();

        var newDivContent =
            '<div class="form-floating mt-2 p-2 question">' +
            '<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea">' + questionText + '</textarea>' +
            '<label for="floatingTextarea">질문항목</label>' +
            '<div class="form-floating mb-3 d-flex justify-content-center">' +
            '<div class="form-check form-check-inline me-4">' +
            '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio1">' +
            '<label class="form-check-label letter1" for="floatingRadio1">매우 우수함(10점)</label>' +
            '</div>' +
            '<div class="form-check form-check-inline me-4">' +
            '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio2">' +
            '<label class="form-check-label letter1" for="floatingRadio2">우수함(8점)</label>' +
            '</div>' +
            '<div class="form-check form-check-inline me-4">' +
            '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio3">' +
            '<label class="form-check-label letter1" for="floatingRadio3">보통(6점)</label>' +
            '</div>' +
            '<div class="form-check form-check-inline me-4">' +
            '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio4">' +
            '<label class="form-check-label letter1" for="floatingRadio4">개선 필요(4점)</label>' +
            '</div>' +
            '<div class="form-check form-check-inline me-4">' +
            '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio5">' +
            '<label class="form-check-label letter1" for="floatingRadio5">미달(2점)</label>' +
            '</div>' +
            '</div>' +
            '<button type="button" class="btn btn-danger btn-sm remove-question letter1">삭제</button>' +
            '</div>';

        $('#targetArea').append(newDivContent);
    });

    $(document).on('click', '.remove-question', function () {
        $(this).closest('.question').remove();
    });


    $(document).ready(function () {
        $(document).on('click', '.btn-blue.rounded-circle', function () {
            var newDivContent =
                '<div class="form-floating mt-2 p-2 question">' +
                '<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea"></textarea>' +
                '<label for="floatingTextarea">평가 기준에 맞는 질문을 작성해주세요.</label>' +
                '<div class="form-floating mb-3 d-flex justify-content-center">' +
                '<div class="form-check form-check-inline me-4">' +
                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio1">' +
                '<label class="form-check-label letter1" for="floatingRadio1">매우 우수함(10점)</label>' +
                '</div>' +
                '<div class="form-check form-check-inline me-4">' +
                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio2">' +
                '<label class="form-check-label letter1" for="floatingRadio2">우수함(8점)</label>' +
                '</div>' +
                '<div class="form-check form-check-inline me-4">' +
                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio3">' +
                '<label class="form-check-label letter1" for="floatingRadio3">보통(6점)</label>' +
                '</div>' +
                '<div class="form-check form-check-inline me-4">' +
                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio4">' +
                '<label class="form-check-label letter1" for="floatingRadio4">개선 필요(4점)</label>' +
                '</div>' +
                '<div class="form-check form-check-inline me-4">' +
                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio5">' +
                '<label class="form-check-label letter1" for="floatingRadio5">미달(2점)</label>' +
                '</div>' +
                '</div>' +
                '<button type="button" class="btn btn-danger btn-sm remove-question letter1">삭제</button>' +
                '</div>';
            $('#targetArea').append(newDivContent);
        });

        $(document).on('click', '.remove-question', function () {
            $(this).closest('.question').remove();
        });

    });

    $(document).ready(function () {
        $(document).on('click', '.btn.btn-secondary.modify', function () {
            $('.btn-blue.rounded-circle, .btn-circle.quest').prop('disabled', function (_, val) {
                return !val;
            });

            $('.question').each(function () {
                $(this).find('textarea').prop('disabled', false);
                $(this).find('label').attr('for', 'floatingTextarea');
            });
        });

        $(document).on('click', '.btn.btn-secondary.save', function () {
            $('.btn-blue.rounded-circle, .btn-circle.quest').prop('disabled', true);

            $('.question').each(function () {
                $(this).find('textarea').prop('disabled', true);
                $(this).find('label').attr('for', 'floatingTextareaDisabled');

            });
        });

    });

    function createDefaultTab(subtitle, lastPart) {
        // let tech = field.replace(/\s+/g, '');
        let tech = lastPart;
        let tech1 = lastPart.replace(/\s+/g, '');
        let rule = subtitle;

        const mainContainer = $('<div class="d-flex"></div>');

        const tabContentContainer = $('<div class="col-9 scroll-container1 me-4"></div>');
        const tabsContainer = $('<ul class="nav nav-tabs me-4"></ul>');
        const contentContainer = $('<div class="tab-content card"></div>');

        const defaultTab = $('<li class="nav-item"></li>');
        const defaultNavLink = $('<a class="nav-link active letter1" href="#tab-default" data-toggle="tab">' + tech1 + '</a>');
        const defaultContent = $('<div class="tab-pane fade show active" id="tab-default"></div>').html(
            '<div class="container">' +
            '<div class="d-flex justify-content-start align-items-center">' +
            '<button type="button" style="margin-right: 17px" class="btn mt-2 mb-2 new-button letter1 ctm-btn-blue" onclick="window.open(\'http://localhost:8082/work-lounge/evaluation-tables/' + tech1 + '/' + rule + '\', \'_blank\', \'width=700, height=600, top=50, left=50, scrollbars=yes\')">미리보기</button>' +
            '<div class="col-7" style="margin-right: 30px">' +
            '</div>' +
            '<button type="button" class="btn btn-secondary ms-1 ml-2 mt-2 mb-2 modify letter1">수정</button>' +
            '<button type="button" class="ms-2 btn btn-secondary ml-2 mt-2 mb-2 save letter1">저장</button>' +
            '</div>' +
            '</div>' +
            '<div class="question">' +
            '<div class="form-floating mt-2 p-2">' +
            '<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea">기본 제목</textarea>' +
            '<label for="floatingTextarea">제목</label>' +
            '</div>' +
            '<div class="form-floating mt-2 p-2">' +
            '<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px">기본 설명</textarea>' +
            '<label for="floatingTextarea2">설명</label>' +
            '</div>' +
            '</div>' +
            '<div id="targetArea">' +
            '</div>' +
            '<div class="text-center my-3">' +
            '<button type="button" class="btn btn-blue rounded-circle" style="background-color: #2e406aff; color: white;">+</button>' +
            '</div>'
        );

        defaultTab.append(defaultNavLink);
        tabsContainer.append(defaultTab);
        contentContainer.append(defaultContent);


        tabContentContainer.append(tabsContainer);
        tabContentContainer.append(contentContainer);

        $('#surveyContainer').empty();

        const col4Container = $('<div class="col-3"></div>');
        mainContainer.append(tabContentContainer);
        mainContainer.append(col4Container);

        $('#surveyContainer').append(mainContainer);

        $.ajax({
            // url: 'http://localhost:8082/api/v1/work_lounge/evaluation-question/생명과학',
            url: 'http://localhost:8082/api/v1/work_lounge/evaluation-question/' + lastPart,
            method: 'GET',
            success: function (data) {

                var newDiv = $(
                    '<div class="new-div p-0" style="width: 100%;">' +
                    '<div class="card shadow" style="margin-top: 40px">' +
                    '<h4 class="text-center letter"><b>질문 목록</b></h4>' +
                    '<div class="card-body" style="max-height: 360px; overflow-y: auto; padding: 5%">' +
                    '</div>' +
                    '</div>' +
                    '</div>'
                );

                $.each(data, function (index, item) {
                    var questionItem = $(
                        '<div class="card d-flex justify-content-between align-items-center mt-1 blue p-2">' +
                        '<div>' +
                        '<span class="letter1">' + item.content + '</span>' +
                        '<button class="btn-circle btn-sm ms-2 quest">+</button>' +
                        '</div>' +
                        '</div>'
                    );

                    newDiv.find('.card-body').append(questionItem);
                });

                col4Container.append(newDiv);
            },
            error: function (xhr, status, error) {
                console.error('AJAX Error: ', status, error);
            }
        });

        $(document).off('click', '.btn-blue.rounded-circle').on('click', '.btn-blue.rounded-circle', function () {
            var newDivContent =
                '<div class="form-floating mt-0 p-1 question">' +
                '<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea"></textarea>' +
                '<label for="floatingTextarea">평가 기준에 맞는 질문을 작성해주세요.</label>' +
                '<div class="form-floating mb-3 d-flex justify-content-center">' +
                '<div class="form-check form-check-inline me-4">' +
                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio1">' +
                '<label class="form-check-label letter1" for="floatingRadio1">매우 우수함(10점)</label>' +
                '</div>' +
                '<div class="form-check form-check-inline me-4">' +
                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio2">' +
                '<label class="form-check-label letter1" for="floatingRadio2">우수함(8점)</label>' +
                '</div>' +
                '<div class="form-check form-check-inline me-4">' +
                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio3">' +
                '<label class="form-check-label letter1" for="floatingRadio3">보통(6점)</label>' +
                '</div>' +
                '<div class="form-check form-check-inline me-4">' +
                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio4">' +
                '<label class="form-check-label letter1" for="floatingRadio4">개선 필요(4점)</label>' +
                '</div>' +
                '<div class="form-check form-check-inline me-4">' +
                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio5">' +
                '<label class="form-check-label letter1" for="floatingRadio5">미달(2점)</label>' +
                '</div>' +
                '</div>' +
                '<button type="button" class="btn btn-danger btn-sm remove-question letter1">삭제</button>' +
                '</div>';

            $(this).closest('.tab-pane').find('.question:last').after(newDivContent);
        });

        $(document).off('click', '.btn-circle.quest').on('click', '.btn-circle.quest', function () {
            var questionText = $(this).prev('span').text();

            var newDivContent =
                '<div class="form-floating mt-2 p-2 question">' +
                '<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea">' + questionText + '</textarea>' +
                '<label for="floatingTextarea">질문항목</label>' +
                '<div class="form-floating mb-3 d-flex justify-content-center">' +
                '<div class="form-check form-check-inline me-4">' +
                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio1">' +
                '<label class="form-check-label letter1" for="floatingRadio1 letter1">매우 우수함(10점)</label>' +
                '</div>' +
                '<div class="form-check form-check-inline me-4">' +
                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio2">' +
                '<label class="form-check-label letter1" for="floatingRadio2 letter1">우수함(8점)</label>' +
                '</div>' +
                '<div class="form-check form-check-inline me-4">' +
                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio3">' +
                '<label class="form-check-label letter1" for="floatingRadio3 letter1">보통(6점)</label>' +
                '</div>' +
                '<div class="form-check form-check-inline me-4">' +
                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio4">' +
                '<label class="form-check-label letter1" for="floatingRadio4 letter1">개선 필요(4점)</label>' +
                '</div>' +
                '<div class="form-check form-check-inline me-4">' +
                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio5">' +
                '<label class="form-check-label letter1" for="floatingRadio5 letter1">미달(2점)</label>' +
                '</div>' +
                '</div>' +
                '<button type="button" class="btn btn-danger btn-sm remove-question letter1">삭제</button>' +
                '</div>';

            $('#targetArea').append(newDivContent);
        });
    }


    // 질문지 저장 용도
    $(document).off('click', '.save').on('click', '.save', function () {
        const title = $('#floatingTextarea').val();
        const description = $('#floatingTextarea2').val();
        const questions = [];

        // 질문 목록 준비
        $('#targetArea .question').each(function () {
            const content = $(this).find('textarea').val();
            const questionType = 'Text';  // 질문 유형 (필요에 따라 수정)
            const techFieldNo = 1;  // 기술 필드 번호 (필요에 따라 수정)


            if (content.trim() !== '') {
                questions.push({
                    type: questionType,
                    content: content,
                    techFieldNo: techFieldNo
                });
            }
        });


        if (questions.length === 0) {
            // 알림 표시
            Swal.fire({
                title: '경고!',
                text: '적어도 하나의 질문을 추가해야 합니다.',
                icon: 'warning',
                confirmButtonText: '확인'
            });
            return;
        }

        // 요청 데이터 객체
        const requestData = {
            title: title,
            description: description,
            formType: 'Survey',
            techFieldNo: 1,
            questions: questions  // 질문 목록
        };

        // 요청 데이터 콘솔
        console.log('Request Data:', JSON.stringify(requestData));

        // AJAX 요청
        $.ajax({
            url: 'http://localhost:8082/api/v1/work_lounge/newForm',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            data: JSON.stringify(requestData),
            // success: function (response) {
            //
            //     alert('Form saved successfully!');
            //     console.log('Server Response:', response);
            //
            // },
            // error: function (xhr, status, error) {
            //     console.log('XHR:', xhr);
            //     console.error('Error:', error);
            //     console.error('Status:', status);
            //     console.error('Response:', xhr.responseText);
            //     alert('Failed to save form: ' + error);
            // }
            success: function (response) {
                Swal.fire({
                    icon: 'success',
                    title: 'Form saved successfully!',
                    text: 'The form has been saved successfully.',
                    confirmButtonText: 'OK'
                });
                console.log('Server Response:', response);
            },
            error: function (xhr, status, error) {
                console.log('XHR:', xhr);
                console.error('Error:', error);
                console.error('Status:', status);
                console.error('Response:', xhr.responseText);
                Swal.fire({
                    icon: 'error',
                    title: 'Failed to save form',
                    text: 'Error: ' + error,
                    confirmButtonText: 'OK'
                });
            }

        });
    });






</script>

</body>
</html>
