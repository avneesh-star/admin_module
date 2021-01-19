using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Razorpay.Api;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace admin_module
{
    public partial class RazorpayCallBack : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string paymentId = Request.Form["razorpay_payment_id"];
                string orderId = Request.Form["razorpay_order_id"];
                string signature = Request.Form["razorpay_signature"];

                string key = "rzp_test_tyfQjoYyrPcAYz";
                string secret = "go9U0FIyUo7xiYvU9lG1Hll2";

                RazorpayClient client = new RazorpayClient(key, secret);

                Dictionary<string, string> attributes = new Dictionary<string, string>();

                attributes.Add("razorpay_payment_id", paymentId);
                attributes.Add("razorpay_order_id", orderId);
                attributes.Add("razorpay_signature", signature);

                Utils.verifyPaymentSignature(attributes);
                pTxnId.InnerText = paymentId;
                pOrderId.InnerText = orderId;
                h1Messege.InnerText = "Transaction Successfull";
                //Session["OrdID"].ToString()
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_razorpay_success", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@order_id", Session["OrdID"]);
                cmd.Parameters.AddWithValue("@payment_id", paymentId);
               int i=cmd.ExecuteNonQuery();
                con.Close();
                if (i > 0)
                {
                    con.Open();
                    SqlCommand cmd3 = new SqlCommand("sp_tbl_cart", con);
                    cmd3.CommandType = CommandType.StoredProcedure;
                    cmd3.Parameters.AddWithValue("@action", "clearcart");
                    cmd3.Parameters.AddWithValue("@user_id", Session["userID"]);
                    cmd3.ExecuteNonQuery();
                    con.Close();
                    Session["OrdID"] = "";
                }
            }
            catch (Exception)
            {
                h1Messege.InnerText = "Transaction Falied";
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_razorpay_falied", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@order_id",Session["OrdID"]);
                cmd.Parameters.AddWithValue("@user_id",Session["userID"]);
                int i = cmd.ExecuteNonQuery();
                con.Close();
                Session["OrdID"] = "";
            }
        }
    }
}