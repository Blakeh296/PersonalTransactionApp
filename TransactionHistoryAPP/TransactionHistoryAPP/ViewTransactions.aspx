<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewTransactions.aspx.cs" Inherits="TransactionHistoryAPP.ViewTransactions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Transactions</title>
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
        .CurrentNav
        {
            background-color: #eee;
        }
        #GridView1
        {
            position:relative;
            left: 20%;
            top:40px;
        }
        #Label1
        {
            position:relative;
            top:20px;
            left:45%;
            border-style:solid;
            border-width: 2px;
            border-color:green;
            padding:4px 4px 4px 4px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="HeaderNav">
            <thead>
                <tr>
                    <th> <a href ="InsertTransaction.aspx"> Insert a new Transaction</a></th>
                </tr>
                <tr>
                    <th class="CurrentNav">View Transactions</th>
                </tr>
            </thead>
        </table>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DTPLAPTOP09;Initial Catalog=TransactionHistoryASPNET;Integrated Security=True" DeleteCommand="DELETE FROM [TransactionHistory] WHERE [TransactionID] = @TransactionID" InsertCommand="INSERT INTO [TransactionHistory] ([Name], [CategoryID], [Amount], [TypeName], [TransactionDate], [Notes]) VALUES (@Name, @CategoryID, @Amount, @TypeName, @TransactionDate, @Notes)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [TransactionHistory]" UpdateCommand="UPDATE [TransactionHistory] SET [Name] = @Name, [CategoryID] = @CategoryID, [Amount] = @Amount, [TypeName] = @TypeName, [TransactionDate] = @TransactionDate, [Notes] = @Notes WHERE [TransactionID] = @TransactionID">
                <DeleteParameters>
                    <asp:Parameter Name="TransactionID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="CategoryID" Type="Int32" />
                    <asp:Parameter Name="Amount" Type="Decimal" />
                    <asp:Parameter Name="TypeName" Type="String" />
                    <asp:Parameter Name="TransactionDate" Type="DateTime" />
                    <asp:Parameter Name="Notes" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="CategoryID" Type="Int32" />
                    <asp:Parameter Name="Amount" Type="Decimal" />
                    <asp:Parameter Name="TypeName" Type="String" />
                    <asp:Parameter Name="TransactionDate" Type="DateTime" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="TransactionID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TransactionID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnRowDeleted="GridView1_RowDeleted">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="TransactionID" HeaderText="TransactionID" InsertVisible="False" ReadOnly="True" SortExpression="TransactionID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                    <asp:BoundField DataField="TypeName" HeaderText="TypeName" SortExpression="TypeName" />
                    <asp:BoundField DataField="TransactionDate" HeaderText="TransactionDate" SortExpression="TransactionDate" />
                    <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
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
        </div>
    </form>
</body>
</html>
