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
    public partial class Sessions : RepeaterClass, EditPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("Sessions", false, "");
            master.EditPage = this;
            master.ShowOrder = false;
            master.TreeLevel = 2;   // leave off if not a tree.
            if (!IsPostBack)
                master.Heading.Text = "Sessions";
            master.LoggingKey = LoggingKeys.Sessions;
        }

        public object Json(bool trash)
        {
            List<AdminList> items = master.Selector.Session(master.ParentID, trash);
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
                item.Count = (from two in master.db.Sessions
                              where two.SportID == item.AssetID
                              && two.Enabled && two.Deleted == false
                              select two.AssetID).Count();
            }
            return tree;
        }

        public void Edit(int id)
        {
            master.Common.DataBindDDL(ddlSport, "Name", "AssetID", master.Selector.Sport(false));
            Data.Session item = master.Selector.Session(id);
            if (item != null)
            {
                master.Heading.Text = txtName.Text = item.Name;
                master.ParentID = item.SportID;
                ddlSport.SelectedValue = item.SportID.ToString();
                txtName.Text = item.Name;
                txtDeadline.Text = Statics.DateTimeToString(item.Deadline, Models.ParseDateTimeType.ShortDate);
                txtStartDate.Text = Statics.DateTimeToString(item.StartDate, Models.ParseDateTimeType.ShortDate);
                chkEnabled.Checked = item.Enabled;
                if (item.Deleted)
                    master.HideSave();

                hypCopy.Visible = true;
                hypCopy.Attributes.Add("onclick", "return LoadModal('mainModal', '" + master.RelativePath + "/_Modals/Session.aspx?ID=" + id + "', 'Copy Session: <small>" + item.Name + "</small>');");
            }
        }

        public string Save()
        {
            List<Data.LogDetail> details = new List<Data.LogDetail>();
            Data.Session item = master.Selector.Session(master.AssetID);
            if (item == null)
            {
                item = new Data.Session();
                item.AssetID = Models.Asset.New(master.db, master.User.ID);
                master.db.Sessions.Add(item);
            }
            item.SportID = Statics.ParseInt(ddlSport.SelectedItem.Value);
            item.Name = txtName.Text;
            item.Deadline = Statics.ParseDateTime(txtDeadline.Text);
            item.StartDate = Statics.ParseDateTime(txtStartDate.Text);
            item.Enabled = chkEnabled.Checked;
            // Add data from other tables

            return master.SaveChanges(item.AssetID, details);
        }

        public void Delete()
        {
            Data.Session item = master.Selector.Session(master.AssetID);
            if (item != null)
                update(item, true);
        }

        public int Restore(string _records)
        {
            int total = 0;
            if (master.AssetID > 0)
            {
                Data.Session item = master.Selector.Session(master.AssetID);
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
                    Data.Session item = master.db.Sessions.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
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
                Data.Session item = master.Selector.Session(master.AssetID);
                if (item != null)
                {
                    master.db.Sessions.Remove(item);
                    total = 1;
                }
            }
            else
            {
                string[] records = _records.Split(new char[] { ',' });
                foreach (string record in records)
                {
                    int id = Statics.ParseInt(record);
                    Data.Session item = master.db.Sessions.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
                    if (item != null)
                    {
                        master.db.Sessions.Remove(item);
                        total++;
                    }
                }
            }
            master.db.SaveChanges();
            return total;
        }

        public void update(Data.Session item, bool delete)
        {
            item.Deleted = delete;
            master.SaveChanges(item.AssetID);
        }

        protected void btnCopy_Click(object sender, EventArgs e)
        {

        }

    }
}