using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public partial class Selector
    {
        public List<AdminList> League(int Parent, bool Trash)
        {
            List<AdminList> items = (from all in db.Leagues
                                     join _parent in db.Sessions on all.SessionID equals _parent.AssetID into tParent
                                     from parent in tParent.DefaultIfEmpty()
                                     join _logs in db.Logs on all.AssetID equals _logs.AssetID into tLogs
                                     from logs in tLogs.DefaultIfEmpty()
                                     join _logUsers in db.Users on logs.CreatedBy equals _logUsers.AssetID into tUsers
                                     from logUsers in tUsers.DefaultIfEmpty()
                                     where (logs == null || logs.Latest == true)
                                     && all.Deleted == Trash
                                     && (Trash || all.SessionID == Parent)
                                     select new AdminList()
                                     {
                                         AssetID = all.AssetID,
                                         Name = all.Name,
                                         Parent = (all.Night == 1 ? "Mon" : (all.Night == 2 ? "Tues" : (all.Night == 3 ? "Wed" : (all.Night == 4 ? "Thur" : (all.Night == 5 ? "Fri" : (all.Night == 7 ? "Sun" : "Sat")))))),
                                         ParentID = all.Night,
                                         Display = all.Display,
                                         Enabled = all.Enabled,
                                         Deleted = all.Deleted,
                                         ModifiedBy = (logUsers == null ? "" : logUsers.First + " " + logUsers.Last),
                                         ModifiedOn = (logs == null ? DateTime.MinValue : logs.CreatedOn)
                                     }).Distinct().OrderBy(o => o.ParentID).ThenBy(o => o.Display).ToList();
            return items;
        }
        public Data.League League(int AssetID)
        {
            return (from all in db.Leagues where all.AssetID == AssetID select all).FirstOrDefault();
        }
    }
}
