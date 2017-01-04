using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web.Events
{
    public partial class Default : PageClass
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            Initialize();

            List<Data.Event> Events = master.db.Events.Where(o => o.Enabled && o.Deleted == false).ToList();
            var all = (from events in Events
                       join users in master.db.Users
                       on events.UserID equals users.AssetID
                       select new
                       {
                           StartDate = events.StartDate,
                           Title = events.Title,
                           Description = events.Description,
                           User = users.First + " " + users.Last,
                           Email = users.Email,
                           Link = events.Link
                       }).ToList();

            DateTime now = Statics.DateTimeUTC();
            rptUpcoming.DataSource = all.Where(o => o.StartDate >= now).ToList().OrderBy(o => o.StartDate).Take(5);
            rptUpcoming.DataBind();
            litUpcoming.Visible = (rptUpcoming.Items.Count == 0);
            rptRecent.DataSource = all.Where(o => o.StartDate < now).ToList().OrderByDescending(o => o.StartDate).Take(5);
            rptRecent.DataBind();
            litRecent.Visible = (rptRecent.Items.Count == 0);
        }
    }
}