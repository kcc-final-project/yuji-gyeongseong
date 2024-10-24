<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<form>

    <input type="hidden" name="opinionNo" value="${ param.opinionNo }">

    <table border="1" align="center">
        <tr>
            <th>작성자</th>
            <td><input name="memNo"></td>
        </tr>

        <tr>
            <th>내용</th>
            <td><textarea name="content" rows="10" cols="60"></textarea></td>
        </tr>

        <tr>
            <td colspan="2">
                <input type="button" value="등록하기" onclick="send_check(this.form)">
                <input type="button" value="취소"
                       onclick="window.location.href='http://localhost:8082/work-lounge/board-list'">
            </td>
        </tr>
    </table>
</form>

<script>
    function send_check(f) {
        let name = f.memNo.value;
        let content = f.content.value.trim();

        if (name == '') {
            alert("이름은 필수입니다");
            return;
        }

        if (content == '') {
            alert("내용은 한글자 이상 필수입니다");
            return;
        }

        f.action = "board_replycomplete";
        f.method = "post";
        f.submit();
    }
</script>
</body>
</html>