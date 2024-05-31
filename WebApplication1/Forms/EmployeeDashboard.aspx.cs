using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace WebApplication1
{
    public partial class EmployeeDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// Logic for adding a farmer when the Add Farmer button is clicked.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAddFarmer_Click(object sender, EventArgs e)
        {
            //pull input values from text boxes
            string farmerName = txtFarmerName.Text.Trim();
            string location = txtLocation.Text.Trim();
            string contactInfo = txtContactInfo.Text.Trim();

            //validate that all fields are filled
            if (string.IsNullOrEmpty(farmerName) || string.IsNullOrEmpty(location) || string.IsNullOrEmpty(contactInfo))
            {
                lblFarmerMessage.Text = "All fields are required.";
                return;
            }

            //get the connection string from web.config file
            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseWebAppConnectionString"].ConnectionString;

            //sql query to insert a new farmer
            string query = "INSERT INTO Farmers (Name, Location, ContactInfo) VALUES (@Name, @Location, @ContactInfo)";

            try
            {
                //create a new SQL connection
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    //add parameters to the SQL command
                    cmd.Parameters.AddWithValue("@Name", farmerName);
                    cmd.Parameters.AddWithValue("@Location", location);
                    cmd.Parameters.AddWithValue("@ContactInfo", contactInfo);

                    //open the SQL connection
                    conn.Open();
                    //execute the SQL command to get number of affected rows
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        lblFarmerMessage.Text = "Farmer added successfully.";
                        lblFarmerMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblFarmerMessage.Text = "Failed to add farmer. Please try again.";
                    }
                }
            }
            catch (SqlException ex)
            {
                lblFarmerMessage.Text = "A database error occurred: " + ex.Message;
            }
            catch (Exception ex)
            {
                lblFarmerMessage.Text = "An unexpected error occurred: " + ex.Message;
            }
        }

        /// <summary>
        /// Logic for flter products button
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnFilterProducts_Click(object sender, EventArgs e)
        {
            //pull filter values from dropdown list and text boxes
            string categoryFilter = ddlCategoryFilter.SelectedValue;
            string startDate = txtStartDate.Text;
            string endDate = txtEndDate.Text;

            //validate and parse start and end dates
            DateTime parsedStartDate, parsedEndDate;
            if (!DateTime.TryParse(startDate, out parsedStartDate))
            {
                parsedStartDate = DateTime.MinValue;
            }
            if (!DateTime.TryParse(endDate, out parsedEndDate))
            {
                parsedEndDate = DateTime.MaxValue;
            }

            //get connection string from web.config
            string connectionString = ConfigurationManager.ConnectionStrings["DatabaseWebAppConnectionString"].ConnectionString;

            //sql query to get filtered products
            string query = "SELECT ProductName, Category, ProductionDate FROM Products WHERE (@Category = 'All' OR Category = @Category) AND (ProductionDate BETWEEN @StartDate AND @EndDate)";

            try
            {
                //create new SQL connection
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    //add parameters SQL command
                    cmd.Parameters.AddWithValue("@Category", categoryFilter);
                    cmd.Parameters.AddWithValue("@StartDate", parsedStartDate);
                    cmd.Parameters.AddWithValue("@EndDate", parsedEndDate);

                    //use sqldataadapter to fill a datatable
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    //bind datatable to gridView
                    gvProducts.DataSource = dt;
                    gvProducts.DataBind();
                }
            }
            catch (SqlException ex)
            {
                lblFilterMessage.Text = "A database error occurred: " + ex.Message;
            }
            catch (Exception ex)
            {
                lblFilterMessage.Text = "An unexpected error occurred: " + ex.Message;
            }
        }
    }
}
