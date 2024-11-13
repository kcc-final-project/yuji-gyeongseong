<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../common/common-noheader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>게시글</title>
    <link rel="stylesheet" href="/resources/css/work-lounge/sharing-opinion.css"/>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>
    <link
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            rel="stylesheet"
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
                <h2><b>게시글</b></h2>
            </div>
            <div class="col-3 d-flex align-items-center ps-5 h-100"></div>
        </div>
    </div>
</div>

<div class="common-main">
    ${boardList}
    <hr/>
    <div class="mt-4">
        <table class="table table-bordered">
            <tbody>
            <tr class="text-center domain">
                <td>번호</td>
                <td>내용</td>
                <td>작성자</td>
                <td>작성일</td>
                <td>조회수</td>
            </tr>
            <c:forEach items="${boardList}" var="board" varStatus="status">
                <tr class="blue">
                    <td class="text-center"><c:out value="${board.opinionNo}"/></td>
                    <td>
                        <c:forEach begin="1" end="${board.depth}">&nbsp&nbsp</c:forEach>
                        <c:if test="${board.depth ne 0}">
                            ㄴ
                        </c:if>
                        <c:if test="${ board.delInfo ne -1 }">
                            <a href="/work-lounge/board_detail/${board.opinionNo}"><c:out value="${board.content}"/></a>
                        </c:if>

                        <c:if test="${ board.delInfo eq -1 }">
                            <font color="gray">${ board.content }</font>
                        </c:if>
                    </td>
                    <td class="text-center"><c:out value="${board.memNo}"/></td>
                    <c:if test="${ board.delInfo ne -1 }">
                        <td class="text-center"><c:out value="${fn:split(board.createdAt, ' ')[0]}"/></td>
                    </c:if>
                    <c:if test="${ board.delInfo eq -1 }">
                        <td align="center">unknown</td>
                    </c:if>
                    <td class="text-center"><c:out value="${board.readhit}"/></td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="5" style="text-align: center">
                    &lt; 1 2 3 &gt;
                </td>
            </tr>

            <tr>
                <td colspan="5" style="text-align: center">
                    <button class="btn ctm-btn-back mb-3"
                            onclick="window.location.href='/work-lounge/board_insert'">새글쓰기
                    </button>
                </td>
            </tr>

            </tbody>
        </table>
        <div class="d-flex justify-content-center">
            <button class="btn ctm-btn-back mb-3"
                    onclick="window.location.href='/work-lounge/evaluation-table'">뒤로
            </button>
        </div>
    </div>
    <script src="/resources/js/work-lounge/sharing-opinion.js"></script>
</div>
</body>
</html>