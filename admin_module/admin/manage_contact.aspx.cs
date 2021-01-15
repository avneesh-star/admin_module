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
    public partial class manage_contact : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idd"] != null && Session["idd"].ToString() != "")
            {
                if (!IsPostBack)
                {

                    bindcontact();
                }

            }
            else
            {
                Response.Redirect("logout.aspx");

            }
        }

        public void bindcontact()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_contactUs_get", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            gv_contact.DataSource = dt;
            gv_contact.DataBind();
        }

        protected void gv_contact_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName== "STS")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_contactUs_delete",con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@cid", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                bindcontact();
            }
        }

        protected void gv_contact_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }
    }

    
}