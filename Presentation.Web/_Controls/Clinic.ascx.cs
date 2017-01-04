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
    public partial class Clinic : ClinicControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize();
            this.SportID = Statics.ParseInt(ConfigurationManager.AppSettings[this.ConfigID]);

            if (!IsPostBack)
            {
                List<Data.Clinic> Clinics = page.master.db.Clinics.Where(o => o.SportID == this.SportID && o.Enabled && o.Deleted == false).ToList();
                var all = (from clinics in Clinics
                           join users in page.master.db.Users
                           on clinics.UserID equals users.AssetID
                           select new
                           {
                               Date = clinics.StartDate,
                               Cost = clinics.Cost,
                               Name = clinics.Name,
                               Description = clinics.Description,
                               User = users.First + " " + users.Last,
                               Email = users.Email,
                               Link = clinics.Link,
                               EZRegister = clinics.EZRegister
                           }).ToList();

                DateTime now = Statics.DateTimeUTC().AddDays(-1);
                var upcoming = all.Where(o => o.Date >= now).OrderBy(o => o.Date).ToList().Take(10);
                List<AdminList> jumps = new List<AdminList>();
                DateTime previous = DateTime.MinValue;
                foreach (var clinic in upcoming) 
                {
                    if (previous == DateTime.MinValue || clinic.Date.Month != previous.Date.Month || clinic.Date.Year != previous.Date.Year) 
                    {
                        previous = clinic.Date;
                        jumps.Add(new AdminList() { Name = clinic.Date.ToString("MMM", System.Globalization.CultureInfo.InvariantCulture) + " " + clinic.Date.Year.ToString(), Parent = clinic.Date.ToString("MMM", System.Globalization.CultureInfo.InvariantCulture) });
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