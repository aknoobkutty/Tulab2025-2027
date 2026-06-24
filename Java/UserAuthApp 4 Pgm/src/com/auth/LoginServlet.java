package com.auth;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection con = DBConnection.getConnection()) {
            if (con == null) {
                out.println("<h2>Database connection failed.</h2>");
                out.println("<a href='login.html'>Back</a>");
                return;
            }

            String query = "SELECT * FROM users WHERE email=? AND password=?";

            try (PreparedStatement ps = con.prepareStatement(query)) {
                ps.setString(1, email);
                ps.setString(2, password);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        HttpSession session = request.getSession();

                        session.setAttribute("name", rs.getString("name"));
                        session.setAttribute("email", rs.getString("email"));
                        session.setAttribute("city", rs.getString("city"));

                        response.sendRedirect("welcome.jsp");
                    } else {
                        out.println("<h2>Invalid Email or Password!</h2>");
                        out.println("<a href='login.html'>Try Again</a>");
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
            out.println("<a href='login.html'>Back</a>");
        }
    }
}