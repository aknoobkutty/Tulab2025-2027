<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Online Exam</title>
    <style>
        body { font-family: Arial, sans-serif; background: #eef2f7; color: #222; margin: 0; padding: 0; }
        .container { max-width: 900px; margin: 40px auto; background: #fff; padding: 32px; border-radius: 12px; box-shadow: 0 16px 40px rgba(0,0,0,0.08); }
        h1 { margin-top: 0; }
        .question { margin-bottom: 28px; padding: 18px; border: 1px solid #dce1e8; border-radius: 8px; background: #fbfcff; }
        .question h2 { font-size: 1.05rem; margin: 0 0 12px; }
        .option { margin: 8px 0; }
        .submit-button { margin-top: 24px; padding: 14px 22px; font-size: 1rem; color: white; background: #007acc; border: none; border-radius: 6px; cursor: pointer; }
        .submit-button:hover { background: #005fa3; }
    </style>
</head>
<body>
<div class="container">
    <h1>Online Examination</h1>
    <p>Answer all questions and click <strong>Submit</strong> to see your score.</p>

    <c:choose>
        <c:when test="${empty questions}">
            <p>No exam questions are available. Please check the database setup.</p>
        </c:when>
        <c:otherwise>
            <form action="exam" method="post">
                <c:forEach var="question" items="${questions}" varStatus="status">
                    <div class="question">
                        <h2>Question ${status.index + 1}: <c:out value="${question.text}" /></h2>
                        <c:forEach var="entry" items="${question.options}">
                            <div class="option">
                                <label>
                                    <input type="radio" name="q_${question.id}" value="${entry.key}" />
                                    <strong><c:out value="${entry.key}" />.</strong> <c:out value="${entry.value}" />
                                </label>
                            </div>
                        </c:forEach>
                    </div>
                </c:forEach>
                <button type="submit" class="submit-button">Submit Exam</button>
            </form>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
