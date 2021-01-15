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
    public partial class cart_view : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null && Session["userID"].ToString() != "")
            {
                if (!IsPostBack)
                {
                    bindviewcart();
                }
            }
        }

        public void bindviewcart()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_cart", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "getcart");
            cmd.Parameters.AddWithValue("@user_id", Session["userID"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            rp_viewcart.DataSource = dt;
            rp_viewcart.DataBind();
        }

        protected void rp_viewcart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            TextBox txtqty = (TextBox)e.Item.FindControl("cartquantity");
            if (e.CommandName == "rmv")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_cart", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "delete");
                cmd.Parameters.AddWithValue("@cart_id", e.CommandArgument);
                int i=cmd.ExecuteNonQuery();
                con.Close();
                if (i > 0)
                {
                    bindviewcart();
                }
            }
            else if(e.CommandName == "edt")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_cart", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "update");
                cmd.Parameters.AddWithValue("@cart_id", e.CommandArgument);
                cmd.Parameters.AddWithValue("@quantity", txtqty.Text);
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i > 0)
                {
                    bindviewcart();
                }
            }
        }

        protected void btn_clear_cart_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_cart", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "clearcart");
            cmd.Parameters.AddWithValue("@user_id", Session["userID"]);
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
            {
                bindviewcart();
            }
        }
    }
}