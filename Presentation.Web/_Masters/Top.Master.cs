using Data;
using Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml;

namespace Presentation.Web._Masters
{
    public partial class Top : MasterClass
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize();

            XmlDocument doc = new XmlDocument();
            doc.Load(AppDomain.CurrentDomain.BaseDirectory + "SiteMap.xml");
            string Path = Request.RawUrl.Substring(0, Request.RawUrl.LastIndexOf("/")).ToUpper();

            XmlNode root = doc.DocumentElement;
            XmlNodeList pages = root.SelectNodes("//page[translate(path, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = '" + Path.ToLower() + "']");
            if (pages.Count == 1)
            {
                try
                {
                    XmlNode page = pages[0];
                    if (String.IsNullOrWhiteSpace(page["title"].InnerText) == false)
                        pageTitle.Text = page["title"].InnerText + " - " + PageTitle;
                    foreach (XmlNode node in page["meta"].ChildNodes)
                    {
                        HtmlMeta meta = new HtmlMeta();
                        meta.Name = node.Name;
                        meta.Content = node.InnerText;
                        MetaPlaceHolder.Controls.Add(meta);
                    }
                }
                catch
                {
                    pageTitle.Text = PageTitle;
                }
            }
            else
                pageTitle.Text = PageTitle;
        }
        public override void Initialize()
        {
            if (string.IsNullOrEmpty(RelativePath))
            {
                db = new DB();
                RelativePath = ConfigurationManager.AppSettings["RelativePath"];
                if (Request.IsLocal)
                    RelativePath = "";      // will always be the root if browsing local.
                PageTitle = ConfigurationManager.AppSettings["PageTitle"];
                WebServiceURL = ConfigurationManager.AppSettings["WebServiceURL"];
                TimeZone = ConfigurationManager.AppSettings["TimeZone"];
                EmailIsHTML = Statics.ParseBool(ConfigurationManager.AppSettings["EmailIsHTML"]);
                Common = new Common(EmailIsHTML);
            }
        }
    }
}