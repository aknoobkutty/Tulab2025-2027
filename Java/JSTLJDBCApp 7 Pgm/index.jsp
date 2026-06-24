<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Student CRUD with JSTL and JDBC</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .card { border: 1px solid #ccc; border-radius: 8px; padding: 20px; max-width: 700px; margin: auto; }
        .card h1 { margin-top: 0; }
        .actions a { color: #fff; background: #007acc; padding: 10px 16px; border-radius: 4px; text-decoration: none; }
    </style>
</head>
<body>
<div class="card">
    <h1>Student Management</h1>
    <p>Use the link below to view, add, edit, and delete student records using JSTL for rendering and JDBC for persistence.</p>
    <div class="actions">
        <a href="students?action=list">View Student List</a>
    </div>
</div>
</body>
</html>
