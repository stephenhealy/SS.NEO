using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web.Company.Staff
{
    public partial class Default : PageClass
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            Initialize();

            rptStaff.DataSource = master.db.Users.Where(o => o.Staff && o.Enabled && o.Deleted == false).OrderBy(o => o.Display).ToList();
            rptStaff.DataBind();
        }
    }
}