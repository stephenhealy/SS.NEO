using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class _MasterClass : System.Web.UI.MasterPage
    {
        public _MasterClass master { get; set; }

        //public DB db { get; set; }
        public string PageTitle { get; set; }
        public string RelativePath { get; set; }
        public string BodyClass { get; set; }

        public virtual void Initialize()
        {
            if (master == null)
            {
                master = (_MasterClass)Master;
                master.Initialize();

                //db = master.db;
                PageTitle = master.PageTitle;
                RelativePath = master.RelativePath;
                BodyClass = master.BodyClass;
            }
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
                // BCC
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
                // Attachments
                if (Attachments != null)
                {
                    foreach (Attachment attachment in Attachments)
                        oMessage.Attachments.Add(attachment);
                }
                oMessage.Subject = Subject;
                oMessage.Body = Body;

                // Configure SMTP Server for Email
                SmtpClient oClient = new SmtpClient();
                if (Request.IsLocal)
                {
                    oClient.Host = "mail.sitesteam.com";
                    oClient.Credentials = new NetworkCredential("testing@sitesteam.com", "T3st1ng");
                    oClient.Port = 25;
                }
                else
                {
                    oClient.Host = "relay2t.us164.corpintra.net";
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
        //public string Anchor(string path, string anchor)
        //{
        //    if (Request.RawUrl.Substring(0, Request.RawUrl.LastIndexOf("/")) == path)
        //        return anchor;
        //    else
        //        return path + anchor;
        //}
    }
}
