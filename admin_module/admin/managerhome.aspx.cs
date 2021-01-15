using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace admin_module
{
    public partial class managerhome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["mid"] != null && Session["mid"].ToString() != "")
            {
                if (!IsPostBack)
                {

                    

                }

            }
            else
            {
                Response.Redirect("logout.aspx");

            }
        }
    }
}