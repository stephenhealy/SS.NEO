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
    public partial class Carousel : RepeaterClass, EditPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("Carousel", false, "");
            master.EditPage = this;
            master.ShowOrder = true;
            //master.TreeLevel = 2;   // leave off if not a tree.
            if (!IsPostBack)
                master.Heading.Text = "Carousel";
            master.LoggingKey = LoggingKeys.Carousel;
            btnImage.Attributes.Add("data-control", txtImage.ClientID);
            btnLink.Attributes.Add("data-control", txtLink.ClientID);
        }

        public object Json(bool trash)
        {
            List<AdminList> items = master.Selector.Carousel(trash);
            return Output.SerializeJSON(items);
        }

        public void Edit(int id)
        {
            Data.Carousel item = master.Selector.Carousel(id);
            if (item != null)
            {
                master.Heading.Text = txtTitle.Text = item.Title;
                txtLead.Text = item.Lead;
                txtDescription.Text = item.Description;
                txtImage.Text = item.Image;
                txtLabel.Text = item.Label;
                txtLink.Text = item.Link;
                radLeft.Checked = item.Left;
                radRight.Checked = !radLeft.Checked;
                chkEnabled.Checked = item.Enabled;
                if (item.Deleted)
                    master.HideSave();
            }
        }

        public string Save()
        {
            List<Data.LogDetail> details = new List<Data.LogDetail>();
            Data.Carousel item = master.Selector.Carousel(master.AssetID);
            if (item == null)
            {
                item = new Data.Carousel();
                item.AssetID = Models.Asset.New(master.db, master.User.ID);
                master.db.Carousels.Add(item);
            }
            item.Title = txtTitle.Text;
            item.Lead = txtLead.Text;
            item.Description = txtDescription.Text;
            item.Image = txtImage.Text;
            item.Label = txtLabel.Text;
            item.Link = txtLink.Text;
            if (item.Display == 0)
                item.Display = master.Selector.Carousel(false).Count;
            item.Left = radLeft.Checked;
            item.Enabled = chkEnabled.Checked;
            // Add data from other tables

            return master.SaveChanges(item.AssetID, details);
        }

        public void Delete()
        {
            Data.Carousel item = master.Selector.Carousel(master.AssetID);
            if (item != null)
                update(item, true);
        }

        public int Restore(string _records)
        {
            int total = 0;
            if (master.AssetID > 0)
            {
                Data.Carousel item = master.Selector.Carousel(master.AssetID);
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
                    Data.Carousel item = master.db.Carousels.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
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
                Data.Carousel item = master.Selector.Carousel(master.AssetID);
                if (item != null)
                {
                    master.db.Carousels.Remove(item);
                    total = 1;
                }
            }
            else
            {
                string[] records = _records.Split(new char[] { ',' });
                foreach (string record in records)
                {
                    int id = Statics.ParseInt(record);
                    Data.Carousel item = master.db.Carousels.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
                    if (item != null)
                    {
                        master.db.Carousels.Remove(item);
                        total++;
                    }
                }
            }
            master.db.SaveChanges();
            return total;
        }

        public void update(Data.Carousel item, bool delete)
        {
            item.Deleted = delete;
            master.SaveChanges(item.AssetID);
        }

    }
}