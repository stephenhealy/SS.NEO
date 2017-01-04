using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public partial class Selector
    {
        public List<AdminList> Event(bool Trash)
        {
            List<AdminList> items = (from all in db.Events
                                     join _logs in db.Logs on all.AssetID equals _logs.AssetID into tLogs
                                     from logs in tLogs.DefaultIfEmpty()
                                     join _logUsers in db.Users on logs.CreatedBy equals _logUsers.AssetID into tUsers
                                     from logUsers in tUsers.DefaultIfEmpty()
                                     where (logs == null || logs.Latest == true)
                                     && all.Deleted == Trash
                                     select new AdminList()
                                     {
                                         AssetID = all.AssetID,
                                         Name = all.Title,
                                         //Display = all.Display,
                                         Enabled = all.Enabled,
                                         Deleted = all.Deleted,
                                         ModifiedBy = (logUsers == null ? "" : logUsers.First + " " + logUsers.Last),
                                         ModifiedOn = (logs == null ? DateTime.MinValue : logs.CreatedOn),
                                         Date = all.StartDate
                                     }).Distinct().OrderByDescending(o => o.Date).ToList();
            return items;
        }
        public Data.Event Event(int AssetID)
        {
            return (from all in db.Events where all.AssetID == AssetID select all).FirstOrDefault();
        }
    }
}
