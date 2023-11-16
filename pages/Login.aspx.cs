using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
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
            string query = "SELECT UserId, Username FROM Users WHERE Username = @Username AND Password = @Password";

            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Hardware"].ConnectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("ValidateUser", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Username", SqlDbType.NVarChar, 50) { Value = username });
                    cmd.Parameters.Add(new SqlParameter("@Password", SqlDbType.NVarChar, 50) { Value = password });

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Authentication successful
                            int userId = reader.GetInt32(0);
                            string userName = reader.GetString(1);

                            // Create a Forms Authentication ticket
                            FormsAuthentication.SetAuthCookie(userName, false);

                            // You can store additional user information in session or other storage if needed
                            Session["UserId"] = userId;

                            return true;
                        }
                        else
                        {
                            // Authentication failed
                            return false;
                        }
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
                // Display an error message or redirect to an error page
            }
        }
    }
}
    