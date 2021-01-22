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
    public partial class adminHome : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idd"] != null && Session["idd"].ToString() != "")
            {
                user_count();
                sale1days();
                sale7days();
                sale15days();
                sale30days();
            }
            else
            {
                Response.Redirect("logout.aspx");

            }
        }
        public void user_count()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select count(user_id)as user_count from tbl_user",con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            lbl_users.Text = dt.Rows[0][0].ToString();
        }
        public void sale1days()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select sum(total_price) as sale from tbl_order_master where order_status=4 and added_on>DATEADD(day, -1, GETDATE())", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            lbl_sale1.Text = dt.Rows[0][0].ToString();
        }
        public void sale7days()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select sum(total_price) as sale from tbl_order_master where order_status=4 and added_on>DATEADD(day, -7, GETDATE())", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            lbl_sale7.Text = dt.Rows[0][0].ToString();
        }

        public void sale15days()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select sum(total_price) as sale from tbl_order_master where order_status=4 and added_on>DATEADD(day, -15, GETDATE())", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            lbl_sale15.Text = dt.Rows[0][0].ToString();
        }

        public void sale30days()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select sum(total_price) as sale from tbl_order_master where order_status=4 and added_on>DATEADD(day, -30, GETDATE())", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            lbl_sale30.Text = dt.Rows[0][0].ToString();
        }

    }
}