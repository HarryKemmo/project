using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{ 
    public partial class Login : System.Web.UI.Page
    {
    protected void Page_Load(object sender, EventArgs e)
    {

        

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {

            string username = txtUsername.Text; // Get this from user input
            string password = txtPassword.Text ; // Get this from user input

            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Local"].ConnectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("ValidateUser", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Username", SqlDbType.NVarChar, 50) { Value = username });
                    cmd.Parameters.Add(new SqlParameter("@Password", SqlDbType.NVarChar, 50) { Value = password });

                    int userId = Convert.ToInt32(cmd.ExecuteScalar());

                    if (userId > 0)
                    {
                        // Authentication successful - user exists
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        // Authentication failed - invalid username or password
                        // You may want to display an error message to the user
                    }
                }
            }


        }
}
}