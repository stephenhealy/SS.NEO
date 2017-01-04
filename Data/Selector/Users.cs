using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public partial class Selector
    {
        public List<AdminList> Users(bool Trash)
        {
            List<Data.User> users = db.Users.Where(o => o.Deleted == Trash).ToList();

            List<AdminList> items = (from all in db.Users
                                     join _logs in db.Logs on all.AssetID equals _logs.AssetID into tLogs
                                     from logs in tLogs.DefaultIfEmpty()
                                     join _logUsers in db.Users on logs.CreatedBy equals _logUsers.AssetID into tUsers
                                     from logUsers in tUsers.DefaultIfEmpty()
                                     where (logs == null || logs.Latest == true)
                                     && all.Deleted == Trash
                                     select new AdminList()
                                     {
                                         AssetID = all.AssetID,
                                         Name = all.First + " " + all.Last,
                                         Display = all.Display,
                                         Enabled = all.Enabled,
                                         Deleted = all.Deleted,
                                         ModifiedBy = (logUsers == null ? "" : logUsers.First + " " + logUsers.Last),
                                         ModifiedOn = (logs == null ? DateTime.MinValue : logs.CreatedOn)
                                     }).Distinct().OrderBy(o => o.Display).ToList();
            return items;
        }
        public Data.User User(int AssetID)
        {
            return (from all in db.Users where all.AssetID == AssetID select all).FirstOrDefault();
        }
    }
}
