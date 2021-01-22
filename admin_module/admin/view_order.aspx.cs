using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;
using System.Text;

namespace admin_module.admin
{
    public partial class view_order : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        public DataTable udt = new DataTable();
        public DataTable ddt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idd"] != null && Session["idd"].ToString() != "")
            {
                if (!IsPostBack)
                {
                   if(Request.QueryString["orderID"]!=null && Request.QueryString["orderID"].ToString() != "")
                    {
                        bind_order_master();
                    }

                }

            }
            else
            {
                Response.Redirect("logout.aspx");

            }
        }

        public void bind_order_master()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_order_master_get_BY_order_id",con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@order_id",Request.QueryString["orderID"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            rp_order_master.DataSource = dt;
            rp_order_master.DataBind();
            udt = dt;
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
                ddt = dt;
            }
        }

        public void orderStatus()
        {
            
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_order_status_get", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            
            
        }


        
        public void deliveryBoyBind()
        {
            
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_deliveryBoy_get", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }
        
    }
}