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

                int k;
                string ConnString;

                SqlConnection sqlConn;

                ConnString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                sqlConn = new SqlConnection(ConnString);

                SqlCommand insertTransaction = new SqlCommand("dbo.InsTransHistory", sqlConn);
                insertTransaction.CommandType = CommandType.StoredProcedure;

                /* AGGG THIS ISNT WORKING THIS IFF */

                if (cbTransaction2.Checked != true && cbTransaction3.Checked != true && cbTransaction4.Checked != true && cbTransaction5.Checked != true
                    &&cbTransaction6.Checked != true && cbTransaction7.Checked != true && cbTransaction8.Checked != true && cbTransaction9.Checked != true && cbTransaction10.Checked != true)
                {
                    dataConn.NewTransaction(tbName.Text, int.Parse(tbCategoryID.Text), double.Parse(tbAmount.Text), tbTypeName.Text, DateTime.Parse(tbTransactionDate.Text), tbNotes.Text, out k);

                    if (k != 0)
                    {
                        Session["NewRecord"] = "Record Recorded !";
                    }
                    Response.Redirect("ViewTransactions.aspx");
                    
                }

                if (cbTransaction2.Checked == true && cbTransaction3.Checked == true && cbTransaction4.Checked == true && cbTransaction5.Checked == true & cbTransaction6.Checked == true
                    && cbTransaction7.Checked == true && cbTransaction8.Checked == true && cbTransaction9.Checked == true && cbTransaction10.Checked == true)
                {
                    dataConn.NewTransaction(tbName.Text, int.Parse(tbCategoryID.Text), double.Parse(tbAmount.Text), tbTypeName.Text, DateTime.Parse(tbTransactionDate.Text), tbNotes.Text, out k);
                    dataConn.NewTransaction(tbName2.Text, int.Parse(tbCatID2.Text), double.Parse(tbAmount2.Text), tbDepositorWithdraw2.Text, DateTime.Parse(tbTransactionDate2.Text), tbNotes2.Text, out k);
                    dataConn.NewTransaction(tbName3.Text, int.Parse(tbCatID3.Text), double.Parse(tbAmount3.Text), tbDepositorWithdraw3.Text, DateTime.Parse(tbTransactiondate3.Text), tbNotes3.Text, out k);
                    dataConn.NewTransaction(tbName4.Text, int.Parse(tbCatID4.Text), double.Parse(tbAmount4.Text), tbDepositorWithdraw4.Text, DateTime.Parse(tbTransactionDate4.Text), tbNotes4.Text, out k);
                    dataConn.NewTransaction(tbName5.Text, int.Parse(tbCatID5.Text), double.Parse(tbAmount5.Text), tbDepositorWithdraw5.Text, DateTime.Parse(tbTransactionDate5.Text), tbNotes5.Text, out k);
                    dataConn.NewTransaction(tbName6.Text, int.Parse(tbCatID6.Text), double.Parse(tbAmount6.Text), tbDepositorWithdraw6.Text, DateTime.Parse(tbTransactionDate6.Text), tbNotes6.Text, out k);
                    dataConn.NewTransaction(tbName7.Text, int.Parse(tbCatID7.Text), double.Parse(tbAmount7.Text), tbDepositorWithdraw7.Text, DateTime.Parse(tbTransactionDate7.Text), tbNotes7.Text, out k);
                    dataConn.NewTransaction(tbName8.Text, int.Parse(tbCatID8.Text), double.Parse(tbAmount8.Text), tbDepositorWithdraw8.Text, DateTime.Parse(tbTransactionDate8.Text), tbNotes8.Text, out k);
                    dataConn.NewTransaction(tbName9.Text, int.Parse(tbCatID9.Text), double.Parse(tbAmount9.Text), tbDepositorWithdraw9.Text, DateTime.Parse(tbTransactionDate9.Text), tbNotes9.Text, out k);
                    dataConn.NewTransaction(tbName10.Text, int.Parse(tbCatID10.Text), double.Parse(tbAmount10.Text), tbDepositorWithdraw10.Text, DateTime.Parse(tbTransactionDate10.Text), tbNotes10.Text, out k);

                    if (k != 0)
                    {
                        Session["NewRecord"] = "Record Recorded !";
                    }
                    Response.Redirect("ViewTransactions.aspx");
                }

                if (cbTransaction2.Checked == true && cbTransaction3.Checked == true && cbTransaction4.Checked == true && cbTransaction5.Checked == true & cbTransaction6.Checked == true
                    && cbTransaction7.Checked == true && cbTransaction8.Checked == true && cbTransaction9.Checked == true)
                {
                    dataConn.NewTransaction(tbName.Text, int.Parse(tbCategoryID.Text), double.Parse(tbAmount.Text), tbTypeName.Text, DateTime.Parse(tbTransactionDate.Text), tbNotes.Text, out k);
                    dataConn.NewTransaction(tbName2.Text, int.Parse(tbCatID2.Text), double.Parse(tbAmount2.Text), tbDepositorWithdraw2.Text, DateTime.Parse(tbTransactionDate2.Text), tbNotes2.Text, out k);
                    dataConn.NewTransaction(tbName3.Text, int.Parse(tbCatID3.Text), double.Parse(tbAmount3.Text), tbDepositorWithdraw3.Text, DateTime.Parse(tbTransactiondate3.Text), tbNotes3.Text, out k);
                    dataConn.NewTransaction(tbName4.Text, int.Parse(tbCatID4.Text), double.Parse(tbAmount4.Text), tbDepositorWithdraw4.Text, DateTime.Parse(tbTransactionDate4.Text), tbNotes4.Text, out k);
                    dataConn.NewTransaction(tbName5.Text, int.Parse(tbCatID5.Text), double.Parse(tbAmount5.Text), tbDepositorWithdraw5.Text, DateTime.Parse(tbTransactionDate5.Text), tbNotes5.Text, out k);
                    dataConn.NewTransaction(tbName6.Text, int.Parse(tbCatID6.Text), double.Parse(tbAmount6.Text), tbDepositorWithdraw6.Text, DateTime.Parse(tbTransactionDate6.Text), tbNotes6.Text, out k);
                    dataConn.NewTransaction(tbName7.Text, int.Parse(tbCatID7.Text), double.Parse(tbAmount7.Text), tbDepositorWithdraw7.Text, DateTime.Parse(tbTransactionDate7.Text), tbNotes7.Text, out k);
                    dataConn.NewTransaction(tbName8.Text, int.Parse(tbCatID8.Text), double.Parse(tbAmount8.Text), tbDepositorWithdraw8.Text, DateTime.Parse(tbTransactionDate8.Text), tbNotes8.Text, out k);
                    dataConn.NewTransaction(tbName9.Text, int.Parse(tbCatID9.Text), double.Parse(tbAmount9.Text), tbDepositorWithdraw9.Text, DateTime.Parse(tbTransactionDate9.Text), tbNotes9.Text, out k);

                    if (k != 0)
                    {
                        Session["NewRecord"] = "Record Recorded !";
                    }
                    Response.Redirect("ViewTransactions.aspx");
                }

                if (cbTransaction2.Checked == true && cbTransaction3.Checked == true && cbTransaction4.Checked == true && cbTransaction5.Checked == true & cbTransaction6.Checked == true
                    && cbTransaction7.Checked == true && cbTransaction8.Checked == true)
                {
                    dataConn.NewTransaction(tbName.Text, int.Parse(tbCategoryID.Text), double.Parse(tbAmount.Text), tbTypeName.Text, DateTime.Parse(tbTransactionDate.Text), tbNotes.Text, out k);
                    dataConn.NewTransaction(tbName2.Text, int.Parse(tbCatID2.Text), double.Parse(tbAmount2.Text), tbDepositorWithdraw2.Text, DateTime.Parse(tbTransactionDate2.Text), tbNotes2.Text, out k);
                    dataConn.NewTransaction(tbName3.Text, int.Parse(tbCatID3.Text), double.Parse(tbAmount3.Text), tbDepositorWithdraw3.Text, DateTime.Parse(tbTransactiondate3.Text), tbNotes3.Text, out k);
                    dataConn.NewTransaction(tbName4.Text, int.Parse(tbCatID4.Text), double.Parse(tbAmount4.Text), tbDepositorWithdraw4.Text, DateTime.Parse(tbTransactionDate4.Text), tbNotes4.Text, out k);
                    dataConn.NewTransaction(tbName5.Text, int.Parse(tbCatID5.Text), double.Parse(tbAmount5.Text), tbDepositorWithdraw5.Text, DateTime.Parse(tbTransactionDate5.Text), tbNotes5.Text, out k);
                    dataConn.NewTransaction(tbName6.Text, int.Parse(tbCatID6.Text), double.Parse(tbAmount6.Text), tbDepositorWithdraw6.Text, DateTime.Parse(tbTransactionDate6.Text), tbNotes6.Text, out k);
                    dataConn.NewTransaction(tbName7.Text, int.Parse(tbCatID7.Text), double.Parse(tbAmount7.Text), tbDepositorWithdraw7.Text, DateTime.Parse(tbTransactionDate7.Text), tbNotes7.Text, out k);
                    dataConn.NewTransaction(tbName8.Text, int.Parse(tbCatID8.Text), double.Parse(tbAmount8.Text), tbDepositorWithdraw8.Text, DateTime.Parse(tbTransactionDate8.Text), tbNotes8.Text, out k);

                    if (k != 0)
                    {
                        Session["NewRecord"] = "Record Recorded !";
                    }
                    Response.Redirect("ViewTransactions.aspx");
                }

                if (cbTransaction2.Checked == true && cbTransaction3.Checked == true && cbTransaction4.Checked == true && cbTransaction5.Checked == true & cbTransaction6.Checked == true
                    && cbTransaction7.Checked == true)
                {
                    dataConn.NewTransaction(tbName.Text, int.Parse(tbCategoryID.Text), double.Parse(tbAmount.Text), tbTypeName.Text, DateTime.Parse(tbTransactionDate.Text), tbNotes.Text, out k);
                    dataConn.NewTransaction(tbName2.Text, int.Parse(tbCatID2.Text), double.Parse(tbAmount2.Text), tbDepositorWithdraw2.Text, DateTime.Parse(tbTransactionDate2.Text), tbNotes2.Text, out k);
                    dataConn.NewTransaction(tbName3.Text, int.Parse(tbCatID3.Text), double.Parse(tbAmount3.Text), tbDepositorWithdraw3.Text, DateTime.Parse(tbTransactiondate3.Text), tbNotes3.Text, out k);
                    dataConn.NewTransaction(tbName4.Text, int.Parse(tbCatID4.Text), double.Parse(tbAmount4.Text), tbDepositorWithdraw4.Text, DateTime.Parse(tbTransactionDate4.Text), tbNotes4.Text, out k);
                    dataConn.NewTransaction(tbName5.Text, int.Parse(tbCatID5.Text), double.Parse(tbAmount5.Text), tbDepositorWithdraw5.Text, DateTime.Parse(tbTransactionDate5.Text), tbNotes5.Text, out k);
                    dataConn.NewTransaction(tbName6.Text, int.Parse(tbCatID6.Text), double.Parse(tbAmount6.Text), tbDepositorWithdraw6.Text, DateTime.Parse(tbTransactionDate6.Text), tbNotes6.Text, out k);
                    dataConn.NewTransaction(tbName7.Text, int.Parse(tbCatID7.Text), double.Parse(tbAmount7.Text), tbDepositorWithdraw7.Text, DateTime.Parse(tbTransactionDate7.Text), tbNotes7.Text, out k);

                    if (k != 0)
                    {
                        Session["NewRecord"] = "Record Recorded !";
                    }
                    Response.Redirect("ViewTransactions.aspx");
                }

                if (cbTransaction2.Checked == true && cbTransaction3.Checked == true && cbTransaction4.Checked == true && cbTransaction5.Checked == true & cbTransaction6.Checked == true)
                {
                    dataConn.NewTransaction(tbName.Text, int.Parse(tbCategoryID.Text), double.Parse(tbAmount.Text), tbTypeName.Text, DateTime.Parse(tbTransactionDate.Text), tbNotes.Text, out k);
                    dataConn.NewTransaction(tbName2.Text, int.Parse(tbCatID2.Text), double.Parse(tbAmount2.Text), tbDepositorWithdraw2.Text, DateTime.Parse(tbTransactionDate2.Text), tbNotes2.Text, out k);
                    dataConn.NewTransaction(tbName3.Text, int.Parse(tbCatID3.Text), double.Parse(tbAmount3.Text), tbDepositorWithdraw3.Text, DateTime.Parse(tbTransactiondate3.Text), tbNotes3.Text, out k);
                    dataConn.NewTransaction(tbName4.Text, int.Parse(tbCatID4.Text), double.Parse(tbAmount4.Text), tbDepositorWithdraw4.Text, DateTime.Parse(tbTransactionDate4.Text), tbNotes4.Text, out k);
                    dataConn.NewTransaction(tbName5.Text, int.Parse(tbCatID5.Text), double.Parse(tbAmount5.Text), tbDepositorWithdraw5.Text, DateTime.Parse(tbTransactionDate5.Text), tbNotes5.Text, out k);
                    dataConn.NewTransaction(tbName6.Text, int.Parse(tbCatID6.Text), double.Parse(tbAmount6.Text), tbDepositorWithdraw6.Text, DateTime.Parse(tbTransactionDate6.Text), tbNotes6.Text, out k);

                    if (k != 0)
                    {
                        Session["NewRecord"] = "Record Recorded !";
                    }
                    Response.Redirect("ViewTransactions.aspx");
                }

                if (cbTransaction2.Checked == true && cbTransaction3.Checked == true && cbTransaction4.Checked == true && cbTransaction5.Checked == true)
                {
                    dataConn.NewTransaction(tbName.Text, int.Parse(tbCategoryID.Text), double.Parse(tbAmount.Text), tbTypeName.Text, DateTime.Parse(tbTransactionDate.Text), tbNotes.Text, out k);
                    dataConn.NewTransaction(tbName2.Text, int.Parse(tbCatID2.Text), double.Parse(tbAmount2.Text), tbDepositorWithdraw2.Text, DateTime.Parse(tbTransactionDate2.Text), tbNotes2.Text, out k);
                    dataConn.NewTransaction(tbName3.Text, int.Parse(tbCatID3.Text), double.Parse(tbAmount3.Text), tbDepositorWithdraw3.Text, DateTime.Parse(tbTransactiondate3.Text), tbNotes3.Text, out k);
                    dataConn.NewTransaction(tbName4.Text, int.Parse(tbCatID4.Text), double.Parse(tbAmount4.Text), tbDepositorWithdraw4.Text, DateTime.Parse(tbTransactionDate4.Text), tbNotes4.Text, out k);
                    dataConn.NewTransaction(tbName5.Text, int.Parse(tbCatID5.Text), double.Parse(tbAmount5.Text), tbDepositorWithdraw5.Text, DateTime.Parse(tbTransactionDate5.Text), tbNotes5.Text, out k);

                    if (k != 0)
                    {
                        Session["NewRecord"] = "Record Recorded !";
                    }
                    Response.Redirect("ViewTransactions.aspx");
                }


                if (cbTransaction2.Checked == true && cbTransaction3.Checked == true && cbTransaction4.Checked == true && cbTransaction5.Checked == true)
                {
                    dataConn.NewTransaction(tbName.Text, int.Parse(tbCategoryID.Text), double.Parse(tbAmount.Text), tbTypeName.Text, DateTime.Parse(tbTransactionDate.Text), tbNotes.Text, out k);
                    dataConn.NewTransaction(tbName2.Text, int.Parse(tbCatID2.Text), double.Parse(tbAmount2.Text), tbDepositorWithdraw2.Text, DateTime.Parse(tbTransactionDate2.Text), tbNotes2.Text, out k);
                    dataConn.NewTransaction(tbName3.Text, int.Parse(tbCatID3.Text), double.Parse(tbAmount3.Text), tbDepositorWithdraw3.Text, DateTime.Parse(tbTransactiondate3.Text), tbNotes3.Text, out k);
                    dataConn.NewTransaction(tbName4.Text, int.Parse(tbCatID4.Text), double.Parse(tbAmount4.Text), tbDepositorWithdraw4.Text, DateTime.Parse(tbTransactionDate4.Text), tbNotes4.Text, out k);
                    dataConn.NewTransaction(tbName5.Text, int.Parse(tbCatID5.Text), double.Parse(tbAmount5.Text), tbDepositorWithdraw5.Text, DateTime.Parse(tbTransactionDate5.Text), tbNotes5.Text, out k);

                    if (k != 0)
                    {
                        Session["NewRecord"] = "Record Recorded !";
                    }
                    Response.Redirect("ViewTransactions.aspx");
                }

                if (cbTransaction2.Checked == true && cbTransaction3.Checked == true && cbTransaction4.Checked == true)
                {

                    dataConn.NewTransaction(tbName.Text, int.Parse(tbCategoryID.Text), double.Parse(tbAmount.Text), tbTypeName.Text, DateTime.Parse(tbTransactionDate.Text), tbNotes.Text, out k);
                    dataConn.NewTransaction(tbName2.Text, int.Parse(tbCatID2.Text), double.Parse(tbAmount2.Text), tbDepositorWithdraw2.Text, DateTime.Parse(tbTransactionDate2.Text), tbNotes2.Text, out k);
                    dataConn.NewTransaction(tbName3.Text, int.Parse(tbCatID3.Text), double.Parse(tbAmount3.Text), tbDepositorWithdraw3.Text, DateTime.Parse(tbTransactiondate3.Text), tbNotes3.Text, out k);
                    dataConn.NewTransaction(tbName4.Text, int.Parse(tbCatID4.Text), double.Parse(tbAmount4.Text), tbDepositorWithdraw4.Text, DateTime.Parse(tbTransactionDate4.Text), tbNotes4.Text, out k);

                    if (k != 0)
                    {
                        Session["NewRecord"] = "Record Recorded !";
                    }
                    Response.Redirect("ViewTransactions.aspx");
                }

                if (cbTransaction2.Checked == true && cbTransaction3.Checked == true)
                {

                    dataConn.NewTransaction(tbName.Text, int.Parse(tbCategoryID.Text), double.Parse(tbAmount.Text), tbTypeName.Text, DateTime.Parse(tbTransactionDate.Text), tbNotes.Text, out k);
                    dataConn.NewTransaction(tbName2.Text, int.Parse(tbCatID2.Text), double.Parse(tbAmount2.Text), tbDepositorWithdraw2.Text, DateTime.Parse(tbTransactionDate2.Text), tbNotes2.Text, out k);
                    dataConn.NewTransaction(tbName3.Text, int.Parse(tbCatID3.Text), double.Parse(tbAmount3.Text), tbDepositorWithdraw3.Text, DateTime.Parse(tbTransactiondate3.Text), tbNotes3.Text, out k);

                    if (k != 0)
                    {
                        Session["NewRecord"] = "Record Recorded !";
                    }
                    Response.Redirect("ViewTransactions.aspx");
                }

                if (cbTransaction2.Checked == true)
                {

                    dataConn.NewTransaction(tbName.Text, int.Parse(tbCategoryID.Text), double.Parse(tbAmount.Text), tbTypeName.Text, DateTime.Parse(tbTransactionDate.Text), tbNotes.Text, out k);
                    dataConn.NewTransaction(tbName2.Text, int.Parse(tbCatID2.Text), double.Parse(tbAmount2.Text), tbDepositorWithdraw2.Text, DateTime.Parse(tbTransactionDate2.Text), tbNotes2.Text, out k);

                    if (k != 0)
                    {
                        Session["NewRecord"] = "Record Recorded !";
                    }
                    Response.Redirect("ViewTransactions.aspx");
                }
                //TODO : Class is work in progress, Apparently have to create text file on server then download it some way
                //dataConn.StreamWrite(name, categoryID, amount, typeName, transactionDate, notes);
            }
            catch (Exception ex)
            {
                lblOutPut.Text = ex.Message;
                lblOutPut.ForeColor = System.Drawing.Color.Red;
            }
        }

        
    }
}