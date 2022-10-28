<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-10-28
  Time: 오전 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>DB 사용하기 - PreparedStatement (update)</title>

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
    String userNm = request.getParameter("userName");

    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        String sql = "SELECT id, password FROM member ";
        sql += "WHERE id = ? ";

//        PreparedStatement 객체 생성 시 사용할 sql 문을 적용
        pstmt = conn.prepareStatement(sql);
//        필요한 위치의 데이터 변경
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();

        if(rs.next()) {
            String rid = rs.getString("id");
            String rpw = rs.getString("password");

            if (userId.equals(rid) && userPw.equals(rpw)) {
                sql = "UPDATE member SET name = ? ";
                sql += "WHERE id = ? ";

                pstmt = conn.prepareStatement(sql);
//                sql 문의 ? 변수 위치에 데이터 변경
                pstmt.setString(1, userNm);
                pstmt.setString(2, userId);
                pstmt.executeUpdate();

                out.println("member 테이블의 정보를 수정하였습니다.");
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
