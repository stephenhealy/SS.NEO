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
    public partial class PhotoCategories : RepeaterClass, EditPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("Photo Categories", false, "");
            master.EditPage = this;
            master.ShowOrder = true;
            //master.TreeLevel = 2;   // leave off if not a tree.
            if (!IsPostBack)
                master.Heading.Text = "PhotoCategories";
            master.LoggingKey = LoggingKeys.PhotoCategories;
        }

        public object Json(bool trash)
        {
            List<AdminList> items = master.Selector.PhotoCategory(trash);
            return Output.SerializeJSON(items);
        }

        public void Edit(int id)
        {
            Data.PhotoCategory item = master.Selector.PhotoCategory(id);
            if (item != null)
            {
                master.Heading.Text = txtName.Text = item.Name;
                chkEnabled.Checked = item.Enabled;
                if (item.Deleted)
                    master.HideSave();
            }
        }

        public string Save()
        {
            List<Data.LogDetail> details = new List<Data.LogDetail>();
            Data.PhotoCategory item = master.Selector.PhotoCategory(master.AssetID);
            if (item == null)
            {
                item = new Data.PhotoCategory();
                item.AssetID = Models.Asset.New(master.db, master.User.ID);
                master.db.PhotoCategories.Add(item);
            }
            item.Name = txtName.Text;
            if (item.Display == 0)
                item.Display = master.Selector.PhotoCategory(false).Count;
            item.Enabled = chkEnabled.Checked;
            // Add data from other tables

            return master.SaveChanges(item.AssetID, details);
        }

        public void Delete()
        {
            Data.PhotoCategory item = master.Selector.PhotoCategory(master.AssetID);
            if (item != null)
                update(item, true);
        }

        public int Restore(string _records)
        {
            int total = 0;
            if (master.AssetID > 0)
            {
                Data.PhotoCategory item = master.Selector.PhotoCategory(master.AssetID);
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
                    Data.PhotoCategory item = master.db.PhotoCategories.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
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
                Data.PhotoCategory item = master.Selector.PhotoCategory(master.AssetID);
                if (item != null)
                {
                    master.db.PhotoCategories.Remove(item);
                    total = 1;
                }
            }
            else
            {
                string[] records = _records.Split(new char[] { ',' });
                foreach (string record in records)
                {
                    int id = Statics.ParseInt(record);
                    Data.PhotoCategory item = master.db.PhotoCategories.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
                    if (item != null)
                    {
                        master.db.PhotoCategories.Remove(item);
                        total++;
                    }
                }
            }
            master.db.SaveChanges();
            return total;
        }

        public void update(Data.PhotoCategory item, bool delete)
        {
            item.Deleted = delete;
            master.SaveChanges(item.AssetID);
        }

    }
}