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

namespace TransactionHistoryAPP
{
    public partial class InsertTransactionItem : System.Web.UI.Page
    {
        DataConn dataConn = new DataConn();

        protected void Page_Load(object sender, EventArgs e)
        {

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
                
                if (k != 0)
                {
                    lblOutPut.Text = "Record Recorded !";
                    lblOutPut.ForeColor = System.Drawing.Color.CornflowerBlue;
                }
                
            }
            catch (Exception ex)
            {
                lblOutPut.Text = ex.Message;
                lblOutPut.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}