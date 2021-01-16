using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Newtonsoft.Json;

namespace admin_module.admin
{
    /// <summary>
    /// Summary description for webadmin
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class webadmin : System.Web.Services.WebService
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        [WebMethod]
        public string orderStatus(int a)
        {
            string data = "";
            con.Open();
            SqlCommand scmd = new SqlCommand("select order_status from tbl_order_master where order_id='"+a+"'",con);
            SqlDataAdapter sda = new SqlDataAdapter(scmd);
            DataTable dtt = new DataTable();
            sda.Fill(dtt);
            con.Close();
            if (dtt.Rows[0]["order_status"].ToString() != "5")
            { 
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_order_status_get", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                data = JsonConvert.SerializeObject(dt);  
            }
            return data;
        }

        [WebMethod]
        public string getOdrStatus(int a)
        {
            string data = "";
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_get_order_staus", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@order_in", a);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            data = JsonConvert.SerializeObject(dt);
            return data;
        }

        [WebMethod]
        public string getAssignBOy(int a)
        {
            string data = "";
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_get_delivery_boy", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@order_in", a);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            data = JsonConvert.SerializeObject(dt);
            return data;
        }

        [WebMethod]
        public string deliveryBoyBind()
        {
            string data = "";
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_deliveryBoy_get", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            data = JsonConvert.SerializeObject(dt);
            return data;
        }

        [WebMethod]
        public void updateOrderStatus(int a, int b)
        {
            if (b == 5)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_order_cancle", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@order_id", a);
                cmd.Parameters.AddWithValue("@cancle_by", "admin");
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_order_status_update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@order_in", a);
                cmd.Parameters.AddWithValue("@order_status", b);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            

        }

        [WebMethod]
        public void deliveryBoyAssign(int a, int b)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_delivery_boy_assign", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@order_in", a);
            cmd.Parameters.AddWithValue("@boy_id", b);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}
