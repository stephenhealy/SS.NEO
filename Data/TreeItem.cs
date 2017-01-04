using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class TreeItem
    {
        public int AssetID { get; set; }
        public string Name { get; set; }
        public int Count { get; set; }
        public List<TreeItem> Children { get; set; }
    }
}
