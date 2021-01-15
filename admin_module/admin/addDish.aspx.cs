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
using System.Drawing;

namespace admin_module
{
    public partial class addDish : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        int DDD=0;
        int result;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idd"] != null && Session["idd"].ToString() != "")
            {
                if (!IsPostBack)
                {
                    if (Request.QueryString["did"] != null && Request.QueryString["did"].ToString() != "")
                    {
                       
                        edit();
                        
                        
                    }

                    BindCategory();

                }

            }
            else
            {
                Response.Redirect("logout.aspx");

            }
        }

        public void edit()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_dish", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "edit");
            cmd.Parameters.AddWithValue("@dish_id", Request.QueryString["did"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddl_category.SelectedValue = dt.Rows[0]["category_id"].ToString();
            txt_dish.Text = dt.Rows[0]["dish_name"].ToString();
            rbl_type.SelectedValue = dt.Rows[0]["dish_type"].ToString();
            txt_detail.Text = dt.Rows[0]["dish_detail"].ToString();
            ViewState["dimg"] = dt.Rows[0]["dish_image"].ToString();
            btn_save.Text = "Update";
        }


        public void BindCategory()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_category_get", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddl_category.DataTextField = "categgory_name";
            ddl_category.DataValueField = "category_id";
            ddl_category.DataSource = dt;
            ddl_category.DataBind();
            ddl_category.Items.Insert(0, new ListItem("--Select--", "0"));
        }

      

        
        public int getlastID()
        {
            
                con.Open();
                SqlCommand cmd2 = new SqlCommand("sp_tbl_dish_get_last_id", con);
                cmd2.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd2);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                return Convert.ToInt32(dt.Rows[0]["dish_id"].ToString());
            
        }




        protected void btn_save_Click(object sender, EventArgs e)
        {
            
            string FN = "";
            string[] validFileTypes = { "bmp", "gif", "png", "jpg", "jpeg" };
            
            string ext = Path.GetExtension(fu_image.PostedFile.FileName);
            bool isValidFile = false;
            for (int i = 0; i < validFileTypes.Length; i++)
            {
                if (ext == "." + validFileTypes[i])
                {
                    isValidFile = true;
                    break;
                }
            }
            
            if (btn_save.Text == "Save")
            {
                FN = DateTime.Now.Ticks.ToString() + Path.GetFileName(fu_image.PostedFile.FileName);
                fu_image.SaveAs(Server.MapPath("~/images" + "\\" + FN));
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_dish", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "insert");
                cmd.Parameters.AddWithValue("@dish_name", txt_dish.Text);
                cmd.Parameters.AddWithValue("@category_id", ddl_category.SelectedValue);
                cmd.Parameters.AddWithValue("@dish_detail", txt_detail.Text);
                cmd.Parameters.AddWithValue("@dish_type", rbl_type.SelectedValue);
                if (isValidFile)
                {
                    cmd.Parameters.AddWithValue("@dish_image", FN);
                    result = cmd.ExecuteNonQuery();
                    con.Close();
                    if (result > 0)
                    {
                        
                        Response.Redirect("dishPrice.aspx?dsid=" + getlastID());
                    }
                    else
                    {
                        lbl_msg.ForeColor = Color.Red;
                        lbl_msg.Text = "Dish not added!!";
                    }
                }
                else
                {
                    lbl_msg.ForeColor = Color.Red;
                    lbl_msg.Text = "Invalid File. Please upload a File with extension " + string.Join(",", validFileTypes);
                    
                }

            }
            else if (btn_save.Text == "Update")
            {
                FN= Path.GetFileName(fu_image.PostedFile.FileName); 
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_dish", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "update");
                cmd.Parameters.AddWithValue("@dish_id", Request.QueryString["did"]);
                cmd.Parameters.AddWithValue("@dish_name", txt_dish.Text);
                cmd.Parameters.AddWithValue("@category_id", ddl_category.SelectedValue);
                cmd.Parameters.AddWithValue("@dish_detail", txt_detail.Text);
                cmd.Parameters.AddWithValue("@dish_type", rbl_type.SelectedValue);
                if (FN != "")
                {
                    if (isValidFile)
                    {
                        FN = DateTime.Now.Ticks.ToString() + FN;
                        cmd.Parameters.AddWithValue("@dish_image", FN);
                        fu_image.SaveAs(Server.MapPath("~/images" + "\\" + FN));
                        File.Delete(Server.MapPath("~/images" + "\\" + ViewState["dimg"]));
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@dish_image", ViewState["dimg"]);
                        
                    }
                }
                else
                {
                    cmd.Parameters.AddWithValue("@dish_image", ViewState["dimg"]);
                }
                result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                   
                    Response.Redirect("dishPrice.aspx?dsid=" + getlastID());
                }
                else
                {
                    lbl_msg.ForeColor = Color.Red;
                    lbl_msg.Text = "Record no updated!!";
                }

            }

        }

    }


}
