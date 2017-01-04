using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class UserProfile
    {
        public int ID { get; set; }
        public string First { get; set; }
        public string Last { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Image { get; set; }
        public bool Super { get; set; }
        public string TimeZone = "Eastern Standard Time";

        public UserProfile(DB db)
        {
            ID = Sessions.GetInt(Sessions.CMS);
            Data.User user = db.Users.FirstOrDefault(o => o.AssetID == ID);
            if (user != null)
            {
                First = user.First;
                Last = user.Last;
                Name = First + " " + Last;
                Email = user.Email;
                Image = user.Image;
                Super = user.Super;
            }
        }
        public void Logout()
        {
            Sessions.Set(Sessions.CMS, "");
        }
    }
}
