using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web.Players.Forgot
{
    public partial class Default : PlayerPageClass
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            Initialize(false);
            Statics.EnterClick(txtForgot, btnForgot);
        }

        protected void btnForgot_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                Data.Setting item = master.db.Settings.FirstOrDefault();
                if (item != null)
                {
                    string strForgot = txtForgot.Text;
                    Data.Player player = master.db.Players.FirstOrDefault(o => o.Email.Trim().ToUpper() == strForgot.Trim().ToUpper());
                    if (player != null)
                    {
                        string password = Statics.Random(10, true);
                        player.Password = Encryption.Encrypt(password, Encryption.PassPhrase);
                        master.Common.AppendBody("Here is your new password:");
                        master.Common.AppendBody(password);

                        Models.EventLog.Add(master.db, EventLog.Forgot, "Sending Player's Connection Password To [" + strForgot + "]");
                        try
                        {
                            string error = master.Common.SendEmail(item.EmailFrom, strForgot, "", "", "Player's Connection Password");
                            if (String.IsNullOrEmpty(error) == false)
                                Models.EventLog.Add(master.db, EventLog.Forgot, error, true, false);
                            else
                                Models.EventLog.Add(master.db, EventLog.Forgot, "Player's Connection Password Sent.");
                        }
                        catch (Exception ex)
                        {
                            string error = ex.Message;
                            while (ex.InnerException != null)
                            {
                                error += " ~ " + ex.InnerException.Message;
                                ex = ex.InnerException;
                            }
                            Models.EventLog.Add(master.db, EventLog.Forgot, error, true, false);
                        }
                    }
                    Save(master.RelativePath + "/Players/?forgot=" + Statics.encryptQueryString(strForgot));
                }
                else
                    Error("This system is not setup for email. Please try back later...");
            }
            else
                Error("There was a problem submitting your information. Please try again...");
        }

    }
}