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
    public partial class Sponsors : RepeaterClass, EditPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("Sponsors", false, "");
            master.EditPage = this;
            master.ShowOrder = true;
            //master.TreeLevel = 2;   // leave off if not a tree.
            if (!IsPostBack)
                master.Heading.Text = "Sponsors";
            master.LoggingKey = LoggingKeys.Sponsors;
            btnLogo.Attributes.Add("data-control", txtLogo.ClientID);
        }

        public object Json(bool trash)
        {
            List<AdminList> items = master.Selector.Sponsor(trash);
            return Output.SerializeJSON(items);
        }

        public void Edit(int id)
        {
            Data.Sponsor item = master.Selector.Sponsor(id);
            if (item != null)
            {
                master.Heading.Text = txtName.Text = item.Name;
                txtLogo.Text = item.Logo;
                txtWebsite.Text = item.Web;
                txtAddress.Text = item.Address;
                txtCity.Text = item.City;
                txtState.Text = item.State;
                txtZip.Text = item.Zip;
                txtPhone.Text = item.Phone;
                txtDescription.Text = item.Description;
                chkEnabled.Checked = item.Enabled;
                if (item.Deleted)
                    master.HideSave();
            }
        }

        public string Save()
        {
            List<Data.LogDetail> details = new List<Data.LogDetail>();
            Data.Sponsor item = master.Selector.Sponsor(master.AssetID);
            if (item == null)
            {
                item = new Data.Sponsor();
                item.AssetID = Models.Asset.New(master.db, master.User.ID);
                master.db.Sponsors.Add(item);
            }
            item.Name = txtName.Text;
            item.Logo = txtLogo.Text;
            item.Web = txtWebsite.Text;
            item.Address = txtAddress.Text;
            item.City = txtCity.Text;
            item.State = txtState.Text.ToUpper();
            item.Zip = txtZip.Text;
            item.Phone = Statics.ClearPhone(txtPhone.Text);
            item.Description = txtDescription.Text;
            if (item.Display == 0)
            {
                List<Data.Sponsor> order = master.db.Sponsors.Where(x => x.Deleted == false).ToList();
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
            Data.Sponsor item = master.Selector.Sponsor(master.AssetID);
            if (item != null)
                update(item, true);
        }

        public int Restore(string _records)
        {
            int total = 0;
            if (master.AssetID > 0)
            {
                Data.Sponsor item = master.Selector.Sponsor(master.AssetID);
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
                    Data.Sponsor item = master.db.Sponsors.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
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
                Data.Sponsor item = master.Selector.Sponsor(master.AssetID);
                if (item != null)
                {
                    master.db.Sponsors.Remove(item);
                    total = 1;
                }
            }
            else
            {
                string[] records = _records.Split(new char[] { ',' });
                foreach (string record in records)
                {
                    int id = Statics.ParseInt(record);
                    Data.Sponsor item = master.db.Sponsors.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
                    if (item != null)
                    {
                        master.db.Sponsors.Remove(item);
                        total++;
                    }
                }
            }
            master.db.SaveChanges();
            return total;
        }

        public void update(Data.Sponsor item, bool delete)
        {
            item.Deleted = delete;
            master.SaveChanges(item.AssetID);
        }

    }
}