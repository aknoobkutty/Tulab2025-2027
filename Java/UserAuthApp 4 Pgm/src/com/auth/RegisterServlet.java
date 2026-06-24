package com.auth;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String city = request.getParameter("city");

        try (Connection con = DBConnection.getConnection()) {
            if (con == null) {
                out.println("<h2>Database connection failed.</h2>");
                out.println("<a href='register.html'>Back</a>");
                return;
            }

            String query = "INSERT INTO users(name, email, password, city) VALUES (?, ?, ?, ?)";

            try (PreparedStatement ps = con.prepareStatement(query)) {
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, password);
                ps.setString(4, city);

                int result = ps.executeUpdate();

                if (result > 0) {
                    out.println("<h2>Registration Successful!</h2>");
                    out.println("<a href='login.html'>Click here to Login</a>");
                } else {
                    out.println("<h2>Registration Failed!</h2>");
                    out.println("<a href='register.html'>Try Again</a>");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
            out.println("<a href='register.html'>Back</a>");
        }
    }
}