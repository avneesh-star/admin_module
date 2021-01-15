using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace admin_module
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_signin_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_login_check", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@user_name", txt_email.Text);
            cmd.Parameters.AddWithValue("@user_password", txt_password.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                
                    Session["idd"] = dt.Rows[0]["userId"].ToString();
                    Session["UserName"] = dt.Rows[0]["uname"].ToString();
                    
                    Response.Redirect("adminHome.aspx?pp=" + dt.Rows[0]["uname"].ToString());
                

            }
            else
            {
                Response.Write("<script>alert('Login Falied!!')</script>");
            }
        }
    }
}