using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Presentation.Web
{
    public class PageClass : System.Web.UI.Page
    {
        public MasterClass master { get; set; }
        protected string Home { get; set; }

        protected virtual void Page_Load(object sender, EventArgs e)
        {
            Initialize();
        }
        public virtual void Initialize()
        {
            if (master == null)
            {
                master = (MasterClass)Master;
                master.Initialize();
            }
        }
    }
}