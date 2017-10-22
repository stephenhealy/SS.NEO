using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public partial class Selector
    {
        public List<AdminList> PhotoAlbum(int Parent, bool Trash)
        {
            List<AdminList> items = (from all in db.PhotoAlbums
                                     join _parent in db.PhotoCategories on all.CategoryID equals _parent.AssetID into tParent
                                     from parent in tParent.DefaultIfEmpty()
                                     join _logs in db.Logs on all.AssetID equals _logs.AssetID into tLogs
                                     from logs in tLogs.DefaultIfEmpty()
                                     join _logUsers in db.Users on logs.CreatedBy equals _logUsers.AssetID into tUsers
                                     from logUsers in tUsers.DefaultIfEmpty()
                                     where (logs == null || logs.Latest == true)
                                     && all.Deleted == Trash
                                     && (Trash || all.CategoryID == Parent || Parent == 0)
                                     select new AdminList()
                                     {
                                         AssetID = all.AssetID,
                                         Name = all.Name,
                                         ParentID = (from photos in db.Photos where photos.Deleted == false && photos.AlbumID == all.AssetID select photos).Count(),
                                         Display = all.Display,
                                         Enabled = all.Enabled,
                                         Deleted = all.Deleted,
                                         ModifiedBy = (logUsers == null ? "" : logUsers.First + " " + logUsers.Last),
                                         ModifiedOn = (logs == null ? DateTime.MinValue : logs.CreatedOn)
                                     }).Distinct().OrderBy(o => o.Display).ToList();
            return items;
        }
        public Data.PhotoAlbum PhotoAlbum(int AssetID)
        {
            return (from all in db.PhotoAlbums where all.AssetID == AssetID select all).FirstOrDefault();
        }
    }
}
