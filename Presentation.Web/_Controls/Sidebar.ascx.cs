using Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web._Controls
{
    public partial class Sidebar : SidebarControl
    {
        protected int Counter { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize();
            this.SportID = Statics.ParseInt(ConfigurationManager.AppSettings[this.ConfigID]);

            if (!IsPostBack)
            {
                rptCarousel.DataSource = page.master.db.Sidebars.Where(o => o.SportID == this.SportID && o.Enabled && o.Deleted == false).OrderBy(o => o.Display).ToList();
                rptCarousel.DataBind();
            }
        }
    }
}