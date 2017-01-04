using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public partial class LogDetail
    {
        // Overwrite the constructor since LogDetail gets recreated each time entities are updated 
        public LogDetail() { }
        public LogDetail(string field, string was, string now)
        {
            Field = field;
            Was = was;
            Now = now;
        }
    }
    public class Logging
    {
        public List<LogDetail> details = new List<LogDetail>();
        public int LogID { get; set; }
        public void Add(string field, string was, string now)
        {
            details.Add(new LogDetail(field, was, now));
        }
        public List<string> Save(string key, int assetid, int createdBy, DB db)
        {
            // Update latest to be false.
            db.Logs.Where(l => ((assetid > 0 && l.AssetID == assetid) || (assetid == 0)) && l.Latest).ToList().ForEach(l => l.Latest = false);

            // Save log
            Log log = new Log();
            log.Key = key;
            log.AssetID = assetid;
            log.Latest = true;
            log.CreatedBy = createdBy;
            log.CreatedOn = DateTimeUTC();
            db.Logs.Add(log);
            List<string> errors = SaveChanges(db);
            LogID = log.ID;
            foreach (LogDetail detail in details)
            {
                detail.LogID = LogID;
                db.LogDetails.Add(detail);
            }
            return errors;
        }
        public List<string> SaveChanges(DbContext ssDB)
        {
            List<string> errors = new List<string>();
            try
            {
                ssDB.SaveChanges();
            }
            catch (DbEntityValidationException z)
            {
                errors = Errors(z);
            }
            return errors;
        }
        public List<string> Errors(DbEntityValidationException z)
        {
            List<string> errors = new List<string>();
            foreach (var eve in z.EntityValidationErrors)
            {
                errors.Add(String.Format("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                    eve.Entry.Entity.GetType().Name, eve.Entry.State));
                foreach (var ve in eve.ValidationErrors)
                {
                    errors.Add(String.Format("- Property: \"{0}\", Error: \"{1}\"",
                        ve.PropertyName, ve.ErrorMessage));
                }
            }
            return errors;
        }
        public void AddSave(string key, int assetid, int createdBy, DB db, string text)
        {
            AddSave(key, assetid, createdBy, db, "", "", text);
        }
        public void AddSave(string key, int assetid, int createdBy, DB db, string was, string now)
        {
            AddSave(key, assetid, createdBy, db, "", was, now);
        }
        public void AddSave(string key, int assetid, int createdBy, DB db, string field, string was, string now)
        {
            details.Add(new LogDetail("AssetID", "", assetid.ToString()));
            details.Add(new LogDetail(field, was, now));
            Save(key, assetid, createdBy, db);
        }
        public DateTime DateTimeUTC()
        {
            // NEEDS TO BE THE SAME AS Presentation.Core.ssFunctions.DateTimeUTC
            return DateTime.UtcNow;
        }
    }
}
