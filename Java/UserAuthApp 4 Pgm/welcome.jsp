<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String name = (String) session.getAttribute("name");
    String email = (String) session.getAttribute("email");
    String city = (String) session.getAttribute("city");

    if (name == null) {
        response.sendRedirect("login.html");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
    <style>
        body {
            font-family: Arial;
            background-color: #e8f5e9;
            text-align: center;
            margin-top: 80px;
        }

        .box {
            background: white;
            width: 400px;
            margin: auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
        }

        a {
            text-decoration: none;
            background: red;
            color: white;
            padding: 10px 25px;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<div class="box">
    <h2>Welcome, <%= name %>!</h2>

    <p>This is your personalized dashboard.</p>

    <h3>Your Details</h3>
    <p><b>Email:</b> <%= email %></p>
    <p><b>City:</b> <%= city %></p>

    <br>
    <a href="LogoutServlet">Logout</a>
</div>

</body>
</html>