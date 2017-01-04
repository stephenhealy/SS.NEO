using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web._Masters
{
    public partial class Site : MasterClass
    {
        private List<Data.SubscriptionType> SubscriptionTypes { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize();

            if (!IsPostBack)
            {
                Data.Setting setting = master.db.Settings.FirstOrDefault();
                if (setting != null)
                {
                    if (String.IsNullOrEmpty(setting.Alert) == false &&
                        (setting.AlertStart == null || Statics.ParseDateTime(setting.AlertStart.ToString()) < Statics.DateTimeUTC()) &&
                        (setting.AlertEnd == null || Statics.ParseDateTime(setting.AlertEnd.ToString()) >= Statics.DateTimeUTC()))
                    {
                        panAlert.Visible = true;
                        litAlert.Text = Statics.TextToHtml(setting.Alert);
                    }
                }
                //SubscriptionTypes = master.db.SubscriptionTypes.Where(o => o.Enabled && o.Deleted == false).ToList();
                //rptSports.DataSource = master.db.Sports.Where(o => o.PhotosOnly == false && o.Enabled && o.Deleted == false).OrderBy(o => o.Display).ToList();
                //rptSports.DataBind();
            }
        }

        //protected void btnSubscribe_Click(object sender, EventArgs e)
        //{
        //    panThanks.Visible = false;
        //    panError.Visible = false;

        //    try
        //    {
        //        Data.Subscription subscription = master.db.Subscriptions.Where(o => o.Email == txtSubscribe.Text).FirstOrDefault();
        //        if (subscription == null)
        //        {
        //            subscription = new Data.Subscription();
        //            master.db.Subscriptions.Add(subscription);
        //            master.db.SaveChanges();
        //        }
        //        subscription.Email = txtSubscribe.Text;
        //        subscription.Created = Statics.DateTimeUTC();
        //        // Delete all previous values
        //        master.db.SubscriptionMembers.Where(o => o.SubscriptionID == subscription.ID).ToList().ForEach(c => c.Deleted = true);
        //        // Add new
        //        foreach (RepeaterItem ri in rptSports.Items)
        //        {
        //            CheckBoxList chkTypes = (CheckBoxList)ri.FindControl("chkTypes");
        //            foreach (ListItem li in chkTypes.Items)
        //            {
        //                if (li.Selected)
        //                {
        //                    Data.SubscriptionMember member = new Data.SubscriptionMember();
        //                    member.SubscriptionID = subscription.ID;
        //                    member.TypeID = Statics.ParseInt(li.Value);
        //                    member.Created = Statics.DateTimeUTC();
        //                    member.Deleted = false;
        //                    master.db.SubscriptionMembers.Add(member);
        //                }
        //            }
        //        }
        //        master.db.SaveChanges();
        //        panThanks.Visible = true;
        //    }
        //    catch (Exception ex)
        //    {
        //        //litError.Text = ex.Message;
        //        panError.Visible = true;
        //    }
        //    ScriptManager.RegisterStartupScript(updSubscribe, updSubscribe.GetType(), "saved", "ShowModal();", true);
        //}

        //protected void rptSports_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    RepeaterItem item = (RepeaterItem)e.Item;
        //    if (item.ItemType != ListItemType.Footer && item.ItemType != ListItemType.Header
        //         && item.ItemType != ListItemType.Pager && item.ItemType != ListItemType.Separator)
        //    {
        //        Data.Sport sport = (Data.Sport)item.DataItem;
        //        CheckBoxList chkTypes = (CheckBoxList)item.FindControl("chkTypes");
        //        master.Common.DataBindDDL(chkTypes, "Name", "AssetID", SubscriptionTypes.Where(o => o.SportID == sport.AssetID).OrderBy(o => o.Display).ToList(), "");
        //    }
        //}
    }
}