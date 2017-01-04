using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web.Company.Contact
{
    public partial class Default : PageClass
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            Initialize();

            if (!IsPostBack)
                master.Common.CheckSession(Page, Sessions.Green, panSent);
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            // Send email
            Data.Setting item = master.db.Settings.FirstOrDefault();
            if (item != null && String.IsNullOrEmpty(item.ContactTo) == false)
            {
                Models.EventLog.Add(master.db, EventLog.Email, "Sending Contact Us Form To [" + item.ContactTo + "] Cc = [" + item.ContactCc + "], Bcc = [" + item.ContactBcc + "]");
                master.Common.AppendBody("Name:", txtName.Text, false);
                master.Common.AppendBody("Email:", txtEmail.Text, false);
                master.Common.AppendBody("Subject:", txtSubject.Text, false);
                master.Common.AppendBody("Message:", txtMessage.Text, false);
                try
                {
                    string error = master.Common.SendEmail(item.EmailFrom, item.ContactTo, item.ContactCc, item.ContactBcc, "Contact Us Form");
                    if (String.IsNullOrEmpty(error) == false)
                        Models.EventLog.Add(master.db, EventLog.Email, error, true, false);
                    else
                        Models.EventLog.Add(master.db, EventLog.Email, "Contact Us Form Sent.");
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