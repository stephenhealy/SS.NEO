using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web.Players
{
    public partial class Default : PlayerPageClass
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            Initialize(false);

            if (!IsPostBack)
            {
                if (String.IsNullOrEmpty(Request.QueryString["invalid"]) == false)
                    phInvalid.Visible = true;
                if (String.IsNullOrEmpty(Request.QueryString["forgot"]) == false)
                {
                    phForgot.Visible = true;
                    litForgot.Text = Statics.decryptQueryString(Request.QueryString["forgot"]);
                }

                if (PlayerID == 0)
                    panLogin.Visible = true;
                else
                    phLoggedIn.Visible = true;

                Statics.EnterClick(txtPassword, btnLogin);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            bool Invalid = false;
            Data.Player Player = master.db.Players.FirstOrDefault(o => o.Email.Trim().ToUpper() == txtEmail.Text.Trim().ToUpper() && o.Enabled && o.Deleted == false);
            if (Player != null)
            {
                if (Player.Password == (Encryption.Encrypt(txtPassword.Text.Trim(), Encryption.PassPhrase)))
                {
                    Cookies.Set(Sessions.PublicUser, Player.AssetID.ToString());
                    Response.Redirect(Request.Path);
                }
                else
                    Invalid = true;
            }
            else
                Invalid = true;

            if (Invalid)
            {
                // Invalid login
                Response.Redirect(Request.Path + "?invalid=true");
            }
        }

    }
}