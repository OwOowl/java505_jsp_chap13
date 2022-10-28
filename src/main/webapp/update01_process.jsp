<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-10-28
  Time: 오전 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>DB 사용하기 - statement (update)</title>

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="dbconn.jsp" %>

<%
    request.setCharacterEncoding("utf-8");

    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");
    String userNm = request.getParameter("userName");

    Statement stmt = null;
    ResultSet rs = null;
    try {
        String sql = "SELECT id, password FROM member ";
        sql += "WHERE id = '" + userId + "' ";

//          Statement 객체 생성
        stmt = conn.createStatement();
//          Statement로 DB에 퀴리를 전송. 결과값을 ResultSet으로 받아옴.
        rs = stmt.executeQuery(sql);

        if(rs.next()) { // 쿼리문의 결과값이 존재하는 경우
            String rid = rs.getString("id");
            String rpw = rs.getString("password");

            if(userId.equals(rid) && userPw.equals(rpw)) {  // 사용자가 입력한 비밀번호가 DB에 저장된 password와 일치할 경우
                sql = "UPDATE member SET name = '" + userNm + "' ";
                sql += "WHERE id = '" + userId + "' ";

//                  새로운 Statement 객체 생성
                stmt = conn.createStatement();
//                  DB에 쿼리문 전송하여 저장된 데이터 수정
                stmt.executeUpdate(sql);
                out.println("member 테이블의 데이터를 수정하였습니다.");
            }
            else {  // 사용자가 입력한 비밀번호가 DB에 저장된 password와 일치하지 않을 경우
                out.println("비밀번호가 틀렸습니다.");
            }
        }
        else {  // 쿼리문의 결과값이 존재하지 않는 경우
          out.println("일치하는 사용자가 없습니다.");
        }
    }
    catch (SQLException e) {
        out.println("SQLException : " + e.getMessage());
    }
    finally {
        if(rs != null) { rs.close(); }
        if(stmt != null) { stmt.close(); }
        if(conn != null) { conn.close(); }
    }
%>
</body>
</html>
