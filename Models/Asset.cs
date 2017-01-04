using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Asset
    {
        public static int New(Data.DB db, int CreatedBy)
        {
            Data.Asset asset = new Data.Asset();
            asset.CreatedOn = Statics.DateTimeUTC();
            asset.CreatedBy = CreatedBy;
            db.Assets.Add(asset);
            db.SaveChanges();
            return asset.ID;
        }
    }
}
