using Models;
using Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.CMS._Masters
{
    public partial class Top : MasterClass
    {
        public override void Initialize(bool Anonymous)
        {
            if (db == null)
            {
                RelativePath = ConfigurationManager.AppSettings["RelativePath"];
                if (Request.IsLocal)
                    RelativePath = "";      // will always be the root if browsing local.
                PageTitle = ConfigurationManager.AppSettings["PageTitle"];
                ImagePath = ConfigurationManager.AppSettings["ImagePath"];
                WebServiceURL = ConfigurationManager.AppSettings["WebServiceURL"];
                WebSiteURL = ConfigurationManager.AppSettings["WebSiteURL"];

                db = new DB();
                User = new UserProfile(db);
                if (User.ID == 0 && Anonymous == false)
                    Response.Redirect(RelativePath + "/?referrer=" + RelativePath + Request.Url.PathAndQuery);
                Selector = new Selector(db);
                Common = new Common(false);
            }
        }
    }
}