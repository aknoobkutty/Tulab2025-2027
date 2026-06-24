package com.examapp.dao;

import com.examapp.model.Question;
import com.examapp.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO {
    private static final String SELECT_ALL = "SELECT id, text, option_a, option_b, option_c, option_d, correct_option FROM questions ORDER BY id";

    public static List<Question> findAll() throws SQLException {
        List<Question> questions = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Question question = new Question();
                question.setId(resultSet.getInt("id"));
                question.setText(resultSet.getString("text"));
                question.getOptions().put("A", resultSet.getString("option_a"));
                question.getOptions().put("B", resultSet.getString("option_b"));
                question.getOptions().put("C", resultSet.getString("option_c"));
                question.getOptions().put("D", resultSet.getString("option_d"));
                question.setCorrectOption(resultSet.getString("correct_option"));
                questions.add(question);
            }
        }
        return questions;
    }
}
