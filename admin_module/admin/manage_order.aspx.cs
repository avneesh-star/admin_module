using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;



namespace admin_module.admin
{
    public partial class manage_order : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("sp_order_master_get", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                gv_order.DataSource = dt;
                gv_order.DataBind();
            }
            else
            {
                gv_order.DataSource = null;
                gv_order.DataBind();
            }
        }

        protected void gv_order_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void gv_order_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "STS")
            {
                Response.Redirect("view_order.aspx?orderID="+e.CommandArgument);
            }
        }
    }
}