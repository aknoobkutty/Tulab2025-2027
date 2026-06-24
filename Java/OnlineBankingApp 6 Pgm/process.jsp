<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String action = request.getParameter("action");

    if ("login".equals(action)) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if ("customer1".equals(username) && "bank123".equals(password)) {
            session.setAttribute("username", username);
            session.setAttribute("accountName", "John Doe");
            session.setAttribute("balance", 5000.00);
            response.sendRedirect("dashboard.jsp");
            return;
        }

        response.sendRedirect("index.jsp?error=Invalid+username+or+password");
        return;
    }

    if (session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp?error=Please+login+first");
        return;
    }

    double balance = (Double) session.getAttribute("balance");
    String message;

    String amountText = request.getParameter("amount");
    double amount = 0;
    try {
        amount = Double.parseDouble(amountText);
    } catch (Exception e) {
        response.sendRedirect("dashboard.jsp?message=" + URLEncoder.encode("Enter a valid amount", "UTF-8"));
        return;
    }

    if (amount <= 0) {
        response.sendRedirect("dashboard.jsp?message=" + URLEncoder.encode("Amount must be greater than zero", "UTF-8"));
        return;
    }

    if ("deposit".equals(action)) {
        balance += amount;
        session.setAttribute("balance", balance);
        message = "Deposit successful. New balance: $" + String.format("%.2f", balance);
    } else if ("withdraw".equals(action)) {
        if (amount > balance) {
            message = "Withdrawal failed: insufficient funds.";
        } else {
            balance -= amount;
            session.setAttribute("balance", balance);
            message = "Withdrawal successful. New balance: $" + String.format("%.2f", balance);
        }
    } else {
        message = "Unknown banking action.";
    }

    response.sendRedirect("dashboard.jsp?message=" + URLEncoder.encode(message, "UTF-8"));
%>
