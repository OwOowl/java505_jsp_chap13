<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-10-28
  Time: 오후 2:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시판</title>

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="dbconn.jsp" %>


<header>
    <div class="p-5 mb-4 bg-light rounded-3">
        <div class="container-fluid py-4">
            <h1 class="text-center">게시물 리스트 페이지</h1>
        </div>
    </div>
</header>


<main class="container mt-4">
    <div class="row">
        <div class="col-sm">
            <table class="table table-hover table-striped">
                <thead class="text-center">
                <tr>
                    <th>글번호</th>
                    <th>글제목</th>
                    <th>작성자</th>
                    <th>등록시간</th>
                    <th>조회수</th>
                </tr>
                </thead>
                <tbody class="text-center">

                <%
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    try {
                        String sql = "select seq, title, user_id, create_date, cnt from board where delete_yn = 'N'" +
                                "ORDER BY seq DESC;";
                        pstmt = conn.prepareStatement(sql);
                        rs = pstmt.executeQuery();

                        while(rs.next()) {
                            int seq = rs.getInt("seq");
                            String title = rs.getString("title");
                            String userId = rs.getString("user_id");
                            String createDt = rs.getString("create_date");
                            int cnt = rs.getInt("cnt");
                %>
                <tr>
                    <td><%=seq%></td>
                    <td><a href="boardDetail2.jsp?seq=<%=seq%>"><%=title%></a></td>
                    <td><%=userId%></td>
                    <td><%=createDt%></td>
                    <td><%=cnt%></td>
                </tr>
                <%
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
                </tbody>
            </table>
            <div class="d-flex justify-content-end">
                <a href="boardWrite.jsp" class="btn btn-primary">글쓰기</a>
            </div>
        </div>
    </div>
</main>


<footer class="container-fluid mt-5 p-5 border-top">
    <p class="lead text-muted text-center">made by bitc java 505</p>
</footer>

</body>
</html>
