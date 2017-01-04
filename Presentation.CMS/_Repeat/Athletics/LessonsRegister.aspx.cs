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
    public partial class LessonsRegister : RepeaterClass, EditPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("Lesson Registrations", false, "");
            master.EditPage = this;
            master.ShowOrder = false;
            master.TreeLevel = 2;   // leave off if not a tree.
            if (!IsPostBack)
                master.Heading.Text = "Lesson Registrations";
            master.LoggingKey = LoggingKeys.LessonsRegister;
        }

        public object Json(bool trash)
        {
            List<AdminList> items = master.Selector.LessonsRegister(master.ParentID, trash);
            DateTime datMin = Statics.DateTimeMin();
            foreach (AdminList item in items)
            {
                if (item.Date > datMin)
                    item.Parent = Statics.DateTimeToString(item.Date, Models.ParseDateTimeType.ShortDate);
            }
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
                item.Count = (from two in master.db.LessonsRegisters
                              where two.SportID == item.AssetID
                              && (two.Scheduled == datMin || two.Scheduled >= DateTime.UtcNow)
                              && two.Deleted == false
                              select two.AssetID).Count();
            }
            return tree;
        }

        public void Edit(int id)
        {
            master.Common.DataBindDDL(ddlInstructor, "Name", "AssetID", master.Selector.Users(false), "-- Not Assigned --");
            Data.LessonsRegister item = master.Selector.LessonsRegister(id);
            if (item != null)
            {
                master.Heading.Text = "Lesson Registration";
                litFirst.Text = item.First;
                litLast.Text = item.Last;
                master.ParentID = item.SportID;
                Data.Sport sport = master.Selector.Sport(item.SportID);
                if (sport != null)
                    litSport.Text = sport.Name;
                litParent.Text = item.Parent;
                litParticipants.Text = item.Participants.ToString();
                litPhone.Text = Statics.FormatPhone(item.Phone);
                litEmail.Text = Statics.FormatEmail(item.Email);
                if (item.Scheduled > Statics.DateTimeMin())
                    txtScheduled.Text = Statics.DateTimeToString(item.Scheduled, Models.ParseDateTimeType.ShortDate);
                ddlInstructor.SelectedValue = item.Instructor.ToString();
                if (item.Deleted)
                    master.HideSave();
            }
        }

        public string Save()
        {
            List<Data.LogDetail> details = new List<Data.LogDetail>();
            Data.LessonsRegister item = master.Selector.LessonsRegister(master.AssetID);
            if (item == null)
            {
                item = new Data.LessonsRegister();
                item.AssetID = Models.Asset.New(master.db, master.User.ID);
                master.db.LessonsRegisters.Add(item);
            }
            if (String.IsNullOrEmpty(txtScheduled.Text) == false)
                item.Scheduled = Statics.ParseDateTime(txtScheduled.Text);
            else
                item.Scheduled = Statics.DateTimeMin();
            item.Instructor = Statics.ParseInt(ddlInstructor.SelectedItem.Value);
            // Add data from other tables

            return master.SaveChanges(item.AssetID, details);
        }

        public void Delete()
        {
            Data.LessonsRegister item = master.Selector.LessonsRegister(master.AssetID);
            if (item != null)
                update(item, true);
        }

        public int Restore(string _records)
        {
            int total = 0;
            if (master.AssetID > 0)
            {
                Data.LessonsRegister item = master.Selector.LessonsRegister(master.AssetID);
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
                    Data.LessonsRegister item = master.db.LessonsRegisters.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
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
                Data.LessonsRegister item = master.Selector.LessonsRegister(master.AssetID);
                if (item != null)
                {
                    master.db.LessonsRegisters.Remove(item);
                    total = 1;
                }
            }
            else
            {
                string[] records = _records.Split(new char[] { ',' });
                foreach (string record in records)
                {
                    int id = Statics.ParseInt(record);
                    Data.LessonsRegister item = master.db.LessonsRegisters.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
                    if (item != null)
                    {
                        master.db.LessonsRegisters.Remove(item);
                        total++;
                    }
                }
            }
            master.db.SaveChanges();
            return total;
        }

        public void update(Data.LessonsRegister item, bool delete)
        {
            item.Deleted = delete;
            master.SaveChanges(item.AssetID);
        }

    }
}