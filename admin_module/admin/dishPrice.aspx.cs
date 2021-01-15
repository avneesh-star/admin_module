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
    public partial class dishPrice : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idd"] != null && Session["idd"].ToString() != "")
            {
                if(Request.QueryString["dsid"]!=null && Request.QueryString["dsid"].ToString()!="")
                {
                    if (!IsPostBack)
                    {
                        bindgrid();

                    }
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
            SqlCommand cmd=new SqlCommand("sp_tbl_dish_price", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "selectByDishID");
            cmd.Parameters.AddWithValue("@dish_id", Request.QueryString["dsid"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if(dt.Rows.Count>0)
            {
                gv_dishPrice.DataSource = dt;
                gv_dishPrice.DataBind();
            }
            else
            {
                dt.Rows.Add(dt.NewRow());
                gv_dishPrice.DataSource = dt;
                gv_dishPrice.DataBind();
                int columncount = gv_dishPrice.Rows[0].Cells.Count;
                gv_dishPrice.Rows[0].Cells.Clear();
                gv_dishPrice.Rows[0].Cells.Add(new TableCell());
                gv_dishPrice.Rows[0].Cells[0].ColumnSpan = columncount;
                gv_dishPrice.Rows[0].Cells[0].Text = "No attribute added";
            }
           
        }
       
        protected void gv_dishPrice_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "SV")
            {
                TextBox TB1 = gv_dishPrice.FooterRow.FindControl("txtAttr2") as TextBox;
                TextBox TB2 = gv_dishPrice.FooterRow.FindControl("txtPrice2") as TextBox;
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_dish_price", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "insert");
                cmd.Parameters.AddWithValue("@dish_id", Request.QueryString["dsid"]);
                cmd.Parameters.AddWithValue("@attribute", TB1.Text);
                cmd.Parameters.AddWithValue("@price", TB2.Text);
                int i=cmd.ExecuteNonQuery();
                con.Close();
                if (i > 0)
                {
                    con.Open();
                    SqlCommand cmd2 = new SqlCommand("sp_tbl_dish_status_update", con);
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.Parameters.AddWithValue("@dish_id", Request.QueryString["dsid"]);
                    cmd2.ExecuteNonQuery();
                    con.Close();
                }
                bindgrid();
            }
        }

        

        protected void gv_dishPrice_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv_dishPrice.EditIndex = -1;
            bindgrid();
        }

        protected void gv_dishPrice_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv_dishPrice.EditIndex = e.NewEditIndex;
            bindgrid();
        }

        protected void gv_dishPrice_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox TB1 = gv_dishPrice.Rows[e.RowIndex].FindControl("txtAttr1") as TextBox;
            TextBox TB2 = gv_dishPrice.Rows[e.RowIndex].FindControl("txtPrice1") as TextBox;
            
            string IDD = gv_dishPrice.DataKeys[e.RowIndex].Value.ToString();
            con.Open();
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_dish_price", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "update");
            
            cmd.Parameters.AddWithValue("@attribute", TB1.Text);
            cmd.Parameters.AddWithValue("@price", TB2.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            
            gv_dishPrice.EditIndex = -1;
            bindgrid();
        }

        protected void gv_dishPrice_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string IDD = gv_dishPrice.DataKeys[e.RowIndex].Value.ToString();
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_dish_price", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "delete");
            cmd.Parameters.AddWithValue("@attr_id", IDD);
            int i=cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
            {
                con.Open();
                SqlCommand cmd2 = new SqlCommand("sp_tbl_dish_status_update", con);
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.AddWithValue("@dish_id", Request.QueryString["dsid"]);
                cmd2.ExecuteNonQuery();
                con.Close();
            }
            bindgrid();
        }
    }
}