<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-10-28
  Time: 오후 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%-- 문제 2) PreparedStatement를 사용하여 delete를 실행하는 프로그램을 작성
          delete02.jsp 파일은 사용자 id와 비밀번호를 입력받는 form으로 생성
          delete02_process.jsp 파일은 사용자가 입력한 내용을 바탕으로 sql 쿼리를 실행
          입력한 id가 없으면 '지정한 사용자가 없습니다.' 문구 출력
          비밀번호가 틀리면 '비밀번호가 틀렸습니다.' 문구 출력--%>
<!DOCTYPE html>
<html>
<head>
    <title>DB 사용하기 - PreparedStatement (delete)</title>

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
</head>
<body>
<form action="delete02_process.jsp" method="post">
    <label for="user-id">아이디</label>
    <input type="text" id="user-id" name="userId"><br>
    <label for="user-pw">비밀번호</label>
    <input type="password" id="user-pw" name="userPw"><br>
    <button type="submit">삭제</button>
</form>
</body>
</html>
