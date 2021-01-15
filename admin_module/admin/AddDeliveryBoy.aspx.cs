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
    public partial class AddDeliveryBoy : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idd"] != null && Session["idd"].ToString() != "")
            {
                
                if (!IsPostBack)
                {
                    if (Request.QueryString["bid"] != null && Request.QueryString["bid"].ToString() != "")
                    {
                        boyEdit();
                    }  
                }

                
            }
            else
            {
                Response.Redirect("logout.aspx");
            }

        }
        public void boyEdit()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_delivery_boy_edit", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@boy_id", Request.QueryString["bid"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            txt_name.Text = dt.Rows[0]["boy_name"].ToString();
            txt_mobile.Text = dt.Rows[0]["boy_mobile"].ToString();
            txt_password.Text = dt.Rows[0]["boy_password"].ToString();
            txt_confirmpassword.Text = dt.Rows[0]["boy_password"].ToString();
            btn_save.Text = "Update";
        }
        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (btn_save.Text == "Save")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_delivery_boy_insert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@boy_name", txt_name.Text);
                cmd.Parameters.AddWithValue("@boy_mobile", txt_mobile.Text);
                cmd.Parameters.AddWithValue("@boy_password", txt_password.Text);
                cmd.Parameters.AddWithValue("@boy_added_by", Session["idd"]);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    Response.Redirect("deliveryboy.aspx");
                }
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_delivery_boy_update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@boy_name", txt_name.Text);
                cmd.Parameters.AddWithValue("@boy_mobile", txt_mobile.Text);
                cmd.Parameters.AddWithValue("@boy_password", txt_password.Text);
                cmd.Parameters.AddWithValue("@boy_id", Request.QueryString["bid"]);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    Response.Redirect("deliveryboy.aspx");
                }
            }
        }
    }
}