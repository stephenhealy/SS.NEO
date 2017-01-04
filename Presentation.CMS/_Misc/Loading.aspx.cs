using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.CMS._Misc
{
    public partial class Loading : PageClass
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("Loading", true, "");
        }
    }
}