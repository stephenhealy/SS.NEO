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
    public partial class Advertisements : RepeaterClass, EditPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("Advertisements", false, "");
            master.EditPage = this;
            master.ShowOrder = false;
            //master.TreeLevel = 2;   // leave off if not a tree.
            if (!IsPostBack)
                master.Heading.Text = "Advertisements";
            master.LoggingKey = LoggingKeys.Advertisements;
        }

        public object Json(bool trash)
        {
            List<AdminList> items = master.Selector.Advertisement(trash);
            return Output.SerializeJSON(items);
        }

        public void Edit(int id)
        {
            Data.Advertisement item = master.Selector.Advertisement(id);
            if (item != null)
            {
                master.Heading.Text = txtName.Text = item.Name;
                txtHeading.Text = item.Heading;
                txtMessage.Text = item.Message;
                txtLink.Text = item.Link;
                txtLabel.Text = item.Label;
                txtFrequency.Text = item.Frequency.ToString();
                litShownTimes.Text = item.Total.ToString();
                litShownLast.Text = Statics.DateTimeToString(item.Last, Models.ParseDateTimeType.LongDateTime, master.User.TimeZone);
                List<Data.AdvertisementClick> clicks = master.db.AdvertisementClicks.Where(o => o.AdvertisementID == item.AssetID).OrderByDescending(o => o.Created).ToList();
                if (clicks.Count > 0)
                {
                    litClickedTimes.Text = clicks.Count.ToString();
                    litClickedLast.Text = Statics.DateTimeToString(clicks[0].Created, Models.ParseDateTimeType.LongDateTime, master.User.TimeZone);
                }
                chkEnabled.Checked = item.Enabled;
                if (item.Deleted)
                    master.HideSave();
            }
        }

        public string Save()
        {
            List<Data.LogDetail> details = new List<Data.LogDetail>();
            Data.Advertisement item = master.Selector.Advertisement(master.AssetID);
            if (item == null)
            {
                item = new Data.Advertisement();
                item.AssetID = Models.Asset.New(master.db, master.User.ID);
                item.Times = 0;
                item.Total = 0;
                master.db.Advertisements.Add(item);
            }
            item.Name = txtName.Text;
            item.Heading = txtHeading.Text;
            item.Message = txtMessage.Text;
            item.Link = txtLink.Text;
            item.Label = txtLabel.Text;
            item.Frequency = Statics.ParseInt(txtFrequency.Text);
            item.Enabled = chkEnabled.Checked;
            // Add data from other tables

            Reset();
            return master.SaveChanges(item.AssetID, details);
        }

        public void Delete()
        {
            Data.Advertisement item = master.Selector.Advertisement(master.AssetID);
            if (item != null)
                update(item, true);
        }

        public int Restore(string _records)
        {
            int total = 0;
            if (master.AssetID > 0)
            {
                Data.Advertisement item = master.Selector.Advertisement(master.AssetID);
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
                    Data.Advertisement item = master.db.Advertisements.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
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
                Data.Advertisement item = master.Selector.Advertisement(master.AssetID);
                if (item != null)
                {
                    master.db.Advertisements.Remove(item);
                    total = 1;
                }
            }
            else
            {
                string[] records = _records.Split(new char[] { ',' });
                foreach (string record in records)
                {
                    int id = Statics.ParseInt(record);
                    Data.Advertisement item = master.db.Advertisements.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
                    if (item != null)
                    {
                        master.db.Advertisements.Remove(item);
                        total++;
                    }
                }
            }
            master.db.SaveChanges();
            return total;
        }

        public void update(Data.Advertisement item, bool delete)
        {
            item.Deleted = delete;
            Reset();
            master.SaveChanges(item.AssetID);
        }

        private void Reset()
        {
            List<Data.Advertisement> ads = master.db.Advertisements.Where(x => x.Enabled && x.Deleted == false).ToList();
            foreach (Data.Advertisement ad in ads)
                ad.Times = 0;
        }

    }
}