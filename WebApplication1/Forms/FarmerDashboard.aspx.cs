using System;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class FarmerDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// Logic for adding a product when the Add Product button is clicked.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            //pull input values from text boxes and dropdown list
            string productName = txtName.Text.Trim();
            string category = ddlCategory.SelectedValue;
            string productionDate = txtProductionDate.Text;

            //validate all fields are filled
            if (string.IsNullOrEmpty(productName) || string.IsNullOrEmpty(category) || string.IsNullOrEmpty(productionDate))
            {
                lblMessage.Text = "All fields are required.";
                return;
            }

            //validate the production date format
            DateTime parsedDate;
            if (!DateTime.TryParse(productionDate, out parsedDate))
            {
                lblMessage.Text = "Invalid production date.";
                return;
            }

            //get the connection string from the Web.config file
            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseWebAppConnectionString"].ConnectionString;

            //insert a new product
            string query = "INSERT INTO Products (FarmerID, ProductName, Category, Quantity, Price, ProductionDate) VALUES (@FarmerID, @ProductName, @Category, @Quantity, @Price, @ProductionDate)";

            try
            {
                //create a new SQL connection 
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    //create a SQL command with the query and connection
                    SqlCommand cmd = new SqlCommand(query, conn);
                    //add parameters
                    cmd.Parameters.AddWithValue("@FarmerID", 1);
                    cmd.Parameters.AddWithValue("@ProductName", productName);
                    cmd.Parameters.AddWithValue("@Category", category);
                    cmd.Parameters.AddWithValue("@Quantity", 0);
                    cmd.Parameters.AddWithValue("@Price", 0); 
                    cmd.Parameters.AddWithValue("@ProductionDate", parsedDate);

                    //open the SQL connection
                    conn.Open();
                    //execute the SQL command and get the number of affected rows
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        lblMessage.Text = "Product added successfully.";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblMessage.Text = "Failed to add product. Please try again.";
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
