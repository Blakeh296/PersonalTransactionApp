using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;
using System.IO;

namespace TransactionHistoryAPP
{
    public partial class InsertTransactionItem : System.Web.UI.Page
    {
        DataConn dataConn = new DataConn();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                Response.Write("Logged in! As : " + Session["Username"]);
            }

            Session["NewRecord"] = null;

        }

        protected void btnNewTransaction_Click(object sender, EventArgs e)
        {
            try
            {
                string name = tbName.Text;
                int categoryID = int.Parse(tbCategoryID.Text);
                double amount = double.Parse(tbAmount.Text);
                string typeName = tbTypeName.Text;
                DateTime transactionDate = DateTime.Parse(tbTransactionDate.Text);
                string notes = tbNotes.Text;
                int k;
                string ConnString;

                SqlConnection sqlConn;

                ConnString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                sqlConn = new SqlConnection(ConnString);

                SqlCommand insertTransaction = new SqlCommand("dbo.InsTransHistory", sqlConn);
                insertTransaction.CommandType = CommandType.StoredProcedure;

                dataConn.NewTransaction(name, categoryID, amount, typeName, transactionDate, notes, out k);

                //TODO : Class is work in progress, Apparently have to create text file on server then download it some way
                //dataConn.StreamWrite(name, categoryID, amount, typeName, transactionDate, notes);

                if (k != 0)
                {
                    Session["NewRecord"] = "Record Recorded !";
                }

                Response.Redirect("ViewTransactions.aspx");
                
            }
            catch (Exception ex)
            {
                lblOutPut.Text = ex.Message;
                lblOutPut.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}