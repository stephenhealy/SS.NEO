using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class AdminList
    {
        public int AssetID { get; set; }
        public string Name { get; set; }
        public string Parent { get; set; }
        public int ParentID { get; set; }
        public int Display { get; set; }
        public bool Enabled { get; set; }
        public bool Deleted { get; set; }
        public string ModifiedBy { get; set; }
        public DateTime ModifiedOn { get; set; }
        public DateTime Date { get; set; }
        public IEnumerable<AdminList> Children { get; set; }
    }
}
