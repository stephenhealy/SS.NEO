using Models;
using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.CMS._Repeat.Content
{
    public partial class Photos : RepeaterClass, EditPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("Photos", false, "");
            master.EditPage = this;
            master.ShowOrder = true;
            master.TreeLevel = 3;   // leave off if not a tree.
            if (!IsPostBack)
                master.Heading.Text = "Photos";
            master.LoggingKey = LoggingKeys.Photos;
            btnImage.Attributes.Add("data-control", txtImage.ClientID);
        }

        public object Json(bool trash)
        {
            List<AdminList> items = master.Selector.Photo(master.ParentID, trash);
            return Output.SerializeJSON(items);
        }

        public override List<TreeItem> Tree()
        {
            List<TreeItem> ones = (from one in master.db.PhotoCategories
                                   where one.Deleted == false
                                   select new TreeItem()
                                   {
                                       AssetID = one.AssetID,
                                       Name = one.Name
                                   }).ToList();
            foreach (TreeItem one in ones)
            {
                one.Count = (from two in master.db.PhotoAlbums
                             join three in master.db.Photos
                             on two.AssetID equals three.AlbumID
                             where two.CategoryID == one.AssetID
                              && two.Enabled && two.Deleted == false
                             && three.Enabled && three.Deleted == false
                             select three.AssetID).Count();
                one.Children = (from two in master.db.PhotoAlbums
                                where two.CategoryID == one.AssetID
                                 && two.Deleted == false
                                select new TreeItem()
                                {
                                    AssetID = two.AssetID,
                                    Name = two.Name
                                }).ToList();
                foreach (TreeItem two in one.Children)
                {
                    two.Count = (from three in master.db.Photos
                                 where three.AlbumID == two.AssetID
                             && three.Enabled && three.Deleted == false
                                 select three.AssetID).Count();
                }
            }
            return ones;
        }

        public void Edit(int id)
        {
            master.Common.DataBindDDL(ddlAlbum, "Name", "AssetID", master.Selector.PhotoAlbum(0, false));
            Data.Photo item = master.Selector.Photo(id);
            if (item != null)
            {
                master.Heading.Text = txtTitle.Text = item.Title;
                master.ParentID = item.AlbumID;
                ddlAlbum.SelectedValue = item.AlbumID.ToString();
                txtCaption.Text = item.Caption;
                txtImage.Text = item.Image;
                chkEnabled.Checked = item.Enabled;
                if (item.Deleted)
                    master.HideSave();
            }
        }

        public string Save()
        {
            List<Data.LogDetail> details = new List<Data.LogDetail>();
            Data.Photo item = master.Selector.Photo(master.AssetID);
            if (item == null)
            {
                item = new Data.Photo();
                item.AssetID = Models.Asset.New(master.db, master.User.ID);
                master.db.Photos.Add(item);
            }
            item.AlbumID = Statics.ParseInt(ddlAlbum.SelectedItem.Value);
            item.Title = txtTitle.Text;
            item.Caption = txtCaption.Text;
            item.Image = txtImage.Text;
            if (item.Display == 0)
            {
                List<Data.Photo> order = master.db.Photos.Where(x => x.AlbumID == item.AlbumID && x.Deleted == false).ToList();
                for (int ii = 1; ii <= order.Count; ii++)
                    order[ii - 1].Display = ii + 1;
                item.Display = 1;
            }
            item.Enabled = chkEnabled.Checked;
            // Add data from other tables

            return master.SaveChanges(item.AssetID, details);
        }

        public void Delete()
        {
            Data.Photo item = master.Selector.Photo(master.AssetID);
            if (item != null)
                update(item, true);
        }

        public int Restore(string _records)
        {
            int total = 0;
            if (master.AssetID > 0)
            {
                Data.Photo item = master.Selector.Photo(master.AssetID);
                if (item != null)
                {
                    update(item, false);
                    total = 1;
                }
            }
            else
            {
                string[] records = _records.Split(new char[] { ',' });
                foreach (string record in records)
                {
                    int id = Statics.ParseInt(record);
                    Data.Photo item = master.db.Photos.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
                    if (item != null)
                    {
                        update(item, false);
                        total++;
                    }
                }
            }
            return total;
        }

        public int Purge(string _records)
        {
            int total = 0;
            if (master.AssetID > 0)
            {
                Data.Photo item = master.Selector.Photo(master.AssetID);
                if (item != null)
                {
                    master.db.Photos.Remove(item);
                    total = 1;
                }
            }
            else
            {
                string[] records = _records.Split(new char[] { ',' });
                foreach (string record in records)
                {
                    int id = Statics.ParseInt(record);
                    Data.Photo item = master.db.Photos.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
                    if (item != null)
                    {
                        master.db.Photos.Remove(item);
                        total++;
                    }
                }
            }
            master.db.SaveChanges();
            return total;
        }

        public void update(Data.Photo item, bool delete)
        {
            item.Deleted = delete;
            master.SaveChanges(item.AssetID);
        }

    }
}