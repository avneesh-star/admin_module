using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Drawing;

namespace admin_module
{
    public partial class forgotpassword : System.Web.UI.Page
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

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            string tkn = tokengenrate();
            con.Open();
            SqlCommand cmd1 = new SqlCommand("sp_tbl_user", con);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@action", "login");
            cmd1.Parameters.AddWithValue("@user_email", txt_email.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                con.Open();
                SqlCommand cmd2 = new SqlCommand("sp_tbl_user", con);
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.AddWithValue("@action", "updatetoken");
                cmd2.Parameters.AddWithValue("@user_email", txt_email.Text);
                cmd2.Parameters.AddWithValue("@token", tkn);
                int ii = cmd2.ExecuteNonQuery();
                con.Close();
                if (ii > 0)
                {
                    MailAddress bcc = new MailAddress("noreplytes@yandex.com");
                    using (MailMessage mm = new MailMessage("noreplytes@yandex.com", txt_email.Text))
                    {
                        mm.Subject = "Password Reset";
                        mm.Body = "Hi," + txt_email.Text + "please click http://localhost:58335/resetPassword.aspx?token=" + Server.UrlEncode(tkn) + " here to reset your password";
                        mm.Bcc.Add(bcc);
                        mm.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.yandex.com.tr";
                        smtp.EnableSsl = true;
                        NetworkCredential NetworkCred = new NetworkCredential("noreplytes@yandex.com", "london@123");
                        smtp.UseDefaultCredentials = true;
                        smtp.Credentials = NetworkCred;
                        smtp.Port = 587;
                        smtp.Send(mm);
                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Password reset link send . Kindly check your mail');", true);
                        Session["msg"] = "Please cheack your mail to verify your E-Mail then login!!";
                    }
                }
            }
            else
            {
                lbl_msg.ForeColor = Color.Red;
                lbl_msg.Text = "E-Mail id not registered!!";
            }
        }
    }
}