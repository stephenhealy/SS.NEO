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
    public partial class Lesson : LessonControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize();
            this.SportID = Statics.ParseInt(ConfigurationManager.AppSettings[this.ConfigID]);
            
            if (!IsPostBack)
            {
                page.master.Common.CheckSession(Page, Sessions.Green, panRegistered);

                page.master.Common.DataBindDDL(ddlValues, "", "", page.master.db.Lessons.Where(o => o.SportID == this.SportID && o.Enabled && o.Deleted == false).Select(o => o.Value).Distinct().OrderBy(o => o).ToList());
                rptLesson.DataSource = page.master.db.Lessons.Where(o => o.SportID == this.SportID && o.Enabled && o.Deleted == false).OrderBy(o => o.Display).ToList();
                rptLesson.DataBind();
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Add to database
            Data.LessonsRegister register = new Data.LessonsRegister();
            register.AssetID = Models.Asset.New(page.master.db, 0);
            register.SportID = this.SportID;
            register.Submitted = Statics.DateTimeUTC();
            register.Scheduled = Statics.DateTimeMin();
            register.First = txtFirst.Text;
            register.Last = txtLast.Text;
            register.Parent = txtParent.Text;
            register.Email = txtEmail.Text;
            register.Phone = txtPhone.Text;
            register.Participants = Statics.ParseInt(ddlValues.SelectedItem.Value);
            register.Instructor = 0;
            page.master.db.LessonsRegisters.Add(register);
            page.master.db.SaveChanges();

            // Send email
            Data.Setting item = page.master.db.Settings.FirstOrDefault();
            if (item != null && String.IsNullOrEmpty(this.EmailTo) == false)
            {
                Models.EventLog.Add(page.master.db, EventLog.Email, "Sending New Lesson Registration To [" + this.EmailTo + "] Cc = [" + this.EmailCc + "], Bcc = [" + this.EmailBcc + "]");
                page.master.Common.AppendBody("First Name:", register.First, false);
                page.master.Common.AppendBody("Last Name:", register.Last, false);
                Data.Sport sport = page.master.db.Sports.FirstOrDefault(o => o.AssetID == this.SportID);
                if (sport != null)
                    page.master.Common.AppendBody("Sport:", sport.Name, false);
                page.master.Common.AppendBody(this.Label + ":", register.Participants.ToString(), false);
                page.master.Common.AppendBody("Parent:", register.Parent, false);
                page.master.Common.AppendBody("Email:", register.Email, false);
                page.master.Common.AppendBody("Phone:", register.Phone, false);
                try
                {
                    string error = page.master.Common.SendEmail(item.EmailFrom, this.EmailTo, this.EmailCc, this.EmailBcc, "New Lesson Registration");
                    if (String.IsNullOrEmpty(error) == false)
                        Models.EventLog.Add(page.master.db, EventLog.Email, error, true, false);
                    else
                        Models.EventLog.Add(page.master.db, EventLog.Email, "New Lesson Registration Sent.");
                }
                catch (Exception ex)
                {
                    string error = ex.Message;
                    while (ex.InnerException != null)
                    {
                        error += " ~ " + ex.InnerException.Message;
                        ex = ex.InnerException;
                    }
                    Models.EventLog.Add(page.master.db, EventLog.Email, error, true, false);
                }
            }

            // Redirect
            Sessions.Set(Sessions.Green, "0");
            Response.Redirect(Request.Url.PathAndQuery);
        }
    }
}