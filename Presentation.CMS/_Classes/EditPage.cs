using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Presentation.CMS
{
    public interface EditPage
    {
        object Json(bool trash);
        List<TreeItem> Tree();
        void Edit(int id);
        string Save();
        void Delete();
        int Purge(string records);
        int Restore(string records);
    }
}