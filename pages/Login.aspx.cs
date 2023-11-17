using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



        }

        protected bool AuthenticateUser(string username, string password)
        {

            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Hardware"].ConnectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("ValidateUser", conn))
                {
                    int count = 0;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Username", SqlDbType.NVarChar, 50) { Value = username });
                    cmd.Parameters.Add(new SqlParameter("@Password", SqlDbType.NVarChar, 50) { Value = password });

                    object DatabaseValue = cmd.ExecuteScalar();


                    if (DatabaseValue is DBNull || DatabaseValue is null )
                    {
                        count = 0;
                        
                    }
                    else
                    {
                        Console.WriteLine("error #43");
                        count = Convert.ToInt32(DatabaseValue);
                    }

                    

                    if (count > 0)
                    {

  
                        FormsAuthentication.SetAuthCookie(username, false);

                        return true;
                    }
                    else;
                    {
                        return false;

                    }
                            

                    
                }


            }
        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // Authenticate user against the database
            if (AuthenticateUser(username, password))
            {
                Response.Redirect("~/Dashboard.aspx"); // Redirect to a secure page on successful login
            }
            else
            {
                Response.Redirect("~/pages/login.aspx");
            }
        }
    }
}
    