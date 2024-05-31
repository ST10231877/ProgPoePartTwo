<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&family=Merriweather:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: url('/Images/Background2.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .container {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 90%;
            max-width: 400px;
            text-align: center;
        }
        .container h2 {
            color: #4caf50;
            margin-bottom: 30px;
            font-weight: 700;
            font-size: 44px;
            font-family: 'Merriweather', serif;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
        }
        .container label {
            display: block;
            margin: 15px 0 5px;
            text-align: left;
            font-weight: 500;
            font-size: 14px;
        }
        .container input[type="text"],
        .container input[type="password"] {
            width: calc(100% - 20px);
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            background-color: #f9f9f9;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }
        .container input[type="text"]:focus,
        .container input[type="password"]:focus {
            border-color: #4caf50;
            outline: none;
        }
        .btnLogin {
            margin-top: 20px;
        }
        .btnAnimation {
            position: relative;
            display: inline-block;
            padding: 14px 28px;
            font-size: 16px;
            font-weight: 500;
            color: seagreen;
            background: transparent;
            border: 2px solid seagreen;
            border-radius: 50px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            text-transform: uppercase;
            transition: background-color 0.3s, color 0.3s;
        }
        .btnAnimation:hover {
            background-color: seagreen;
            color: white;
        }
        .container .message {
            margin-top: 20px;
            color: red;
            font-weight: 500;
        }
        .container .social-buttons {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }
        .social-button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 50px;
            height: 50px;
            margin: 0 10px;
            border: 2px solid #ddd;
            border-radius: 50%;
            cursor: pointer;
            font-size: 20px;
            font-weight: 500;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease;
            position: relative;
        }
        .social-button i {
            vertical-align: middle;
        }
        .social-button .tooltip {
            visibility: hidden;
            width: 120px;
            background-color: #333;
            color: #fff;
            text-align: center;
            border-radius: 6px;
            padding: 5px 0;
            position: absolute;
            z-index: 1;
            bottom: 100%; 
            left: 50%;
            margin-left: -60px;
            opacity: 0;
            transition: opacity 0.3s;
        }
        .social-button:hover .tooltip {
            visibility: visible;
            opacity: 1;
        }
        .social-button.google {
            color: #db4437;
            border-color: #db4437;
        }
        .social-button.google:hover {
            background-color: #db4437;
            color: white;
        }
        .social-button.apple {
            color: #000;
            border-color: #000;
        }
        .social-button.apple:hover {
            background-color: #000;
            color: white;
        }
        .social-button.facebook {
            color: #3b5998;
            border-color: #3b5998;
        }
        .social-button.facebook:hover {
            background-color: #3b5998;
            color: white;
        }
        .container .register-prompt {
            margin-top: 20px;
            font-size: 14px;
        }
        .container .register-prompt a {
            color: #4caf50;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }
        .container .register-prompt a:hover {
            color: #388e3c;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
            justify-content: center;
            align-items: center;
        }
        .modal-content {
            background-color: #fff;
            padding: 20px;
            border: 1px solid #888;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 400px;
            text-align: center;
        }
        .modal-content h2 {
            margin: 0;
            font-size: 24px;
            color: #333;
        }
        .modal-content label {
            margin-top: 15px;
            font-weight: 500;
        }
        .modal-content input[type="text"],
        .modal-content input[type="password"] {
            width: calc(100% - 20px);
            padding: 12px;
            margin-top: 10px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            background-color: #f9f9f9;
        }
        .modal-content .btnModal {
            background-color: #4caf50;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            font-weight: 500;
            transition: background-color 0.3s ease;
            margin-top: 20px;
        }
        .modal-content .btnModal:hover {
            background-color: #45a049;
        }
        .modal-content .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .modal-content .close:hover,
        .modal-content .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .modal-content.google {
            border-color: #db4437;
        }
        .modal-content.google .btnModal {
            background-color: #db4437;
        }
        .modal-content.google .btnModal:hover {
            background-color: #c3362a;
        }
        .modal-content.apple {
            border-color: #000;
        }
        .modal-content.apple .btnModal {
            background-color: #000;
        }
        .modal-content.apple .btnModal:hover {
            background-color: #333;
        }
        .modal-content.facebook {
            border-color: #3b5998;
        }
        .modal-content.facebook .btnModal {
            background-color: #3b5998;
        }
        .modal-content.facebook .btnModal:hover {
            background-color: #2d4373;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <div class="container">
            <h2>Login</h2>
            <asp:Label ID="lblUsername" runat="server" Text="Username:" AssociatedControlID="txtUsername"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>

            <asp:Label ID="lblPassword" runat="server" Text="Password:" AssociatedControlID="txtPassword"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>

            <div class="btnLogin">
                <asp:Button ID="btnLogin" runat="server" CssClass="btnAnimation" Text="Login" OnClick="btnLogin_Click" />
            </div>

            <asp:Label ID="lblError" runat="server" CssClass="message"></asp:Label>

            <div class="social-buttons">
                <a href="#" class="social-button google" onclick="showModal('google')"><i class="fab fa-google"></i>
                    <span class="tooltip">Login with Google</span>
                </a>
                <a href="#" class="social-button apple" onclick="showModal('apple')"><i class="fab fa-apple"></i>
                    <span class="tooltip">Login with Apple</span>
                </a>
                <a href="#" class="social-button facebook" onclick="showModal('facebook')"><i class="fab fa-facebook-f"></i>
                    <span class="tooltip">Login with Facebook</span>
                </a>
            </div>

            <div class="register-prompt">
                Not registered yet? <a href="Register.aspx">Register here</a>.
            </div>
        </div>
    </form>

    <!-- Modals -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2 id="modalTitle">Login with Google</h2>
            <label for="modalUsername">Username:</label>
            <input type="text" id="modalUsername" name="modalUsername" />
            <label for="modalPassword">Password:</label>
            <input type="password" id="modalPassword" name="modalPassword" />
            <button class="btnModal" onclick="submitModal()">Login</button>
        </div>
    </div>

    <script>
        function submitModal() {
            var username = document.getElementById("modalUsername").value;
            var password = document.getElementById("modalPassword").value;

            if (username && password) {
                PageMethods.ModalLogin(username, password, onLoginSuccess, onLoginError);
            } else {
                alert("Please fill all fields");
            }
        }

        function onLoginSuccess(result) {
            if (result) {
                if (result === "farmer") {
                    window.location.href = "FarmersDashboard.aspx";
                } else if (result === "employee") {
                    window.location.href = "EmployeesDashboard.aspx";
                }
            } else {
                alert("Invalid username or password.");
            }
        }

        function onLoginError(error) {
            alert("An error occurred: " + error.get_message());
        }

        function showModal(platform) {
            const modal = document.getElementById("myModal");
            const modalContent = modal.querySelector('.modal-content');
            const title = document.getElementById("modalTitle");
            const btnModal = modal.querySelector('.btnModal');

            modalContent.className = 'modal-content ' + platform;
            title.innerText = "Login with " + platform.charAt(0).toUpperCase() + platform.slice(1);

            modal.style.display = "flex";
        }

        function closeModal() {
            document.getElementById("myModal").style.display = "none";
        }

        window.onclick = function (event) {
            if (event.target == document.getElementById("myModal")) {
                closeModal();
            }
        }
    </script>
</body>
</html>
