using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web.Company.Sponsors
{
    public partial class Default : PageClass
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            Initialize();

            if (!IsPostBack)
            {
                rptSponsors.DataSource = master.db.Sponsors.Where(o => o.Enabled && o.Deleted == false).OrderBy(o => o.Display).ToList();
                rptSponsors.DataBind();
            }
        }
        protected string Address(string address, string city, string state, string zip)
        {
            if (String.IsNullOrEmpty(address))
            {
                if (String.IsNullOrEmpty(zip))
                {
                    // City and State
                    if (String.IsNullOrEmpty(city) == false && String.IsNullOrEmpty(state) == false)
                        return city + ", " + state;
                    else
                        return "";
                }
                else
                    return city + ", " + state + " " + zip;
            }
            else
            {
                if (String.IsNullOrEmpty(zip))
                {
                    // City and State
                    if (String.IsNullOrEmpty(city) == false && String.IsNullOrEmpty(state) == false)
                        return address + " | " + city + ", " + state;
                    else
                        return "";
                }
                else
                    return address + " | " + city + ", " + state + " " + zip;
            }
        }
    }
}