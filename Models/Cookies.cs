using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.SessionState;

namespace Models
{
    public class Cookies
    {
        // SET
        public static void Set(string name, string value)
        {
            Set(HttpContext.Current.Response, name, value);
        }

        // GET
        public static string Get(string name)
        {
            return Get(HttpContext.Current.Request, name);
        }
        public static int GetInt(string name)
        {
            return Statics.ParseInt(Get(name));
        }



        private static string Get(HttpRequest request, string name)
        {
            string value = "";
            if (request.Cookies[name] != null)
                value = Encryption.Decrypt(request.Cookies[name].Value, Encryption.Cookies);
            return value;
        }
        private static void Set(HttpResponse response, string name, string value)
        {
            response.Cookies[name].Value = Encryption.Encrypt(value, Encryption.Cookies);
            response.Cookies[name].Expires = DateTime.UtcNow.AddDays(7);
        }
    }
}
