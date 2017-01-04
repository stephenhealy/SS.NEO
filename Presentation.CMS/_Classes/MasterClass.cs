using Models;
using Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace Presentation.CMS
{
    public class MasterClass : System.Web.UI.MasterPage
    {
        public MasterClass master { get; set; }

        public DB db { get; set; }
        public string PageTitle { get; set; }
        public string RelativePath { get; set; }
        public string ImagePath { get; set; }
        public string WebServiceURL { get; set; }
        public string WebSiteURL { get; set; }
        public string BodyClass { get; set; }

        public UserProfile User { get; set; }
        public Common Common { get; set; }
        public Selector Selector { get; set; }
        public Logging Logging { get; set; }

        protected virtual void Page_Load(object sender, EventArgs e)
        {
            // To override, must do -> protected override void Page_Load(...
            Initialize(false);
            PageLoad();
        }
        public virtual void Initialize(bool Anonymous)
        {
            if (master == null)
            {
                master = (MasterClass)Master;
                master.Initialize(Anonymous);

                db = master.db;
                PageTitle = master.PageTitle;
                RelativePath = master.RelativePath;
                ImagePath = master.ImagePath;
                WebServiceURL = master.WebServiceURL;
                WebSiteURL = master.WebSiteURL;
                BodyClass = master.BodyClass;
                User = master.User;
                Common = master.Common;
                Selector = master.Selector;
                Logging = master.Logging;
            }
        }
        public virtual void PageLoad()
        {
            /* Nothing to do here.  Use...
                public override void PageLoad()
            */
        }
        public bool SaveChanges()
        {
            try
            {
                db.SaveChanges();
                Sessions.Set(Sessions.Saved, "0");
                return true;
            }
            catch (DbEntityValidationException z)
            {
                List<string> Errors = Logging.Errors(z);
                string errors = string.Join("<br/>", Errors.ToArray());
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "errored", "NotifyError('" + Statics.EscapeSingleJS(errors) + "', null, 'The following error occurred...');", true);
                return false;
            }
        }
        public string SaveChanges(string LoggingKey, int AssetID)
        {
            List<string> Errors = db.SaveChanges(LoggingKey, AssetID, User.ID, false);
            if (Errors.Count > 0)
                return string.Join("<br/>", Errors.ToArray());
            else
                return "";
        }
    }
    public class DBClass : MasterClass
    {
        public EditPage EditPage { get; set; }

        public int AssetID { get; set; }
        public int ParentID { get; set; }
        public string LoggingKey { get; set; }

        public string SaveChanges(int _AssetID)
        {
            return SaveChanges(_AssetID, null);
        }
        public string SaveChanges(int _AssetID, List<Data.LogDetail> details)
        {
            AssetID = _AssetID;
            List<string> Errors = db.SaveChanges(LoggingKey, AssetID, User.ID, (details != null && details.Count > 0));
            if (Errors.Count > 0)
                return string.Join("<br/>", Errors.ToArray());
            else
            {
                // Add logging for any ADDITIONAL data (not the same as adding the field changes)
                if (db.LogID > 0 && details != null && details.Count > 0)
                {
                    foreach (Data.LogDetail detail in details)
                    {
                        detail.LogID = db.LogID;
                        db.LogDetails.Add(detail);
                    }
                    Errors = Logging.SaveChanges(db);
                    if (Errors.Count > 0)
                        return string.Join("<br/>", Errors.ToArray());
                    else
                        return "";
                }
                else
                    return "";
            }
        }
    }

}