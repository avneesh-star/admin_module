using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace admin_module.deliveryBoy
{
    public partial class dlogin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_delivery_boy_login",con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@boy_mobile", txtlogin.Text);
            cmd.Parameters.AddWithValue("@boy_password", password.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if(dt.Rows.Count>0)
            {
                Session["boyID"] = dt.Rows[0]["boy_id"].ToString();
                Response.Redirect("rorders.aspx");
            }
            else
            {
                lbl_msg.Text = "Wrong mobile or password!!";
            }
        }
    }
}