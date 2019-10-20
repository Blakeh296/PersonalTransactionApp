﻿using System;
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

                /* AGGG THIS ISNT WORKING THIS IFF */

                if (cbTransaction2.Checked != true && cbTransaction3.Checked != true)
                {
                    dataConn.NewTransaction(name, categoryID, amount, typeName, transactionDate, notes, out k);
                    

                    if (k != 0)
                    {
                        Session["NewRecord"] = "Record Recorded !";
                    }
                    Response.Redirect("ViewTransactions.aspx");
                    
                }

                if (cbTransaction2.Checked == true && cbTransaction3.Checked == true)
                {
                    string name2 = tbName2.Text;
                    int categoryID2 = int.Parse(tbCatID2.Text);
                    double amount2 = double.Parse(tbAmount2.Text);
                    string typeName2 = tbDepositorWithdraw2.Text;
                    DateTime transactionDate2 = DateTime.Parse(tbTransactionDate2.Text);
                    string notes2 = tbNotes2.Text;

                    string name3 = tbName3.Text;
                    int categoryID3 = int.Parse(tbCatID3.Text);
                    double amount3 = double.Parse(tbAmount3.Text);
                    string typeName3 = tbDepositorWithdraw3.Text;
                    DateTime transactionDate3 = DateTime.Parse(tbTransactiondate3.Text);
                    string notes3 = tbNotes3.Text;

                    dataConn.NewTransaction(name, categoryID, amount, typeName, transactionDate, notes, out k);
                    dataConn.NewTransaction(name2, categoryID2, amount2, typeName2, transactionDate2, notes2, out k);
                    dataConn.NewTransaction(name3, categoryID3, amount3, typeName3, transactionDate3, notes3, out k);
                    
                    if (k != 0)
                    {
                        Session["NewRecord"] = "Record Recorded !";
                    }
                    Response.Redirect("ViewTransactions.aspx");
                }

                if (cbTransaction2.Checked == true)
                {
                    string name2 = tbName2.Text;
                    int categoryID2 = int.Parse(tbCatID2.Text);
                    double amount2 = double.Parse(tbAmount2.Text);
                    string typeName2 = tbDepositorWithdraw2.Text;
                    DateTime transactionDate2 = DateTime.Parse(tbTransactionDate2.Text);
                    string notes2 = tbNotes2.Text;

                    dataConn.NewTransaction(name, categoryID, amount, typeName, transactionDate, notes, out k);
                    dataConn.NewTransaction(name2, categoryID2, amount2, typeName2, transactionDate2, notes2, out k);

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