using Data;
using Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web._Controls
{
    public partial class Advertisement : ControlClass
    {
        private class AdvertisementCalc
        {
            public int ID { get; set; }
            public int Difference { get; set; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize();
            if (!IsPostBack)
            {
                List<Data.Advertisement> advertisements = page.master.db.Advertisements.Where(o => o.Enabled && o.Deleted == false).ToList();
                // get total frequency
                int TotalFrequency = advertisements.Sum(o => o.Frequency);
                // get total number of times the ads have been clicked (for actual percentage calculation)
                int TotalTimes = advertisements.Sum(o => o.Times);

                // loop through each one calculating actual display percentages
                List<AdvertisementCalc> calculations = new List<AdvertisementCalc>();
                foreach (Data.Advertisement advertisement in advertisements)
                {
                    AdvertisementCalc calculation = new AdvertisementCalc();
                    calculation.ID = advertisement.AssetID;
                    // get the desired percentage of frequency compared with other frequencies
                    int CalculatedPercent = Percentage(advertisement.Frequency, TotalFrequency);
                    // get the actual percentage of times the ad has been shown
                    int ActualPercent = Percentage(advertisement.Times, TotalTimes);
                    // calculate difference (lowest is least used - negative means it is not reaching desired frequency)
                    calculation.Difference = (ActualPercent - CalculatedPercent);
                    calculations.Add(calculation);
                }

                int ID = calculations.OrderBy(o => o.Difference).FirstOrDefault().ID;
                Data.Advertisement first = advertisements.FirstOrDefault(o => o.AssetID == ID);
                if (first != null)
                {

                    litHeading.Text = first.Heading;
                    litMessage.Text = first.Message;
                    litAbove.Text = first.Above;
                    hypLink.Text = first.Label;
                    hypLink.NavigateUrl = page.master.RelativePath + "/Ad.aspx?i=" + Statics.encryptQueryString(first.AssetID.ToString());

                    // update total times shown (will never reset)
                    first.Total = first.Total + 1;
                    // update revolving times shown (will reset when a change is made to any advertisement from CMS)
                    first.Times = first.Times + 1;
                    first.Last = Statics.DateTimeUTC();
                    page.master.db.SaveChanges();
                }
            }
        }
        private static int Percentage(int int1, int int2)
        {
            double dbl1 = Statics.ParseDouble(int1.ToString("0"));
            double dbl2 = Statics.ParseDouble(int2.ToString("0"));
            double ceiling = Math.Ceiling((dbl1 / dbl2) * 100);
            return Statics.ParseInt(ceiling.ToString("0"));
        }
    }
}