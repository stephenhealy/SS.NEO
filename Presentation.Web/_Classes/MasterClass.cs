using Data;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Presentation.Web
{
    public class MasterClass : System.Web.UI.MasterPage
    {
        public MasterClass master { get; set; }

        public DB db { get; set; }
        public Common Common { get; set; }
        public string PageTitle { get; set; }
        public string RelativePath { get; set; }
        public string WebServiceURL { get; set; }
        public string TimeZone { get; set; }
        public bool EmailIsHTML { get; set; }
        public string BodyClass { get; set; }
        public int Upcoming { get; set; }

        public virtual void Initialize()
        {
            if (master == null)
            {
                master = (MasterClass)Master;
                master.Initialize();

                db = master.db;
                Common = master.Common;
                PageTitle = master.PageTitle;
                RelativePath = master.RelativePath;
                WebServiceURL = master.WebServiceURL;
                TimeZone = master.TimeZone;
                EmailIsHTML = master.EmailIsHTML;
                BodyClass = master.BodyClass;
                Upcoming = master.Upcoming;
            }
        }
    }
}