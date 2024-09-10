using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.Configuration;

namespace QuizPortal
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Clear();
            }
            errorMsg.Visible = false;
        }
        protected void signup_button_click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string name = nameId.Text;
                string username = usernameId.Text;
                string password = passwordId.Text;
                string role = roleId.SelectedItem.Value;

                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = WebConfigurationManager.ConnectionStrings["conQuizPortal"].ConnectionString;
                try
                {
                    using (conn)
                    {
                        string checkUserQuery = "SELECT COUNT(*) FROM Users WHERE username=@Username";
                        SqlCommand checkUserCmd = new SqlCommand(checkUserQuery, conn);
                        checkUserCmd.Parameters.AddWithValue("@Username", username);

                        conn.Open();
                        int userCount = (int)checkUserCmd.ExecuteScalar();

                        if (userCount > 0)
                        {
                            errorMsg.Text = "User already exists. Please choose a different username.";
                            errorMsg.Visible = true;
                        }
                        else
                        {
                            string query = "INSERT INTO Users (name, username, password, role) VALUES (@Name, @Username, @Password, @Role)";
                            SqlCommand cmd = new SqlCommand(query, conn);
                            cmd.Parameters.AddWithValue("@Name", name);
                            cmd.Parameters.AddWithValue("@Username", username);
                            cmd.Parameters.AddWithValue("@Password", password);
                            cmd.Parameters.AddWithValue("@Role", role);

                            cmd.ExecuteNonQuery();
                            Response.Redirect("login.aspx");
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    errorMsg.Text = "An error occurred during SignUp. Please try again later! ";
                    errorMsg.Visible = true;
                }
            }
        }
    }
}