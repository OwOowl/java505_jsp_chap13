<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-10-28
  Time: 오전 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>DB 사용하기</title>

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="dbconn.jsp"%>

<%
    request.setCharacterEncoding("utf-8");

    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");
    String userName = request.getParameter("userName");

    Statement stmt = null;
    try {
//        소스코드 쿼리문 끝에 공백을 넣지 않으면 쿼리문이 서로 붙어서 출력되어 오류가 날 수 있음
        String sql = "INSERT INTO member(id, password, name) ";
        sql += "VALUES ('" + userId + "', '" + userPw + "', '" + userName + "')";

        stmt = conn.createStatement();
        stmt.executeUpdate(sql);
        out.println("member 테이블에 데이터를 추가하였습니다.");
    }
    catch (SQLException e){
        out.println("member 테이블에 데이터 추가를 실패하였습니다.");
        out.println("SQLException : " + e.getMessage());
    }
    finally {
        if(stmt != null) { stmt.close(); }
        if(conn != null) { conn.close(); }
    }
%>
</body>
</html>
