using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web
{
    public partial class Ad : PageClass
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            Initialize();

            if (String.IsNullOrEmpty(Request.QueryString["i"]) == false)
            {
                int ID = Statics.ParseInt(Statics.decryptQueryString(Request.QueryString["i"]));
                Data.Advertisement advertisement = master.db.Advertisements.FirstOrDefault(o => o.AssetID == ID);
                if (advertisement != null)
                {
                    Data.AdvertisementClick click = new Data.AdvertisementClick();
                    click.AdvertisementID = advertisement.AssetID;
                    click.IPAddress = Statics.IPAddress(Request);
                    click.Created = Statics.DateTimeUTC();
                    master.db.AdvertisementClicks.Add(click);
                    master.db.SaveChanges();

                    // Redirect
                    Response.Redirect(advertisement.Link);
                }
            }
        }
    }
}