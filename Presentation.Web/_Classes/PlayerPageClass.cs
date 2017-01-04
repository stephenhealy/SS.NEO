using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Presentation.Web
{
    public class PlayerPageClass : PageClass
    {
        protected int PlayerID { get; set; }
        protected Data.Player player { get; set; }

        protected virtual void Page_Load(object sender, EventArgs e)
        {
            Initialize(true);
        }
        public virtual void Initialize(bool Restricted)
        {
            if (master == null)
            {
                master = (MasterClass)Master;
                master.Initialize();

                PlayerID = Cookies.GetInt(Sessions.PublicUser);
                player = master.db.Players.Find(PlayerID);
                if (player == null && Restricted)
                    Response.Redirect(master.RelativePath + "/Players");
            }
        }
        public void Save()
        {
            Save(Request.Path);
        }
        public void Save(string Redirect)
        {
            List<string> errors = master.db.SaveChanges();
            if (errors.Count > 0)
                Error(string.Join("<br/>", errors.ToArray()));
            else if (Redirect.Contains("?"))
                Response.Redirect(Redirect);
            else
                Response.Redirect(Redirect + "?save=true");
        }
        public void Error(string Message)
        {
            Session[Sessions.Error] = Message;
            Response.Redirect(Request.Path + "?error=true");
        }
    }
}