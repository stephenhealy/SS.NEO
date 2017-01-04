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
    public partial class PhotoAlbums : RepeaterClass, EditPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("Photo Albums", false, "");
            master.EditPage = this;
            master.ShowOrder = false;
            master.TreeLevel = 2;   // leave off if not a tree.
            if (!IsPostBack)
                master.Heading.Text = "PhotoAlbums";
            master.LoggingKey = LoggingKeys.PhotoAlbums;
        }

        public object Json(bool trash)
        {
            List<AdminList> items = master.Selector.PhotoAlbum(master.ParentID, trash);
            return Output.SerializeJSON(items);
        }

        public override List<TreeItem> Tree()
        {
            List<TreeItem> tree = (from one in master.db.PhotoCategories
                                   where one.Deleted == false
                                   select new TreeItem()
                                   {
                                       AssetID = one.AssetID,
                                       Name = one.Name
                                   }).ToList();
            foreach (TreeItem item in tree)
            {
                item.Count = (from two in master.db.PhotoAlbums
                              where two.CategoryID == item.AssetID
                              && two.Enabled && two.Deleted == false
                              select two.AssetID).Count();
            }
            return tree;
        }

        public void Edit(int id)
        {
            master.Common.DataBindDDL(ddlCategory, "Name", "AssetID", master.Selector.PhotoCategory(false));
            Data.PhotoAlbum item = master.Selector.PhotoAlbum(id);
            if (item != null)
            {
                master.Heading.Text = txtName.Text = item.Name;
                master.ParentID = item.CategoryID;
                ddlCategory.SelectedValue = item.CategoryID.ToString();
                txtName.Text = item.Name;
                chkEnabled.Checked = item.Enabled;
                if (item.Deleted)
                    master.HideSave();
            }
        }

        public string Save()
        {
            List<Data.LogDetail> details = new List<Data.LogDetail>();
            Data.PhotoAlbum item = master.Selector.PhotoAlbum(master.AssetID);
            if (item == null)
            {
                item = new Data.PhotoAlbum();
                item.AssetID = Models.Asset.New(master.db, master.User.ID);
                master.db.PhotoAlbums.Add(item);
            }
            item.CategoryID = Statics.ParseInt(ddlCategory.SelectedItem.Value);
            item.Name = txtName.Text;
            item.Enabled = chkEnabled.Checked;
            // Add data from other tables

            return master.SaveChanges(item.AssetID, details);
        }

        public void Delete()
        {
            Data.PhotoAlbum item = master.Selector.PhotoAlbum(master.AssetID);
            if (item != null)
                update(item, true);
        }

        public int Restore(string _records)
        {
            int total = 0;
            if (master.AssetID > 0)
            {
                Data.PhotoAlbum item = master.Selector.PhotoAlbum(master.AssetID);
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
                    Data.PhotoAlbum item = master.db.PhotoAlbums.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
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
                Data.PhotoAlbum item = master.Selector.PhotoAlbum(master.AssetID);
                if (item != null)
                {
                    master.db.PhotoAlbums.Remove(item);
                    total = 1;
                }
            }
            else
            {
                string[] records = _records.Split(new char[] { ',' });
                foreach (string record in records)
                {
                    int id = Statics.ParseInt(record);
                    Data.PhotoAlbum item = master.db.PhotoAlbums.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
                    if (item != null)
                    {
                        master.db.PhotoAlbums.Remove(item);
                        total++;
                    }
                }
            }
            master.db.SaveChanges();
            return total;
        }

        public void update(Data.PhotoAlbum item, bool delete)
        {
            item.Deleted = delete;
            master.SaveChanges(item.AssetID);
        }

    }
}