using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TransactionHistoryAPP
{
    public partial class ViewTransactions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                Response.Write("Logged in! As : " + Session["Username"]);
            }
            if (Session["NewRecord"] != null)
            {
                Label1.Visible = true;
                Label1.Text = Session["NewRecord"].ToString();
                Label1.ForeColor = System.Drawing.Color.Green;
            } 
            else
            {
                Label1.Text = "";
                Label1.Visible = false;
            }
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            string grabtxt = Label1.Text;

            Label1.Text = grabtxt+ "Record Deleted !";
            Label1.ForeColor = System.Drawing.Color.Red;
        }
    }
}