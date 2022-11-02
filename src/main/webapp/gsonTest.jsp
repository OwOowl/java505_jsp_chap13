<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-02
  Time: 오후 3:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="com.bitc.jspchap13.Student" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
</head>
<body>


<%
    Gson gson = new Gson();
    Student stu = new Student(1001, "홍길동");

    String jsonStr = gson.toJson(stu);
    out.print(jsonStr + "<br>");


    JsonObject jobj = new JsonObject();
    jobj.addProperty("id", 1002);
    jobj.addProperty("name", "아이유");
    out.print(jobj + "<br>");


    jsonStr = "{\"id\": 1003, \"name\": \"유재석\"}";
    Student stu1 = gson.fromJson(jsonStr, Student.class);
    out.print(stu1.getId());
    out.print(stu1.getName());

%>
</body>
</html>
