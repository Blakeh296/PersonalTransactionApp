<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertTransaction.aspx.cs" Inherits="TransactionHistoryAPP.InsertTransactionItem" %>

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

<br /><br /><br /><br />
        
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
<br /><br />
          <asp:Label ID="lblName2" runat="server" Text="Transaction Name :"></asp:Label><asp:TextBox ID="tbName2" runat="server"></asp:TextBox>
          <asp:Label ID="lblCatID2" runat="server" Text="CategoryID :"></asp:Label><asp:TextBox ID="tbCatID2" runat="server"></asp:TextBox>
          <asp:Label ID="lblAmount2" runat="server" Text="Amount :"></asp:Label><asp:TextBox ID="tbAmount2" runat="server" Text="0"></asp:TextBox>
<br /> <br />
          <asp:Label ID="lblDepositorWithdraw2" runat="server" Text="Deposit or Withdraw?"></asp:Label><asp:TextBox ID="tbDepositorWithdraw2" runat="server" Text="Withdraw"></asp:TextBox>
          <asp:Label ID="lblTransactionDate2" runat="server" Text="Transaction Date :"></asp:Label><asp:TextBox ID="tbTransactionDate2" runat="server"></asp:TextBox>
          <asp:Label ID="lblNotes2" runat="server" Text=" Notes :"></asp:Label><asp:TextBox ID="tbNotes2" runat="server"></asp:TextBox>
            <asp:CheckBox ID="cbTransaction2" runat="server" Text="Transaction 2" />
<br /><br />
          <asp:Label ID="lblName3" runat="server" Text="Transaction Name :"></asp:Label><asp:TextBox ID="tbName3" runat="server"></asp:TextBox>
          <asp:Label ID="lblCatID3" runat="server" Text="CategoryID :"></asp:Label><asp:TextBox ID="tbCatID3" runat="server"></asp:TextBox>
          <asp:Label ID="lblAmount3" runat="server" Text="Amount :"></asp:Label><asp:TextBox ID="tbAmount3" runat="server" Text="0"></asp:TextBox>
<br /> <br />
          <asp:Label ID="lblDepositorWithdraw3" runat="server" Text="Deposit or Withdraw?"></asp:Label><asp:TextBox ID="tbDepositorWithdraw3" runat="server" Text="Withdraw"></asp:TextBox>
          <asp:Label ID="lblTransactionDate3" runat="server" Text="Transaction Date :"></asp:Label><asp:TextBox ID="tbTransactiondate3" runat="server"></asp:TextBox>
          <asp:Label ID="lblNotes3" runat="server" Text=" Notes :"></asp:Label><asp:TextBox ID="tbNotes3" runat="server"></asp:TextBox>
            <asp:CheckBox ID="cbTransaction3" runat="server" Text="Transaction 3" />
<br /><br />
          <asp:Label ID="lblName4" runat="server" Text="Transaction Name :"></asp:Label><asp:TextBox ID="tbName4" runat="server"></asp:TextBox>
          <asp:Label ID="lblCatID4" runat="server" Text="CategoryID :"></asp:Label><asp:TextBox ID="tbCatID4" runat="server"></asp:TextBox>
          <asp:Label ID="lblAmount4" runat="server" Text="Amount :"></asp:Label><asp:TextBox ID="tbAmount4" runat="server" Text="0"></asp:TextBox>
<br /> <br />
          <asp:Label ID="lblDepositorWithdraw4" runat="server" Text="Deposit or Withdraw?"></asp:Label><asp:TextBox ID="tbDepositorWithdraw4" runat="server" Text="Withdraw"></asp:TextBox>
          <asp:Label ID="lblTransactionDate4" runat="server" Text="Transaction Date :"></asp:Label><asp:TextBox ID="tbTransactionDate4" runat="server"></asp:TextBox>
          <asp:Label ID="lblNotes4" runat="server" Text=" Notes :"></asp:Label><asp:TextBox ID="tbNotes4" runat="server"></asp:TextBox>
            <asp:CheckBox ID="cbTransaction4" runat="server" Text="Transaction 4" />
<br /><br />
          <asp:Label ID="lblName5" runat="server" Text="Transaction Name :"></asp:Label><asp:TextBox ID="tbName5" runat="server"></asp:TextBox>
          <asp:Label ID="lblCatID5" runat="server" Text="CategoryID :"></asp:Label><asp:TextBox ID="tbCatID5" runat="server"></asp:TextBox>
          <asp:Label ID="lblAmount5" runat="server" Text="Amount :"></asp:Label><asp:TextBox ID="tbAmount5" runat="server" Text="0"></asp:TextBox>
<br /> <br />
          <asp:Label ID="lblDepositorWithdraw5" runat="server" Text="Deposit or Withdraw?"></asp:Label><asp:TextBox ID="tbDepositorWithdraw5" runat="server" Text="Withdraw"></asp:TextBox>
          <asp:Label ID="lblTransactionDate5" runat="server" Text="Transaction Date :"></asp:Label><asp:TextBox ID="tbTransactionDate5" runat="server"></asp:TextBox>
          <asp:Label ID="lblNotes5" runat="server" Text=" Notes :"></asp:Label><asp:TextBox ID="tbNotes5" runat="server"></asp:TextBox>
            <asp:CheckBox ID="cbTransaction5" runat="server" Text="Transaction 5" />
<br /><br />
          <asp:Label ID="lblName6" runat="server" Text="Transaction Name :"></asp:Label><asp:TextBox ID="tbName6" runat="server"></asp:TextBox>
          <asp:Label ID="lblCatID6" runat="server" Text="CategoryID :"></asp:Label><asp:TextBox ID="tbCatID6" runat="server"></asp:TextBox>
          <asp:Label ID="lblAmount6" runat="server" Text="Amount :"></asp:Label><asp:TextBox ID="tbAmount6" runat="server" Text="0"></asp:TextBox>
<br /> <br />
          <asp:Label ID="lblDepositorWithdraw6" runat="server" Text="Deposit or Withdraw?"></asp:Label><asp:TextBox ID="tbDepositorWithdraw6" runat="server" Text="Withdraw"></asp:TextBox>
          <asp:Label ID="lblTransactionDate6" runat="server" Text="Transaction Date :"></asp:Label><asp:TextBox ID="tbTransactionDate6" runat="server"></asp:TextBox>
          <asp:Label ID="lblNotes6" runat="server" Text=" Notes :"></asp:Label><asp:TextBox ID="tbNotes6" runat="server"></asp:TextBox>
            <asp:CheckBox ID="cbTransaction6" runat="server" Text="Transaction 6" />
<br /><br />
          <asp:Label ID="lblName7" runat="server" Text="Transaction Name :"></asp:Label><asp:TextBox ID="tbName7" runat="server"></asp:TextBox>
          <asp:Label ID="lblCatID7" runat="server" Text="CategoryID :"></asp:Label><asp:TextBox ID="tbCatID7" runat="server"></asp:TextBox>
          <asp:Label ID="lblAmount7" runat="server" Text="Amount :"></asp:Label><asp:TextBox ID="tbAmount7" runat="server" Text="0"></asp:TextBox>
<br /> <br />
          <asp:Label ID="lblDepositorWithdraw7" runat="server" Text="Deposit or Withdraw?"></asp:Label><asp:TextBox ID="tbDepositorWithdraw7" runat="server" Text="Withdraw"></asp:TextBox>
          <asp:Label ID="lblTransactionDate7" runat="server" Text="Transaction Date :"></asp:Label><asp:TextBox ID="tbTransactionDate7" runat="server"></asp:TextBox>
          <asp:Label ID="lblNotes7" runat="server" Text=" Notes :"></asp:Label><asp:TextBox ID="tbNotes7" runat="server"></asp:TextBox>
            <asp:CheckBox ID="cbTransaction7" runat="server" Text="Transaction 7" />
<br /><br />
          <asp:Label ID="lblName8" runat="server" Text="Transaction Name :"></asp:Label><asp:TextBox ID="tbName8" runat="server"></asp:TextBox>
          <asp:Label ID="lblCatID8" runat="server" Text="CategoryID :"></asp:Label><asp:TextBox ID="tbCatID8" runat="server"></asp:TextBox>
          <asp:Label ID="lblAmount8" runat="server" Text="Amount :"></asp:Label><asp:TextBox ID="tbAmount8" runat="server" Text="0"></asp:TextBox>
<br /> <br />
          <asp:Label ID="lblDepositorWithdraw8" runat="server" Text="Deposit or Withdraw?"></asp:Label><asp:TextBox ID="tbDepositorWithdraw8" runat="server" Text="Withdraw"></asp:TextBox>
          <asp:Label ID="lblTransactionDate8" runat="server" Text="Transaction Date :"></asp:Label><asp:TextBox ID="tbTransactionDate8" runat="server"></asp:TextBox>
          <asp:Label ID="lblNotes8" runat="server" Text=" Notes :"></asp:Label><asp:TextBox ID="tbNotes8" runat="server"></asp:TextBox>
            <asp:CheckBox ID="cbTransaction8" runat="server" Text="Transaction 8" />
<br /><br />
          <asp:Label ID="lblName9" runat="server" Text="Transaction Name :"></asp:Label><asp:TextBox ID="tbName9" runat="server"></asp:TextBox>
          <asp:Label ID="lblCatID9" runat="server" Text="CategoryID :"></asp:Label><asp:TextBox ID="tbCatID9" runat="server"></asp:TextBox>
          <asp:Label ID="lblAmount9" runat="server" Text="Amount :"></asp:Label><asp:TextBox ID="tbAmount9" runat="server" Text="0"></asp:TextBox>
<br /> <br />
          <asp:Label ID="lblDepositorWithdraw9" runat="server" Text="Deposit or Withdraw?"></asp:Label><asp:TextBox ID="tbDepositorWithdraw9" runat="server" Text="Withdraw"></asp:TextBox>
          <asp:Label ID="lblTransactionDate9" runat="server" Text="Transaction Date :"></asp:Label><asp:TextBox ID="tbTransactionDate9" runat="server"></asp:TextBox>
          <asp:Label ID="lblNotes9" runat="server" Text=" Notes :"></asp:Label><asp:TextBox ID="tbNotes9" runat="server"></asp:TextBox>
            <asp:CheckBox ID="cbTransaction9" runat="server" Text="Transaction 9" />
<br /><br />
          <asp:Label ID="lblName10" runat="server" Text="Transaction Name :"></asp:Label><asp:TextBox ID="tbName10" runat="server"></asp:TextBox>
          <asp:Label ID="lblCatID10" runat="server" Text="CategoryID :"></asp:Label><asp:TextBox ID="tbCatID10" runat="server"></asp:TextBox>
          <asp:Label ID="lblAmount10" runat="server" Text="Amount :"></asp:Label><asp:TextBox ID="tbAmount10" runat="server" Text="0"></asp:TextBox>
<br /> <br />
          <asp:Label ID="lblDepositorWithdraw10" runat="server" Text="Deposit or Withdraw?"></asp:Label><asp:TextBox ID="tbDepositorWithdraw10" runat="server" Text="Withdraw"></asp:TextBox>
          <asp:Label ID="lblTransactionDate10" runat="server" Text="Transaction Date :"></asp:Label><asp:TextBox ID="tbTransactionDate10" runat="server"></asp:TextBox>
          <asp:Label ID="lblNotes10" runat="server" Text=" Notes :"></asp:Label><asp:TextBox ID="tbNotes10" runat="server"></asp:TextBox>
            <asp:CheckBox ID="cbTransaction10" runat="server" Text="Transaction 10" />
        </div>

        
    </form>
</body>
</html>
