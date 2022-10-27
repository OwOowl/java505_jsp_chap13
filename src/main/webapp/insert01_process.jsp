<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-10-27
  Time: 오후 4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>DB 사용하기 - 테이블에 데이터 추가</title>

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
</head>
<body>
<%
    Connection conn = null;
    Statement stmt = null;

    try {
        String url = "jdbc:mysql://localhost:3306/javadb";
        String user = "test1";
        String password = "java505";

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        request.setCharacterEncoding("utf-8");

        String userId = request.getParameter("userId");
        String userPw = request.getParameter("userPw");
        String userName = request.getParameter("userName");

        String sql = "INSERT INTO member(id, password, name)";
        sql += "VALUES('" + userId + "', '" + userPw + "', '" + userName + "')";

        stmt = conn.createStatement();
        stmt.executeUpdate(sql);
        out.println("Member 테이블에 추가가 성공했습니다.");

    } catch (SQLException e) {
        out.println("Member 테이블 추가가 실패했습니다.");
        out.println("SQLException : " + e.getMessage());

    } finally {
        if(stmt != null) { stmt.close(); }
        if(conn != null) { conn.close(); }
    }
%>
</body>
</html>
