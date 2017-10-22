using Data;
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
    public partial class Tournament : TournamentControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize();
            this.SportID = Statics.ParseInt(ConfigurationManager.AppSettings[this.ConfigID]);

            if (!IsPostBack)
            {
                List<Data.Tournament> Tournaments = page.master.db.Tournaments.Where(o => o.SportID == this.SportID && o.Enabled && o.Deleted == false).ToList();
                var all = (from tournaments in Tournaments
                           join users in page.master.db.Users
                           on tournaments.UserID equals users.AssetID
                           select new
                           {
                               Date = tournaments.Date,
                               Cost = tournaments.Cost,
                               Name = tournaments.Name,
                               Description = tournaments.Description,
                               User = users.First + " " + users.Last,
                               Email = users.Email,
                               EZSchedule = tournaments.EZSchedule,
                               EZRegister = tournaments.EZRegister
                           }).ToList();

                DateTime now = Statics.DateTimeUTC();
                var upcoming = all.Where(o => o.Date >= now).OrderBy(o => o.Date).ToList().Take(15);
                List<AdminList> jumps = new List<AdminList>();
                DateTime previous = DateTime.MinValue;
                foreach (var tournament in upcoming) 
                {
                    if (previous == DateTime.MinValue || tournament.Date.Month != previous.Date.Month || tournament.Date.Year != previous.Date.Year) 
                    {
                        previous = tournament.Date;
                        jumps.Add(new AdminList() { Name = tournament.Date.ToString("MMM", System.Globalization.CultureInfo.InvariantCulture) + " " + tournament.Date.Year.ToString(), Parent = tournament.Date.ToString("MMM", System.Globalization.CultureInfo.InvariantCulture) });
                    }
                }
                rptJump.DataSource = jumps;
                rptJump.DataBind();
                rptUpcoming.DataSource = upcoming;
                rptUpcoming.DataBind();
                litUpcoming.Visible = (rptUpcoming.Items.Count == 0);
                //rptRecent.DataSource = all.Where(o => o.Date < now).OrderByDescending(o => o.Date).ToList().Take(10);
                //rptRecent.DataBind();
                //litRecent.Visible = (rptRecent.Items.Count == 0);
            }
        }
    }
}