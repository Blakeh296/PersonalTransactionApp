﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertTransaction.aspx.cs" Inherits="TransactionHistoryAPP.InsertTransactionItem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transaction Insert</title>
    <style type ="text/css">

        .HeaderNav
        {
            text-align:center;
            font-size: 30px;
            width: 100%;
            margin-top: 1px;
            margin-bottom: 0px;
            height: 37px;
        }
        .HeaderNav a 
        {
            text-decoration: none;
            color: black;
            background-color: #eee;
            display:block;
        }
        .HeaderNav a:hover
        {
            background-color: #4CAF50;
            Text-Shadow: 5px 5px 5px #808080;
			Color: white;
        }
        .InsertTxtBoxes
        {
            width:100%;
            position:relative;
            left:10%;
            top:10px;
        }
        #GridView2
        {
            position:relative;
            left: 35%;
            top: 50px;
        }
        #h1
        {
            position:relative;
            width: 100%;
            text-align:center;
        }
        .currentNav
        {
            background-color: #eee;
        }
        #ListBox1
        {
            position:relative;
            bottom: 30px;
            left: 50%;
            width: 164px;
            height: 176px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="HeaderNav">
            <thead>
                <tr>
                    <th> <a href ="ViewTransactions.aspx"> View Transactions</a></th>
                </tr>
                <tr>
                    <th class="currentNav">Insert a new Transaction</th>
                </tr>
            </thead>
        </table>
        
        <div class ="InsertTxtBoxes">
            <asp:Label ID="Label1" runat="server" Text="Transaction Name :"></asp:Label><asp:TextBox ID="tbName" runat="server"></asp:TextBox>
            <asp:Label ID="lblCategoryID" runat="server" Text="Category ID :"></asp:Label> <asp:TextBox ID="tbCategoryID" runat="server"></asp:TextBox>
            <asp:Label ID="lblAmount" runat="server" Text="Amount :"></asp:Label> <asp:TextBox ID="tbAmount" runat="server"></asp:TextBox>
            <br /><br />
            <asp:Label ID="lblTransTypeName" runat="server" Text="Deposit or Withdraw?"></asp:Label><asp:TextBox ID="tbTypeName" runat="server" Text="Withdraw"></asp:TextBox>
            <asp:Label ID="lblTransactionDate" runat="server" Text="Transaction Date :"></asp:Label> <asp:TextBox ID="tbTransactionDate" runat="server"></asp:TextBox>
            <asp:Label ID="lblNotes" runat="server" Text="Notes :"></asp:Label> <asp:TextBox ID="tbNotes" runat="server"></asp:TextBox>
            <asp:Button ID="btnNewTransaction" runat="server" OnClick="btnNewTransaction_Click" Text="Insert to DB" />
            <asp:Label ID="lblOutPut" runat="server"></asp:Label>
        </div>
        <br /><br />
        <div class ="InsertTxtBoxes">
          <asp:Label ID="lblName2" runat="server" Text="Transaction Name :"></asp:Label><asp:TextBox ID="tbName2" runat="server"></asp:TextBox>
          <asp:Label ID="lblCatID2" runat="server" Text="CategoryID :"></asp:Label><asp:TextBox ID="tbCatID2" runat="server"></asp:TextBox>
          <asp:Label ID="lblAmount2" runat="server" Text="Amount :"></asp:Label><asp:TextBox ID="tbAmount2" runat="server" Text="0"></asp:TextBox>
                <br /> <br />
          <asp:Label ID="lblDepositorWithdraw2" runat="server" Text="Deposit or Withdraw?"></asp:Label><asp:TextBox ID="tbDepositorWithdraw2" runat="server" Text="Withdraw"></asp:TextBox>
          <asp:Label ID="lblTransactionDate2" runat="server" Text="Transaction Date :"></asp:Label><asp:TextBox ID="tbTransactionDate2" runat="server"></asp:TextBox>
          <asp:Label ID="lblNotes2" runat="server" Text=" Notes :"></asp:Label><asp:TextBox ID="tbNotes2" runat="server"></asp:TextBox>
            <asp:CheckBox ID="cbTransaction2" runat="server" Text="Transaction 2" />
        </div>
        <br /><br />
        <div class ="InsertTxtBoxes">
          <asp:Label ID="lblName3" runat="server" Text="Transaction Name :"></asp:Label><asp:TextBox ID="tbName3" runat="server"></asp:TextBox>
          <asp:Label ID="lblCatID3" runat="server" Text="CategoryID :"></asp:Label><asp:TextBox ID="tbCatID3" runat="server"></asp:TextBox>
          <asp:Label ID="lblAmount3" runat="server" Text="Amount :"></asp:Label><asp:TextBox ID="tbAmount3" runat="server" Text="0"></asp:TextBox>
                <br /> <br />
          <asp:Label ID="lblDepositorWithdraw3" runat="server" Text="Deposit or Withdraw?"></asp:Label><asp:TextBox ID="tbDepositorWithdraw3" runat="server" Text="Withdraw"></asp:TextBox>
          <asp:Label ID="lblTransactionDate3" runat="server" Text="Transaction Date :"></asp:Label><asp:TextBox ID="tbTransactiondate3" runat="server"></asp:TextBox>
          <asp:Label ID="lblNotes3" runat="server" Text=" Notes :"></asp:Label><asp:TextBox ID="tbNotes3" runat="server"></asp:TextBox>
            <asp:CheckBox ID="cbTransaction3" runat="server" Text="Transaction 3" />
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=DTPLAPTOP09;Initial Catalog=TransactionHistoryASPNET;Integrated Security=True" DeleteCommand="DELETE FROM [TransactionCategory] WHERE [CategoryID] = @CategoryID" InsertCommand="INSERT INTO [TransactionCategory] ([CatName]) VALUES (@CatName)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [CategoryID], [CatName] FROM [TransactionCategory]" UpdateCommand="UPDATE [TransactionCategory] SET [CatName] = @CatName WHERE [CategoryID] = @CategoryID">
            <DeleteParameters>
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CatName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CatName" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="CategoryID" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" InsertVisible="False" ReadOnly="True" SortExpression="CategoryID" />
                <asp:BoundField DataField="CatName" HeaderText="CatName" SortExpression="CatName" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
    </form>
</body>
</html>
