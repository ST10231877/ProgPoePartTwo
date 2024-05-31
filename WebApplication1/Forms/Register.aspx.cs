using System;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// Logic for registering a new user when the Register button is clicked.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //pull input values from text boxes and radio buttons
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string role = roleFarmer.Checked ? "Farmer" : (roleEmployee.Checked ? "Employee" : "");

            //validate that all fields are filled
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(role))
            {
                lblMessage.Text = "All fields are required.";
                return; 
            }
            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseWebAppConnectionString"].ConnectionString;

            //sql query to insert a new user registration
            string query = "INSERT INTO LoginDetails (Username, Password, Role) VALUES (@Username, @Password, @Role)";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    //add parameters to the SQL command
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@Role", role);
                    conn.Open();
                    //execute sql command to get number affected rows
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Registration failed. Please try again.";
                    }
                }
            }
            catch (SqlException ex)
            {
                lblMessage.Text = "A database error occurred: " + ex.Message;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An unexpected error occurred: " + ex.Message;
            }
        }
    }
}
