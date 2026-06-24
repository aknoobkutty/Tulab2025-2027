<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #141E30, #243B55);
            overflow: hidden;
        }

        .container {
            width: 90%;
            max-width: 950px;
            min-height: 520px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 50px;
            border-radius: 25px;
            background: rgba(255, 255, 255, 0.12);
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.35);
            backdrop-filter: blur(14px);
            border: 1px solid rgba(255, 255, 255, 0.18);
            position: relative;
        }

        .left {
            width: 55%;
            color: white;
            text-align: left;
        }

        .left h1 {
            font-size: 48px;
            margin-bottom: 20px;
            line-height: 1.2;
        }

        .left h1 span {
            color: #00f5d4;
        }

        .left p {
            font-size: 18px;
            color: #dcdcdc;
            line-height: 1.7;
            margin-bottom: 25px;
        }

        .features {
            margin-top: 20px;
        }

        .features div {
            margin: 14px 0;
            padding: 12px 18px;
            width: fit-content;
            border-radius: 30px;
            background: rgba(255, 255, 255, 0.15);
            color: #fff;
            font-size: 16px;
        }

        .right {
            width: 38%;
            text-align: center;
            background: white;
            padding: 35px 25px;
            border-radius: 22px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.25);
        }

        .cart-icon {
            font-size: 80px;
            margin-bottom: 20px;
            animation: float 2.5s ease-in-out infinite;
        }

        .right h2 {
            color: #243B55;
            margin-bottom: 15px;
            font-size: 28px;
        }

        .right p {
            color: #666;
            font-size: 15px;
            margin-bottom: 25px;
            line-height: 1.6;
        }

        a {
            text-decoration: none;
        }

        button {
            padding: 14px 32px;
            font-size: 17px;
            font-weight: bold;
            color: #141E30;
            background: linear-gradient(135deg, #00f5d4, #00bbf9);
            border: none;
            border-radius: 35px;
            cursor: pointer;
            transition: 0.3s;
            box-shadow: 0 10px 25px rgba(0, 245, 212, 0.35);
        }

        button:hover {
            transform: translateY(-4px) scale(1.03);
            box-shadow: 0 15px 35px rgba(0, 245, 212, 0.55);
        }

        .circle1, .circle2 {
            position: absolute;
            border-radius: 50%;
            background: linear-gradient(135deg, #00f5d4, #00bbf9);
            opacity: 0.25;
            z-index: -1;
        }

        .circle1 {
            width: 180px;
            height: 180px;
            top: -60px;
            left: -60px;
        }

        .circle2 {
            width: 240px;
            height: 240px;
            bottom: -90px;
            right: -80px;
        }

        @keyframes float {
            0% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-12px);
            }
            100% {
                transform: translateY(0);
            }
        }

        @media(max-width: 768px) {
            .container {
                flex-direction: column;
                padding: 30px;
                text-align: center;
            }

            .left, .right {
                width: 100%;
                text-align: center;
            }

            .left {
                margin-bottom: 30px;
            }

            .left h1 {
                font-size: 36px;
            }

            .features div {
                margin: 12px auto;
            }
        }
    </style>
</head>

<body>

<div class="container">

    <div class="circle1"></div>
    <div class="circle2"></div>

    <div class="left">
        <h1>Welcome to <span>Smart Cart</span></h1>

        <p>
            Discover amazing products, add your favorites to the cart,
            and enjoy a smooth shopping experience with a modern interface.
        </p>

        <div class="features">
            <div>💻 Latest Laptops & Gadgets</div>
            <div>⚡ Fast and Easy Shopping</div>
            <div>🛒 Simple Cart Management</div>
        </div>
    </div>

    <div class="right">
        <div class="cart-icon">🛒</div>

        <h2>Start Shopping</h2>

        <p>
            Browse products, add items to your cart,
            and place your order easily.
        </p>

        <a href="index.jsp">
            <button>Explore Now</button>
        </a>
    </div>

</div>

</body>
</html>