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
    public partial class League : LeagueControl
    {
        protected List<Data.League> Current { get; set; }
        protected int CurrentMax { get; set; }
        protected List<Data.League> Upcoming { get; set; }
        protected int UpcomingMax { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize();
            this.SportID = Statics.ParseInt(ConfigurationManager.AppSettings[this.ConfigID]);

            if (!IsPostBack)
            {
                Data.Sport sport = page.master.db.Sports.FirstOrDefault(o => o.AssetID == this.SportID);
                if (sport != null)
                {
                    if (String.IsNullOrEmpty(this.Sport))
                        this.Sport = sport.Name;
                    LeagueDay days = new LeagueDay();
                    // Determine current and upcoming session
                    DateTime now = Statics.DateTimeUTC();
                    Data.Session upcoming = page.master.db.Sessions.Where(o => o.SportID == this.SportID && o.StartDate > now && o.Enabled && o.Deleted == false).OrderBy(o => o.StartDate).FirstOrDefault();
                    if (upcoming != null)
                    {
                        Upcoming = page.master.db.Leagues.Where(o => o.SessionID == upcoming.AssetID && o.Enabled && o.Deleted == false).ToList();
                        page.master.Upcoming = Upcoming.Count;
                        var all = (from leagues in page.master.db.Leagues
                                       where leagues.SessionID == upcoming.AssetID && leagues.Enabled && leagues.Deleted == false
                                       group leagues.Name by leagues.Night into g
                                       select new { Night = g.Key, Total = g.Count() }).ToList();
                        if (all.Count > 0)
                            UpcomingMax = all.Max(o => o.Total);
                        rptUpcoming.DataSource = days.Week;
                        rptUpcoming.DataBind();
                    }
                    Data.Session current = page.master.db.Sessions.Where(o => o.SportID == this.SportID && o.StartDate <= now && o.Enabled && o.Deleted == false).OrderByDescending(o => o.StartDate).FirstOrDefault();
                    if (current != null)
                    {
                        Current = page.master.db.Leagues.Where(o => o.SessionID == current.AssetID && o.Enabled && o.Deleted == false).ToList();
                        var all = (from leagues in page.master.db.Leagues
                                   where leagues.SessionID == current.AssetID && leagues.Enabled && leagues.Deleted == false
                                   group leagues.Name by leagues.Night into g
                                   select new { Night = g.Key, Total = g.Count() }).ToList();
                        if (all.Count > 0)
                            CurrentMax = all.Max(o => o.Total);
                        rptCurrent.DataSource = days.Week;
                        rptCurrent.DataBind();
                    }
                }
            }
        }

        protected void rptCurrent_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            BindData(Current, CurrentMax, e, lblCurrent, rptCurrent, litCurrent);
        }

        protected void rptUpcoming_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            BindData(Upcoming, UpcomingMax, e, lblUpcoming, rptUpcoming, litUpcoming);
        }

        private void BindData(List<Data.League> leagues, int maximum, RepeaterItemEventArgs e, Label label, Repeater repeater, Literal literal)
        {
            RepeaterItem item = (RepeaterItem)e.Item;
            if (item.ItemType != ListItemType.Footer && item.ItemType != ListItemType.Header
                 && item.ItemType != ListItemType.Pager && item.ItemType != ListItemType.Separator)
            {
                LeagueDayOfWeek day = (LeagueDayOfWeek)item.DataItem;
                List<Data.League> night = leagues.Where(o => o.Night == day.Number).ToList();
                for (int ii = night.Count; ii < maximum; ii++)
                    night.Add(new Data.League() { Name = "&nbsp;", Display = 99999 });

                Repeater rptLeagues = (Repeater)item.FindControl("rptLeagues");
                rptLeagues.DataSource = night.OrderBy(o => o.Display).ToList();
                rptLeagues.DataBind();
            }

            if (leagues.Count > 0)
            {
                label.Text = leagues.Count.ToString();
                literal.Visible = false;
            }
            else
                label.Visible = repeater.Visible = false;
        }
    }
}