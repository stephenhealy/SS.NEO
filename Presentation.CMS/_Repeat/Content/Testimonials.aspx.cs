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
    public partial class Testimonials : RepeaterClass, EditPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("Testimonials", false, "");
            master.EditPage = this;
            master.ShowOrder = true;
            //master.TreeLevel = 2;   // leave off if not a tree.
            if (!IsPostBack)
                master.Heading.Text = "Testimonials";
            master.LoggingKey = LoggingKeys.Testimonials;
            btnImage.Attributes.Add("data-control", txtImage.ClientID);
        }

        public object Json(bool trash)
        {
            List<AdminList> items = master.Selector.Testimonial(master.ParentID, trash);
            return Output.SerializeJSON(items);
        }

        public void Edit(int id)
        {
            Data.Testimonial item = master.Selector.Testimonial(id);
            if (item != null)
            {
                master.Heading.Text = txtName.Text = item.Name;
                txtCompany.Text = item.Company;
                txtTestimonial.Text = item.Testimonial1;
                txtEmail.Text = item.Email;
                txtImage.Text = item.Image;
                chkEnabled.Checked = item.Enabled;
                if (item.Deleted)
                    master.HideSave();
            }
        }

        public string Save()
        {
            List<Data.LogDetail> details = new List<Data.LogDetail>();
            Data.Testimonial item = master.Selector.Testimonial(master.AssetID);
            if (item == null)
            {
                item = new Data.Testimonial();
                item.AssetID = Models.Asset.New(master.db, master.User.ID);
                master.db.Testimonials.Add(item);
            }
            item.Name = txtName.Text;
            item.Company = txtCompany.Text;
            item.Testimonial1 = txtTestimonial.Text;
            item.Email = txtEmail.Text;
            item.Image = txtImage.Text;
            if (item.Display == 0)
            {
                List<Data.Testimonial> order = master.db.Testimonials.Where(x => x.Deleted == false).ToList();
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
            Data.Testimonial item = master.Selector.Testimonial(master.AssetID);
            if (item != null)
                update(item, true);
        }

        public int Restore(string _records)
        {
            int total = 0;
            if (master.AssetID > 0)
            {
                Data.Testimonial item = master.Selector.Testimonial(master.AssetID);
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
                    Data.Testimonial item = master.db.Testimonials.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
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
                Data.Testimonial item = master.Selector.Testimonial(master.AssetID);
                if (item != null)
                {
                    master.db.Testimonials.Remove(item);
                    total = 1;
                }
            }
            else
            {
                string[] records = _records.Split(new char[] { ',' });
                foreach (string record in records)
                {
                    int id = Statics.ParseInt(record);
                    Data.Testimonial item = master.db.Testimonials.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
                    if (item != null)
                    {
                        master.db.Testimonials.Remove(item);
                        total++;
                    }
                }
            }
            master.db.SaveChanges();
            return total;
        }

        public void update(Data.Testimonial item, bool delete)
        {
            item.Deleted = delete;
            master.SaveChanges(item.AssetID);
        }

    }
}