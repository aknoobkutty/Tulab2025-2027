<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Students List</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background: #007acc; color: white; }
        a.button { padding: 8px 14px; background: #007acc; color: white; text-decoration: none; border-radius: 4px; }
        a.button.delete { background: #d9534f; }
    </style>
</head>
<body>
    <h1>Student Records</h1>
    <p><a class="button" href="students?action=new">Add New Student</a></p>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty students}">
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.name}</td>
                        <td>${student.department}</td>
                        <td>${student.email}</td>
                        <td>
                            <a class="button" href="students?action=edit&id=${student.id}">Edit</a>
                            <a class="button delete" href="students?action=delete&id=${student.id}" onclick="return confirm('Delete this student?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="5">No students found.</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
    <p><a href="index.jsp">Back to Home</a></p>
</body>
</html>
