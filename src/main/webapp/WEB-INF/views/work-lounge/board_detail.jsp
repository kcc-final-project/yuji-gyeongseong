<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세보기</title>
    <script>
        function deleteOpinion(opinionNo) {
            if (confirm('정말로 삭제하시겠습니까?')) {
                fetch(`/work-lounge/board_delete/${opinionNo}`, {
                    method: 'PUT',
                })
                    .then(response => {
                        if (response.redirected) {
                            window.location.href = response.url;
                        }
                    })
                    .catch(error => {
                        alert('삭제 중 오류가 발생했습니다.');
                        console.error('Error:', error);
                    });
            }
        }

    </script>
</head>
<body>
<form>
    <input type="hidden" name="opinionNo" value="${board.opinionNo}">
    <table border="1" align="center">
        <tr>
            <th>작성자</th>
            <td>${board.memName}</td>
        </tr>

        <tr>
            <th>작성일</th>
            <td>${board.createdAt}</td>
        </tr>

        <tr>
            <th>내용</th>
            <td>
                <pre>${board.content}</pre>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <input type="button" value="목록보기"
                       onclick="window.location.href='/work-lounge/board-list'">
                <input type="button" value="댓글"
                       onclick="window.location.href='${pageContext.request.contextPath}/work-lounge/board_reply?opinionNo=${board.opinionNo}'">
                <input type="button" value="삭제" onclick="deleteOpinion(${board.opinionNo})">
            </td>
        </tr>
    </table>
</form>
</body>
</html>