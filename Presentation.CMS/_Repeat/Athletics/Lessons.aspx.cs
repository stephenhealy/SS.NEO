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
    public partial class Lessons : RepeaterClass, EditPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("Lessons", false, "");
            master.EditPage = this;
            master.ShowOrder = true;
            master.TreeLevel = 2;   // leave off if not a tree.
            if (!IsPostBack)
                master.Heading.Text = "Lessons";
            master.LoggingKey = LoggingKeys.Lessons;
        }

        public object Json(bool trash)
        {
            List<AdminList> items = master.Selector.Lesson(master.ParentID, trash);
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
            DateTime datMin = Statics.DateTimeMin();
            foreach (TreeItem item in tree)
            {
                item.Count = (from two in master.db.Lessons
                              where two.SportID == item.AssetID
                              && two.Enabled && two.Deleted == false
                              select two.AssetID).Count();
            }
            return tree;
        }

        public void Edit(int id)
        {
            master.Common.DataBindDDL(ddlSport, "Name", "AssetID", master.Selector.Sport(false));
            Data.Lesson item = master.Selector.Lesson(id);
            if (item != null)
            {
                master.Heading.Text = txtName.Text = item.Name;
                master.ParentID = item.SportID;
                ddlSport.SelectedValue = item.SportID.ToString();
                txtName.Text = item.Name;
                txtRate.Text = item.Rate.ToString("F");
                radHourly.Checked = item.Hourly;
                radOnce.Checked = !item.Hourly;
                txtBenefit1.Text = item.Benefit1;
                txtBenefit2.Text = item.Benefit2;
                txtBenefit3.Text = item.Benefit3;
                txtValue.Text = item.Value;
                chkEnabled.Checked = item.Enabled;
                if (item.Deleted)
                    master.HideSave();
            }
        }

        public string Save()
        {
            List<Data.LogDetail> details = new List<Data.LogDetail>();
            Data.Lesson item = master.Selector.Lesson(master.AssetID);
            if (item == null)
            {
                item = new Data.Lesson();
                item.AssetID = Models.Asset.New(master.db, master.User.ID);
                master.db.Lessons.Add(item);
            }
            item.SportID = Statics.ParseInt(ddlSport.SelectedItem.Value);
            item.Name = txtName.Text;
            item.Rate = Statics.ParseDouble(txtRate.Text);
            item.Hourly = radHourly.Checked;
            item.Benefit1 = txtBenefit1.Text;
            item.Benefit2 = txtBenefit2.Text;
            item.Benefit3 = txtBenefit3.Text;
            item.Value = txtValue.Text;
            if (item.Display == 0)
                item.Display = master.Selector.Lesson(item.SportID, false).Count;
            item.Enabled = chkEnabled.Checked;
            // Add data from other tables

            return master.SaveChanges(item.AssetID, details);
        }

        public void Delete()
        {
            Data.Lesson item = master.Selector.Lesson(master.AssetID);
            if (item != null)
                update(item, true);
        }

        public int Restore(string _records)
        {
            int total = 0;
            if (master.AssetID > 0)
            {
                Data.Lesson item = master.Selector.Lesson(master.AssetID);
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
                    Data.Lesson item = master.db.Lessons.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
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
                Data.Lesson item = master.Selector.Lesson(master.AssetID);
                if (item != null)
                {
                    master.db.Lessons.Remove(item);
                    total = 1;
                }
            }
            else
            {
                string[] records = _records.Split(new char[] { ',' });
                foreach (string record in records)
                {
                    int id = Statics.ParseInt(record);
                    Data.Lesson item = master.db.Lessons.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
                    if (item != null)
                    {
                        master.db.Lessons.Remove(item);
                        total++;
                    }
                }
            }
            master.db.SaveChanges();
            return total;
        }

        public void update(Data.Lesson item, bool delete)
        {
            item.Deleted = delete;
            master.SaveChanges(item.AssetID);
        }

    }
}