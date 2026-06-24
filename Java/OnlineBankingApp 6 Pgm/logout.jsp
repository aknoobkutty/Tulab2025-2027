<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    HttpSession currentSession = request.getSession(false);
    if (currentSession != null) {
        currentSession.invalidate();
    }
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logged Out</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f4f9; margin: 0; padding: 0; }
        .container { width: 400px; margin: 120px auto; padding: 24px; background: white; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.08); text-align: center; }
        a { display: inline-block; margin-top: 18px; padding: 10px 20px; background: #0078d4; color: white; text-decoration: none; border-radius: 4px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Logged Out</h1>
        <p>Your banking session has ended.</p>
        <a href="index.jsp">Login Again</a>
    </div>
</body>
</html>
