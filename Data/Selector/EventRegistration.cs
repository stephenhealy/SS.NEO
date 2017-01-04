﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public partial class Selector
    {
        public List<AdminList> EventRegistration(int Parent, bool Trash)
        {
            List<AdminList> items = (from all in db.EventRegistrations
                                     join _parent in db.Sports on all.SportID equals _parent.AssetID into tParent
                                     from parent in tParent.DefaultIfEmpty()
                                     join _logs in db.Logs on all.AssetID equals _logs.AssetID into tLogs
                                     from logs in tLogs.DefaultIfEmpty()
                                     join _logUsers in db.Users on logs.CreatedBy equals _logUsers.AssetID into tUsers
                                     from logUsers in tUsers.DefaultIfEmpty()
                                     where all.Deleted == Trash
                                     && (Trash || all.SportID == Parent || Parent == 0)
                                     select new AdminList()
                                     {
                                         AssetID = all.AssetID,
                                         Name = (Parent == 0 ? all.First + " " + all.Last : parent.Name + " - " + all.First + " " + all.Last),
                                         Enabled = true,
                                         Deleted = all.Deleted,
                                         ModifiedBy = (logUsers == null ? "" : logUsers.First + " " + logUsers.Last),
                                         ModifiedOn = all.Submitted,
                                         Date = all.Scheduled
                                     }).Distinct().OrderByDescending(o => o.ModifiedOn).ToList();
            return items;
        }
        public Data.EventRegistration EventRegistration(int AssetID)
        {
            return (from all in db.EventRegistrations where all.AssetID == AssetID select all).FirstOrDefault();
        }
    }
}
