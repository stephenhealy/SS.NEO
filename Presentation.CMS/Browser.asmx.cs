using Data;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Presentation.CMS
{
    /// <summary>
    /// Summary description for Browser
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Browser : System.Web.Services.WebService
    {
        public DB db;

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public bool ValidKey(int ID, string Val)
        {
            db = new DB();

            Data.Key key = db.Keys.FirstOrDefault(x => x.id == ID && x.deleted == null);
            if (key != null && key.val == Val)
            {
                key.deleted = Statics.DateTimeUTC();
                db.SaveChanges();
                return true;
            }
            else
                return false;
        }

        [WebMethod]
        public bool Valid(string Url)
        {
            db = new DB();
            return true;
        }
    }
}
