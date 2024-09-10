using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace QuizPortal
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Clear();
            }
            errorMsg.Visible = false;
        }

        protected void login_button_click(object sender, EventArgs e)
        {
            string username = usernameId.Text;
            string password = passwordId.Text;
            string role = roleId.SelectedValue;

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = WebConfigurationManager.ConnectionStrings["conQuizPortal"].ConnectionString;
            try
            {
                using (conn)
                {
                    conn.Open();
                    string query = "SELECT * FROM Users WHERE username=@Username AND password=@Password AND role=@Role";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@Role", role);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        if(role == "User")
                        {
                            Session["Username"] = username;
                            Session["Role"] = "User";
                            Response.Redirect("home.aspx");
                        }
                        if (role == "Admin")
                        {
                            Session["Username"] = username;
                            Session["Role"] = "Admin";
                            Response.Redirect("admin.aspx");
                        }
                    }
                    else
                    {
                        errorMsg.Text = "Invalid Username or Password !";
                        errorMsg.Visible = true;
                    }
                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                errorMsg.Text = "An error occured during Login. Please try again later!";
                errorMsg.Visible = true;
            }
        }
    }
}