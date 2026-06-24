<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Exam Result</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f7fb; color: #222; margin: 0; padding: 0; }
        .container { max-width: 900px; margin: 40px auto; background: #fff; padding: 32px; border-radius: 12px; box-shadow: 0 16px 40px rgba(0,0,0,0.08); }
        h1 { margin-top: 0; }
        .summary { padding: 18px; background: #eef6ff; border-radius: 10px; margin-bottom: 24px; }
        .summary strong { color: #007acc; }
        .question { margin-bottom: 22px; padding: 18px; border: 1px solid #d9e2ec; border-radius: 10px; }
        .correct { border-color: #2a7f62; background: #ecf8f1; }
        .incorrect { border-color: #b64141; background: #f9e6e6; }
        .option-label { display: block; margin: 6px 0; }
        .answer { margin-top: 10px; }
        .return-link { display: inline-block; margin-top: 20px; color: #fff; background: #007acc; padding: 12px 20px; text-decoration: none; border-radius: 6px; }
    </style>
</head>
<body>
<div class="container">
    <h1>Exam Result</h1>
    <div class="summary">
        <p>Your score: <strong>${score}</strong> out of <strong>${total}</strong>.</p>
        <p>Status: <strong><c:choose>
            <c:when test="${passed}">Passed</c:when>
            <c:otherwise>Needs Improvement</c:otherwise>
        </c:choose></strong></p>
    </div>

    <c:forEach var="question" items="${questions}" varStatus="status">
        <div class="question ${question.correctOption == question.userAnswer ? 'correct' : 'incorrect'}">
            <h2>Question ${status.index + 1}: <c:out value="${question.text}" /></h2>
            <p class="answer"><strong>Your answer:</strong>
                <c:choose>
                    <c:when test="${empty question.userAnswer}">No answer provided</c:when>
                    <c:otherwise><c:out value="${question.userAnswer}" /> - <c:out value="${question.options[question.userAnswer]}" /></c:otherwise>
                </c:choose>
            </p>
            <p class="answer"><strong>Correct answer:</strong> <c:out value="${question.correctOption}" /> - <c:out value="${question.options[question.correctOption]}" /></p>
        </div>
    </c:forEach>

    <a class="return-link" href="exam">Retake Exam</a>
</div>
</body>
</html>
