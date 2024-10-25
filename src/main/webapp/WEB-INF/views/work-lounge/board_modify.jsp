<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정하기</title>
    <script>
        function modifyBoard() {
            const opinionNo = document.getElementById('opinionNo').value;
            const content = document.getElementById('content').value;

            if (!content || content.trim() === "") {
                alert('내용을 입력해 주세요.');
                return;
            }

            fetch(`/work-lounge/board_modify/${opinionNo}`, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({content})
            })
                .then(response => {
                    if (response.ok) {
                        alert('게시글이 수정되었습니다.');
                        window.location.href = '/work-lounge/board-list';
                    } else {
                        return response.text().then(text => {
                            alert(`수정 중 오류가 발생했습니다: ${text}`);
                        });
                    }
                })
                .catch(error => {
                    alert('서버와의 연결에 문제가 발생했습니다.');
                    console.error('Error:', error);
                });
        }
    </script>
</head>
<body>
<h2>게시글 수정하기</h2>
<form onsubmit="event.preventDefault(); modifyBoard();">
    <input type="hidden" id="opinionNo" value="${board.opinionNo}">
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
                <textarea id="content" rows="10" cols="50">${board.content}</textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="button" value="수정 완료" onclick="modifyBoard()">
                <input type="button" value="취소" onclick="window.location.href='/work-lounge/board-list'">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
