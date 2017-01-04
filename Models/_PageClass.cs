using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class _PageClass : System.Web.UI.Page
    {
        public _MasterClass master { get; set; }
        protected string Home { get; set; }

        protected virtual void Page_Load(object sender, EventArgs e)
        {
            Initialize("");
        }
        public virtual void Initialize(string PageTitle)
        {
            if (master == null)
            {
                master = (_MasterClass)Master;
                master.Initialize();
                if (String.IsNullOrWhiteSpace(master.PageTitle))
                    this.Title = PageTitle;
                else if (String.IsNullOrWhiteSpace(PageTitle))
                    this.Title = master.PageTitle;
                else
                    this.Title = master.PageTitle + " | " + PageTitle;
            }
        }
        public string AddRelative(string link)
        {
            if (String.IsNullOrWhiteSpace(master.RelativePath) == false && link.StartsWith("/"))
                link = master.RelativePath + link;
            return link;
        }
    }
}
