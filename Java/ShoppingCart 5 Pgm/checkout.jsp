<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    session.removeAttribute("cart");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <meta charset="UTF-8">

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #141E30, #243B55);
            color: white;
            text-align: center;
            padding-top: 100px;
        }

        .box {
            background: rgba(255, 255, 255, 0.15);
            width: 420px;
            margin: auto;
            padding: 35px;
            border-radius: 18px;
            box-shadow: 0 0 25px rgba(0,0,0,0.4);
        }

        h1 {
            color: #00f5d4;
            margin-bottom: 15px;
        }

        p {
            font-size: 18px;
            margin-bottom: 30px;
        }

        a {
            text-decoration: none;
        }

        button {
            padding: 12px 25px;
            border: none;
            border-radius: 25px;
            background: #00f5d4;
            color: #141E30;
            font-weight: bold;
            cursor: pointer;
            font-size: 15px;
        }

        button:hover {
            background: #00bbf9;
        }
    </style>
</head>

<body>

<div class="box">
    <h1>Order Placed Successfully!</h1>
    <p>🚚 Your product will be delivered soon.</p>

    <a href="home.jsp">
        <button>Continue Shopping</button>
    </a>
</div>

</body>
</html>