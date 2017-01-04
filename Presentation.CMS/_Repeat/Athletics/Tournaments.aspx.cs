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
    public partial class Tournaments : RepeaterClass, EditPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("Tournaments", false, "");
            master.EditPage = this;
            //master.ShowOrder = true;
            master.TreeLevel = 2;   // leave off if not a tree.
            if (!IsPostBack)
                master.Heading.Text = "Tournaments";
            master.LoggingKey = LoggingKeys.Tournaments;
        }

        public object Json(bool trash)
        {
            List<AdminList> items = master.Selector.Tournament(master.ParentID, trash);
            foreach (AdminList item in items)
                item.Parent = Statics.DateTimeToString(item.Date, Models.ParseDateTimeType.ShortDate);
            return Output.SerializeJSON(items);
        }

        public override List<TreeItem> Tree()
        {
            List<TreeItem> tree = (from one in master.db.Sports
                                   where one.Deleted == false
                                   select new TreeItem()
                                   {
                                       AssetID = one.AssetID,
                                       Name = one.Name
                                   }).ToList();
            foreach (TreeItem item in tree)
            {
                item.Count = (from two in master.db.Tournaments
                              where two.SportID == item.AssetID
                              && two.Enabled && two.Deleted == false
                              select two.AssetID).Count();
            }
            return tree;
        }

        public void Edit(int id)
        {
            master.Common.DataBindDDL(ddlSport, "Name", "AssetID", master.Selector.Sport(false));
            master.Common.DataBindDDL(ddlDirector, "Name", "AssetID", master.Selector.Users(false));
            Data.Tournament item = master.Selector.Tournament(id);
            if (item != null)
            {
                master.Heading.Text = txtName.Text = item.Name;
                master.ParentID = item.SportID;
                ddlSport.SelectedValue = item.SportID.ToString();
                txtDescription.Text = item.Description;
                txtLocation.Text = item.Location;
                txtDate.Text = Statics.DateTimeToString(item.Date, Models.ParseDateTimeType.ShortDate);
                txtDeadline.Text = Statics.DateTimeToString(item.Deadline, Models.ParseDateTimeType.ShortDate);
                txtCost.Text = item.Cost.ToString("F");
                ddlDirector.SelectedValue = item.UserID.ToString();
                txtEZRegister.Text = item.EZRegister;
                txtEZSchedule.Text = item.EZSchedule;
                chkEnabled.Checked = item.Enabled;
                if (item.Deleted)
                    master.HideSave();
            }
        }

        public string Save()
        {
            List<Data.LogDetail> details = new List<Data.LogDetail>();
            Data.Tournament item = master.Selector.Tournament(master.AssetID);
            if (item == null)
            {
                item = new Data.Tournament();
                item.AssetID = Models.Asset.New(master.db, master.User.ID);
                master.db.Tournaments.Add(item);
            }
            item.SportID = Statics.ParseInt(ddlSport.SelectedItem.Value);
            item.Name = txtName.Text;
            item.Description = txtDescription.Text;
            item.Location = txtLocation.Text;
            item.Date = Statics.ParseDateTime(txtDate.Text);
            item.Deadline = Statics.ParseDateTime(txtDeadline.Text);
            item.Cost = Statics.ParseDouble(txtCost.Text);
            item.UserID = Statics.ParseInt(ddlDirector.SelectedItem.Value);
            item.EZRegister = txtEZRegister.Text;
            item.EZSchedule = txtEZSchedule.Text;
            item.Enabled = chkEnabled.Checked;
            // Add data from other tables

            return master.SaveChanges(item.AssetID, details);
        }

        public void Delete()
        {
            Data.Tournament item = master.Selector.Tournament(master.AssetID);
            if (item != null)
                update(item, true);
        }

        public int Restore(string _records)
        {
            int total = 0;
            if (master.AssetID > 0)
            {
                Data.Tournament item = master.Selector.Tournament(master.AssetID);
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
                    Data.Tournament item = master.db.Tournaments.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
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
                Data.Tournament item = master.Selector.Tournament(master.AssetID);
                if (item != null)
                {
                    master.db.Tournaments.Remove(item);
                    total = 1;
                }
            }
            else
            {
                string[] records = _records.Split(new char[] { ',' });
                foreach (string record in records)
                {
                    int id = Statics.ParseInt(record);
                    Data.Tournament item = master.db.Tournaments.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
                    if (item != null)
                    {
                        master.db.Tournaments.Remove(item);
                        total++;
                    }
                }
            }
            master.db.SaveChanges();
            return total;
        }

        public void update(Data.Tournament item, bool delete)
        {
            item.Deleted = delete;
            master.SaveChanges(item.AssetID);
        }

    }
}