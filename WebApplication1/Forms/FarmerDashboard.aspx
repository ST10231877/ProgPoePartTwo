<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FarmerDashboard.aspx.cs" Inherits="WebApplication1.FarmerDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Farmer Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&family=Merriweather:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: url('/Images/Background3.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
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
        .container input[type="date"],
        .container select {
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
        .container input[type="date"]:focus,
        .container select:focus {
            border-color: #4caf50;
            outline: none;
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
            width: 100%;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Farmer Dashboard</h2>
            <asp:Label ID="lblName" runat="server" Text="Product Name:" AssociatedControlID="txtName"></asp:Label>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>

            <asp:Label ID="lblCategory" runat="server" Text="Category:" AssociatedControlID="ddlCategory"></asp:Label>
            <asp:DropDownList ID="ddlCategory" runat="server">
                <asp:ListItem Value="Vegetables">Vegetables</asp:ListItem>
                <asp:ListItem Value="Fruits">Fruits</asp:ListItem>
                <asp:ListItem Value="Dairy">Dairy</asp:ListItem>
                <asp:ListItem Value="Grains">Grains</asp:ListItem>
            </asp:DropDownList>

            <asp:Label ID="lblProductionDate" runat="server" Text="Production Date:" AssociatedControlID="txtProductionDate"></asp:Label>
            <asp:TextBox ID="txtProductionDate" runat="server" TextMode="Date"></asp:TextBox>

            <div class="btnLogin">
                <asp:Button ID="btnAddProduct" runat="server" CssClass="btnAnimation" Text="Add Product" OnClick="btnAddProduct_Click" />
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
        </div>
    </form>
</body>
</html>
