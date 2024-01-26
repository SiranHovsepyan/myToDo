<%@ page import="com.example.mytodo.model.User" %>
<%@ page import="com.example.mytodo.model.ToDo" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11.01.2024
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home page</title>
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


<% User user = null;
    if (session.getAttribute("user") != null) {
        user = (User) session.getAttribute("user");
%>
<h3>Welcome  <%=user.getName() + " " + user.getSurname()%>!!! <a href="/logout">Logout</a></h3>
<%}%>

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
    <form action="/addToDo" method="post">
        <div class="row m-1 p-3">
            <div class="col col-11 mx-auto">
                <div class="row bg-white rounded shadow-sm p-2 add-todo-wrapper align-items-center justify-content-center">
                    <div class="col">
                        <input class="form-control form-control-lg border-0 add-todo-input bg-transparent rounded"
                               type="text" placeholder="Add new .." name="title">
                    </div>
                    <%--                    <div class="col-auto m-0 px-2 d-flex align-items-center">--%>
                    <%--                        <label class="text-secondary my-2 p-0 px-1 view-opt-label due-date-label d-none">Due date not--%>
                    <%--                            set</label>--%>
                    <%--                        <i class="fa fa-calendar my-2 px-1 text-primary btn due-date-button" data-toggle="tooltip"--%>
                    <%--                           data-placement="bottom" title="Set a Due date"></i>--%>
                    <%--                        <i class="fa fa-calendar-times-o my-2 px-1 text-danger btn clear-due-date-button d-none"--%>
                    <%--                           data-toggle="tooltip" data-placement="bottom" title="Clear Due date"></i>--%>
                    <%--                    </div>--%>
                    <div class="col-auto px-0 mx-0 mr-2">
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <div class="p-2 mx-4 border-black-25 border-bottom"></div>

    <div class="row m-1 p-3">
        <div class="col col-11 mx-auto">
            <table style="width: 100%">
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Created date</th>
                    <th>Finish date</th>
                    <th>User added</th>
                    <th>Status</th>
                    <th>Edit</th>
                    <th>Delete</th>

                </tr>
                <%
                    if (!toDos.isEmpty()) {
                        for (ToDo toDo : toDos) {%>
                <tr>
                    <td><%=toDo.getId()%>
                    </td>
                    <td><%=toDo.getTitle()%>
                    </td>
                    <td><%=toDo.getCreatedDate()%>
                    </td>
                    <td><%=toDo.getFinishDate()%>
                    </td>
                    <td><%=toDo.getUser().getName()%>
                    </td>
                    <td><%=toDo.getStatus()%>
                    </td>
                    <td>
                        <a href="/updateToDo?id=<%=toDo.getId()%>">
                        <h5 class="m-0 p-0 px-2">
                            <i class="fa fa-pencil text-info btn m-0 p-0" data-toggle="tooltip" data-placement="bottom"
                               title="Edit todo"></i>
                        </h5>
                        </a>
                    </td>
                    <td>
                        <a href="/deleteToDo?id=<%=toDo.getId()%>">
                        <h5 class="m-0 p-0 px-2">
                            <i class="fa fa-trash-o text-danger btn m-0 p-0" data-toggle="tooltip"
                               data-placement="bottom" title="Delete todo"></i>
                        </h5>
                        </a>
                    </td>
                </tr>

                <% }
                }
                %>
            </table>
        </div>
    </div>
</div>


</body>
</html>
