<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-10-28
  Time: 오후 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
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
<%@ include file="dbconn.jsp"%>

<%
    request.setCharacterEncoding("utf-8");

    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");

    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        String sql = "SELECT id, password FROM member WHERE id = ?";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();
        if(rs.next()) {
            String rid = rs.getString("id");
            String rpw = rs.getString("password");

            if(userId.equals(rid) && userPw.equals(rpw)) {
                sql = "DELETE FROM member WHERE id = ? and password = ? ";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, userId);
                pstmt.setString(2, userPw);
                pstmt.executeUpdate();
                out.println("member 테이블 데이터를 삭제하였습니다.");
            }
            else {
              out.println("비밀번호가 틀렸습니다.");
            }
        }
        else {
          out.println("일치하는 사용자가 없습니다.");
        }
    }
    catch (SQLException e) {
        out.println("SQLException : " + e.getMessage());
    }
    finally {
        if(rs != null) { rs.close(); }
        if(pstmt != null) { pstmt.close(); }
        if(conn != null) { conn.close(); }
    }
%>
</body>
</html>
