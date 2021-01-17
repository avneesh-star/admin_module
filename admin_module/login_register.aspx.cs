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
using System.IO;
using System.Drawing;
using System.Net;
using System.Net.Mail;

namespace admin_module
{
    public partial class login_register : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["userMail"] != null)
                {
                    txt_login_mail.Text = Request.Cookies["userMail"].Value;
                }
                if (Request.Cookies["password"] != null)
                {
                    txt_login_password.Attributes.Add("value", Request.Cookies["password"].Value);
                }
                if (Request.Cookies["userMail"] != null && Request.Cookies["password"] != null)
                {
                    cb_remember.Checked = true;
                }
            }
            
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
            
            string tkn = tokengenrate();
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
                cmd.Parameters.AddWithValue("@token", tkn);
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i > 0)
                {
                    MailAddress bcc = new MailAddress("noreplytes@yandex.com");
                    using (MailMessage mm = new MailMessage("noreplytes@yandex.com", txt_user_email.Text))
                    {
                        mm.Subject = "Verification Mail";
                        mm.Body = "Hi," + txt_user_name.Text + "please click http://localhost:58335/mail_verification.aspx?token=" + Server.UrlEncode(tkn) + " here to veify your mail";
                        mm.Bcc.Add(bcc);
                        mm.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.yandex.com.tr";
                        smtp.EnableSsl = true;
                        NetworkCredential NetworkCred = new NetworkCredential("noreplytes@yandex.com", "password");
                        smtp.UseDefaultCredentials = true;
                        smtp.Credentials = NetworkCred;
                        smtp.Port = 587;
                        smtp.Send(mm);
                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Your registration has been done. Kindly check your mail');", true);
                        Session["msg"] = "Please cheack your mail to verify your E-Mail then login!!";
                    }
                    //Response.Write("<script>window.location='Login.aspx';</script>");
                    
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
                            if (cb_remember.Checked == true)
                            {
                                Response.Cookies["userMail"].Value = txt_login_mail.Text;
                                Response.Cookies["password"].Value = txt_login_password.Text;
                                Response.Cookies["userMail"].Expires = DateTime.Now.AddDays(15);
                                Response.Cookies["password"].Expires = DateTime.Now.AddDays(15);
                            }
                            else
                            {
                                Response.Cookies["userMail"].Expires = DateTime.Now.AddDays(-1);
                                Response.Cookies["password"].Expires = DateTime.Now.AddDays(-1);
                            }
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
