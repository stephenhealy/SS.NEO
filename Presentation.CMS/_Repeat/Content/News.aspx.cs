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
    public partial class News : RepeaterClass, EditPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("News", false, "");
            master.EditPage = this;
            master.ShowOrder = true;
            //master.TreeLevel = 2;   // leave off if not a tree.
            if (!IsPostBack)
                master.Heading.Text = "News";
            master.LoggingKey = LoggingKeys.News;
            btnLink.Attributes.Add("data-control", txtLink.ClientID);
        }

        public object Json(bool trash)
        {
            List<AdminList> items = master.Selector.News(trash);
            return Output.SerializeJSON(items);
        }

        public void Edit(int id)
        {
            Data.News item = master.Selector.News(id);
            if (item != null)
            {
                master.Heading.Text = txtTitle.Text = item.Title;
                txtDescription.Text = item.Description;
                txtLink.Text = item.Link;
                chkEnabled.Checked = item.Enabled;
                if (item.Deleted)
                    master.HideSave();
            }
        }

        public string Save()
        {
            List<Data.LogDetail> details = new List<Data.LogDetail>();
            Data.News item = master.Selector.News(master.AssetID);
            if (item == null)
            {
                item = new Data.News();
                item.AssetID = Models.Asset.New(master.db, master.User.ID);
                master.db.News.Add(item);
            }
            item.Title = txtTitle.Text;
            item.Description = txtDescription.Text;
            item.Link = txtLink.Text;
            if (item.Display == 0)
            {
                List<Data.News> order = master.db.News.Where(x => x.Deleted == false).ToList();
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
            Data.News item = master.Selector.News(master.AssetID);
            if (item != null)
                update(item, true);
        }

        public int Restore(string _records)
        {
            int total = 0;
            if (master.AssetID > 0)
            {
                Data.News item = master.Selector.News(master.AssetID);
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
                    Data.News item = master.db.News.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
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
                Data.News item = master.Selector.News(master.AssetID);
                if (item != null)
                {
                    master.db.News.Remove(item);
                    total = 1;
                }
            }
            else
            {
                string[] records = _records.Split(new char[] { ',' });
                foreach (string record in records)
                {
                    int id = Statics.ParseInt(record);
                    Data.News item = master.db.News.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
                    if (item != null)
                    {
                        master.db.News.Remove(item);
                        total++;
                    }
                }
            }
            master.db.SaveChanges();
            return total;
        }

        public void update(Data.News item, bool delete)
        {
            item.Deleted = delete;
            master.SaveChanges(item.AssetID);
        }

    }
}