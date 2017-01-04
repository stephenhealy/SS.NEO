﻿using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web.Company.Testimonials
{
    public partial class Default : PageClass
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            Initialize();

            if (!IsPostBack)
            {
                rptTestimonials.DataSource = master.db.Testimonials.Where(o => o.Enabled && o.Deleted == false).OrderBy(o => o.Display).ToList();
                rptTestimonials.DataBind();
            }
        }
    }
}