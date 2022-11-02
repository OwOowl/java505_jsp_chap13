<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-02
  Time: 오전 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>상세 글 읽기</title>

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>

    <script>
        window.addEventListener("DOMContentLoaded", function() {
            const btnList = document.querySelector(`#btn-list`);
            btnList.addEventListener(`click`, function() {
                history.back();
            });
        });
    </script>
</head>
<body>
<%@ include file="dbconn.jsp"%>
<%
    request.setCharacterEncoding("utf-8");

    String title = "";
    String contents = "";
    String userId = "";
    String createDate = "";
    String updateDate = "";
    int boardCnt = 0;
    // 게시판 목록 페이지에서 넘겨받은 글 번호
    int seq = Integer.parseInt(request.getParameter("seq"));

    PreparedStatement pstmt = null;
    ResultSet rs = null;


    try {
//        조회수 올리기
        String sql = "update board set cnt = cnt + 1 where seq = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, seq);
        pstmt.executeUpdate();


//         선택한 게시글 내용 출력
        sql = "select seq, title, contents, user_id, create_date, update_date, cnt from board where seq = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, seq);
        rs = pstmt.executeQuery();

        if(rs.next()) {
            title = rs.getString("title");
            contents = rs.getString("contents");
            userId = rs.getString("user_Id");
            createDate = rs.getString("create_date");
            updateDate = rs.getString("update_date");
            boardCnt = rs.getInt("cnt");
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

<header>
    <div class="p-5 mb-4 bg-light rounded-3">
        <div class="container-fluid py-4">
            <h1 class="text-center">상세 글 읽기 페이지</h1>
        </div>
    </div>
</header>

<main class="container mt-4">
    <div class="row">
        <form action="boardUpdate_process.jsp" method="post">
        <div class="col-sm-6 mx-auto">
            <div class="form-floating my-3">
                <input type="text" class="form-control" id="seq" name="seq" readonly value="<%=seq%>">
                <label for="seq" class="form-label">Seq</label>
            </div>
            <div class="form-floating my-3">
                <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요"
                    value="<%=title%>">
                <label for="title" class="form-label">title</label>
            </div>
            <div class="form-floating my-3">
                <input type="text" class="form-control" id="user-id" name="userId" placeholder="ID를 입력하세요" disabled
                    value="<%=userId%>">
                <label for="user-id" class="form-label">ID</label>
            </div>
            <div class="form-floating my-3">
                <input type="text" class="form-control" id="create-date" name="createDate" readonly value="<%=createDate%>">
                <label for="create-date" class="form-label">Date</label>
            </div>
            <div class="form-floating my-3">
                <input type="text" class="form-control" id="board-cnt" name="boardCnt" readonly value="<%=boardCnt%>">
                <label for="board-cnt" class="form-label">cnt</label>
            </div>
            <div class="form-floating my-3">
                    <input class="form-control" id="contents" name="contents" placeholder="내용을 입력하세요" value="<%=contents%>">
                    <label for="contents" class="form-label">contents</label>
            </div>
            <div class="my-3 row">
                <div class="col-sm">
                    <button class="btn btn-secondary" type="button" id="btn-list">목록으로</button>
                </div>
                <div class="col-sm d-flex justify-content-end">
<%--                        <input type="hidden" name="seq" value="<%=seq%>">--%>
<%--                        <input type="hidden" name="title" value="<%=title%>">--%>
<%--                        <input type="hidden" name="contents" value="<%=contents%>">--%>
                        <button class="btn btn-warning me-2" type="submit">수정</button>
                    </form>
                    <form action="boardDelete_process.jsp" method="get">
                        <input type="hidden" name="seq" value="<%=seq%>">
                        <button class="btn btn-danger" type="submit">삭제</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<footer class="container-fluid mt-5 p-5 border-top">
    <p class="lead text-muted text-center">made by bitc java 505</p>
</footer>

</body>
</html>
