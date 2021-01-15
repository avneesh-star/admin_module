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
    public partial class deliveryboy : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idd"] != null && Session["idd"].ToString() != "")
            {
                if (!IsPostBack)
                {
                    bindgrid();

                }

            }
            else
            {
                Response.Redirect("logout.aspx");

            }
        }

        public void bindgrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_delivery_boy_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            gv_deliveryBoy.DataSource = dt;
            gv_deliveryBoy.DataBind();
            
        }

        protected void gv_deliveryBoy_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "STS")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_delivery_boy_status_update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@boy_id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                bindgrid();
            }
            else
            {
                Response.Redirect("AddDeliveryBoy.aspx?bid=" + e.CommandArgument);
            }
        }

        protected void gv_deliveryBoy_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}