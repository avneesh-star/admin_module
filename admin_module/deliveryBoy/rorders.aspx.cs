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
    public partial class rorders : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["boyID"] != null && Session["boyID"].ToString() != "")
            {
                
                    if (!IsPostBack)
                    {
                        bindorders();
                    }
                
            }
                
            else
            {
                Response.Redirect("dlogout.aspx");
            }

        }

        public void bindorders()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_delivery_boy_orders",con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@delivery_boy_id", Session["boyID"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            rp_orders.DataSource = dt;
            rp_orders.DataBind();
        }

        protected void rp_orders_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DL")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_set_delivered", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@order_id", e.CommandArgument);
              int i=  cmd.ExecuteNonQuery();
                con.Close();
                if (i > 0)
                {
                    bindorders();
                }
               
            }
            else
            {
                Response.Redirect("view_detail.aspx?orderID="+e.CommandArgument);
            }
        }
    }
}