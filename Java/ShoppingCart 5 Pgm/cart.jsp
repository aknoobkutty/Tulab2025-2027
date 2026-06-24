<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>
    <meta charset="UTF-8">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            min-height: 100vh;
            background: linear-gradient(135deg, #141E30, #243B55);
            color: white;
            padding: 40px 20px;
        }

        .container {
            max-width: 900px;
            margin: auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 35px;
        }

        .header h1 {
            font-size: 38px;
        }

        .header h1 span {
            color: #00f5d4;
        }

        .back-btn {
            text-decoration: none;
            padding: 12px 24px;
            border-radius: 30px;
            color: #141E30;
            font-weight: bold;
            background: linear-gradient(135deg, #00f5d4, #00bbf9);
            box-shadow: 0 10px 25px rgba(0, 245, 212, 0.35);
            transition: 0.3s;
        }

        .back-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 35px rgba(0, 245, 212, 0.55);
        }

        .cart-box {
            background: rgba(255, 255, 255, 0.12);
            border-radius: 24px;
            padding: 30px;
            backdrop-filter: blur(14px);
            border: 1px solid rgba(255, 255, 255, 0.18);
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.35);
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 18px 22px;
            margin-bottom: 18px;
            border-radius: 18px;
            background: rgba(255, 255, 255, 0.14);
            transition: 0.3s;
        }

        .cart-item:hover {
            transform: translateY(-4px);
            background: rgba(255, 255, 255, 0.2);
        }

        .item-left {
            display: flex;
            align-items: center;
            gap: 15px;
            font-size: 20px;
            font-weight: 500;
        }

        .item-icon {
            font-size: 34px;
        }

        .remove-btn {
            padding: 10px 20px;
            border: none;
            border-radius: 25px;
            background: linear-gradient(135deg, #ff416c, #ff4b2b);
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .remove-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 25px rgba(255, 65, 108, 0.45);
        }

        .empty {
            text-align: center;
            padding: 70px 20px;
        }

        .empty-icon {
            font-size: 85px;
            margin-bottom: 20px;
        }

        .empty h2 {
            font-size: 30px;
            margin-bottom: 12px;
            color: #00f5d4;
        }

        .empty p {
            color: #ddd;
            font-size: 17px;
            margin-bottom: 30px;
        }

        .checkout-area {
            text-align: right;
            margin-top: 30px;
        }

        .checkout-btn {
            padding: 14px 34px;
            border: none;
            border-radius: 35px;
            font-size: 16px;
            font-weight: bold;
            color: #141E30;
            background: linear-gradient(135deg, #00f5d4, #00bbf9);
            cursor: pointer;
            box-shadow: 0 10px 25px rgba(0, 245, 212, 0.35);
            transition: 0.3s;
        }

        .checkout-btn:hover {
            transform: translateY(-4px);
            box-shadow: 0 15px 35px rgba(0, 245, 212, 0.55);
        }

        .circle1, .circle2 {
            position: fixed;
            border-radius: 50%;
            background: linear-gradient(135deg, #00f5d4, #00bbf9);
            opacity: 0.18;
            z-index: -1;
        }

        .circle1 {
            width: 220px;
            height: 220px;
            top: -70px;
            left: -80px;
        }

        .circle2 {
            width: 280px;
            height: 280px;
            bottom: -100px;
            right: -90px;
        }

        @media(max-width: 600px) {
            .header {
                flex-direction: column;
                gap: 18px;
                text-align: center;
            }

            .header h1 {
                font-size: 30px;
            }

            .cart-item {
                flex-direction: column;
                gap: 18px;
                text-align: center;
            }

            .checkout-area {
                text-align: center;
            }
        }
    </style>
</head>

<body>

<div class="circle1"></div>
<div class="circle2"></div>

<div class="container">

    <div class="header">
        <h1>🛒 Your <span>Cart</span></h1>
        <a class="back-btn" href="index.jsp">Continue Shopping</a>
    </div>

    <div class="cart-box">

<%
    List<String> cart = (List<String>) session.getAttribute("cart");

    if(cart == null || cart.size() == 0) {
%>

        <div class="empty">
            <div class="empty-icon">🛍️</div>
            <h2>Your Cart is Empty</h2>
            <p>Add some products to your cart and come back here.</p>
            <a class="back-btn" href="index.jsp">Start Shopping</a>
        </div>

<%
    } else {
        int i = 0;

        for(String item : cart) {
            String icon = "🛍️";

            if(item.toLowerCase().contains("laptop")) {
                icon = "💻";
            } else if(item.toLowerCase().contains("mobile")) {
                icon = "📱";
            } else if(item.toLowerCase().contains("headphones")) {
                icon = "🎧";
            } else if(item.toLowerCase().contains("keyboard")) {
                icon = "⌨️";
            }
%>

        <div class="cart-item">
            <div class="item-left">
                <span class="item-icon"><%= icon %></span>
                <span><%= item %></span>
            </div>

            <a href="removeFromCart.jsp?index=<%= i %>">
                <button class="remove-btn">Remove</button>
            </a>
        </div>

<%
            i++;
        }
%>

        <div class="checkout-area">
            <a href="checkout.jsp">
                <button class="checkout-btn">Proceed to Checkout</button>
            </a>
        </div>

<%
    }
%>

    </div>

</div>

</body>
</html>