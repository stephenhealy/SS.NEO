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
    public partial class Leagues : RepeaterClass, EditPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("Leagues", false, "");
            master.EditPage = this;
            master.ShowOrder = false;
            master.TreeLevel = 3;   // leave off if not a tree.
            if (!IsPostBack)
                master.Heading.Text = "Leagues";
            master.LoggingKey = LoggingKeys.Leagues;
        }

        public object Json(bool trash)
        {
            List<AdminList> items = master.Selector.League(master.ParentID, trash);
            return Output.SerializeJSON(items);
        }

        public override List<TreeItem> Tree()
        {
            List<TreeItem> ones = (from one in master.db.Sports
                                   where one.Deleted == false
                                   select new TreeItem()
                                   {
                                       AssetID = one.AssetID,
                                       Name = one.Name
                                   }).ToList();
            foreach (TreeItem one in ones)
            {
                one.Count = (from two in master.db.Sessions
                             join three in master.db.Leagues
                             on two.AssetID equals three.SessionID
                             where two.SportID == one.AssetID
                              && two.Enabled && two.Deleted == false
                             && three.Enabled && three.Deleted == false
                             select three.AssetID).Count();
                one.Children = (from two in master.db.Sessions
                                where two.SportID == one.AssetID
                                 && two.Deleted == false
                                     select new TreeItem()
                                     {
                                         AssetID = two.AssetID,
                                         Name = two.Name
                                     }).ToList();
                foreach (TreeItem two in one.Children)
                {
                    two.Count = (from three in master.db.Leagues
                                 where three.SessionID == two.AssetID
                             && three.Enabled && three.Deleted == false
                                 select three.AssetID).Count();
                }
            }
            return ones;
        }

        public void Edit(int id)
        {
            master.Common.DataBindDDL(ddlSession, "Name", "AssetID", master.Selector.Session(0, false).Where(o => o.Date >= DateTime.UtcNow).ToList());
            Data.League item = master.Selector.League(id);
            if (item != null)
            {
                master.Heading.Text = txtName.Text = item.Name;
                master.ParentID = item.SessionID;
                ddlSession.SelectedValue = item.SessionID.ToString();
                if (ddlSession.SelectedIndex == 0)
                {
                    Data.Session session = master.Selector.Session(item.SessionID);
                    if (session != null)
                    {
                        ddlSession.Items[0].Text = session.Name + " (In Progress)";
                        ddlSession.Enabled = false;
                        RequiredFieldValidator1.Enabled = false;
                    }
                }
                txtName.Text = item.Name;
                txtDescription.Text = item.Description;
                if (item.Night == 1) radMonday.Checked = true;
                else if (item.Night == 2) radTuesday.Checked = true;
                else if (item.Night == 3) radWednesday.Checked = true;
                else if (item.Night == 4) radThursday.Checked = true;
                else if (item.Night == 5) radFriday.Checked = true;
                else if (item.Night == 7) radSunday.Checked = true;
                txtEZRegister.Text = item.EZRegister;
                txtEZSchedule.Text = item.EZSchedule;
                txtCost.Text = item.Cost.ToString("F");
                txtDisplay.Text = item.Display.ToString();
                chkEnabled.Checked = item.Enabled;
                if (item.Deleted)
                    master.HideSave();
            }
        }

        public string Save()
        {
            List<Data.LogDetail> details = new List<Data.LogDetail>();
            Data.League item = master.Selector.League(master.AssetID);
            if (item == null)
            {
                item = new Data.League();
                item.AssetID = Models.Asset.New(master.db, master.User.ID);
                master.db.Leagues.Add(item);
            }
            if (ddlSession.Enabled)
                item.SessionID = Statics.ParseInt(ddlSession.SelectedItem.Value);
            item.Name = txtName.Text;
            item.Description = txtDescription.Text;
            if (radMonday.Checked) item.Night = 1;
            else if (radTuesday.Checked) item.Night = 2;
            else if (radWednesday.Checked) item.Night = 3;
            else if (radThursday.Checked) item.Night = 4;
            else if (radFriday.Checked) item.Night = 5;
            else if (radSunday.Checked) item.Night = 7;
            item.EZRegister = txtEZRegister.Text;
            item.EZSchedule = txtEZSchedule.Text;
            item.Cost = Statics.ParseDouble(txtCost.Text);
            item.Display = Statics.ParseInt(txtDisplay.Text);
            item.Enabled = chkEnabled.Checked;
            // Add data from other tables

            return master.SaveChanges(item.AssetID, details);
        }

        public void Delete()
        {
            Data.League item = master.Selector.League(master.AssetID);
            if (item != null)
                update(item, true);
        }

        public int Restore(string _records)
        {
            int total = 0;
            if (master.AssetID > 0)
            {
                Data.League item = master.Selector.League(master.AssetID);
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
                    Data.League item = master.db.Leagues.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
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
                Data.League item = master.Selector.League(master.AssetID);
                if (item != null)
                {
                    master.db.Leagues.Remove(item);
                    total = 1;
                }
            }
            else
            {
                string[] records = _records.Split(new char[] { ',' });
                foreach (string record in records)
                {
                    int id = Statics.ParseInt(record);
                    Data.League item = master.db.Leagues.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
                    if (item != null)
                    {
                        master.db.Leagues.Remove(item);
                        total++;
                    }
                }
            }
            master.db.SaveChanges();
            return total;
        }

        public void update(Data.League item, bool delete)
        {
            item.Deleted = delete;
            master.SaveChanges(item.AssetID);
        }

    }
}