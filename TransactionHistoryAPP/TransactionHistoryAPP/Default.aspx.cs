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
    public partial class Default : System.Web.UI.Page
    {
        DataConn dataConn = new DataConn();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string userName = TextBox1.Text;
                string passWord = TextBox2.Text;

                dataConn.Login(userName, passWord, out bool returnValue);

                if (returnValue == true)
                {
                    Session["Login"] = true;
                    Session["UserName"] = userName;
                    Response.Redirect("ViewTransactions.aspx");
                }
                else
                {
                    Response.Write("UserName or Password Incorrect");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}
