using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class EventLog
    {
        public const string Email = "Email";
        public const string Forgot = "Forgot";
        public static void Add(Data.DB db, string Event, string Message)
        {
            Add(db, Event, Message, false, false);
        }
        public static void Add(Data.DB db, string Event, string Message, bool Error, bool Debug)
        {
            Data.EventLog log = new Data.EventLog();
            log.Event = Event;
            log.Message = Message;
            log.Error = Error;
            log.Debug = Debug;
            log.Created = Statics.DateTimeUTC();
            db.EventLogs.Add(log);
            db.SaveChanges();
        }
    }
}
