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
    public partial class view_detail : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["boyID"] !=null && Session["boyID"].ToString() != "")
            {
                if (Request.QueryString["orderID"] != null && Request.QueryString["orderID"].ToString() != "")
                {
                    if (!IsPostBack)
                    {
                        bind_order_master();
                        getOdrStatus();
                    }
                }
            }
            else
            {
                Response.Redirect("dlogout.aspx");
            }
        }

        public void bind_order_master()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_order_master_get_BY_order_id", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@order_id", Request.QueryString["orderID"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            rp_order_master.DataSource = dt;
            rp_order_master.DataBind();
        }

        protected void rp_order_master_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater detailrp = (Repeater)e.Item.FindControl("rp_order_detail");

                con.Open();
                SqlCommand cmd = new SqlCommand("sp_order_detail_by_orderID_get", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@order_id", Request.QueryString["orderID"]);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                detailrp.DataSource = dt;
                detailrp.DataBind();
            }
        }

        public void getOdrStatus()
        {
           
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_get_order_staus", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@order_in", Request.QueryString["orderID"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            lbl_od_status.Text = dt.Rows[0]["order_status"].ToString();
        }
    }
}