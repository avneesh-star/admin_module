using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Razorpay.Api;
using System.Net;

namespace admin_module
{
    public partial class Razorpaycheckout : System.Web.UI.Page
    {
        public string orderId;
        public string amount;
        public string contact;
        public string name;
        public string product;
        public string email;
        protected void Page_Load(object sender, EventArgs e)
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            amount = (Convert.ToInt32(Request.QueryString["amount"]) * 100).ToString();
            contact = Request.QueryString["mobile"].ToString();
            name = Request.QueryString["name"].ToString();
            product = Request.QueryString["product"].ToString();
            email = Request.QueryString["email"].ToString();

            Dictionary<string, object> input = new Dictionary<string, object>();
            input.Add("amount", amount);
            input.Add("currency", "INR");
            input.Add("payment_capture", 1);

            string key = "rzp_test_tyfQjoYyrPcAYz";
            string secret = "go9U0FIyUo7xiYvU9lG1Hll2";

            RazorpayClient client = new RazorpayClient(key, secret);

            Razorpay.Api.Order order = client.Order.Create(input);
            orderId = order["id"].ToString();
        }
    }
}