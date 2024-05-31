<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDashboard.aspx.cs" Inherits="WebApplication1.EmployeeDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&family=Merriweather:wght@700&display=swap" rel="stylesheet">
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
            max-width: 800px;
            text-align: left;
        }
        .container h2 {
            color: #4caf50;
            margin-bottom: 30px;
            font-weight: 700;
            font-size: 44px;
            font-family: 'Merriweather', serif;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
        }
        .container h3 {
            color: #4caf50;
            margin-bottom: 25px;
            font-weight: 500;
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
        .product-list {
            margin-top: 25px;
        }
        .product-list table {
            width: 100%;
            border-collapse: collapse;
        }
        .product-list th, .product-list td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        .product-list th {
            background-color: #f2f2f2;
            color: black;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Employee Dashboard</h2>
            <h3>Add New Farmer</h3>
            <asp:Label ID="lblFarmerName" runat="server" Text="Farmer Name:" AssociatedControlID="txtFarmerName"></asp:Label>
            <asp:TextBox ID="txtFarmerName" runat="server"></asp:TextBox>

            <asp:Label ID="lblLocation" runat="server" Text="Location:" AssociatedControlID="txtLocation"></asp:Label>
            <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox>

            <asp:Label ID="lblContactInfo" runat="server" Text="Contact Info:" AssociatedControlID="txtContactInfo"></asp:Label>
            <asp:TextBox ID="txtContactInfo" runat="server"></asp:TextBox>

            <div class="btnLogin">
                <asp:Button ID="btnAddFarmer" runat="server" CssClass="btnAnimation" Text="Add Farmer" OnClick="btnAddFarmer_Click" />
            </div>
            <asp:Label ID="lblFarmerMessage" runat="server" CssClass="message"></asp:Label>

            <h3>View Products</h3>
            <asp:Label ID="lblCategoryFilter" runat="server" Text="Category:" AssociatedControlID="ddlCategoryFilter"></asp:Label>
            <asp:DropDownList ID="ddlCategoryFilter" runat="server">
                <asp:ListItem Value="All">All</asp:ListItem>
                <asp:ListItem Value="Vegetables">Vegetables</asp:ListItem>
                <asp:ListItem Value="Fruits">Fruits</asp:ListItem>
                <asp:ListItem Value="Dairy">Dairy</asp:ListItem>
                <asp:ListItem Value="Grains">Grains</asp:ListItem>
            </asp:DropDownList>

            <asp:Label ID="lblDateRange" runat="server" Text="Production Date Range:" AssociatedControlID="txtStartDate"></asp:Label>
            <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date"></asp:TextBox>
            <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date"></asp:TextBox>

            <div class="btnLogin">
                <asp:Button ID="btnFilterProducts" runat="server" CssClass="btnAnimation" Text="Filter Products" OnClick="btnFilterProducts_Click" />
            </div>
            <asp:Label ID="lblFilterMessage" runat="server" CssClass="message"></asp:Label>

            <div class="product-list">
                <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                        <asp:BoundField DataField="Category" HeaderText="Category" />
                        <asp:BoundField DataField="ProductionDate" HeaderText="Production Date" DataFormatString="{0:yyyy-MM-dd}" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
