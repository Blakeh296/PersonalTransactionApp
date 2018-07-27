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
        Encryption encryption = new Encryption();

        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.BackColor = System.Drawing.Color.LightYellow;
            TextBox2.BackColor = System.Drawing.Color.LightYellow;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
        
            try
            {
                
                string userName = TextBox1.Text;
                string passWord = TextBox2.Text;

                string hashValue = encryption.Encrypt(passWord);

                dataConn.Login(userName, hashValue, out bool returnValue);

                if (returnValue == true)
                {
                    Session["Login"] = true;
                    Session["UserName"] = userName;
                    Response.Redirect("ViewTransactions.aspx");
                }
                else
                {
                    Response.Write("UserName or Password Incorrect");
                    TextBox1.BackColor = System.Drawing.Color.Red;
                    TextBox2.BackColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}
