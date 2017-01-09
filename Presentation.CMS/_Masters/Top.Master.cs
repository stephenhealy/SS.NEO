using Models;
using Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

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

                string DataDirectory = ConfigurationManager.AppSettings["DataDirectory"];
                // Check to see if we need to change the defualt data directory for the datbase (if local and shared in project)
                if (String.IsNullOrEmpty(DataDirectory) == false)
                {
                    string BinDirectory = System.Reflection.Assembly.GetExecutingAssembly().CodeBase;
                    BinDirectory = BinDirectory.Substring(0, BinDirectory.LastIndexOf("/bin", StringComparison.InvariantCultureIgnoreCase));
                    BinDirectory = BinDirectory.Substring(0, BinDirectory.LastIndexOf("/", StringComparison.InvariantCultureIgnoreCase));
                    BinDirectory = BinDirectory.Replace("file:///", string.Empty);
                    while (BinDirectory.Contains("/"))
                        BinDirectory = BinDirectory.Replace("/", "\\");
                    string AbsoluteDataDirectory = Path.GetFullPath(BinDirectory + DataDirectory);
                    AppDomain.CurrentDomain.SetData("DataDirectory", AbsoluteDataDirectory);
                }

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