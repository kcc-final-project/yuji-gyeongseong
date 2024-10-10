<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@
        include file="../common/common-noheader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>평가 보고서</title>
    <link
            rel="stylesheet"
            href="/resources/css/work-lounge/evaluation-paper.css"
    />
</head>
<body>
<div class="common-header">
    <div class="container d-flex h-100 pe-0">
        <div
                class="row row-cols-2 justify-content-between align-items-center w-100"
        >
            <div class="col-3 d-flex align-items-center ps-5 h-100"></div>
            <div class="col-3 d-flex align-items-center ps-5 h-100">
                <h2><b>평가보고서</b></h2>
            </div>
            <div class="col-3 d-flex align-items-center ps-5 h-100"></div>
        </div>
    </div>
</div>
<div class="common-main">
    <hr/>
    <div class="container mt-5">
        <table class="table table-bordered">
            <tbody>
            <tr>
                <th class="table-active">사업명</th>
                <th colspan="3">통합공고명</th>
            </tr>
            <tr>
                <th class="table-active">연구개발과제번호</th>
                <td>RS-2024-01</td>
                <th class="table-active">평가일</th>
                <td>2024-10-06</td>
            </tr>
            <tr>
                <th class="table-active">연구개발과제명</th>
                <td colspan="3">Jacob</td>
            </tr>
            <tr>
                <th class="table-active">주관연구개발기관</th>
                <td>상기평</td>
                <th class="table-active">연구책임자</th>
                <td>홍길동</td>
            </tr>
            <tr>
                <th class="table-active">평가위원</th>
                <td>신짱구</td>
                <th class="table-active">소속</th>
                <td>기상청</td>
            </tr>
            <tr>
                <th class="table-active">부서</th>
                <td>개발1팀</td>
                <th class="table-active">직위</th>
                <td>팀장</td>
            </tr>
            <tr>
                <td colspan="4">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a
                                    class="nav-link active"
                                    id="common-tab"
                                    data-toggle="tab"
                                    href="#common"
                                    role="tab"
                                    aria-controls="common"
                                    aria-selected="true"
                            >공통 평가지</a
                            >
                        </li>
                        <li class="nav-item">
                            <a
                                    class="nav-link"
                                    id="skill-tab"
                                    data-toggle="tab"
                                    href="#skill"
                                    role="tab"
                                    aria-controls="skill"
                                    aria-selected="false"
                            >기술분야 평가지 (정보/통신)</a
                            >
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div
                                class="tab-pane fade show active"
                                id="common"
                                role="tabpanel"
                                aria-labelledby="common-tab"
                        >
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <th colspan="5" class="table-active">
                                        1. 연구 주제의 명확성과 중요성은 어떠한가요?
                                    </th>
                                </tr>
                                <tr>
                                    <td class="d-flex justify-content-between">
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score1"
                                                    id="excellent1"
                                                    value="10"
                                            />
                                            <label class="form-check-label" for="excellent1"
                                            >매우 우수함(10점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score1"
                                                    id="superiority1"
                                                    value="8"
                                            />
                                            <label class="form-check-label" for="superiority1"
                                            >우수함(8점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score1"
                                                    id="normal1"
                                                    value="6"
                                            />
                                            <label class="form-check-label" for="normal1"
                                            >보통(6점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score1"
                                                    id="improvement1"
                                                    value="4"
                                            />
                                            <label class="form-check-label" for="improvement1"
                                            >개선 필요(4점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score1"
                                                    id="shortfall1"
                                                    value="2"
                                            />
                                            <label class="form-check-label" for="shortfall1"
                                            >미달(2점)</label
                                            >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" class="table-active">
                                        2. 연구 목표와 가설이 명확하게 설정되었나요?
                                    </th>
                                </tr>
                                <tr>
                                    <td class="d-flex justify-content-between">
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score2"
                                                    id="excellent2"
                                                    value="10"
                                            />
                                            <label class="form-check-label" for="excellent2"
                                            >매우 우수함(10점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score2"
                                                    id="superiority2"
                                                    value="8"
                                            />
                                            <label class="form-check-label" for="superiority2"
                                            >우수함(8점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score2"
                                                    id="normal2"
                                                    value="6"
                                            />
                                            <label class="form-check-label" for="normal2"
                                            >보통(6점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score2"
                                                    id="improvement2"
                                                    value="4"
                                            />
                                            <label class="form-check-label" for="improvement2"
                                            >개선 필요(4점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score2"
                                                    id="shortfall2"
                                                    value="2"
                                            />
                                            <label class="form-check-label" for="shortfall2"
                                            >미달(2점)</label
                                            >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" class="table-active">
                                        3. 연구 방법론이 적절하고 타당한가요?
                                    </th>
                                </tr>
                                <tr>
                                    <td class="d-flex justify-content-between">
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score3"
                                                    id="excellent3"
                                                    value="10"
                                            />
                                            <label class="form-check-label" for="excellent3"
                                            >매우 우수함(10점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score3"
                                                    id="superiority3"
                                                    value="8"
                                            />
                                            <label class="form-check-label" for="superiority3"
                                            >우수함(8점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score3"
                                                    id="normal3"
                                                    value="6"
                                            />
                                            <label class="form-check-label" for="normal3"
                                            >보통(6점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score3"
                                                    id="improvement3"
                                                    value="4"
                                            />
                                            <label class="form-check-label" for="improvement3"
                                            >개선 필요(4점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score3"
                                                    id="shortfall3"
                                                    value="2"
                                            />
                                            <label class="form-check-label" for="shortfall3"
                                            >미달(2점)</label
                                            >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" class="table-active">
                                        4. 연구 계획의 실행 가능성은 얼마나 높은가요?
                                    </th>
                                </tr>
                                <tr>
                                    <td class="d-flex justify-content-between">
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score4"
                                                    id="excellent4"
                                                    value="10"
                                            />
                                            <label class="form-check-label" for="excellent4"
                                            >매우 우수함(10점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score4"
                                                    id="superiority4"
                                                    value="8"
                                            />
                                            <label class="form-check-label" for="superiority4"
                                            >우수함(8점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score4"
                                                    id="normal4"
                                                    value="6"
                                            />
                                            <label class="form-check-label" for="normal4"
                                            >보통(6점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score4"
                                                    id="improvement4"
                                                    value="4"
                                            />
                                            <label class="form-check-label" for="improvement4"
                                            >개선 필요(4점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score4"
                                                    id="shortfall4"
                                                    value="2"
                                            />
                                            <label class="form-check-label" for="shortfall4"
                                            >미달(2점)</label
                                            >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" class="table-active">
                                        5. 연구 계획이 기존 연구와 어떻게 차별화되는지 설명할 수 있나요?
                                    </th>
                                </tr>
                                <tr>
                                    <td class="d-flex justify-content-between">
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score5"
                                                    id="excellent5"
                                                    value="10"
                                            />
                                            <label class="form-check-label" for="excellent5"
                                            >매우 우수함(10점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score5"
                                                    id="superiority5"
                                                    value="8"
                                            />
                                            <label class="form-check-label" for="superiority5"
                                            >우수함(8점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score5"
                                                    id="normal5"
                                                    value="6"
                                            />
                                            <label class="form-check-label" for="normal5"
                                            >보통(6점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score5"
                                                    id="improvement5"
                                                    value="4"
                                            />
                                            <label class="form-check-label" for="improvement5"
                                            >개선 필요(4점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score3"
                                                    id="shortfall5"
                                                    value="2"
                                            />
                                            <label class="form-check-label" for="shortfall5"
                                            >미달(2점)</label
                                            >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" class="table-active">
                                        6. 연구 자원의 배분과 관리 계획이 합리적인가요?
                                    </th>
                                </tr>
                                <tr>
                                    <td class="d-flex justify-content-between">
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score6"
                                                    id="excellent6"
                                                    value="10"
                                            />
                                            <label class="form-check-label" for="excellent6"
                                            >매우 우수함(10점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score6"
                                                    id="superiority6"
                                                    value="8"
                                            />
                                            <label class="form-check-label" for="superiority6"
                                            >우수함(8점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score6"
                                                    id="normal6"
                                                    value="6"
                                            />
                                            <label class="form-check-label" for="normal6"
                                            >보통(6점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score6"
                                                    id="improvement6"
                                                    value="4"
                                            />
                                            <label class="form-check-label" for="improvement6"
                                            >개선 필요(4점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score6"
                                                    id="shortfall6"
                                                    value="2"
                                            />
                                            <label class="form-check-label" for="shortfall6"
                                            >미달(2점)</label
                                            >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" class="table-active">
                                        7. 연구 결과의 잠재적인 영향력과 기여도는 어느 정도인가요?
                                    </th>
                                </tr>
                                <tr>
                                    <td class="d-flex justify-content-between">
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score7"
                                                    id="excellent7"
                                                    value="10"
                                            />
                                            <label class="form-check-label" for="excellent7"
                                            >매우 우수함(10점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score7"
                                                    id="superiority7"
                                                    value="8"
                                            />
                                            <label class="form-check-label" for="superiority7"
                                            >우수함(8점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score7"
                                                    id="normal7"
                                                    value="6"
                                            />
                                            <label class="form-check-label" for="normal7"
                                            >보통(6점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score7"
                                                    id="improvement7"
                                                    value="4"
                                            />
                                            <label class="form-check-label" for="improvement7"
                                            >개선 필요(4점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score7"
                                                    id="shortfall7"
                                                    value="2"
                                            />
                                            <label class="form-check-label" for="shortfall7"
                                            >미달(2점)</label
                                            >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" class="table-active">
                                        8. 예상되는 윤리적 문제나 한계점이 명확히 제시되었나요?
                                    </th>
                                </tr>
                                <tr>
                                    <td class="d-flex justify-content-between">
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score8"
                                                    id="excellent8"
                                                    value="10"
                                            />
                                            <label class="form-check-label" for="excellent8"
                                            >매우 우수함(10점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score8"
                                                    id="superiority8"
                                                    value="8"
                                            />
                                            <label class="form-check-label" for="superiority8"
                                            >우수함(8점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score8"
                                                    id="normal8"
                                                    value="6"
                                            />
                                            <label class="form-check-label" for="normal8"
                                            >보통(6점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score8"
                                                    id="improvement8"
                                                    value="4"
                                            />
                                            <label class="form-check-label" for="improvement8"
                                            >개선 필요(4점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score8"
                                                    id="shortfall8"
                                                    value="2"
                                            />
                                            <label class="form-check-label" for="shortfall8"
                                            >미달(2점)</label
                                            >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" class="table-active">
                                        9. 연구 일정과 단계별 목표가 현실적인가요?
                                    </th>
                                </tr>
                                <tr>
                                    <td class="d-flex justify-content-between">
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score9"
                                                    id="excellent9"
                                                    value="10"
                                            />
                                            <label class="form-check-label" for="excellent9"
                                            >매우 우수함(10점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score9"
                                                    id="superiority9"
                                                    value="8"
                                            />
                                            <label class="form-check-label" for="superiority9"
                                            >우수함(8점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score9"
                                                    id="normal9"
                                                    value="6"
                                            />
                                            <label class="form-check-label" for="normal9"
                                            >보통(6점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score9"
                                                    id="improvement9"
                                                    value="4"
                                            />
                                            <label class="form-check-label" for="improvement9"
                                            >개선 필요(4점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score9"
                                                    id="shortfall9"
                                                    value="2"
                                            />
                                            <label class="form-check-label" for="shortfall9"
                                            >미달(2점)</label
                                            >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" class="table-active">
                                        10. 연구팀의 구성과 각자의 역할이 명확히 정의되었나요?
                                    </th>
                                </tr>
                                <tr>
                                    <td class="d-flex justify-content-between">
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score10"
                                                    id="excellent10"
                                                    value="10"
                                            />
                                            <label class="form-check-label" for="excellent10"
                                            >매우 우수함(10점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score10"
                                                    id="superiority10"
                                                    value="8"
                                            />
                                            <label class="form-check-label" for="superiority10"
                                            >우수함(8점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score10"
                                                    id="normal10"
                                                    value="6"
                                            />
                                            <label class="form-check-label" for="normal10"
                                            >보통(6점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score10"
                                                    id="improvement10"
                                                    value="4"
                                            />
                                            <label class="form-check-label" for="improvement10"
                                            >개선 필요(4점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score10"
                                                    id="shortfall10"
                                                    value="2"
                                            />
                                            <label class="form-check-label" for="shortfall10"
                                            >미달(2점)</label
                                            >
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <h3 class="text-end mt-2 shadow-sm score">
                                총 점수 : <span id="result1">0</span>점
                            </h3>
                            <br>
                            <div class="d-flex mt-5">
                                <div class="col-4"></div>
                                <button
                                        class="btn btn-primary save-button ctm-btn-normal"
                                        onclick="saveSurvey()"
                                >
                                    취소
                                </button>
                                <div class="col-1"></div>
                                <button
                                        class="btn btn-primary edit-button ctm-btn-normal"
                                        onclick="enableEditing()"
                                >
                                    완료
                                </button>
                            </div>
                        </div>
                        <div
                                class="tab-pane fade"
                                id="skill"
                                role="tabpanel"
                                aria-labelledby="skill-tab"
                        >
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <th colspan="5" class="table-active">
                                        1. 연구 주제가 정보/통신 분야에서 얼마나 중요한 문제를 다루고 있나요?
                                    </th>
                                </tr>
                                <tr>
                                    <td class="d-flex justify-content-between">
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score11"
                                                    id="excellent11"
                                                    value="10"
                                            />
                                            <label class="form-check-label" for="excellent11"
                                            >매우 우수함(10점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score11"
                                                    id="superiority11"
                                                    value="8"
                                            />
                                            <label class="form-check-label" for="superiority11"
                                            >우수함(8점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score11"
                                                    id="normal11"
                                                    value="6"
                                            />
                                            <label class="form-check-label" for="normal11"
                                            >보통(6점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score11"
                                                    id="improvement11"
                                                    value="4"
                                            />
                                            <label class="form-check-label" for="improvement11"
                                            >개선 필요(4점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score11"
                                                    id="shortfall11"
                                                    value="2"
                                            />
                                            <label class="form-check-label" for="shortfall11"
                                            >미달(2점)</label
                                            >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" class="table-active">
                                        2. 연구 목표와 가설이 정보/통신 기술의 발전에 기여할 수 있는지 설명해 주실래요?
                                    </th>
                                </tr>
                                <tr>
                                    <td class="d-flex justify-content-between">
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score12"
                                                    id="excellent12"
                                                    value="10"
                                            />
                                            <label class="form-check-label" for="excellent12"
                                            >매우 우수함(10점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score12"
                                                    id="superiority12"
                                                    value="8"
                                            />
                                            <label class="form-check-label" for="superiority12"
                                            >우수함(8점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score12"
                                                    id="normal12"
                                                    value="6"
                                            />
                                            <label class="form-check-label" for="normal12"
                                            >보통(6점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score12"
                                                    id="improvement12"
                                                    value="4"
                                            />
                                            <label class="form-check-label" for="improvement12"
                                            >개선 필요(4점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score12"
                                                    id="shortfall12"
                                                    value="2"
                                            />
                                            <label class="form-check-label" for="shortfall12"
                                            >미달(2점)</label
                                            >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" class="table-active">
                                        3. 연구 방법론이 최신 정보/통신 기술과 잘 맞아 떨어지는가요?
                                    </th>
                                </tr>
                                <tr>
                                    <td class="d-flex justify-content-between">
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score13"
                                                    id="excellent13"
                                                    value="10"
                                            />
                                            <label class="form-check-label" for="excellent13"
                                            >매우 우수함(10점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score13"
                                                    id="superiority13"
                                                    value="8"
                                            />
                                            <label class="form-check-label" for="superiority13"
                                            >우수함(8점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score13"
                                                    id="normal13"
                                                    value="6"
                                            />
                                            <label class="form-check-label" for="normal13"
                                            >보통(6점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score13"
                                                    id="improvement13"
                                                    value="4"
                                            />
                                            <label class="form-check-label" for="improvement13"
                                            >개선 필요(4점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score13"
                                                    id="shortfall13"
                                                    value="2"
                                            />
                                            <label class="form-check-label" for="shortfall13"
                                            >미달(2점)</label
                                            >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" class="table-active">
                                        4. 연구 계획의 실현 가능성과 예산 사용 계획이 현실적인가요?
                                    </th>
                                </tr>
                                <tr>
                                    <td class="d-flex justify-content-between">
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score14"
                                                    id="excellent14"
                                                    value="10"
                                            />
                                            <label class="form-check-label" for="excellent14"
                                            >매우 우수함(10점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score14"
                                                    id="superiority14"
                                                    value="8"
                                            />
                                            <label class="form-check-label" for="superiority14"
                                            >우수함(8점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score14"
                                                    id="normal14"
                                                    value="6"
                                            />
                                            <label class="form-check-label" for="normal14"
                                            >보통(6점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score14"
                                                    id="improvement14"
                                                    value="4"
                                            />
                                            <label class="form-check-label" for="improvement14"
                                            >개선 필요(4점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score14"
                                                    id="shortfall14"
                                                    value="2"
                                            />
                                            <label class="form-check-label" for="shortfall14"
                                            >미달(2점)</label
                                            >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" class="table-active">
                                        5. 연구에서 예상되는 정보/통신 기술의 혁신성은 어느 정도인가요?
                                    </th>
                                </tr>
                                <tr>
                                    <td class="d-flex justify-content-between">
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score15"
                                                    id="excellent15"
                                                    value="10"
                                            />
                                            <label class="form-check-label" for="excellent15"
                                            >매우 우수함(10점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score15"
                                                    id="superiority15"
                                                    value="8"
                                            />
                                            <label class="form-check-label" for="superiority15"
                                            >우수함(8점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score15"
                                                    id="normal15"
                                                    value="6"
                                            />
                                            <label class="form-check-label" for="normal15"
                                            >보통(6점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score15"
                                                    id="improvement15"
                                                    value="4"
                                            />
                                            <label class="form-check-label" for="improvement15"
                                            >개선 필요(4점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score15"
                                                    id="shortfall15"
                                                    value="2"
                                            />
                                            <label class="form-check-label" for="shortfall15"
                                            >미달(2점)</label
                                            >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" class="table-active">
                                        6. 연구 결과가 정보/통신 산업에 미칠 수 있는 잠재적인 영향력은 무엇인가요?
                                    </th>
                                </tr>
                                <tr>
                                    <td class="d-flex justify-content-between">
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score16"
                                                    id="excellent16"
                                                    value="10"
                                            />
                                            <label class="form-check-label" for="excellent16"
                                            >매우 우수함(10점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score16"
                                                    id="superiority16"
                                                    value="8"
                                            />
                                            <label class="form-check-label" for="superiority16"
                                            >우수함(8점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score16"
                                                    id="normal16"
                                                    value="6"
                                            />
                                            <label class="form-check-label" for="normal16"
                                            >보통(6점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score16"
                                                    id="improvement16"
                                                    value="4"
                                            />
                                            <label class="form-check-label" for="improvement16"
                                            >개선 필요(4점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score16"
                                                    id="shortfall16"
                                                    value="2"
                                            />
                                            <label class="form-check-label" for="shortfall16"
                                            >미달(2점)</label
                                            >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" class="table-active">
                                        7. 데이터 수집 및 분석 방법이 정보/통신 표준에 부합한가요?
                                    </th>
                                </tr>
                                <tr>
                                    <td class="d-flex justify-content-between">
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score17"
                                                    id="excellent17"
                                                    value="10"
                                            />
                                            <label class="form-check-label" for="excellent17"
                                            >매우 우수함(10점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score17"
                                                    id="superiority17"
                                                    value="8"
                                            />
                                            <label class="form-check-label" for="superiority17"
                                            >우수함(8점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score17"
                                                    id="normal17"
                                                    value="6"
                                            />
                                            <label class="form-check-label" for="normal17"
                                            >보통(6점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score17"
                                                    id="improvement17"
                                                    value="4"
                                            />
                                            <label class="form-check-label" for="improvement17"
                                            >개선 필요(4점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score17"
                                                    id="shortfall17"
                                                    value="2"
                                            />
                                            <label class="form-check-label" for="shortfall17"
                                            >미달(2점)</label
                                            >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" class="table-active">
                                        8. 연구의 윤리적 고려 사항과 개인정보 보호 대책이 명확히 제시되었나요?
                                    </th>
                                </tr>
                                <tr>
                                    <td class="d-flex justify-content-between">
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score18"
                                                    id="excellent18"
                                                    value="10"
                                            />
                                            <label class="form-check-label" for="excellent18"
                                            >매우 우수함(10점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score18"
                                                    id="superiority18"
                                                    value="8"
                                            />
                                            <label class="form-check-label" for="superiority8"
                                            >우수함(8점)</label
                                            >
                                        </div>

                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score18"
                                                    id="normal18"
                                                    value="6"
                                            />
                                            <label class="form-check-label" for="normal8"
                                            >보통(6점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score18"
                                                    id="improvement18"
                                                    value="4"
                                            />
                                            <label class="form-check-label" for="improvement18"
                                            >개선 필요(4점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score18"
                                                    id="shortfall18"
                                                    value="2"
                                            />
                                            <label class="form-check-label" for="shortfall18"
                                            >미달(2점)</label
                                            >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" class="table-active">
                                        9. 연구 일정이 정보/통신 기술의 빠른 발전 속도를 충분히 반영하고 있나요?
                                    </th>
                                </tr>
                                <tr>
                                    <td class="d-flex justify-content-between">
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score19"
                                                    id="excellent19"
                                                    value="10"
                                            />
                                            <label class="form-check-label" for="excellent19"
                                            >매우 우수함(10점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score19"
                                                    id="superiority19"
                                                    value="8"
                                            />
                                            <label class="form-check-label" for="superiority19"
                                            >우수함(8점)</label>
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score19"
                                                    id="normal19"
                                                    value="6"
                                            />
                                            <label class="form-check-label" for="normal19"
                                            >보통(6점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score19"
                                                    id="improvement19"
                                                    value="4"
                                            />
                                            <label class="form-check-label" for="improvement19"
                                            >개선 필요(4점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score19"
                                                    id="shortfall19"
                                                    value="2"
                                            />
                                            <label class="form-check-label" for="shortfall19"
                                            >미달(2점)</label
                                            >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" class="table-active">
                                        10. 연구팀의 역량과 각자의 역할이 정보/통신 분야에서 적절하게 배분되어 있나요?
                                    </th>
                                </tr>
                                <tr>
                                    <td class="d-flex justify-content-between">
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score20"
                                                    id="excellent20"
                                                    value="10"
                                            />
                                            <label class="form-check-label" for="excellent20"
                                            >매우 우수함(10점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score20"
                                                    id="superiority20"
                                                    value="8"
                                            />
                                            <label class="form-check-label" for="superiority20"
                                            >우수함(8점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score20"
                                                    id="normal20"
                                                    value="6"
                                            />
                                            <label class="form-check-label" for="normal20"
                                            >보통(6점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score20"
                                                    id="improvement20"
                                                    value="4"
                                            />
                                            <label class="form-check-label" for="improvement20"
                                            >개선 필요(4점)</label
                                            >
                                        </div>
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="score20"
                                                    id="shortfall20"
                                                    value="2"
                                            />
                                            <label class="form-check-label" for="shortfall20"
                                            >미달(2점)</label
                                            >
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <h3 class="text-end mt-2 shadow-sm score">
                                총 점수 : <span id="result2">0</span>점
                            </h3>
                            <br>
                            <div class="d-flex mt-5">
                                <div class="col-4"></div>
                                <button
                                        class="btn btn-primary save-button ctm-btn-normal"
                                        onclick="saveSurvey()"
                                >
                                    취소
                                </button>
                                <div class="col-1"></div>
                                <button
                                        class="btn btn-primary edit-button ctm-btn-normal"
                                        onclick="enableEditing()"
                                >
                                    완료
                                </button>
                            </div>

                        </div>
                        <br>
                    </div>
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="/resources/js/work-lounge/evaluation-paper.js"></script>
</div>
</body>
</html>
