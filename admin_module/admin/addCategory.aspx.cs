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
    public partial class addCategory : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idd"] != null && Session["idd"].ToString() != "")
            {

                if (!IsPostBack)
                {
                    if (Request.QueryString["cid"] != null && Request.QueryString["cid"].ToString() != "")
                    {
                        categoryEdit();
                    }
                }


            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }

        public void categoryEdit()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_category_edit", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@category_id", Request.QueryString["cid"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            txt_category_name.Text = dt.Rows[0]["categgory_name"].ToString();
            btn_save.Text = "Update";
        }
        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (btn_save.Text == "Save")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_category_insert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@category_name", txt_category_name.Text);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    Response.Redirect("categoryManage.aspx");
                }
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_category_update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@category_id", Request.QueryString["cid"]);
                cmd.Parameters.AddWithValue("@category_name", txt_category_name.Text);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    Response.Redirect("categoryManage.aspx");
                }
            }
        }
    }
}