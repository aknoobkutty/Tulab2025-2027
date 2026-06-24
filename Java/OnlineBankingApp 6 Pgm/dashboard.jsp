<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    HttpSession currentSession = request.getSession(false);
    if (currentSession == null || currentSession.getAttribute("username") == null) {
        response.sendRedirect("index.jsp?error=Please+login+first");
        return;
    }

    String accountName = (String) currentSession.getAttribute("accountName");
    String username = (String) currentSession.getAttribute("username");
    Double balance = (Double) currentSession.getAttribute("balance");
    String message = request.getParameter("message");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Banking - Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; background: #eef2f7; margin: 0; padding: 0; }
        .page { max-width: 900px; margin: 40px auto; padding: 20px; }
        .card { background: white; border-radius: 8px; padding: 24px; box-shadow: 0 6px 20px rgba(0,0,0,0.06); }
        .header { display: flex; justify-content: space-between; align-items: center; }
        .header h1 { margin: 0; }
        .balance { font-size: 2rem; margin: 16px 0; color: #0078d4; }
        .message { padding: 12px; margin-bottom: 18px; background: #e8f4ff; border: 1px solid #b8dbff; color: #0b3d91; border-radius: 4px; }
        .actions { display: flex; gap: 20px; flex-wrap: wrap; }
        .action-box { flex: 1 1 280px; background: #f8fafc; padding: 18px; border-radius: 8px; border: 1px solid #dfe5ea; }
        label { display: block; margin: 12px 0 6px; color: #444; }
        input[type="number"], input[type="submit"] { width: 100%; padding: 10px; border-radius: 4px; border: 1px solid #bbb; }
        input[type="submit"] { margin-top: 12px; background: #0078d4; color: white; border: none; cursor: pointer; }
        .logout { text-decoration: none; color: #0078d4; }
    </style>
</head>
<body>
    <div class="page">
        <div class="card">
            <div class="header">
                <div>
                    <h1>Welcome, <%= accountName %></h1>
                    <p>Username: <strong><%= username %></strong></p>
                </div>
                <div><a class="logout" href="logout.jsp">Logout</a></div>
            </div>

            <% if (message != null) { %>
                <div class="message"><%= java.net.URLDecoder.decode(message, "UTF-8") %></div>
            <% } %>

            <div class="balance">Available Balance: $<%= String.format("%.2f", balance) %></div>

            <div class="actions">
                <div class="action-box">
                    <h2>Deposit Money</h2>
                    <form action="process.jsp" method="post">
                        <input type="hidden" name="action" value="deposit" />
                        <label for="depositAmount">Amount</label>
                        <input type="number" id="depositAmount" name="amount" min="1" step="0.01" required />
                        <input type="submit" value="Deposit" />
                    </form>
                </div>

                <div class="action-box">
                    <h2>Withdraw Money</h2>
                    <form action="process.jsp" method="post">
                        <input type="hidden" name="action" value="withdraw" />
                        <label for="withdrawAmount">Amount</label>
                        <input type="number" id="withdrawAmount" name="amount" min="1" step="0.01" required />
                        <input type="submit" value="Withdraw" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
