using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace TransactionHistoryAPP
{
    public class DataConn
    {
        private SqlConnection sqlconn;

        public void ApplicationLog(string LogMessage)
        {
            StreamWriter logOutput = new StreamWriter(HttpRuntime.AppDomainAppPath + "\\AppLog.txt", true);
            logOutput.WriteLine(DateTime.Now.ToString() + ":  " + LogMessage);
            logOutput.Close();
        }

        public DataConn()
        {
            string SQLConnString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            sqlconn = new SqlConnection(SQLConnString);
        }

        public DataConn(string ConnectionString)
        {
            sqlconn = new SqlConnection(ConnectionString);
        }

        public bool Login(string userName, string passWord, out bool returnValue)
        {
            returnValue = false;
            
            try
            {
                SqlConnection sqlConn;

                string ConnString = ConnString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                sqlConn = new SqlConnection(ConnString);

                SqlDataAdapter SqlDA = new SqlDataAdapter("dbo.AdminLogin", ConnString);

                // Create A DataTabla
                DataTable dtPasswordCheck = new DataTable();

                // Fill the Data Table with data from Data Adapter
                SqlDA.Fill(dtPasswordCheck);
                // TODO: FINISH THIS CLASS FROM RESUME ASPNET
                // Create a DataRow, Add Where statement to Stored Proc through ("UserName = '" + TextBox1.Text + "'")
                DataRow[] PasswordDR = dtPasswordCheck.Select("UserName = '" + userName + "'");
                if (PasswordDR.Any())
                {
                    if (PasswordDR[0].ItemArray[2].ToString() == passWord)
                    {
                        returnValue = true;
                    }
                    else
                    {
                        returnValue = false;
                    }
                }
               
                return returnValue;
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return returnValue;
        }

        public int NewTransaction(string Name, int CategoryID, double Money, string TypeName, DateTime TransactionDate, string Notes, out int k)
        {
            string ConnString;
            try
            {
                SqlConnection sqlConn;

                ConnString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                sqlConn = new SqlConnection(ConnString);

                SqlCommand insertNewUser = new SqlCommand("dbo.InsTransHistory", sqlConn);
                insertNewUser.CommandType = CommandType.StoredProcedure;

                insertNewUser.Parameters.AddWithValue("@Name", Name);
                insertNewUser.Parameters.AddWithValue("@CategoryID", CategoryID);
                insertNewUser.Parameters.AddWithValue("@Amount", Money);
                insertNewUser.Parameters.AddWithValue("@TypeName", TypeName);
                insertNewUser.Parameters.AddWithValue("@TransactionDate", TransactionDate);
                insertNewUser.Parameters.AddWithValue("@Notes", Notes);

                sqlConn.Open();
                k = insertNewUser.ExecuteNonQuery();
                
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return k;
        }
        
        public void Dispose()
        {
            sqlconn.Close();
            sqlconn = null;
        }
    }
}