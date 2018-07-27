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
        Encryption encryption = new Encryption();

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

        public bool Login(string userName, string hashValue, out bool returnValue)
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
                    if (PasswordDR[0].ItemArray[2].ToString() == hashValue)
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

        public bool StreamWrite(string tbName, int tbCatID, double tbAmount, string TypeName, DateTime tbTransDate, string tbNotes)
        {
            bool returnValue = false;
            StreamWriter OutPutInserts;

            OutPutInserts = File.AppendText("TransactionHistoryInserts.txt");

            string var = "INSERT INTO TransactionHistory (Name, CategoryID, Amount, TypeName, TransactionDate, Notes) VALUES "
                + "('" + tbName + "'), " + "('" + tbCatID + "'), " + "('" + tbAmount + "'), "
                + "(" + TypeName + "'), " + "('" + tbTransDate + "'), " + "('" + tbNotes + "')";
            
            OutPutInserts.WriteLine(var);
            OutPutInserts.Close();
            
            return returnValue;
        }
        
        public void Dispose()
        {
            sqlconn.Close();
            sqlconn = null;
        }
    }
}