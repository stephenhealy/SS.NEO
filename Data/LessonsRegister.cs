//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class LessonsRegister
    {
        public int AssetID { get; set; }
        public int SportID { get; set; }
        public string First { get; set; }
        public string Last { get; set; }
        public string Parent { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public int Participants { get; set; }
        public System.DateTime Submitted { get; set; }
        public System.DateTime Scheduled { get; set; }
        public int Instructor { get; set; }
        public bool Deleted { get; set; }
    }
}
