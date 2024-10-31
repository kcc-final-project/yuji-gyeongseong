<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-noheader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>전자평가표</title>
    <link rel="stylesheet" href="/resources/css/work-lounge/evaluation-table.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <style>
        .d-flex {
            display: flex;
        }

        .scroll-container {
            max-height: 700px;
            overflow-y: auto;
        }

        .scroll-container1 {
            max-height: 565px;
            overflow-y: auto;
        }

        .form-select {
            width: 100px;
            margin-right: 10px;
        }
    </style>
</head>
<body>
<div class="main-container" style="width: 100%; height: 756px;">
    <div class="marin-header"
         style="width: 100%; height: 10%; display: flex; justify-content: center; align-items: center;">
        <h2>전자평가표</h2>
    </div>
    <div class="d-flex justify-content-center ps-1">
        <div class="card col-4 scroll-container">
            <div class="d-flex justify-content-center align-center mt-1">
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
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title truncate-text">
                                <c:out value="${announce.totalTitle}"/>
                            </h5>
                            <p class="card-text">
                                <span class="div-class"><c:out value="${announce.status}"/></span>
                            <h5 class="d-flex">공고일: <c:out value="${announce.startedAt}"/></h5>
                            <h5 class="d-flex">접수마감일: <c:out value="${announce.closedAt}"/></h5>
                            </p>
                            <select data-id="${announce.totalTitle}"
                                    class="form-select mt-2 w-100 test announcement-select"
                                    aria-label="공모 분야 선택">
                                <option selected>공모분야를 선택해주세요.</option>
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
        <div class="col-8">
            <div class="col-9">
                <table class="table table-bordered text-center committee-top">
                </table>
            </div>
            <div class="col-12" style="margin-top: 0;">
                <div id="surveyContainer" class="survey-container col-12"></div>
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

                // Show or hide cards based on the selected status
                if (selectedStatus === 'all') {
                    card.style.display = 'block'; // Show all
                } else if (selectedStatus === status) {
                    card.style.display = 'block'; // Show matching status
                } else {
                    card.style.display = 'none'; // Hide non-matching status
                }
            });
        });

        // Sorting logic
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

                return option === 'recent' ? dateB - dateA : dateA - dateB; // 내림차순 또는 오름차순
            });

            // Clear and re-append sorted announcements
            const announceList = document.getElementById('announceList');
            announceList.innerHTML = '';
            sortedAnnouncements.forEach(card => announceList.appendChild(card));
        });
    });


    $(document).ready(function () {
        $(".announcement-select").change(function () {
            var selectedValue = $(this).val(); // 선택된 값
            var selectedOption = $(this).find("option:selected"); // 선택된 옵션
            var committeeTitle = selectedOption.data("subtitle"); // 데이터 속성 가져오기
            console.log(committeeTitle); // 콘솔에 출력

            $.ajax({
                url: 'http://localhost:8082/api/v1/work_lounge/evaluation-table/' + committeeTitle,
                type: 'GET',
                dataType: 'json', // 서버에서 JSON 형식으로 데이터가 반환된다고 가정
                success: function (data) {
                    console.log(data);
                    const committeeTop = $('.committee-top'); // tbody 선택

                    // 기존 내용을 비우기
                    committeeTop.empty();

                    // 테이블 헤더 추가
                    committeeTop.append(`
                    <thead>
                        <tr class="domain">
                            <th>공고분야명</th>
                            <th>공모분야</th>
                            <th>기술분야</th>
                            <th>서식구성</th>
                        </tr>
                    </thead>
                    <tbody>
                `);

                    // 데이터 배열을 순회하며 테이블 행 추가
                    $.each(data, function(index, item) {
                        const $row = $('<tr>');

                        // 각 항목에 대한 데이터 추가
                        $row.append('<td>' + item.subTitle + '</td>');
                        $row.append('<td>' + item.taskType + '</td>');
                        $row.append('<td class="paper" data-field="' + item.techFieldName + '">' + item.techFieldName + '</td>');

                        // 공모 분야 선택 드롭다운 생성
                        const $select = $('<select class="form-select mt-2 w-100 p-0" aria-label="공모 분야 선택"></select>');
                        $select.append('<option selected>공모분야를 선택해주세요.</option>');
                        $select.append('<option value="0" data-subtitle="default">Default</option>');

                        // formTypes를 반복하여 드롭다운에 옵션 추가
                        $.each(item.formTypes, function (i, formType) {
                            $select.append(
                                '<option class="paper" data-subtitle="' + formType.formType + '" value="' + formType.evaluationTableNo + '">' +
                                formType.formType +
                                '</option>'
                            );
                        });

                        // 드롭다운에 change 이벤트 추가
                        $select.on('change', function () {
                            const selectedOption = $(this).find('option:selected');
                            const subtitle = selectedOption.data('subtitle');
                            const field = $row.find('td.paper').data('field'); // 같은 행의 data-field 가져오기
                            console.log('해당하는 data-field:', field);
                            console.log('선택된 data-subtitle:', subtitle);

                            $.ajax({
                                // url: 'http://localhost:8082/api/v1/work_lounge/evaluation-table/생명과학/FormTypeA',
                                url: 'http://localhost:8082/api/v1/work_lounge/evaluation-table/'+ field + '/' + subtitle,
                                type: 'GET',
                                dataType: 'json', // 서버에서 JSON 형식으로 데이터가 반환된다고 가정
                                success: function (data) {
                                    console.log(data);

                                    var tabsContainer = $('<ul class="nav nav-tabs me-4"></ul>');
                                    var tabContentContainer = $('<div class="tab-content"></div>');
                                    var types = {}; // 고유한 타입 저장

                                    $.each(data, function (index, item) {
                                        var type = item.type;
                                        if (!types[type]) {
                                            types[type] = {
                                                navItem: $('<li class="nav-item"></li>'),
                                                navLink: $('<a class="nav-link" href="#tab-' + type + '" data-toggle="tab"></a>').text(type),
                                                content: $('<div class="tab-pane fade card mt-1 me-4" id="tab-' + type + '"></div>')
                                                    .html(
                                                        '<div class="container text-right">' +
                                                        '<button type="button" class="btn btn-secondary ml-2 mt-2 mb-2 modify"> 수정</button>' +
                                                        '<button type="button" class="btn btn-secondary ml-2 mt-2 mb-2 save"> 저장</button>' +
                                                        '</div>' +
                                                        '<div class="question">' + // Wrapping content in a single parent div
                                                        '<div class="form-floating mt-2 p-2">' +
                                                        '<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea">' + item.title + '</textarea>' +
                                                        '<label for="floatingTextarea">제목</label>' +
                                                        '</div>' +
                                                        '<div class="form-floating mt-2 p-2">' +
                                                        '<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px">' + item.description + '</textarea>' +
                                                        '<label for="floatingTextarea2">설명</label>' +
                                                        '</div>' +
                                                        '</div>' +
                                                        '<div class="question">' + // Wrapping content in a separate question div
                                                        '<div class="form-floating mt-2 p-2">' +
                                                        '<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea">' + item.content + '</textarea>' +
                                                        '<label for="floatingInputValue">질문 항목</label>' +
                                                        '<button type="button" class="btn btn-danger btn-sm remove-question">삭제</button>' +
                                                        '</div>' +
                                                        '<div class="form-floating mb-3 d-flex justify-content-center">' +
                                                        '<div class="form-check form-check-inline me-4">' +
                                                        '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio1">' +
                                                        '<label class="form-check-label" for="floatingRadio1">Option 1</label>' +
                                                        '</div>' +
                                                        '<div class="form-check form-check-inline me-4">' +
                                                        '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio2">' +
                                                        '<label class="form-check-label" for="floatingRadio2">Option 2</label>' +
                                                        '</div>' +
                                                        '<div class="form-check form-check-inline me-4">' +
                                                        '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio3">' +
                                                        '<label class="form-check-label" for="floatingRadio3">Option 3</label>' +
                                                        '</div>' +
                                                        '<div class="form-check form-check-inline me-4">' +
                                                        '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio4">' +
                                                        '<label class="form-check-label" for="floatingRadio4">Option 4</label>' +
                                                        '</div>' +
                                                        '<div class="form-check form-check-inline me-4">' +
                                                        '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio5">' +
                                                        '<label class="form-check-label" for="floatingRadio5">Option 5</label>' +
                                                        '</div>' +
                                                        '</div>' +
                                                        '</div>'
                                                    )
                                            };
                                            // 삭제 버튼 클릭 시 해당 질문 항목 제거
                                            $(document).on('click', '.remove-question', function() {
                                                $(this).closest('.question').remove();
                                            });




                                            types[type].navItem.append(types[type].navLink);
                                            tabsContainer.append(types[type].navItem);
                                            tabContentContainer.append(types[type].content);
                                        } else {
                                            // 기존 탭 내용에 추가  // 1. Append the form with radio buttons first
                                            types[type].content.append(
                                                '<form class="form-floating mt-2 p-2 question">' +
                                                '<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea">' + item.content + '</textarea>' +
                                                '<label for="floatingInputValue">질문 항목</label>' +
                                                '<div class="form-floating mb-3 d-flex justify-content-center">' +
                                                '<div class="form-check form-check-inline me-4">' +
                                                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio1">' +
                                                '<label class="form-check-label" for="floatingRadio1">Option 1</label>' +
                                                '</div>' +
                                                '<div class="form-check form-check-inline me-4">' +
                                                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio2">' +
                                                '<label class="form-check-label" for="floatingRadio2">Option 2</label>' +
                                                '</div>' +
                                                '<div class="form-check form-check-inline me-4">' +
                                                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio3">' +
                                                '<label class="form-check-label" for="floatingRadio3">Option 3</label>' +
                                                '</div>' +
                                                '<div class="form-check form-check-inline me-4">' +
                                                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio4">' +
                                                '<label class="form-check-label" for="floatingRadio4">Option 4</label>' +
                                                '</div>' +
                                                '<div class="form-check form-check-inline me-4">' +
                                                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio5">' +
                                                '<label class="form-check-label" for="floatingRadio5">Option 5</label>' +
                                                '</div>' +
                                                '</div>' +
                                                '<button type="button" class="btn btn-danger btn-sm remove-question">삭제</button>' +
                                                '</form>'
                                            );

                                            // 2. Then append the remaining content (excluding radio buttons)
                                            types[type].content.append(`
                                                <div id="targetArea"></div>
                                                    <div class="d-flex justify-content-center align-items-center">
                                                        <button type="button" class="btn btn-blue rounded-circle" style="background-color: #2e406aff; color: white;" disabled>+</button>
                                                    </div>
                                            `);
                                        }

                                        // 첫 번째 탭과 내용을 활성화
                                        if (index === 0) {
                                            types[type].navLink.addClass('active');
                                            types[type].content.addClass('show active');
                                        }



                                    });

                                    // 탭과 콘텐츠를 포함하는 새로운 div 생성
                                    var tabsWrapper = $('<div class="tabs-wrapper" style="width: 75%; float: left; max-height: 490px; overflow-y: auto;"></div>');
                                    tabsWrapper.append(tabsContainer);
                                    tabsWrapper.append(tabContentContainer);

                                    // // 새로 추가할 div 생성
                                    // var newDiv = $(
                                    //     '<div class="new-div p-2" style="width: 25%; float: left;">' +
                                    //     '<div class="card" style="margin-top: 40px">' +
                                    //     '<h4 class="text-center"><b>질문 목록</b></h4>' +
                                    //     '<div class="card-body" style="max-height: 340px; overflow-y: auto">' +
                                    //     '<div class="card d-flex justify-content-between align-items-center mt-1 blue">' +
                                    //     '<div>' +
                                    //     '<span style="font-size: 20px">질문 1</span>' +
                                    //     '<button class="btn-circle btn-sm ms-2 quest" >+</button>' +
                                    //     '</div>' +
                                    //     '</div>' +
                                    //     '</div>' +
                                    //     '</div>' +
                                    //     '</div>'
                                    // );


                                    // #surveyContainer에 추가
                                    $('#surveyContainer').empty(); // 기존 내용을 비우기
                                    $('#surveyContainer').append(tabsWrapper);
                                    // $('#surveyContainer').append(newDiv);

                                    // 질문 목록용도
                                    $(document).ready(function() {
                                        console.log('해당하는 data-field:', field);
                                        // AJAX 요청으로 데이터 가져오기
                                        $.ajax({
                                            // url: 'http://localhost:8082/api/v1/work_lounge/evaluation-question/생명과학',
                                            url: 'http://localhost:8082/api/v1/work_lounge/evaluation-question/' + field,
                                            method: 'GET',
                                            success: function(data) {
                                                console.log(data); // 데이터 확인을 위해 로그 출력

                                                // 공통 div 구조 생성
                                                var newDiv = $(
                                                    '<div class="new-div p-0" style="width: 25%; float: left;">' +
                                                    '<div class="card" style="margin-top: 40px">' +
                                                    '<h4 class="text-center"><b>질문 목록</b></h4>' +
                                                    '<div class="card-body" style="max-height: 340px; overflow-y: auto; padding: 5%">' +
                                                    '</div>' +
                                                    '</div>' +
                                                    '</div>'
                                                );

                                                // 데이터를 기반으로 각 질문 항목 추가
                                                $.each(data, function(index, item) {
                                                    var questionItem = $(
                                                        '<div class="card d-flex justify-content-between align-items-center mt-1 blue p-2">' +
                                                        '<div>' +
                                                        '<span style="font-size: 15px">' + item.content + '</span>' + // 데이터를 여기 적용
                                                        '<button class="btn-circle btn-sm ms-2 quest" disabled>+</button>' +
                                                        '</div>' +
                                                        '</div>'
                                                    );

                                                    // 질문 항목을 공통 div 구조에 추가
                                                    newDiv.find('.card-body').append(questionItem);
                                                });

                                                // #surveyContainer에 새로운 div 추가
                                                $('#surveyContainer').append(newDiv);
                                            },
                                            error: function(xhr, status, error) {
                                                console.error('AJAX Error: ', status, error);
                                            }
                                        });
                                    });



                                },
                                error: function (xhr, status, error) {
                                    console.error('AJAX Error: ', status, error);
                                }
                            });



                        });

                        // 드롭다운을 마지막 열에 추가
                        $row.append($('<td>').append($select));

                        // tbody에 행 추가
                        committeeTop.find('tbody').append($row);
                    });

                    committeeTop.append('</tbody>'); // tbody 종료 태그 추가
                },
                error: function (xhr, status, error) {
                    console.error('AJAX Error: ', status, error);
                }
            });
        });
    });

    //질문지
    // $(document).ready(function() {
    //     // 기존 코드...
    //
    //     // 새로운 div를 "여기다가" 위치에 추가하는 이벤트 리스너
    //     $(document).on('click', '.btn-circle.quest', function() {
    //         var newDivContent = '<div class="new-content mt-2">새로운 div 내용</div>'; // 새로운 div의 내용 정의
    //         $('#targetArea').append(newDivContent); // "여기다가" 위치에 새로운 div 추가
    //     });
    //
    //     // 기존 코드 계속...
    // });

    $(document).on('click', '.btn-circle.quest', function() {
        // 클릭한 버튼의 이전 span 요소를 찾습니다.
        var questionText = $(this).prev('span').text(); // span의 텍스트 가져오기
        console.log(questionText); // questionText 값을 콘솔에 출력

        // 새로운 div를 "여기다가" 위치에 추가하는 코드
        var newDivContent =
            '<div class="form-floating mt-2 p-2 question">' +
            '<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea">' + questionText + '</textarea>' +
            '<label for="floatingTextarea">질문항목</label>' +
            '<div class="form-floating mb-3 d-flex justify-content-center">' +
            '<div class="form-check form-check-inline me-4">' +
            '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio1">' +
            '<label class="form-check-label" for="floatingRadio1">Option 1</label>' +
            '</div>' +
            '<div class="form-check form-check-inline me-4">' +
            '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio2">' +
            '<label class="form-check-label" for="floatingRadio2">Option 2</label>' +
            '</div>' +
            '<div class="form-check form-check-inline me-4">' +
            '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio3">' +
            '<label class="form-check-label" for="floatingRadio3">Option 3</label>' +
            '</div>' +
            '<div class="form-check form-check-inline me-4">' +
            '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio4">' +
            '<label class="form-check-label" for="floatingRadio4">Option 4</label>' +
            '</div>' +
            '<div class="form-check form-check-inline me-4">' +
            '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio5">' +
            '<label class="form-check-label" for="floatingRadio5">Option 5</label>' +
            '</div>' +
            '</div>' +
            '<button type="button" class="btn btn-danger btn-sm remove-question">삭제</button>' +
            '</div>';

        $('#targetArea').append(newDivContent); // "여기다가" 위치에 새로운 div 추가
    });

    // 삭제 버튼 클릭 시 해당 질문 항목 제거
    $(document).on('click', '.remove-question', function() {
        $(this).closest('.question').remove();
    });


    // 일반 +버튼
    $(document).ready(function() {
        // 기존 코드...

        // 새로운 div를 "여기다가" 위치에 추가하는 이벤트 리스너
        // 새로운 div를 "여기다가" 위치에 추가하는 이벤트 리스너
        $(document).on('click', '.btn-blue.rounded-circle', function() {
            var newDivContent =
                '<div class="form-floating mt-2 p-2 question">' +
                '<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea"></textarea>' +
                '<label for="floatingTextarea">평가 기준에 맞는 질문을 작성해주세요.</label>' +
                '<div class="form-floating mb-3 d-flex justify-content-center">' +
                '<div class="form-check form-check-inline me-4">' +
                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio1">' +
                '<label class="form-check-label" for="floatingRadio1">Option 1</label>' +
                '</div>' +
                '<div class="form-check form-check-inline me-4">' +
                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio2">' +
                '<label class="form-check-label" for="floatingRadio2">Option 2</label>' +
                '</div>' +
                '<div class="form-check form-check-inline me-4">' +
                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio3">' +
                '<label class="form-check-label" for="floatingRadio3">Option 3</label>' +
                '</div>' +
                '<div class="form-check form-check-inline me-4">' +
                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio4">' +
                '<label class="form-check-label" for="floatingRadio4">Option 4</label>' +
                '</div>' +
                '<div class="form-check form-check-inline me-4">' +
                '<input class="form-check-input" type="radio" name="floatingRadioOptions" id="floatingRadio5">' +
                '<label class="form-check-label" for="floatingRadio5">Option 5</label>' +
                '</div>' +
                '</div>' +
                '<button type="button" class="btn btn-danger btn-sm remove-question ">삭제</button>' +
                '</div>'; // 새로운 div의 내용 정의
            $('#targetArea').append(newDivContent); // "여기다가" 위치에 새로운 div 추가
        });

        // 삭제 버튼 클릭 시 해당 질문 항목 제거
        $(document).on('click', '.remove-question', function() {
            $(this).closest('.question').remove();
        });

        // 기존 코드 계속...
    });

    // 수정, 저장 버튼
    $(document).ready(function() {
        // 기존 코드...

        // 수정 버튼 클릭 시 disabled 속성 토글
        $(document).on('click', '.btn.btn-secondary.modify', function() {
            $('.btn-blue.rounded-circle, .btn-circle.quest').prop('disabled', function(_, val) {
                return !val;
            });

            // // question 클래스를 가진 항목의 textarea 활성화
            // $('.question').each(function() {
            //     $(this).find('textarea').prop('disabled', function(_, val) {
            //         return !val;
            //     });
            //     $(this).find('label').attr('for', function(_, val) {
            //         return val === 'floatingTextareaDisabled' ? 'floatingTextarea' : 'floatingTextareaDisabled';
            //     });
            // });
            // question 클래스를 가진 항목의 textarea 활성화
            $('.question').each(function() {
                $(this).find('textarea').prop('disabled', false);
                $(this).find('label').attr('for', 'floatingTextarea'); // for 속성 복구
            });
        });

        // 저장 버튼 클릭 시 disabled 속성 설정
        $(document).on('click', '.btn.btn-secondary.save', function() {
            $('.btn-blue.rounded-circle, .btn-circle.quest').prop('disabled', true);

            // question 클래스를 가진 항목에 for="floatingTextareaDisabled" 속성 추가
            $('.question').each(function () {
                $(this).find('textarea').prop('disabled', true); // textarea를 비활성화
                $(this).find('label').attr('for', 'floatingTextareaDisabled'); // label의 for 속성 변경

            });
        });

        // 기존 코드 계속...
    });






</script>

</body>
</html>
