using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web.Events.Host
{
    public partial class Default : PageClass
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            Initialize();

            if (!IsPostBack)
                master.Common.CheckSession(Page, Sessions.Green, panRegistered);
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Add to database
            Data.EventRegistration register = new Data.EventRegistration();
            register.AssetID = Models.Asset.New(master.db, 0);
            register.SportID = 0;
            register.Submitted = Statics.DateTimeUTC();
            register.Scheduled = Statics.DateTimeMin();
            register.First = txtFirst.Text;
            register.Last = txtLast.Text;
            register.Email = txtEmail.Text;
            register.Phone = txtPhone.Text;
            register.StartDate = Statics.ParseDateTime(txtDate.Text + " " + txtTime.Text);
            register.Description = txtDescription.Text;
            register.Website = txtWebsite.Text;
            master.db.EventRegistrations.Add(register);
            master.db.SaveChanges();

            // Send email
            Data.Setting item = master.db.Settings.FirstOrDefault();
            if (item != null && String.IsNullOrEmpty(item.EventTo) == false)
            {
                Models.EventLog.Add(master.db, EventLog.Email, "Sending New Host an Event Registration To [" + item.EventTo + "] Cc = [" + item.EventCc + "], Bcc = [" + item.EventBcc + "]");
                master.Common.AppendBody("First Name:", register.First, false);
                master.Common.AppendBody("Last Name:", register.Last, false);
                master.Common.AppendBody("Email:", register.Email, false);
                master.Common.AppendBody("Phone:", register.Phone, false);
                master.Common.AppendBody("Start Date:", txtDate.Text + " " + txtTime.Text, false);
                master.Common.AppendBody("Website:", register.Website, false);
                master.Common.AppendBody("Description:", register.Description, false);
                try
                {
                    string error = master.Common.SendEmail(item.EmailFrom, item.EventTo, item.EventCc, item.EventBcc, "New Host an Event Registration");
                    if (String.IsNullOrEmpty(error) == false)
                        Models.EventLog.Add(master.db, EventLog.Email, error, true, false);
                    else
                        Models.EventLog.Add(master.db, EventLog.Email, "New Host an Event Registration Sent.");
                }
                catch (Exception ex)
                {
                    string error = ex.Message;
                    while (ex.InnerException != null)
                    {
                        error += " ~ " + ex.InnerException.Message;
                        ex = ex.InnerException;
                    }
                    Models.EventLog.Add(master.db, EventLog.Email, error, true, false);
                }
            }

            // Redirect
            Sessions.Set(Sessions.Green, "0");
            Response.Redirect(Request.Url.PathAndQuery);
        }
    }
}