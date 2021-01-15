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
    public partial class login_register : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string tokengenrate()
        {
            byte[] time = BitConverter.GetBytes(DateTime.UtcNow.ToBinary());
            byte[] key = Guid.NewGuid().ToByteArray();
            string token = Convert.ToBase64String(time.Concat(key).ToArray());
            return token;
            // token = Server.UrlDecode(token);for decode
        }
        protected void btn_register_Click(object sender, EventArgs e)
        {
            string token = Server.UrlEncode(tokengenrate());
            con.Open();
            SqlCommand cmd1 = new SqlCommand("sp_tbl_user", con);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@action", "login");
            cmd1.Parameters.AddWithValue("@user_email", txt_user_email.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                Session["msg"] = "E-Mail id already registered!!";
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_user", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "insert");
                cmd.Parameters.AddWithValue("@user_name", txt_user_name.Text);
                cmd.Parameters.AddWithValue("@user_email", txt_user_email.Text);
                cmd.Parameters.AddWithValue("@user_mobile", txt_mobile.Text);
                cmd.Parameters.AddWithValue("@user_password", BCrypt.Net.BCrypt.HashPassword(txt_user_password.Text, 10));
                cmd.Parameters.AddWithValue("@token", tokengenrate());
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i > 0)
                {
                    Session["msg"] = "Your registration has been done .Please check your mail for Activate your account.";
                }
            }
            
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_user", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "login");
            cmd.Parameters.AddWithValue("@user_email", txt_login_mail.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                if(BCrypt.Net.BCrypt.Verify(txt_login_password.Text, dt.Rows[0]["user_password"].ToString()))
                {
                    if (dt.Rows[0]["user_status"].ToString() == "1")
                    {
                        if (dt.Rows[0]["email_status"].ToString() == "1")
                        {
                            Session["userID"] = dt.Rows[0]["user_id"].ToString();
                            Session["userName"] = dt.Rows[0]["user_name"].ToString();
                            Response.Redirect("shop.aspx?userID=" + dt.Rows[0]["user_id"].ToString());
                        }
                        else
                        {
                            Session["msg"] = "Email not verfied yet Please verify fist!!";
                        }
                    }
                    else
                    {
                        Session["msg"] = "Your account is deacitvates by admin!!";
                    }
                }
                else
                {
                    Session["msg"] = "wrong password!!";
                }
                
            }
            else
            {
                {
                    Session["msg"] = "wrong email!!";
                }
            }
        }
    }
}