<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>${formTitle}</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; }
        form { max-width: 600px; }
        label { display: block; margin-top: 14px; }
        input { width: 100%; padding: 8px; box-sizing: border-box; margin-top: 6px; }
        button { margin-top: 18px; padding: 10px 18px; background: #007acc; color: white; border: none; border-radius: 4px; }
        .actions a { margin-left: 12px; text-decoration: none; color: #007acc; }
    </style>
</head>
<body>
    <h1>${formTitle}</h1>
    <form action="students" method="post">
        <input type="hidden" name="action" value="${formAction}" />
        <label for="id">Student ID</label>
        <input id="id" name="id" type="number" value="${student.id}"<c:if test="${formAction == 'update'}"> readonly</c:if> required />

        <label for="name">Name</label>
        <input id="name" name="name" type="text" value="${student.name}" required />

        <label for="department">Department</label>
        <input id="department" name="department" type="text" value="${student.department}" required />

        <label for="email">Email</label>
        <input id="email" name="email" type="email" value="${student.email}" required />

        <button type="submit">Save</button>
        <span class="actions"><a href="students">Cancel</a></span>
    </form>
</body>
</html>
