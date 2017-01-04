using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class HistoryList
    {
        public int LogID { get; set; }
        public int AssetID { get; set; }
        public string Avatar { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public IEnumerable<LogDetail> Details { get; set; }
    }
}
