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
using System.Drawing;

namespace admin_module
{
    public partial class my_account : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["userID"]!=null && Session["userID"].ToString() != "")
            {
                if (!IsPostBack)
                {
                    binddata();
                }
            }
            else
            {
                Response.Redirect("shop.aspx");
            }
        }

        public void binddata()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_user", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "getById");
            cmd.Parameters.AddWithValue("@user_id", Session["userID"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                txtName.ReadOnly =true;
                txtName.Text = dt.Rows[0]["user_name"].ToString();
                txtEmail.ReadOnly = true;
                txtEmail.Text = dt.Rows[0]["user_email"].ToString();
                txtMobile.ReadOnly = true;
                txtMobile.Text = dt.Rows[0]["user_mobile"].ToString();
                btn_update.Text = "Edit";

            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            if (btn_update.Text == "Edit")
            {
                txtName.ReadOnly = false;
                txtMobile.ReadOnly = false;
                btn_update.Text = "Update";
                lbl_msg.ForeColor = Color.Red;
                lbl_msg.Text = "You can update only name and mobile number***";
            }
            else if (btn_update.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_user", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "proUpdate");
                cmd.Parameters.AddWithValue("@user_id", Session["userID"]);
                cmd.Parameters.AddWithValue("@user_name", txtName.Text);
                cmd.Parameters.AddWithValue("@user_mobile", txtMobile.Text);
                int i=cmd.ExecuteNonQuery();
                con.Close();
                if (i > 0)
                {
                    lbl_msg.ForeColor = Color.Red;
                    lbl_msg.Text = "Your record updated***";
                    binddata();
                }
            }
        }

        

        protected void btn_change_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_user", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "changePassword");
            cmd.Parameters.AddWithValue("@user_id", Session["userID"]);
            cmd.Parameters.AddWithValue("@user_password", BCrypt.Net.BCrypt.HashPassword(txtNewPassword.Text, 10));
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
            {
                lbl.ForeColor = Color.Red;
                lbl.Text = "Your password updated***";
            }
        }
    }
}