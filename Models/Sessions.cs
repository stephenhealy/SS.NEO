using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.SessionState;

namespace Models
{
    public class Sessions
    {
        public static string CMS = "CMS";
        public static string PublicUser = "PublicUser";
        public static string Saved = "Saved";
        public static string Error = "Error";
        public static string Green = "Green";
        public static string Deleted = "Deleted";
        public static string Restored = "Restored";
        public static string Purged = "Purged";
        public static string SaveWarning = "SaveWarning";

        // SET
        public static void Set(string name, string value)
        {
            Set(HttpContext.Current.Session, name, value);
        }

        // GET
        public static string Get(string name)
        {
            return Get(HttpContext.Current.Session, name);
        }
        public static int GetInt(string name)
        {
            return Statics.ParseInt(Get(name));
        }



        private static string Get(HttpSessionState session, string name)
        {
            string value = "";
            if (session[name] != null)
                value = session[name].ToString();
            return value;
        }
        private static void Set(HttpSessionState session, string name, string value)
        {
            session[name] = value;
        }
    }
}
