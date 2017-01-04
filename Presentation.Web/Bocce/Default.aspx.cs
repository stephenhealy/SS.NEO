using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web.Bocce
{
    public partial class Default : PageClass
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            Initialize();

            if (!IsPostBack)
            {
                // Bocce
                Data.Bocce bocce = master.db.Bocces.FirstOrDefault(o => o.Deleted == false);
                if (bocce != null)
                    litBocce.Text = Statics.TextToHtml(bocce.Message);
            }
        }
    }
}