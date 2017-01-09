using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web
{
    public partial class Default : PageClass
    {
        protected int Indicator = 0;
        protected override void Page_Load(object sender, EventArgs e)
        {
            Initialize();

            List<Data.Carousel> Carousels = master.db.Carousels.Where(o => o.Enabled && o.Deleted == false).OrderBy(o => o.Display).ToList();
            for (int ii = 0; ii < Carousels.Count; ii++)
                Carousels[ii].AssetID = ii;
            rptCarousel.DataSource = rptCarouselIndicators.DataSource = Carousels;
            rptCarousel.DataBind();
            rptCarouselIndicators.DataBind();

            rptNews.DataSource = master.db.News.Where(o => o.Enabled && o.Deleted == false).OrderBy(o => o.Display).ToList();
            rptNews.DataBind();

            Data.Sponsor featured = master.db.Sponsors.FirstOrDefault(o => o.Featured && o.Enabled && o.Deleted == false);
            if (featured != null)
            {
                phFeatured.Visible = true;
                imgFeatured.AlternateText = imgFeatured.ToolTip = hypFeatured.ToolTip = featured.Name;
                imgFeatured.ImageUrl = master.RelativePath + featured.Advertisement;
                hypFeatured.NavigateUrl = master.RelativePath + "/Sponsor.aspx?f=" + Statics.encryptQueryString(featured.AssetID.ToString());
            }
        }
    }
}