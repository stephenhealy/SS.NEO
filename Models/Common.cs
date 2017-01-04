using Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Models
{
    public class Common
    {
        public const string ReplaceValue = "%value%";
        private StringBuilder body { get; set; }
        private int intSpacerWidth = 15;
        private bool IsHtml { get; set; }
        private Dictionary<string, string> dictionary { get; set; }
        public Common(bool EmailIsHtml)
        {
            body = new StringBuilder();
            IsHtml = EmailIsHtml;
            dictionary = new Dictionary<string, string>();
        }

        public void CheckSession(Page Page, string SessionKey, Panel panel)
        {
            CheckSession(Page, SessionKey, panel, null, "");
        }
        public void CheckSession(Page Page, string SessionKey, Panel panel, Literal literal)
        {
            CheckSession(Page, SessionKey, panel, literal, "");
        }
        public void CheckSession(Page Page, string SessionKey, Panel panel, Literal literal, string Message)
        {
            string value = Sessions.Get(SessionKey);
            if (String.IsNullOrWhiteSpace(value) == false)
            {
                panel.Visible = true;
                if (literal != null)
                {
                    if (String.IsNullOrEmpty(Message) == false)
                    {
                        while (Message.Contains(ReplaceValue))
                            Message = Message.Replace(ReplaceValue, value);
                        literal.Text = Message;
                    }
                    else
                        literal.Text = value;
                }
                Sessions.Set(SessionKey, "");
            }
        }
        public void RegisterStartupScript(Page page, string text)
        {
            page.ClientScript.RegisterStartupScript(page.GetType(), DateTime.Now.ToFileTimeUtc().ToString(), text, true);
        }


        public void DataBindDDL(ListControl ddl, string _text_field, string _data_field, object _source)
        {
            DataBindDDL(ddl, _text_field, _data_field, _source, null, false);
        }
        public void DataBindDDL(ListControl ddl, string _text_field, string _data_field, object _source, string _0_text)
        {
            DataBindDDL(ddl, _text_field, _data_field, _source, _0_text, false);
        }
        public void DataBindDDL(ListControl ddl, string _text_field, string _data_field, object _source, string _0_text, bool _select_if_one)
        {
            if (string.IsNullOrEmpty(_text_field) == false)
                ddl.DataTextField = _text_field;
            if (string.IsNullOrEmpty(_data_field) == false)
                ddl.DataValueField = _data_field;
            ddl.DataSource = _source;
            ddl.DataBind();
            if (_0_text != null)
            {
                if (_0_text != "")
                    ddl.Items.Insert(0, new ListItem(_0_text, "0"));
            }
            else
                ddl.Items.Insert(0, new ListItem("-- select --", "0"));
            if (_select_if_one && (_0_text == null || _0_text != "") && ddl.Items.Count == 2) // set the only one to selected by default
                ddl.SelectedIndex = 1;
        }

        public string SendEmail(string From, string To, string Cc, string Bcc, string Subject)
        {
            return SendEmail(From, To, Cc, Bcc, null, Subject, body.ToString());
        }
        public string SendEmail(string From, string To, string Cc, string Bcc, List<Attachment> Attachments, string Subject)
        {
            return SendEmail(From, To, Cc, Bcc, Attachments, Subject, body.ToString());
        }
        public string SendEmail(string From, string To, string Cc, string Bcc, string Subject, string Body)
        {
            return SendEmail(From, To, Cc, Bcc, null, Subject, Body);
        }
        public string SendEmail(string From, string To, string Cc, string Bcc, List<Attachment> Attachments, string Subject, string Body)
        {
            string Error = "";
            try
            {
                MailMessage oMessage = new MailMessage();
                char[] strEmailSplit = { ';' };

                // FROM
                MailAddress oAddress = new MailAddress(From);
                oMessage.From = oAddress;
                // TO
                string[] strEmailTO = To.Split(strEmailSplit);
                for (int ii = 0; ii < strEmailTO.Length; ii++)
                {
                    if (strEmailTO[ii].Trim() != "")
                    {
                        string strAddress = strEmailTO[ii];
                        if (strAddress != "")
                        {
                            oAddress = new MailAddress(strAddress);
                            oMessage.To.Add(oAddress);
                        }
                    }
                }
                // CC
                if (Cc != null)
                {
                    string[] strEmailCC = Cc.Split(strEmailSplit);
                    for (int ii = 0; ii < strEmailCC.Length; ii++)
                    {
                        if (strEmailCC[ii].Trim() != "")
                        {
                            string strAddress = strEmailCC[ii];
                            if (strAddress != "")
                            {
                                oAddress = new MailAddress(strAddress);
                                oMessage.CC.Add(oAddress);
                            }
                        }
                    }
                }
                // BCC
                if (Bcc != null)
                {
                    string[] strEmailBCC = Bcc.Split(strEmailSplit);
                    for (int ii = 0; ii < strEmailBCC.Length; ii++)
                    {
                        if (strEmailBCC[ii].Trim() != "")
                        {
                            string strAddress = strEmailBCC[ii];
                            if (strAddress != "")
                            {
                                oAddress = new MailAddress(strAddress);
                                oMessage.Bcc.Add(oAddress);
                            }
                        }
                    }
                }
                // Attachments
                if (Attachments != null)
                {
                    foreach (Attachment attachment in Attachments)
                        oMessage.Attachments.Add(attachment);
                }
                oMessage.Subject = Subject;
                StringBuilder strBody = new StringBuilder();
                if (IsHtml == true)
                {
                    oMessage.IsBodyHtml = true;
                    strBody.Append("<html><body><font style='" + DefaultFontStyle() + "'>");
                    strBody.Append("<p>");
                    strBody.Append(Body);
                    strBody.Append("</p>");
                    strBody.Append("</font></body></html>");
                }
                else
                    strBody.Append(Body);
                oMessage.Body = strBody.ToString();

                // Configure SMTP Server for Email
                SmtpClient oClient = new SmtpClient();
                if (HttpContext.Current.Request.IsLocal)
                {
                    oClient.Host = "mail.sitesteam.com";
                    oClient.Credentials = new NetworkCredential("testing@sitesteam.com", "T3st1ng");
                    oClient.Port = 25;
                }
                else
                {
                    oClient.Host = "uk.scriptmail.yourwebservers.com";
                    oClient.Credentials = new NetworkCredential("neosportsplant.com@script.mail", "E?g7q9_T");
                    oClient.Port = 25;
                }

                // Send Email
                oClient.Send(oMessage);
            }
            catch (Exception ex)
            {
                while (ex.InnerException != null)
                    ex = ex.InnerException;
                Error = ex.Message;
            }
            return Error;
        }

        public void AppendBody(string _line)
        {
            AppendBody("", _line, false);
        }
        public void AppendBody(string _label, string _data, bool _highlight)
        {
            string strRowStart = (IsHtml ? "<tr>" : "");
            string strColumnStart = (IsHtml ? (_data == "" ? "<td colspan=\"2\">" : "<td>") : "");
            StringBuilder strSpacer = new StringBuilder();
            if (IsHtml == false)
            {
                int intSpacer = intSpacerWidth - _label.Length;
                for (int ii = 0; ii < intSpacer; ii++)
                    strSpacer.Append(" ");
            }
            string strColumnSpacer = (IsHtml && _data != "" ? "</td><td>" : strSpacer.ToString());
            string strColumnEnd = (IsHtml ? "</td>" : "");
            string strRowEnd = (IsHtml ? "</tr>" : Environment.NewLine);

            if (_highlight)
            {
                if (IsHtml)
                    _data = "<B>" + _data.ToUpper() + "</B>";
                else
                    _data = _data.ToUpper();
            }
            if (IsHtml && _label == "")
                _label = "&nbsp;";
            if (IsHtml && _label.ToUpper().StartsWith("HTTP"))
                _label = "<A HREF=\"" + _label + "\" TARGET=\"_BLANK\">" + _label + "</A>";

            body.Append(strRowStart);
            body.Append(strColumnStart);
            body.Append(_label);
            body.Append(strColumnSpacer);
            body.Append(_data);
            body.Append(strColumnEnd);
            body.Append(strRowEnd);
        }
        public string DefaultFontStyle()
        {
            return "font-family: Arial, Helvetica, sans-serif; font-size:12px; color:#222222";
        }

        private void LoadDictionary()
        {
            if (dictionary.Count == 0)
            {
                dictionary.Add(LoggingKeys.Advertisements, "Name");
                dictionary.Add(LoggingKeys.Bocce, "Message");
                dictionary.Add(LoggingKeys.Carousel, "Title");
                dictionary.Add(LoggingKeys.Clinics, "Name");
                dictionary.Add(LoggingKeys.EventRegistration, "First|Last");
                dictionary.Add(LoggingKeys.Events, "Title");
                dictionary.Add(LoggingKeys.Leagues, "Name");
                dictionary.Add(LoggingKeys.Lessons, "Name");
                dictionary.Add(LoggingKeys.LessonsRegister, "First|Last");
                dictionary.Add(LoggingKeys.News, "Title");
                dictionary.Add(LoggingKeys.PhotoCategories, "Name");
                dictionary.Add(LoggingKeys.PhotoAlbums, "Name");
                dictionary.Add(LoggingKeys.Photos, "Title");
                dictionary.Add(LoggingKeys.Positions, "Name");
                dictionary.Add(LoggingKeys.Sessions, "Name");
                dictionary.Add(LoggingKeys.Sponsors, "Name");
                dictionary.Add(LoggingKeys.Sports, "Name");
                dictionary.Add(LoggingKeys.SubscriptionTypes, "Name");
                dictionary.Add(LoggingKeys.Testimonials, "Name");
                dictionary.Add(LoggingKeys.Tournaments, "Name");
                dictionary.Add(LoggingKeys.Users, "First|Last");
            }
        }

        public string ExecuteSelect(DbContext context, string table, string id)
        {
            if (table.ToUpper() == "SETTINGS")
                return "A Setting";
            else
            {
                LoadDictionary();
                string value = "Unknown";
                string name = dictionary[table];
                while (name.Contains("|"))
                    name = name.Replace("|", " + ' ' + ");
                var results = context.Database.SqlQuery<string>("SELECT " + name + " AS name FROM " + table + " WHERE AssetID = " + id).ToList();
                if (results.Count == 1)
                    return results[0];
                else
                    return value;
            }
        }

    }
}
