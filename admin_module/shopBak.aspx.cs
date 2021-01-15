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
using Newtonsoft.Json;

namespace admin_module
{
    public partial class shopBak : System.Web.UI.Page
    {
       static SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //if(!IsPostBack)
            //{
            //    //binddish();
            //    //bindCategories();
            //}
           
        }
        [WebMethod]
        public static string  binddish()
        {
            string data = "";
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_dish", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "selectAllactive");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
           DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            data = JsonConvert.SerializeObject(dt);
            return data;
            
        }
        [WebMethod]
        public static string bindprice(int did)
        {
            string data = "";
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_dish_price_get_bY_dishID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dish_id", did);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            data = JsonConvert.SerializeObject(dt);
            return data;
        }

        [WebMethod]
        public static string bindCategories()
        {
            string data = "";
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_category_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            data = JsonConvert.SerializeObject(dt);
            return data;

        }
        //protected void rp_dishDetail_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{

        //}

        //protected void rp_dishDetail_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        Repeater priceRepeater = (Repeater)e.Item.FindControl("rp_price");
        //        HiddenField dishid = (HiddenField)e.Item.FindControl("hdf_dishid");
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand("sp_dish_price_get_bY_dishID", con);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@dish_id", dishid.Value);
        //        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //        DataTable dt = new DataTable();
        //        da.Fill(dt);
        //        con.Close();
        //        priceRepeater.DataSource = dt;
        //        priceRepeater.DataBind();
        //    }
        //}
    }
}