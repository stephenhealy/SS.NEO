using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Key
    {
        public static Data.Key New(Data.DB db)
        {
            // Generate key
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var random = new Random();
            string result = new string(
                Enumerable.Repeat(chars, 50)
                          .Select(s => s[random.Next(s.Length)])
                          .ToArray());
            // Add to database
            Data.Key key = new Data.Key();
            key.val = result;
            key.created = Statics.DateTimeUTC();
            db.Keys.Add(key);
            db.SaveChanges();
            return key;
        }
    }
}
