using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web
{
    public partial class League : PageClass
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            Initialize();

            if (String.IsNullOrEmpty(Request.QueryString["ID"]) == false)
            {
                int AssetID = Statics.ParseInt(Request.QueryString["ID"]);
                Data.League league = master.db.Leagues.FirstOrDefault(o => o.AssetID == AssetID);
                if (league != null)
                {
                    litDescription.Text = Statics.TextToHtml(league.Description, false);
                    Data.Session session = master.db.Sessions.FirstOrDefault(o => o.AssetID == league.SessionID);
                    if (session != null)
                        litDeadline.Text = Statics.DateTimeToString(session.Deadline, ParseDateTimeType.LongDate);
                    litCost.Text = league.Cost.ToString("F");
                }
            }
        }
    }
}