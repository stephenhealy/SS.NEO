using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public partial class Selector
    {
        private DB db { get; set; }
        public Selector(DB _db)
        {
            db = _db;
        }
        public List<HistoryList> History(string Key, int AssetID)
        {
            List<HistoryList> items = (from all in db.Logs
                                       join _logUsers in db.Users on all.CreatedBy equals _logUsers.AssetID into tUsers
                                       from logUsers in tUsers.DefaultIfEmpty()
                                       where all.Key.ToUpper() == Key.ToUpper()
                                       && (AssetID == 0 || AssetID == all.AssetID)
                                       select new HistoryList()
                                     {
                                         LogID = all.ID,
                                         AssetID = all.AssetID,
                                         //Avatar = all.Avatar,
                                         CreatedBy = (logUsers == null ? "" : logUsers.First + " " + logUsers.Last),
                                         CreatedOn = all.CreatedOn,
                                         Details = db.LogDetails.Where(o => o.LogID == all.ID)
                                     }).OrderByDescending(o => o.CreatedOn).ToList();
            return items;
        }
    }
}
