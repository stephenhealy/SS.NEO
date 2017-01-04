using Models;
using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.Serialization;

namespace Presentation.CMS._Modals
{
    public partial class Session : PageClass
    {
        protected int AssetID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("", false, "");

            master.Common.CheckSession(Page, Sessions.Saved, panSaved);

            if (String.IsNullOrEmpty(Request.QueryString["ID"]) == false)
                AssetID = Statics.ParseInt(Request.QueryString["ID"]);
            if (!IsPostBack)
            {
                Data.Session item = master.Selector.Session(AssetID);
                if (item != null)
                {
                    litCurrent.Text = item.Name;
                    btnSave.Enabled = true;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            List<Data.LogDetail> details = new List<Data.LogDetail>();
            Data.Session copy = master.Selector.Session(AssetID);
            if (copy != null)
            {
                Data.Session session = new Data.Session();
                session.AssetID = Models.Asset.New(master.db, master.User.ID);
                session.SportID = copy.SportID;
                session.Name = txtName.Text;
                session.Deadline = Statics.ParseDateTime(txtDeadline.Text);
                session.StartDate = Statics.ParseDateTime(txtStartDate.Text);
                session.Enabled = copy.Enabled;
                master.db.Sessions.Add(session);

                string errors = master.SaveChanges(LoggingKeys.Sessions, session.AssetID);
                if (String.IsNullOrEmpty(errors))
                {
                    // Now, copy the leagues
                    List<Data.League> Leagues = master.db.Leagues.Where(o => o.SessionID == copy.AssetID && o.Deleted == false).OrderBy(o => o.Display).ToList();
                    foreach (Data.League League in Leagues)
                    {
                        Data.League league = new Data.League();
                        league.AssetID = Models.Asset.New(master.db, master.User.ID);
                        league.SessionID = session.AssetID;
                        league.Name = League.Name;
                        league.Description = League.Description;
                        league.Night = League.Night;
                        league.EZRegister = "";
                        league.EZSchedule = "";
                        league.Cost = League.Cost;
                        league.Display = League.Display;
                        league.Enabled = League.Enabled;
                        master.db.Leagues.Add(league);

                        errors = master.SaveChanges(LoggingKeys.Leagues, league.AssetID);
                        if (String.IsNullOrEmpty(errors) == false)
                            break;
                    }
                }

                // Check to make sure there are no errors.
                if (String.IsNullOrEmpty(errors))
                {
                    Sessions.Set(Sessions.Saved, "0");
                    master.Common.RegisterStartupScript(Page, "window.top.HideModalNavigate('myModal','" + master.RelativePath + "/_Repeat/Athletics/Sessions.aspx?Back=" + session.SportID + "');");
                }
                else
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "errored", "NotifyError('" + Statics.EscapeSingleJS(errors) + "', null, 'The following error occurred...');", true);
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            master.Common.RegisterStartupScript(Page, "window.top.HideModalRefresh('myModal');");
        }

    }
}