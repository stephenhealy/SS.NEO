using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.CMS._Masters
{
    public partial class Site : MasterClass
    {
        public override void PageLoad()
        {
            if (!IsPostBack)
            {
                if (String.IsNullOrEmpty(master.User.Image) == false)
                    imgAvatar.ImageUrl = master.User.Image;
                imgAvatar.AlternateText = master.User.Name;
            }
        }

        public string Active(string path)
        {
            string active = "";
            if (Request.Path.ToUpper().Contains(path.ToUpper()))
                active = " active";
            return active;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            master.User.Logout();
            Response.Redirect(Request.Url.PathAndQuery);
        }
    }
}