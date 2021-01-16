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
    public partial class order_history : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null && Session["userID"].ToString() != "")
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
            SqlCommand cmd = new SqlCommand("sp_order_master_get_history", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@user_id", Session["userID"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            rp_order_history.DataSource = dt;
            rp_order_history.DataBind();
        }

        protected void rp_order_history_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "C")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_order_cancle", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@order_id", e.CommandArgument);
                cmd.Parameters.AddWithValue("@cancle_by", "Coustomer");
                cmd.ExecuteNonQuery();
                con.Close();
                binddata();
            }
        }
    }
}