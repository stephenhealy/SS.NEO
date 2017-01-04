using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web.Players.Password
{
    public partial class Default : PlayerPageClass
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            Initialize(true);
            Statics.EnterClick(txtChangePassword2, btnChange);
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                if (player.Password == (Encryption.Encrypt(txtChangePassword.Text.Trim(), Encryption.PassPhrase)))
                {
                    player.Password = Encryption.Encrypt(txtChangePassword1.Text.Trim(), Encryption.PassPhrase);
                    Save(master.RelativePath + "/Players/Password/");
                }
                else
                    Error("The password did not match. Try again...");
            }
            else
                Error("There was a problem submitting your information. Please try again...");
        }

    }
}