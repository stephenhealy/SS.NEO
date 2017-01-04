using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web.Gallery
{
    public partial class Default : PageClass
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            Initialize();

            if (!IsPostBack)
            {
                rptCategories.DataSource = master.db.PhotoCategories.Where(o => o.Enabled && o.Deleted == false).OrderBy(o => o.Display).ToList();
                rptCategories.DataBind();
            }
        }

        protected void rptCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            RepeaterItem item = (RepeaterItem)e.Item;
            if (item.ItemType != ListItemType.Footer && item.ItemType != ListItemType.Header
                 && item.ItemType != ListItemType.Pager && item.ItemType != ListItemType.Separator)
            {
                Data.PhotoCategory parent = (Data.PhotoCategory)item.DataItem;
                ListView lstAlbums = (ListView)item.FindControl("lstAlbums");
                Label lblAlbums = (Label)item.FindControl("lblAlbums");
                if (lstAlbums != null && lblAlbums != null)
                {
                    lstAlbums.DataSource = master.db.PhotoAlbums.Where(o => o.CategoryID == parent.AssetID && o.Enabled && o.Deleted == false).OrderBy(o => o.Display).ToList();
                    lstAlbums.DataBind();
                    lblAlbums.Text = "(" + lstAlbums.Items.Count.ToString() + ")";
                }
            }
        }

        protected void lstAlbums_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            ListViewItem item = (ListViewItem)e.Item;
            if (item.ItemType != ListViewItemType.EmptyItem && item.ItemType != ListViewItemType.InsertItem)
            {
                Data.PhotoAlbum parent = (Data.PhotoAlbum)item.DataItem;
                Repeater rptPhotos = (Repeater)item.FindControl("rptPhotos");
                List<Data.Photo> photos = master.db.Photos.Where(o => o.AlbumID == parent.AssetID && o.Enabled && o.Deleted == false).OrderBy(o => o.Display).ToList();
                HyperLink lnkFirst = (HyperLink)item.FindControl("lnkFirst");
                lnkFirst.Attributes.Add("onclick", "return false;");
                Image imgFirst = (Image)item.FindControl("imgFirst");
                Label lblPhotos = (Label)item.FindControl("lblPhotos");
                Data.Photo photo = photos.FirstOrDefault();
                if (photo != null && lnkFirst != null && imgFirst != null && lblPhotos != null)
                {
                    lnkFirst.NavigateUrl = imgFirst.ImageUrl = photos.FirstOrDefault().Image;
                    lnkFirst.ToolTip = imgFirst.AlternateText = photos.FirstOrDefault().Caption;
                    //rptPhotos.DataSource = photos.Skip(1);
                    rptPhotos.DataSource = photos;
                    rptPhotos.DataBind();
                    if (photos.Count == 1)
                        lblPhotos.Text = "1 Photo";
                    else
                        lblPhotos.Text = photos.Count.ToString() + " Photos";
                }
                else if (lnkFirst != null && imgFirst != null)
                {
                    lnkFirst.Visible = false;
                    imgFirst.Visible = false;
                }
            }
        }
    }
}