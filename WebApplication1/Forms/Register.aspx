<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&family=Merriweather:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
    body {
        font-family: 'Roboto', sans-serif;
        background: url('/Images/Background1.jpg') no-repeat center center fixed;
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
    .container input[type="radio"] {
        display: none;
    }
    .container .radio-label {
        display: inline-block;
        padding: 10px 20px;
        margin: 5px;
        border: 1px solid #ddd;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease, border-color 0.3s ease, box-shadow 0.3s ease;
    }
    .container input[type="radio"]:checked + .radio-label {
        background-color: #4caf50;
        color: white;
        border-color: #4caf50;
        box-shadow: 0 0 10px rgba(76, 175, 80, 0.5);
    }
    .container input[type="submit"] {
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
    }
    .container input[type="submit"]:hover {
        background-color: #45a049;
    }
    .container .message {
        margin-top: 20px;
        color: red;
        font-weight: 500;
    }
    .container .account-prompt {
        margin-top: 20px;
        font-size: 14px;
    }
    .container .account-prompt a {
        color: #4caf50;
        text-decoration: none;
        font-weight: 500;
        transition: color 0.3s;
    }
    .container .account-prompt a:hover {
        color: #388e3c;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Register</h2>
            <asp:Label ID="lblUsername" runat="server" Text="Username:" AssociatedControlID="txtUsername"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>

            <asp:Label ID="lblPassword" runat="server" Text="Password:" AssociatedControlID="txtPassword"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>

            <div class="role-selection">
                <input type="radio" id="roleFarmer" name="Role" runat="server" />
                <label for="roleFarmer" class="radio-label">Farmer</label>

                <input type="radio" id="roleEmployee" name="Role" runat="server" />
                <label for="roleEmployee" class="radio-label">Employee</label>
                <br />
                <br />
            </div>

            <asp:Button ID="btnRegister" runat="server" CssClass="btnAnimation" Text="Register" OnClick="btnRegister_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

            <div class="account-prompt">
                Already have an account? <a href="Login.aspx">Login here</a>.
            </div>

            <div class="social-buttons">
                <a href="#" class="social-button google" onclick="showModal('google')"><i class="fab fa-google"></i>
                    <span class="tooltip">Sign up with Google</span>
                </a>
                <a href="#" class="social-button apple" onclick="showModal('apple')"><i class="fab fa-apple"></i>
                    <span class="tooltip">Sign up with Apple</span>
                </a>
                <a href="#" class="social-button facebook" onclick="showModal('facebook')"><i class="fab fa-facebook-f"></i>
                    <span class="tooltip">Sign up with Facebook</span>
                </a>
            </div>
        </div>
    </form>

    <!-- Modal code -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2 id="modalTitle">Sign Up with Google</h2>
            <label for="modalUsername">Username:</label>
            <input type="text" id="modalUsername" name="modalUsername" />
            <label for="modalPassword">Password:</label>
            <input type="password" id="modalPassword" name="modalPassword" />
            <label for="modalRole">Role:</label>
            <div class="role-selection">
                <input type="radio" id="modalRoleFarmer" name="modalRole" />
                <label for="modalRoleFarmer" class="radio-label">Farmer</label>
                <input type="radio" id="modalRoleEmployee" name="modalRole" />
                <label for="modalRoleEmployee" class="radio-label">Employee</label>
            </div>
            <button class="btnModal" onclick="submitModal()">Sign Up</button>
        </div>
    </div>

    <script>
        function showModal(platform) {
            document.getElementById("modalTitle").innerText = "Sign Up with " + platform.charAt(0).toUpperCase() + platform.slice(1);
            document.getElementById("myModal").style.display = "flex";
        }

        function closeModal() {
            document.getElementById("myModal").style.display = "none";
        }

        function submitModal() {
            var username = document.getElementById("modalUsername").value;
            var password = document.getElementById("modalPassword").value;
            var role = document.getElementById("modalRoleFarmer").checked ? "Farmer" : (document.getElementById("modalRoleEmployee").checked ? "Employee" : "");

            if (username && password && role) {
                alert("Signed up successfully with " + username + " as " + role);
                closeModal();
            } else {
                alert("Please fill all fields");
            }
        }

        window.onclick = function(event) {
            if (event.target == document.getElementById("myModal")) {
                closeModal();
            }
        }
    </script>
</body>
</html>
