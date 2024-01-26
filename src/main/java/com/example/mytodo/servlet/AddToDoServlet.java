package com.example.mytodo.servlet;

import com.example.mytodo.manager.ToDoManager;
import com.example.mytodo.model.ToDo;
import com.example.mytodo.model.User;
import com.example.mytodo.toDoEnum.Status;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(urlPatterns = "/addToDo")
public class AddToDoServlet extends HttpServlet {
    private ToDoManager toDoManager = new ToDoManager();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/home.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        User user  = (User) req.getSession().getAttribute("user");
        toDoManager.add(ToDo.builder()
                .title(title)
                .user(user)
                .createdDate(new Date())
                .status(String.valueOf(Status.NEW))
                .build());
        resp.sendRedirect("/home");
    }
}
