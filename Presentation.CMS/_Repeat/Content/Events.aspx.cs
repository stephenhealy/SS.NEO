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
    public partial class Events : RepeaterClass, EditPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("Events", false, "");
            master.EditPage = this;
            //master.ShowOrder = true;
            //master.TreeLevel = 2;   // leave off if not a tree.
            if (!IsPostBack)
                master.Heading.Text = "Events";
            master.LoggingKey = LoggingKeys.Events;
        }

        public object Json(bool trash)
        {
            List<AdminList> items = master.Selector.Event(trash);
            return Output.SerializeJSON(items);
        }

        public void Edit(int id)
        {
            master.Common.DataBindDDL(ddlDirector, "Name", "AssetID", master.Selector.Users(false));
            Data.Event item = master.Selector.Event(id);
            if (item != null)
            {
                master.Heading.Text = txtTitle.Text = item.Title;
                txtDescription.Text = item.Description;
                txtStartDate.Text = Statics.DateTimeToString(item.StartDate, Models.ParseDateTimeType.ShortDate);
                ddlDirector.SelectedValue = item.UserID.ToString();
                txtLink.Text = item.Link;
                chkEnabled.Checked = item.Enabled;
                if (item.Deleted)
                    master.HideSave();
            }
        }

        public string Save()
        {
            List<Data.LogDetail> details = new List<Data.LogDetail>();
            Data.Event item = master.Selector.Event(master.AssetID);
            if (item == null)
            {
                item = new Data.Event();
                item.AssetID = Models.Asset.New(master.db, master.User.ID);
                master.db.Events.Add(item);
            }
            item.Title = txtTitle.Text;
            item.Description = txtDescription.Text;
            item.StartDate = Statics.ParseDateTime(txtStartDate.Text);
            item.UserID = Statics.ParseInt(ddlDirector.SelectedItem.Value);
            item.Link = txtLink.Text;
            item.Enabled = chkEnabled.Checked;
            // Add data from other tables

            return master.SaveChanges(item.AssetID, details);
        }

        public void Delete()
        {
            Data.Event item = master.Selector.Event(master.AssetID);
            if (item != null)
                update(item, true);
        }

        public int Restore(string _records)
        {
            int total = 0;
            if (master.AssetID > 0)
            {
                Data.Event item = master.Selector.Event(master.AssetID);
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
                    Data.Event item = master.db.Events.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
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
                Data.Event item = master.Selector.Event(master.AssetID);
                if (item != null)
                {
                    master.db.Events.Remove(item);
                    total = 1;
                }
            }
            else
            {
                string[] records = _records.Split(new char[] { ',' });
                foreach (string record in records)
                {
                    int id = Statics.ParseInt(record);
                    Data.Event item = master.db.Events.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
                    if (item != null)
                    {
                        master.db.Events.Remove(item);
                        total++;
                    }
                }
            }
            master.db.SaveChanges();
            return total;
        }

        public void update(Data.Event item, bool delete)
        {
            item.Deleted = delete;
            master.SaveChanges(item.AssetID);
        }

    }
}