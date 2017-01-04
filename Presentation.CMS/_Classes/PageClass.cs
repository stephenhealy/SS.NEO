using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Presentation.CMS
{
    public class PageClass : System.Web.UI.Page
    {
        public MasterClass master { get; set; }
        protected string Home { get; set; }

        public virtual void Initialize(string PageTitle, bool Anonymous, string BodyClass)
        {
            if (master == null)
            {
                master = (MasterClass)Master;
                master.BodyClass = BodyClass;
                master.Initialize(Anonymous);
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
    public class RepeaterClass : PageClass
    {
        public Presentation.CMS._Masters.repeat master { get; set; }

        public void Initialize(string PageTitle, bool Anonymous, string BodyClass)
        {
            if (master == null)
            {
                base.Initialize(PageTitle, Anonymous, BodyClass);
                master = (Presentation.CMS._Masters.repeat)Master;
            }
        }

        public virtual List<TreeItem> Tree()
        {
            return null;
        }
    }
}
