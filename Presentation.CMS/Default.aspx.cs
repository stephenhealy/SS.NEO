using Models;
using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.CMS
{
    public partial class Default : PageClass
    {
        private int Attempts = 3;
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("Login", true, "account-bg");
            if (master.User.ID > 0)
                Redirect();
            else
            {
                CheckAccess(0);
                phLogin.Visible = true;
                txtEmail.Focus();
                Statics.EnterClick(txtEmail, btnLogin);
                Statics.EnterClick(txtPassword, btnLogin);
            }

            if (Session[Request.Path] != null)
            {
                string error = Session[Request.Path].ToString();
                if (error == "")
                    phSuccess.Visible = true;
                else
                {
                    phError.Visible = true;
                    litError.Text = error;
                }
                Session[Request.Path] = null;
            }

        }

        private void Redirect()
        {
            if (String.IsNullOrEmpty(Request.QueryString["referrer"]) == false)
                Response.Redirect(Request.QueryString["referrer"]);
            else
                Response.Redirect(master.RelativePath + "/Dashboard.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            phInvalidPassword.Visible = phInvalidCaptcha.Visible = phError.Visible = false;

            List<Data.User> Users = master.db.Users.ToList();
            if (Users.Count == 0)
            {
                // First one
                Data.User user = new User();
                user.AssetID = Models.Asset.New(master.db, master.User.ID);
                user.First = "First";
                user.Last = "Admin";
                user.Email = txtEmail.Text;
                user.Password = Encryption.Encrypt(txtPassword.Text, Encryption.PassPhrase);
                user.Super = true;
                user.Enabled = true;
                master.db.Users.Add(user);
                master.SaveChanges();
                Sessions.Set(Sessions.CMS, user.AssetID.ToString());
                Redirect();
            }
            else
            {
                bool Captcha = true;
                if (phCaptcha.Visible && Session["Captcha"] != null)
                {
                    //Match captcha text entered by user and the one stored in session
                    if (Convert.ToString(Session["Captcha"]) != txtCaptcha.Text.Trim())
                        Captcha = false;
                }

                if (Captcha == false)
                {
                    phInvalidPassword.Visible = false;
                    phCaptcha.Visible = phInvalidCaptcha.Visible = true;
                }
                else
                {
                    bool Invalid = false;
                    Data.User user = master.db.Users.FirstOrDefault(o => o.Email.Trim().ToUpper() == txtEmail.Text.Trim().ToUpper());
                    if (user != null)
                    {
                        if (user.Password == (Encryption.Encrypt(txtPassword.Text.Trim(), Encryption.PassPhrase)))
                        {
                            // Valid login
                            //login.lastlogin = login.currentlogin;
                            //login.currentlogin = Statics.DateTimeUTC();
                            //master.DB.SaveChanges();
                            Sessions.Set(Sessions.CMS, user.AssetID.ToString());
                            Redirect();
                        }
                        else
                            Invalid = true;
                    }
                    else
                        Invalid = true;

                    if (Invalid)
                    {
                        // Invalid login
                        phInvalidPassword.Visible = true;
                        CheckAccess(1);
                    }
                }
            }
        }

        private bool CheckAccess(int increment)
        {
            string IP = GetIPAddress();

            // Add one to running session total
            int count = Sessions.GetInt(IP);
            count = count + increment;
            Sessions.Set(IP, count.ToString());

            int attempts = Attempts - count;
            if (attempts != Attempts)   // not initial login
            {
                if (attempts > 0)
                {
                    // show warning
                    litAttempts.Text = attempts.ToString();
                    //UpdateCaptchaText(txtCaptcha);
                    //phCaptcha.Visible = true;
                    return false;
                }
                else
                {
                    // prevent from logging in
                    phDenied.Visible = true;
                    txtPassword.Focus();
                    btnLogin.Enabled = false;
                    btnLogin.CssClass += " disabled";
                    return true;
                }
            }
            else
            {
                return false;
            }
        }

        protected string GetIPAddress()
        {
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (!string.IsNullOrEmpty(ipAddress))
            {
                string[] addresses = ipAddress.Split(',');
                if (addresses.Length != 0)
                {
                    return addresses[0];
                }
            }

            return context.Request.ServerVariables["REMOTE_ADDR"];
        }

        protected void btnCaptcha_Click(object sender, EventArgs e)
        {
            UpdateCaptchaText(txtCaptcha);
        }

        private void UpdateCaptchaText(TextBox captcha)
        {
            captcha.Text = string.Empty;
            Session["Captcha"] = Guid.NewGuid().ToString().Substring(0, 6);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            //string LanID = Sessions.Get<string>(Sessions.LanID);
            //if (String.IsNullOrEmpty(LanID))    // Session has cleared
            //    Response.Redirect("/");

            //Match match = Regex.Match(txtNewPassword.Text, RegEx, RegexOptions.IgnoreCase);
            //if (match.Success)
            //{
            //    // Change password
            //    Models.iPasswordChange param = new Models.iPasswordChange();
            //    param.Token = ConfigurationManager.AppSettings["TOKEN_ResetPassword"];
            //    param.Username = LanID;
            //    param.Password = txtNewPassword.Text;

            //    oGenericResponse response = Collaboration.Execute(Collaboration.SerializeJSON(param), "ResetPassword");
            //    if (response.Success)
            //    {
            //        Sessions.Set(Sessions.ResetStep, 0);
            //        Session[Request.Path] = "";
            //        Response.Redirect(Request.Path);
            //    }
            //    else
            //    {
            //        Session[Request.Path] = response.Message;
            //        Response.Redirect(Request.Path);
            //    }
            //}
            //else
            //{
            //    Session[Request.Path] = "The password you entered does not meet the minimum requirements.";
            //    Response.Redirect(Request.Path);
            //}
        }


    }
}