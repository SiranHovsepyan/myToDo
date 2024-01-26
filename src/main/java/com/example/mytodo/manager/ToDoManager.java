package com.example.mytodo.manager;

import com.example.mytodo.db.DBConnectionProvider;
import com.example.mytodo.model.ToDo;
import com.example.mytodo.model.User;
import com.example.mytodo.toDoEnum.Status;
import com.example.mytodo.util.DateUtil;

import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

public class ToDoManager {
    private Connection connection = DBConnectionProvider.getInstance().getConnection();
    private UserManager userManager = new UserManager();

    public void add(ToDo toDo) {
        String sql = "INSERT INTO todo(title,created_date,user_id,status) VALUES(?,?,?,?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, toDo.getTitle());
            preparedStatement.setString(2, DateUtil.convertDateToString(toDo.getCreatedDate()));
            preparedStatement.setInt(3, toDo.getUser().getId());
            preparedStatement.setString(4, toDo.getStatus() );
            preparedStatement.executeUpdate();
            ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
            if (generatedKeys.next()) {
                int id = generatedKeys.getInt(1);
                toDo.setId(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void delete(int id) {
        String sql = "DELETE FROM todo WHERE id=" + id;
        try (Statement statement = connection.createStatement()) {
            statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(ToDo toDo) {
        String sql = "UPDATE todo SET title=?,finish_date=?,status=? WHERE id=?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, toDo.getTitle());
            preparedStatement.setString(2, DateUtil.convertDateToString(toDo.getFinishDate()));
            preparedStatement.setString(3, toDo.getStatus());
            preparedStatement.setInt(4,toDo.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public ToDo getToDoById(int id) {
        String sql = "SELECT * FROM todo WHERE id=" + id;
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(sql);
            if (resultSet.next()) {
                return ToDo.builder()
                        .id(resultSet.getInt("id"))
                        .title(resultSet.getString("title"))
                        .createdDate(resultSet.getDate("created_date"))
                        .finishDate(resultSet.getDate("finish_date"))
                        .user(userManager.getUserById(resultSet.getInt("user_id")))
                        .status(resultSet.getString("status"))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public List<ToDo> getToDos() {
        String sql = "SELECT * FROM todo";
        List<ToDo> toDos = new ArrayList<>();
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                toDos.add(ToDo.builder()
                        .id(resultSet.getInt("id"))
                        .title(resultSet.getString("title"))
                        .createdDate(resultSet.getDate("created_date"))
                        .finishDate(resultSet.getDate("finish_date"))
                        .user(userManager.getUserById(resultSet.getInt("user_id")))
                        .status(resultSet.getString("status"))
                        .build());
            }
        } catch (SQLException  e) {
            e.printStackTrace();
        }
        return toDos;
    }



}
