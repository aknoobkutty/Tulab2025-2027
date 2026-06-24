package com.examapp.controller;

import com.examapp.dao.QuestionDAO;
import com.examapp.model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class ExamController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Question> questions = QuestionDAO.findAll();
            request.setAttribute("questions", questions);
            request.getRequestDispatcher("exam.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("error", "Unable to load exam questions: " + e.getMessage());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Question> questions = QuestionDAO.findAll();
            int score = 0;
            for (Question question : questions) {
                String answer = request.getParameter("q_" + question.getId());
                question.setUserAnswer(answer);
                if (answer != null && answer.equals(question.getCorrectOption())) {
                    score++;
                }
            }

            int total = questions.size();
            boolean passed = total == 0 ? false : score >= Math.ceil(total * 0.6);

            request.setAttribute("questions", questions);
            request.setAttribute("score", score);
            request.setAttribute("total", total);
            request.setAttribute("passed", passed);
            request.getRequestDispatcher("result.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("error", "Unable to score exam: " + e.getMessage());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
