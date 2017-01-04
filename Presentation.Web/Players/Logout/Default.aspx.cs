using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web.Players.Logout
{
    public partial class Default : PlayerPageClass
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            Initialize(false);
            Cookies.Set(Sessions.PublicUser, "");
            Response.Redirect(master.RelativePath + "/Players");
        }
    }
}