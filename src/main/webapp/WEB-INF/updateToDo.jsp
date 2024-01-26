<%@ page import="com.example.mytodo.model.User" %>
<%@ page import="com.example.mytodo.model.ToDo" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update ToDo</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;0,800;1,300;1,400;1,600;1,700;1,800&amp;display=swap">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.standalone.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootlint/1.1.0/bootlint.min.js"></script>

    <link rel="stylesheet" href="/css/style.css">
    <script src="/js/app.js"></script>
</head>
<body>
<% ToDo toDo = (ToDo) request.getAttribute("toDo");%>

<% User user = null;
    if (session.getAttribute("user") != null) {
        user = (User) session.getAttribute("user");
    }
%>

<%
    List<ToDo> toDos = (List<ToDo>) request.getAttribute("toDos");

%>

<div class="container m-5 p-2 rounded mx-auto bg-light shadow">
    <!-- App title section -->
    <div class="row m-1 p-4">
        <div class="col">
            <div class="p-1 h1 text-primary text-center mx-auto display-inline-block">
                <i class="fa fa-check bg-primary text-white rounded p-2"></i>
                <u>My Todo-s</u>
            </div>
        </div>
    </div>
    <!-- Create todo section -->
    <form action="/updateToDo" method="post">
        <div class="row m-1 p-3">
            <div class="col col-11 mx-auto">
                <input type="hidden" name="id" value="<%=toDo.getId()%>">
                Title:<input type="text" name="title" value="<%=toDo.getTitle()%>"><br>
                Status:<input type="text" name="status" value="<%=toDo.getStatus()%>"><br>
                <input type="submit" value="update">
            </div>
        </div>
    </form>

    <div class="p-2 mx-4 border-black-25 border-bottom"></div>


</div>


</body>
</html>

