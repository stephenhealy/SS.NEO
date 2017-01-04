using Models;
using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.CMS._Modals
{
    public partial class History : PageClass
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("", true, "");

            if (!IsPostBack)
                BindData();
        }

        public void BindData()
        {
            int AssetID = 0;
            if (String.IsNullOrEmpty(Request.QueryString["i"]) == false)
                AssetID = Statics.ParseInt(Request.QueryString["i"]);

            string Key = "";
            if (String.IsNullOrEmpty(Request.QueryString["k"]) == false)
                Key = Request.QueryString["k"];

            List<HistoryList> logs = new List<HistoryList>();
            if (String.IsNullOrEmpty(Key) == false)
            {
                string key = Request.QueryString["key"];
                int assetid = 0;
                if (String.IsNullOrEmpty(Request.QueryString["assetid"]) == false)
                    assetid = Statics.ParseInt(Request.QueryString["assetid"]);

                logs = master.Selector.History(Key, AssetID);
            }

            lvLogs.DataSource = logs;
            lvLogs.DataBind();
        }

        protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            pgLogs.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindData();
        }

        protected void lvLogs_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            ListViewItem lvLog = (ListViewItem)e.Item;
            HistoryList log = (HistoryList)lvLog.DataItem;
            Repeater rptDetails = (Repeater)lvLog.FindControl("rptDetails");
            if (rptDetails != null)
            {
                rptDetails.DataSource = log.Details;
                rptDetails.DataBind();
            }
        }

        public string Lookup(string field, string now, string was)
        {
            string row = "";
            string fieldUpper = field.ToUpper();
            if (fieldUpper == "ASSETID")
            {
                if (String.IsNullOrEmpty(Request.QueryString["noasset"]))
                    now = "<a href=\"javascript:void(0);\" onclick=\"window.top.location = window.top.location + '?ID=" + now + "';\">" + now + "</a>";
            }
            else if (fieldUpper.Contains("PASSWORD"))
            {
                now = "**********";
                was = "";
            }
            else if (fieldUpper.EndsWith("ID"))
            {
                string _field_for_was = field;
                int nowID = Statics.ParseInt(now);
                if (nowID > 0)
                    now = Lookup(ref field, now);
                else
                    now = "";
                int wasID = Statics.ParseInt(was);
                if (wasID > 0)
                    was = Lookup(ref _field_for_was, was);
                else
                    was = "";
            }
            else
            {
                now = HttpContext.Current.Server.HtmlEncode(now);
                was = HttpContext.Current.Server.HtmlEncode(was);
            }
            row = "<td>" + field + ":</td><td>" + now + (!String.IsNullOrEmpty(was) ? "</td><tr><td class='text-warning'><i class='fa fa-level-up fa-rotate-90'></i>was</td><td><small class='text-muted'>" + was + "</small>" : "") + "</td>";
            return row;
        }
        private string Lookup(ref string field, string value)
        {
            int AssetID = Statics.ParseInt(value);
            if (AssetID > 0)
            {
                switch (field.ToUpper())
                {
                    case "USERID":
                        field = "User";
                        Data.User user = master.db.Users.FirstOrDefault(o => o.AssetID == AssetID);
                        if (user != null)
                            value = user.First + " " + user.Last;
                        break;
                }
            }
            else
                value = "";
            return value;
        }


    }
}