<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication1.Forms.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Agri-Energy Connect</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&family=Merriweather:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: url('/Images/Background4.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            position: relative;
            z-index: 1;
        }
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: -1;
        }
        .header {
            background-color: rgba(255, 255, 255, 0.9);
            width: 100%;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            animation: fadeInDown 1s ease-out;
        }
        .header h1 {
            color: #4caf50;
            margin: 0;
            font-size: 40px;
            font-family: 'Merriweather', serif;
            letter-spacing: 1px;
        }
        .content {
            flex: 1;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            width: 100%;
            padding: 20px;
            box-sizing: border-box;
        }
        .main-content, .sidebar {
            animation: fadeInUp 1s ease-out;
        }
        .main-content {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 60%;
            max-width: 800px;
            text-align: center;
            margin: 20px;
        }
        .sidebar {
            width: 20%;
            max-width: 250px;
            margin: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: left;
            transition: box-shadow 0.3s;
        }
        .sidebar:hover {
            box-shadow: 0 0 20px rgba(76, 175, 80, 0.6);
        }
        .sidebar h2 {
            color: #4caf50;
            font-size: 22px;
            margin-bottom: 15px;
            width: 100%;
            text-align: center;
            font-weight: 700;
        }
        .sidebar p {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 15px;
            text-align: center;
            font-weight: 500;
        }
        .main-content h2 {
            color: #4caf50;
            margin-bottom: 20px;
            font-weight: 700;
            font-size: 28px;
            font-family: 'Merriweather', serif;
        }
        .main-content p {
            margin-bottom: 20px;
            line-height: 1.6;
            font-size: 18px;
            font-weight: 500;
        }
        .stats {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }
        .stat {
            background-color: #f0f9f0;
            border-radius: 10px;
            padding: 20px;
            width: 30%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            font-weight: 700;
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: box-shadow 0.3s;
        }
        .stat:hover {
            box-shadow: 0 0 20px rgba(76, 175, 80, 0.6);
        }
        .stat i {
            font-size: 40px;
            color: #4caf50;
            margin-bottom: 10px;
        }
        .stat h3 {
            color: #4caf50;
            font-size: 24px;
            margin: 0;
        }
        .stat p {
            font-size: 20px;
            margin: 10px 0 0;
            font-weight: 500;
        }
        .btn-container {
            display: flex;
            justify-content: space-around;
            margin-top: 30px;
        }
        .btnAnimation {
            display: inline-block;
            padding: 14px 28px;
            font-size: 18px;
            font-weight: 700;
            color: seagreen;
            background: transparent;
            border: 2px solid seagreen;
            border-radius: 50px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            text-transform: uppercase;
            transition: background-color 0.3s, color 0.3s;
            width: 21%;
            letter-spacing: 1px;
        }
        .btnAnimation:hover {
            background-color: seagreen;
            color: white;
        }
        .footer {
            background-color: rgba(255, 255, 255, 0.9);
            width: 100%;
            padding: 10px;
            text-align: center;
            box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.1);
            position: relative;
            bottom: 0;
            animation: fadeInUp 1s ease-out;
        }
        .footer p {
            margin: 0;
            font-size: 14px;
            font-weight: 500;
        }
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Agri-Energy Connect</h1>
    </div>
    <div class="content">
        <div class="sidebar">
            <h2>Our Mission</h2>
            <p>To foster sustainable and innovative agricultural practices through the integration of green energy solutions.</p>
            <h2>Our Goals</h2>
            <p>Connecting over 10,000 farmers with cutting-edge green energy technologies.</p>
            <h2>Awards</h2>
            <p>Recipient of the 2023 Green Innovation Award for outstanding contribution to sustainable farming.</p>
            <h2>Our Vision</h2>
            <p>To become the leading platform for integrating sustainable energy solutions in agriculture globally.</p>
            <h2>Testimonials</h2>
            <p>"Agri-Energy Connect has revolutionized our farming practices!" - Farmer Joe</p>
        </div>
        <div class="main-content">
            <h2>Connecting Agriculture and Green Energy</h2>
            <p>Welcome to Agri-Energy Connect, where we bridge the gap between agriculture and green energy technology providers. Our mission is to foster sustainable and innovative solutions for a better future.</p>
            <div class="stats">
                <div class="stat">
                    <i class="fas fa-seedling"></i>
                    <h3>10,000+</h3>
                    <p>Farmers Connected</p>
                </div>
                <div class="stat">
                    <i class="fas fa-leaf"></i>
                    <h3>500+</h3>
                    <p>Green Projects</p>
                </div>
                <div class="stat">
                    <i class="fas fa-solar-panel"></i>
                    <h3>1,000+</h3>
                    <p>Energy Solutions</p>
                </div>
            </div>
            <div class="btn-container">
                <a href="Login.aspx" class="btnAnimation">Login</a>
                <a href="Register.aspx" class="btnAnimation">Register</a>
            </div>
        </div>
        <div class="sidebar">
            <h2>Contact Us</h2>
            <p>Email: info@agrienergyconnect.com</p>
            <p>Phone: +1 234 567 890</p>
            <p>Address: 123 Green Energy Road, Sustainability City, Earth</p>
            <h2>Follow Us</h2>
            <p><i class="fab fa-facebook"></i> Facebook</p>
            <p><i class="fab fa-twitter"></i> Twitter</p>
            <p><i class="fab fa-linkedin"></i> LinkedIn</p>
        </div>
    </div>
    <div class="footer">
        <p>&copy; 2024 Agri-Energy Connect. All rights reserved.</p>
    </div>
</body>
</html>
