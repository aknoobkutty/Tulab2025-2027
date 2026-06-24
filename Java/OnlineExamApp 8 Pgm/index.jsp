<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Online Examination System</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f2f5f7; color: #333; margin: 0; padding: 0; }
        .container { max-width: 800px; margin: 80px auto; background: #fff; padding: 32px; border-radius: 12px; box-shadow: 0 16px 40px rgba(0,0,0,0.08); }
        h1 { margin-top: 0; }
        .intro { line-height: 1.7; }
        .actions a { display: inline-block; margin-top: 24px; padding: 12px 22px; background: #007acc; color: white; text-decoration: none; border-radius: 6px; }
        .actions a:hover { background: #005fa3; }
    </style>
</head>
<body>
<div class="container">
    <h1>Online Examination System</h1>
    <p class="intro">This sample application demonstrates an online exam flow using JSTL for view rendering and JDBC for persistence. The question bank is loaded from a relational database, then the user submits answers and receives an immediate score report.</p>
    <ul>
        <li>Uses JSTL `<c:forEach>` to render question lists</li>
        <li>Uses JDBC to load questions from MySQL</li>
        <li>Implements a servlet controller for request routing</li>
    </ul>
    <div class="actions">
        <a href="exam">Start Exam</a>
    </div>
</div>
</body>
</html>
