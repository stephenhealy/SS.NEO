using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.CMS._Repeat.System
{
    public partial class Settings : PageClass
    {
        private string LoggingKey = "Settings";
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("Settings", false, "");

            if (!IsPostBack)
            {
                master.Common.CheckSession(Page, Sessions.Saved, panSaved);

                Data.Setting item = master.db.Settings.FirstOrDefault();
                if (item != null)
                {
                    txtAlert.Text = item.Alert;
                    if (String.IsNullOrEmpty(item.AlertStart.ToString()) == false)
                        txtAlertStart.Text = Statics.DateTimeToString(item.AlertStart, Models.ParseDateTimeType.ShortDate);
                    if (String.IsNullOrEmpty(item.AlertEnd.ToString()) == false)
                        txtAlertEnd.Text = Statics.DateTimeToString(item.AlertEnd, Models.ParseDateTimeType.ShortDate);
                    txtEmailFrom.Text = item.EmailFrom;
                    txtEventTo.Text = item.EventTo;
                    txtEventCc.Text = item.EventCc;
                    txtEventBcc.Text = item.EventBcc;
                    txtContactTo.Text = item.ContactTo;
                    txtContactCc.Text = item.ContactCc;
                    txtContactBcc.Text = item.ContactBcc;
                    txtLeagueError.Text = item.LeagueError.ToString();
                    txtLeagueWarning.Text = item.LeagueWarning.ToString();
                    txtLesson.Text = item.Lesson.ToString();
                    txtEvent.Text = item.Event.ToString();
                    txtPlayers.Text = item.Players.ToString();
                    txtTeams.Text = item.Teams.ToString();
                    hypHistory.Attributes.Add("onclick", "return LoadModal('mainModal', '" + master.RelativePath + "/_Modals/History.aspx?k=" + this.LoggingKey + "&i=" + item.AssetID + "', 'History: <small>" + this.LoggingKey + "</small>');");
                }
                else
                    hypHistory.Visible = false;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Data.Setting item = master.db.Settings.FirstOrDefault();
            if (item == null)
            {
                item = new Data.Setting();
                item.AssetID = Models.Asset.New(master.db, master.User.ID);
                master.db.Settings.Add(item);
            }
            item.Alert = txtAlert.Text;
            if (String.IsNullOrEmpty(txtAlertStart.Text) == false)
                item.AlertStart = Statics.ParseDateTime(txtAlertStart.Text);
            else
                item.AlertStart = null;
            if (String.IsNullOrEmpty(txtAlertEnd.Text) == false)
                item.AlertEnd = Statics.ParseDateTime(txtAlertEnd.Text);
            else
                item.AlertEnd = null;
            item.EmailFrom = txtEmailFrom.Text;
            item.EventTo = txtEventTo.Text;
            item.EventCc = txtEventCc.Text;
            item.EventBcc = txtEventBcc.Text;
            item.ContactTo = txtContactTo.Text;
            item.ContactCc = txtContactCc.Text;
            item.ContactBcc = txtContactBcc.Text;
            item.LeagueError = Statics.ParseInt(txtLeagueError.Text);
            item.LeagueWarning = Statics.ParseInt(txtLeagueWarning.Text);
            item.Lesson = Statics.ParseInt(txtLesson.Text);
            item.Event = Statics.ParseInt(txtEvent.Text);
            item.Players = Statics.ParseInt(txtPlayers.Text);
            item.Teams = Statics.ParseInt(txtTeams.Text);
            item.Deleted = false;

            List<string> Errors = master.db.SaveChanges(this.LoggingKey, item.AssetID, master.User.ID, false);
            if (Errors.Count > 0)
            {
                panError.Visible = true;
                litError.Text = string.Join("<br/>", Errors.ToArray());
            }
            else
            {
                Sessions.Set(Sessions.Saved, "0");
                Response.Redirect(Request.Path);
            }
        }
    }
}