using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace admin_module
{
    public partial class manageDish : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("sp_tbl_dish", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "selectAll");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                gv_dish.DataSource = dt;
                gv_dish.DataBind();
            }
           else
            {
                gv_dish.DataSource =null;
                gv_dish.DataBind();
            }

        }
        
        protected void gv_dish_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "STS")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_dish", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "statusUpdate");
                cmd.Parameters.AddWithValue("@dish_id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                bindgrid();
            }
            else if (e.CommandName == "A")
            {
                Response.Redirect("addDish.aspx?did=" + e.CommandArgument);
            }
            else if (e.CommandName == "D")
            {
                con.Open();
                SqlCommand cmd1 = new SqlCommand("sp_tbl_dish", con);
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.AddWithValue("@action", "getImage");
                cmd1.Parameters.AddWithValue("@dish_id", e.CommandArgument);
                SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                da1.Fill(dt1);
                //con.Close();

                //con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_dish", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "delete");
                cmd.Parameters.AddWithValue("@dish_id", e.CommandArgument);
                int i=cmd.ExecuteNonQuery();
                con.Close();
                if (i > 0)
                {
                    
                    File.Delete(Server.MapPath("~/images" + "\\" + dt1.Rows[0][0].ToString()));
                }
                bindgrid();
            }
            else if (e.CommandName == "VP")
            {
                Response.Redirect("dishPrice.aspx?dsid=" + e.CommandArgument);
            }
        }

        protected void gv_dish_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}