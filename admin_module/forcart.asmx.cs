using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Newtonsoft.Json;

namespace admin_module
{
    /// <summary>
    /// Summary description for forcart
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class forcart : System.Web.Services.WebService
    {
        SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

        [WebMethod]
        public void addtocard(int uid, int pid, int did, int qnt, int price)
        {
            con1.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_cart", con1);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "insert");
            cmd.Parameters.AddWithValue("@user_id", uid);
            cmd.Parameters.AddWithValue("@price_id", pid);
            cmd.Parameters.AddWithValue("@dish_id", did);
            cmd.Parameters.AddWithValue("@quantity", qnt);
            cmd.Parameters.AddWithValue("@dish_price", price);
            cmd.ExecuteNonQuery();
            con1.Close();
        }


        [WebMethod]
        public void datelecart(int cartid)
        {
            con1.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_cart", con1);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "delete");
            cmd.Parameters.AddWithValue("@cart_id", cartid);
            cmd.ExecuteNonQuery();
            con1.Close();
        }

        [WebMethod]
        public string bindcart(int uid)
        {
            string data = "";
            con1.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_cart", con1);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "getcart");
            cmd.Parameters.AddWithValue("@user_id", uid);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con1.Close();
            data = JsonConvert.SerializeObject(dt);
            return data;
        }

        [WebMethod]
        public void sendmsg(string a, long b, string c, string d, string e)
        {
            con1.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_contactUs_insert", con1);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name", a);
            cmd.Parameters.AddWithValue("@mobile", b);
            cmd.Parameters.AddWithValue("@email", c);
            cmd.Parameters.AddWithValue("@subject", d);
            cmd.Parameters.AddWithValue("@messege", e);
            cmd.ExecuteNonQuery();
            con1.Close();
        }

        
    }
}
