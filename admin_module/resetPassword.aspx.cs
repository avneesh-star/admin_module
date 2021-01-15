using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using BCrypt.Net;

namespace admin_module
{
    public partial class resetPassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_msg.Text = Server.UrlDecode(Request.QueryString["token"]);
        }

        protected void btn_changePassword_Click(object sender, EventArgs e)
        {
            string token = Server.UrlDecode(Request.QueryString["token"]);
             token = token.Trim().Replace(" ", "+");
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_user", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "resetPassword");
            cmd.Parameters.AddWithValue("@user_password", BCrypt.Net.BCrypt.HashPassword(txt_newPassword.Text, 10));
            cmd.Parameters.AddWithValue("@token", token);
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
            {
                lbl_msg.Text = "Your password has reset!!";
            }
        }
    }
}