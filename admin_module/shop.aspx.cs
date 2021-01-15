using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;

namespace admin_module
{
    public partial class shop : System.Web.UI.Page
    {
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
   
        public static int userID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                binddish();
                bindCategories();
            }
            if(Session["userID"]!=null && Session["userID"].ToString() != "")
            {
                userID = Convert.ToInt32(Session["userID"].ToString());
            }
           
        }

        public void binddish()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_get_dish_filter", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@category_id", Request.QueryString["cat"]);
            cmd.Parameters.AddWithValue("@dish_type", ViewState["typeID"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
           DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {

                rp_dishDetail.DataSource = dt;
                rp_dishDetail.DataBind();
            }
        }


        public void bindCategories()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_category_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            rp_categories.DataSource = dt;
            rp_categories.DataBind();
        }

        
       

        protected void rp_dishDetail_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater priceRepeater = (Repeater)e.Item.FindControl("rp_price");
                HiddenField dishid = (HiddenField)e.Item.FindControl("hdf_dishid");
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_dish_price_get_bY_dishID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@dish_id", dishid.Value);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                priceRepeater.DataSource = dt;
                priceRepeater.DataBind();
            }
        }

        protected void rbl_vegFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
          ViewState["typeID"]=  rbl_vegFilter.SelectedValue;
            binddish();
        }
    }
}