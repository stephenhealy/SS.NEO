using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class BrowserDirectory
    {
        public string Name;
        public string Extension;
        public DateTime CreationTimeUTC;
        public DateTime LastAccessTimeUTC;
        public DateTime LastWriteTimeUTC;
        public List<BrowserDirectory> SubDirectories;
        public List<BrowserFile> Files;
        public string Error;
    }
}
