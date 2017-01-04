using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web._Masters
{
    public partial class players : MasterClass
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize();
            if (!IsPostBack)
            {
                panHome.Visible = (Request.Path.EndsWith("/Players/default.aspx") == false);
                if (String.IsNullOrEmpty(Request.QueryString["error"]) == false && Session[Sessions.Error] != null && Session[Sessions.Error].ToString() != "")
                {
                    litError.Text = Session[Sessions.Error].ToString();
                    Session[Sessions.Error] = "";
                    phError.Visible = true;
                }
                else if (String.IsNullOrEmpty(Request.QueryString["save"]) == false)
                    phSave.Visible = true;

                int PlayerID = Cookies.GetInt(Sessions.PublicUser);
                Data.Player player = master.db.Players.FirstOrDefault(o => o.AssetID == PlayerID && o.Enabled && o.Deleted == false);
                if (player != null)
                {
                    phWelcome.Visible = true;
                    Username.Text = player.First + " " + player.Last;
                }
            }
        }
    }
}