using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public partial class Selector
    {
        public List<AdminList> Carousel(bool Trash)
        {
            List<AdminList> items = (from all in db.Carousels
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
                                         Display = all.Display,
                                         Enabled = all.Enabled,
                                         Deleted = all.Deleted,
                                         ModifiedBy = (logUsers == null ? "" : logUsers.First + " " + logUsers.Last),
                                         ModifiedOn = (logs == null ? DateTime.MinValue : logs.CreatedOn)
                                     }).Distinct().OrderBy(o => o.Display).ToList();
            return items;
        }
        public Data.Carousel Carousel(int AssetID)
        {
            return (from all in db.Carousels where all.AssetID == AssetID select all).FirstOrDefault();
        }
    }
}
