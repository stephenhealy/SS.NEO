using Models;
using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.CMS._Repeat.Athletics
{
    public partial class Sports : RepeaterClass, EditPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("Sports", false, "");
            master.EditPage = this;
            master.ShowOrder = true;
            //master.TreeLevel = 2;   // leave off if not a tree.
            if (!IsPostBack)
                master.Heading.Text = "Sports";
            master.LoggingKey = LoggingKeys.Sports;
        }

        public object Json(bool trash)
        {
            List<AdminList> items = master.Selector.Sport(trash);
            return Output.SerializeJSON(items);
        }

        public void Edit(int id)
        {
            Data.Sport item = master.Selector.Sport(id);
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
            Data.Sport item = master.Selector.Sport(master.AssetID);
            if (item == null)
            {
                item = new Data.Sport();
                item.AssetID = Models.Asset.New(master.db, master.User.ID);
                master.db.Sports.Add(item);
            }
            item.Name = txtName.Text;
            if (item.Display == 0)
                item.Display = master.Selector.Sport(false).Count;
            item.Enabled = chkEnabled.Checked;
            // Add data from other tables

            return master.SaveChanges(item.AssetID, details);
        }

        public void Delete()
        {
            Data.Sport item = master.Selector.Sport(master.AssetID);
            if (item != null)
                update(item, true);
        }

        public int Restore(string _records)
        {
            int total = 0;
            if (master.AssetID > 0)
            {
                Data.Sport item = master.Selector.Sport(master.AssetID);
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
                    Data.Sport item = master.db.Sports.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
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
                Data.Sport item = master.Selector.Sport(master.AssetID);
                if (item != null)
                {
                    master.db.Sports.Remove(item);
                    total = 1;
                }
            }
            else
            {
                string[] records = _records.Split(new char[] { ',' });
                foreach (string record in records)
                {
                    int id = Statics.ParseInt(record);
                    Data.Sport item = master.db.Sports.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
                    if (item != null)
                    {
                        master.db.Sports.Remove(item);
                        total++;
                    }
                }
            }
            master.db.SaveChanges();
            return total;
        }

        public void update(Data.Sport item, bool delete)
        {
            item.Deleted = delete;
            master.SaveChanges(item.AssetID);
        }

    }
}