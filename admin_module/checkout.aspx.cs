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
    public partial class checkout : System.Web.UI.Page
    {
        public string product;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null && Session["userID"].ToString() != "")
            {
                if (!IsPostBack)
                {
                    bindviewcart();
                }
            }
            else
            {
                Response.Redirect("shop.aspx");
            }
        }

        public DataTable carttable()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_cart", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "getcart");
            cmd.Parameters.AddWithValue("@user_id", Session["userID"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public void bindviewcart()
        {
            product = "";
            int tts = 0;
            DataTable dt = carttable();
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    tts = tts + Convert.ToInt32(dt.Rows[i]["total_price"].ToString());
                    product = product + dt.Rows[i]["dish_name"].ToString() + ',';
                }
                product = product.TrimEnd(',');
                lbl_totalshop.Text = tts.ToString();
                if (dt.Rows.Count > 0)
                {
                    rpt_final_cat.DataSource = dt;
                    rpt_final_cat.DataBind();
                }
                else
                {
                    rpt_final_cat.DataSource = null;
                    rpt_final_cat.DataBind();
                }
               
            }


        }

        protected void palce_order_Click(object sender, EventArgs e)
        {
            DataTable dt = carttable();
            if (rbl_payment_mode.SelectedValue == "1")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_book_order", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@user_id", Session["userID"]);
                cmd.Parameters.AddWithValue("@name", txt_fname.Text);
                cmd.Parameters.AddWithValue("@email", txt_email.Text);
                cmd.Parameters.AddWithValue("@mobile", txt_mobile.Text);
                cmd.Parameters.AddWithValue("@address", txt_address.Text);
                cmd.Parameters.AddWithValue("@pincode", txt_pincode.Text);
                cmd.Parameters.AddWithValue("@total_price", lbl_totalshop.Text);
                cmd.Parameters.AddWithValue("@payment_type", rbl_payment_mode.SelectedItem.Text);
                int i = cmd.ExecuteNonQuery();
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
                        bindviewcart();
                }
            }
            else if(rbl_payment_mode.SelectedValue == "2")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_book_order", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@user_id", Session["userID"]);
                cmd.Parameters.AddWithValue("@name", txt_fname.Text);
                cmd.Parameters.AddWithValue("@email", txt_email.Text);
                cmd.Parameters.AddWithValue("@mobile", txt_mobile.Text);
                cmd.Parameters.AddWithValue("@address", txt_address.Text);
                cmd.Parameters.AddWithValue("@pincode", txt_pincode.Text);
                cmd.Parameters.AddWithValue("@total_price", lbl_totalshop.Text);
                cmd.Parameters.AddWithValue("@payment_type", rbl_payment_mode.SelectedItem.Text);
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i > 0)
                {
                    con.Open();
                    SqlCommand cmd2 = new SqlCommand("sp_lastorderID", con);
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.Parameters.AddWithValue("@userID", Session["userID"]);
                    SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                    DataTable dt2 = new DataTable();
                    da2.Fill(dt2);
                    con.Close();
                    Session["OrdID"] = dt2.Rows[0][0].ToString();
                    Response.Redirect(string.Format("Razorpaycheckout.aspx?name={0}&email={1}&mobile={2}&product={3}&amount={4}", txt_fname.Text, txt_email.Text, txt_mobile.Text, product, lbl_totalshop.Text));
                }
            }
        }
    }
}