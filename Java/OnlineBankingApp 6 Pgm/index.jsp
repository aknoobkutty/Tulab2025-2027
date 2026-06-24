<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Banking - Login</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f4f9; margin: 0; padding: 0; }
        .container { width: 360px; margin: 100px auto; padding: 24px; background: white; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.08); }
        h1 { margin-top: 0; color: #333; }
        label { display: block; margin: 12px 0 4px; color: #555; }
        input[type="text"], input[type="password"], input[type="submit"] { width: 100%; padding: 10px; border-radius: 4px; border: 1px solid #ccc; }
        input[type="submit"] { margin-top: 18px; background: #0078d4; color: white; border: none; cursor: pointer; }
        .error { color: #b00020; margin-bottom: 16px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Online Banking</h1>
        <!-- <p>Use <strong>customer1</strong> / <strong>bank123</strong> to log in.</p> -->
        <% if (error != null) { %>
            <div class="error"><%= error %></div>
        <% } %>
        <form action="process.jsp" method="post">
            <input type="hidden" name="action" value="login" />
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required />

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required />

            <input type="submit" value="Login" />
        </form>
    </div>
</body>
</html>
