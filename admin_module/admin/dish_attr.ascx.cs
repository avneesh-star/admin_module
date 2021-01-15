using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace admin_module
{
    public partial class dish_attr : System.Web.UI.UserControl
    {
        public event EventHandler RemoveUserControl;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_remove_Click(object sender, EventArgs e)
        {
            RemoveUserControl(sender, e);
        }
    }
}