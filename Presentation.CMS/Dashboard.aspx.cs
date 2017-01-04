using Data;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.CMS
{
    public partial class Dashboard : PageClass
    {
        private class ActionRequired
        {
            public int ID { get; set; }
            public string Icon { get; set; }
            public string Css { get; set; }
            public string Message { get; set; }
            public string Link { get; set; }
            public string Email { get; set; }
            public string Phone { get; set; }
            public string Label { get; set; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("Dashboard", false, "");

            if (!IsPostBack)
            {
                // Action Required
                List<ActionRequired> actions = new List<ActionRequired>();

                DateTime min = Statics.DateTimeMin();
                DateTime now = Statics.DateTimeUTC();

                Data.Setting setting = master.db.Settings.FirstOrDefault();
                if (setting != null)
                {
                    int LeagueError = Statics.ParseInt(setting.LeagueError);
                    DateTime _error = now.AddDays(LeagueError);
                    string threshold = "has started";
                    if (LeagueError > 0)
                        threshold = "is " + LeagueError.ToString() + " day(s) from starting";
                    // EZSchedules missing for leagues
                    actions.AddRange((from leagues in master.db.Leagues
                                      join sessions in master.db.Sessions on leagues.SessionID equals sessions.AssetID
                                      where leagues.Enabled && leagues.Deleted == false
                                      && sessions.Enabled && sessions.Deleted == false
                                      && leagues.EZSchedule == "" && sessions.StartDate < _error
                                      select new ActionRequired()
                                      {
                                          ID = leagues.AssetID,
                                          Icon = "times-circle",
                                          Css = "danger",
                                          Message = "League &quot;" + leagues.Name + "&quot; <strong class='semi-bold'>" + threshold + "</strong>! You need to configure the EZSchedule.",
                                          Link = master.RelativePath + "/_Repeat/Athletics/Leagues.aspx?ID=*",
                                          Label = "Fix It Now"
                                      }).ToList());

                    int LeagueWarning = Statics.ParseInt(setting.LeagueWarning);
                    if (LeagueWarning == 0)
                        LeagueWarning = 7;
                    threshold = "less than " + LeagueWarning.ToString() + " day(s)";
                    DateTime _warning = now.AddDays(LeagueWarning);
                    // EZSchedules missing for leagues
                    actions.AddRange((from leagues in master.db.Leagues
                                      join sessions in master.db.Sessions on leagues.SessionID equals sessions.AssetID
                                      where leagues.Enabled && leagues.Deleted == false
                                      && sessions.Enabled && sessions.Deleted == false
                                      && leagues.EZSchedule == "" && sessions.StartDate < _warning && sessions.StartDate > _error
                                      select new ActionRequired()
                                      {
                                          ID = leagues.AssetID,
                                          Icon = "exclamation-triangle",
                                          Css = "warning",
                                          Message = "League &quot;" + leagues.Name + "&quot; is <strong class='semi-bold'>" + threshold + "</strong> from starting! Remember to configure the EZSchedule.",
                                          Link = master.RelativePath + "/_Repeat/Athletics/Leagues.aspx?ID=*",
                                          Label = "Update Now"
                                      }).ToList());
                    // Lessons
                    int Lesson = Statics.ParseInt(setting.Lesson);
                    if (Lesson >= 0)
                    {
                        if (Lesson == 0)
                            Lesson = 4;
                        threshold = "more than " + Lesson.ToString() + " week(s)";
                        DateTime _lesson = now.AddDays(Lesson * -7);
                        actions.AddRange((from registrations in master.db.LessonsRegisters
                                          join sports in master.db.Sports on registrations.SportID equals sports.AssetID
                                          where registrations.Deleted == false
                                          && sports.Enabled && sports.Deleted == false
                                          && registrations.Scheduled == min && registrations.Submitted < _lesson
                                          select new ActionRequired()
                                          {
                                              ID = registrations.AssetID,
                                              Icon = "cubes",
                                              Css = "secondary",
                                              Message = "&quot;" + registrations.First + " " + registrations.Last + "&quot; has waited <strong class='semi-bold'>" + threshold + "</strong> to schedule a lesson in " + sports.Name + ".",
                                              Email = registrations.Email,
                                              Phone = registrations.Phone,
                                              Link = master.RelativePath + "/_Repeat/Athletics/LessonsRegister.aspx?ID=*",
                                              Label = "Schedule It Now"
                                          }).ToList());
                    }
                    // Events
                    int Event = Statics.ParseInt(setting.Event);
                    if (Event >= 0)
                    {
                        if (Event == 0)
                            Event = 4;
                        threshold = "more than " + Event.ToString() + " week(s)";
                        DateTime _event = now.AddDays(Event * -7);
                        actions.AddRange((from registrations in master.db.EventRegistrations
                                          join sports in master.db.Sports on registrations.SportID equals sports.AssetID
                                          where registrations.Deleted == false
                                          && sports.Enabled && sports.Deleted == false
                                          && registrations.Scheduled == min && registrations.Submitted < _event
                                          select new ActionRequired()
                                          {
                                              ID = registrations.AssetID,
                                              Icon = "flag-o",
                                              Css = "secondary",
                                              Message = "&quot;" + registrations.First + " " + registrations.Last + "&quot; has waited <strong class='semi-bold'>" + threshold + "</strong> to book an event in " + sports.Name + ".",
                                              Email = registrations.Email,
                                              Phone = registrations.Phone,
                                              Link = master.RelativePath + "/_Repeat/Content/EventRegistration.aspx?ID=*",
                                              Label = "Book It Now"
                                          }).ToList());
                    }
                    // Players without teams
                    int Players = Statics.ParseInt(setting.Players);
                    if (Players >= 0)
                    {
                        if (Players == 0)
                            Players = 4;
                        threshold = "more than " + Players.ToString() + " week(s)";
                        DateTime _players = now.AddDays(Players * -7);
                        actions.AddRange((from seeking in master.db.Seekings
                                          join players in master.db.Players on seeking.PlayerID equals players.AssetID
                                          where (seeking.Team == null || seeking.Team == "") && seeking.Deleted == false
                                          && players.Enabled && players.Deleted == false
                                          && seeking.Filled == null && (seeking.Updated == null || (DateTime)seeking.Updated < _players)
                                          select new ActionRequired()
                                          {
                                              ID = 0,
                                              Icon = "user",
                                              Css = "default",
                                              Message = "Player &quot;" + players.First + " " + players.Last + "&quot; has spent <strong class='semi-bold'>" + threshold + "</strong> looking for a team.",
                                              Phone = players.Phone,
                                              Link = "mailto:" + players.Email,
                                              Label = "Email Now"
                                          }).ToList());
                    }
                    // Teams without players
                    int Teams = Statics.ParseInt(setting.Teams);
                    if (Teams >= 0)
                    {
                        if (Teams == 0)
                            Teams = 4;
                        threshold = "more than " + Teams.ToString() + " week(s)";
                        DateTime _teams = now.AddDays(Teams * -7);
                        actions.AddRange((from seeking in master.db.Seekings
                                          join players in master.db.Players on seeking.PlayerID equals players.AssetID
                                          where (seeking.Team != null && seeking.Team != "") && seeking.Deleted == false
                                          && players.Enabled && players.Deleted == false
                                          && seeking.Filled == null && (seeking.Updated == null || (DateTime)seeking.Updated < _teams)
                                          select new ActionRequired()
                                          {
                                              ID = 0,
                                              Icon = "user",
                                              Css = "default",
                                              Message = "Team &quot;" + seeking.Team + "&quot; (" + players.First + " " + players.Last + ") has spent <strong class='semi-bold'>" + threshold + "</strong> looking for a player.",
                                              Phone = players.Phone,
                                              Link = "mailto:" + players.Email,
                                              Label = "Email Now"
                                          }).ToList());
                    }
                }
                lstAction.DataSource = actions;
                lstAction.DataBind();

                // Bocce
                Data.Bocce bocce = master.db.Bocces.FirstOrDefault(o => o.Deleted == false);
                if (bocce != null)
                    txtBocce.Text = bocce.Message;

                // Recent Activity
                List<HistoryList> items = (from all in master.db.Logs
                                           join _logUsers in master.db.Users on all.CreatedBy equals _logUsers.AssetID into tUsers
                                           from logUsers in tUsers.DefaultIfEmpty()
                                           select new HistoryList()
                                           {
                                               LogID = all.ID,
                                               AssetID = all.AssetID,
                                               Avatar = all.Key,
                                               CreatedBy = (logUsers == null ? "" : logUsers.First + " " + logUsers.Last),
                                               CreatedOn = all.CreatedOn
                                           }).OrderByDescending(o => o.CreatedOn).Take(5).ToList();
                lstActivity.DataSource = items;
                lstActivity.DataBind();
            }
        }

        protected string Phone(object phone)
        {
            if (phone != null && phone.ToString() != "")
                return "<a class=\"btn btn-default\" data-toggle=\"popover\" data-content=\"" + Statics.FormatPhone(phone) + "\" title=\"Phone Number\">Call Now</a>";
            else
                return "";
        }

        protected string Email(object email)
        {
            if (email != null && email.ToString() != "")
                return "<a class=\"btn btn-default\" href=\"mailto:" + email.ToString() + "\">Email Now</a>";
            else
                return "";
        }

        protected string Link(string link, string id)
        {
            if (link.Contains("*"))
                return link.Replace("*", id);
            else
                return link;
        }

        protected string GetIt(string table, string id)
        {
            return master.Common.ExecuteSelect(master.db, table, id);
        }

        protected void btnBocce_Click(object sender, EventArgs e)
        {
            master.db.Bocces.Where(x => x.Deleted == false).ToList().ForEach(x => x.Deleted = true);
            Data.Bocce item = new Bocce();
            item.AssetID = Models.Asset.New(master.db, master.User.ID);
            item.Message = txtBocce.Text;
            item.Deleted = false;
            master.db.Bocces.Add(item);

            string errors = master.SaveChanges(LoggingKeys.Bocce, item.AssetID);
            // Check to make sure there are no errors.
            if (String.IsNullOrEmpty(errors))
                Sessions.Set(Sessions.Saved, "0");
            else
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "errored", "NotifyError('" + Statics.EscapeSingleJS(errors) + "', null, 'The following error occurred...');", true);
        }

    }
}