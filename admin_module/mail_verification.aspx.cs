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
    public partial class mail_verification : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            mail_verify();
            
        }

        public void mail_verify()
        {
            string token = Server.UrlDecode(Request.QueryString["token"]);
            token = token.Trim().Replace(" ", "+");
            con.Open();
            SqlCommand cmd2 = new SqlCommand("sp_tbl_user", con);
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Parameters.AddWithValue("@action", "emailverify");
            cmd2.Parameters.AddWithValue("@token", token);
            int i = cmd2.ExecuteNonQuery();
            con.Close();
            if (i > 0)
            {
                lbl.Text = "Your email verified!!";
                Session["msg"] = "E-Mail verified successfully.Please login!!";
            }

            else
            {
                lbl.Text = "Your not email verified!!";
            }
        }
    }
}
