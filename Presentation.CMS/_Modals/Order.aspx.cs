using Models;
using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.Serialization;

namespace Presentation.CMS._Modals
{
    public class IDs
    {
        public int id { get; set; }
    }
    public partial class Order : PageClass
    {
        protected int AssetID = 0;
        protected string Key = "";
        protected int Parent = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("", true, "");

            master.Common.CheckSession(Page, Sessions.Saved, panSaved);

            if (String.IsNullOrEmpty(Request.QueryString["i"]) == false)
                AssetID = Statics.ParseInt(Request.QueryString["i"]);
            if (String.IsNullOrEmpty(Request.QueryString["k"]) == false)
                Key = Request.QueryString["k"];
            if (String.IsNullOrEmpty(Request.QueryString["p"]) == false)
                Parent = Statics.ParseInt(Request.QueryString["p"]);

            if (!IsPostBack)
                BindData();
        }

        public void BindData()
        {
            if (Key == LoggingKeys.Carousel)
                lstOrder.DataSource = master.Selector.Carousel(false);
            else if (Key == LoggingKeys.Sports)
                lstOrder.DataSource = master.Selector.Sport(false);
            else if (Key == LoggingKeys.News)
                lstOrder.DataSource = master.Selector.News(false);
            else if (Key == LoggingKeys.Lessons)
                lstOrder.DataSource = master.Selector.Lesson(Parent, false);
            else if (Key == LoggingKeys.PhotoCategories)
                lstOrder.DataSource = master.Selector.PhotoCategory(false);
            else if (Key == LoggingKeys.PhotoAlbums)
                lstOrder.DataSource = master.Selector.PhotoAlbum(Parent, false);
            else if (Key == LoggingKeys.Photos)
                lstOrder.DataSource = master.Selector.Photo(Parent, false);
            else if (Key == LoggingKeys.Sponsors)
                lstOrder.DataSource = master.Selector.Sponsor(false);

            lstOrder.DataBind();

        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.PathAndQuery);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Request.Form[hdnOrder.UniqueID]) == false)
            {
                List<IDs> ids = Models.Output.DeserializeJSON<List<IDs>>(Request.Form[hdnOrder.UniqueID]);
                for (int ii = 1; ii <= ids.Count; ii++)
                {
                    int AssetID = ids[ii - 1].id;
                    if (Key == LoggingKeys.Carousel)
                        master.db.Carousels.FirstOrDefault(o => o.AssetID == AssetID).Display = ii;
                    else if (Key == LoggingKeys.Sports)
                        master.db.Sports.FirstOrDefault(o => o.AssetID == AssetID).Display = ii;
                    else if (Key == LoggingKeys.News)
                        master.db.News.FirstOrDefault(o => o.AssetID == AssetID).Display = ii;
                    else if (Key == LoggingKeys.Lessons)
                        master.db.Lessons.FirstOrDefault(o => o.AssetID == AssetID).Display = ii;
                    else if (Key == LoggingKeys.PhotoCategories)
                        master.db.PhotoCategories.FirstOrDefault(o => o.AssetID == AssetID).Display = ii;
                    else if (Key == LoggingKeys.PhotoAlbums)
                        master.db.PhotoAlbums.FirstOrDefault(o => o.AssetID == AssetID).Display = ii;
                    else if (Key == LoggingKeys.Photos)
                        master.db.Photos.FirstOrDefault(o => o.AssetID == AssetID).Display = ii;
                    else if (Key == LoggingKeys.Sponsors)
                        master.db.Sponsors.FirstOrDefault(o => o.AssetID == AssetID).Display = ii;
                }
            }
            if (master.SaveChanges())
                master.Common.RegisterStartupScript(Page, "window.top.HideModalRefresh('myModal');");
        }

    }
}