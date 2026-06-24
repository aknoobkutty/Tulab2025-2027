package com.studentapp.controller;

import com.studentapp.dao.StudentDAO;
import com.studentapp.model.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class StudentController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentDAO dao;

    @Override
    public void init() {
        dao = new StudentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "new":
                    showForm(request, response, new Student(), "Create Student", "create");
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteStudent(request, response);
                    break;
                default:
                    listStudents(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if ("create".equals(action)) {
                createStudent(request, response);
            } else if ("update".equals(action)) {
                updateStudent(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/students");
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listStudents(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Student> students = dao.listAll();
        request.setAttribute("students", students);
        RequestDispatcher dispatcher = request.getRequestDispatcher("students.jsp");
        dispatcher.forward(request, response);
    }

    private void showForm(HttpServletRequest request, HttpServletResponse response, Student student, String title, String action) throws ServletException, IOException {
        request.setAttribute("student", student);
        request.setAttribute("formTitle", title);
        request.setAttribute("formAction", action);
        RequestDispatcher dispatcher = request.getRequestDispatcher("student-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Student existing = dao.getById(id);
        if (existing == null) {
            response.sendRedirect(request.getContextPath() + "/students");
            return;
        }
        showForm(request, response, existing, "Edit Student", "update");
    }

    private void createStudent(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        Student student = new Student();
        student.setId(Integer.parseInt(request.getParameter("id")));
        student.setName(request.getParameter("name"));
        student.setDepartment(request.getParameter("department"));
        student.setEmail(request.getParameter("email"));
        dao.addStudent(student);
        response.sendRedirect(request.getContextPath() + "/students");
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        Student student = new Student();
        student.setId(Integer.parseInt(request.getParameter("id")));
        student.setName(request.getParameter("name"));
        student.setDepartment(request.getParameter("department"));
        student.setEmail(request.getParameter("email"));
        dao.updateStudent(student);
        response.sendRedirect(request.getContextPath() + "/students");
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.deleteStudent(id);
        response.sendRedirect(request.getContextPath() + "/students");
    }
}
