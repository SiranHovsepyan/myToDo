package com.example.mytodo.servlet;

import com.example.mytodo.manager.ToDoManager;
import com.example.mytodo.model.ToDo;
import com.example.mytodo.toDoEnum.Status;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(urlPatterns = "/updateToDo")

public class UpdateToDoServlet extends HttpServlet {

    private ToDoManager toDoManager = new ToDoManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        ToDo toDo = toDoManager.getToDoById(id);
        req.setAttribute("toDo",toDo);
        req.getRequestDispatcher("/WEB-INF/updateToDo.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        toDoManager.update(ToDo.builder()
                        .id(id)
                        .title(title)
                        .finishDate(new Date())
                        .status(String.valueOf(Status.DONE))
                .build());
        resp.sendRedirect("/home");
    }
}
