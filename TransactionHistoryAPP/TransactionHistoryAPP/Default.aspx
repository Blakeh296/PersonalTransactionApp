<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TransactionHistoryAPP.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transaction History</title>
    <style type ="text/css">
        #TextBox1
        {
            background-color:lightyellow;
        }
        #TextBox2
        {
            position:relative;
            left: 200px;
            bottom:71px;
            background-color:lightyellow;
        }
        .lblpassWord
        {
            position:relative;
            left: 200px;
            bottom:71px;
        }
        #btnLogin
        {
            position:relative;
            left: 210px;
            bottom:71px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Hello Blake! Pls Log in :</h1>
        <p>User Name :</p><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
        <p class="lblpassWord">Password :</p><asp:TextBox ID="TextBox2" TextMode="Password" runat="server">Shadow7076</asp:TextBox>
        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" />
        <div>
        </div>
    </form>
</body>
</html>
