using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class BrowserFile
    {
        public string Name;
        public string Extension;
        public long Length;
        public bool ReadOnly;
        public DateTime CreationTimeUTC;
        public DateTime LastAccessTimeUTC;
        public DateTime LastWriteTimeUTC;
    }
}
