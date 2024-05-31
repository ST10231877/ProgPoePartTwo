using System;
using System.Data.SqlClient;
using System.Web.Security;
using System.Configuration;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// Login Button, SQL query to connect to database and redirect user to designated page
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //pull username and password
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // check for empty values
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblError.Text = "Both username and password are required.";
                return; 
            }

            //get connection string fron web config
            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseWebAppConnectionString"].ConnectionString;

            // SQL query to select the role of the user based on the provided username and password
            string query = "SELECT Role FROM LoginDetails WHERE Username = @Username AND Password = @Password";

            try
            {
                //create new sql connectiom
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    //add parameters
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);
                    conn.Open();
                    object result = cmd.ExecuteScalar();

                    //check for null result
                    if (result != null)
                    {
                        string role = result.ToString();
                        FormsAuthentication.SetAuthCookie(username, false);

                        // redirect user to either farmer or employee form
                        if (role == "Farmer")
                        {
                            Response.Redirect("FarmerDashboard.aspx");
                        }
                        else if (role == "Employee")
                        {
                            Response.Redirect("EmployeeDashboard.aspx");
                        }
                    }
                    else
                    {
                        lblError.Text = "Invalid username or password.";
                    }
                }
            }
            catch (SqlException ex)
            {
                lblError.Text = "A database error occurred: " + ex.Message;
            }
            catch (Exception ex)
            {
                lblError.Text = "An unexpected error occurred: " + ex.Message;
            }
        }
    }
}
