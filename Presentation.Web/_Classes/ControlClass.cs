using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Presentation.Web
{
    public class ControlClass : System.Web.UI.UserControl
    {
        public string ConfigID { get; set; }
        public int SportID { get; set; }
        public PageClass page { get; set; }
        public virtual void Initialize()
        {
            if (page == null)
            {
                page = (PageClass)Page;
                page.Initialize();
            }
        }
    }
    public class LessonControl : ControlClass
    {
        public string Header { get; set; }
        public string Body { get; set; }
        public string Label { get; set; }
        public string EmailTo { get; set; }
        public string EmailCc { get; set; }
        public string EmailBcc { get; set; }
    }
    public class TournamentControl : ControlClass
    {
        public string Sport { get; set; }
    }
    public class ClinicControl : ControlClass
    {
        public string Sport { get; set; }
    }
    public class SidebarControl : ControlClass
    {
        public string Sport { get; set; }
        public bool Vertical { get; set; }
    }
    public class LeagueControl : TournamentControl
    {
        public string Header { get; set; }
        public string Body { get; set; }
    }
}