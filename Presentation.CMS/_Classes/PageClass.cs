using Data;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace Presentation.CMS
{
    public class PageClass : System.Web.UI.Page
    {
        public MasterClass master { get; set; }
        protected string Home { get; set; }

        public virtual void Initialize(string PageTitle, bool Anonymous, string BodyClass)
        {
            if (master == null)
            {
                master = (MasterClass)Master;
                master.BodyClass = BodyClass;
                master.Initialize(Anonymous);
                if (String.IsNullOrWhiteSpace(master.PageTitle))
                    this.Title = PageTitle;
                else if (String.IsNullOrWhiteSpace(PageTitle))
                    this.Title = master.PageTitle;
                else
                    this.Title = master.PageTitle + " | " + PageTitle;
            }
        }
        public string AddRelative(string link)
        {
            if (String.IsNullOrWhiteSpace(master.RelativePath) == false && link.StartsWith("/"))
                link = master.RelativePath + link;
            return link;
        }

        protected WebServiceClient.BrowserDirectory GetDirectoryInfo(string _path)
        {
            Data.Key key = Models.Key.New(master.db);
            WebServiceClient.Browser oWS = new WebServiceClient.Browser();
            oWS.Url = master.WebServiceURL;
            WebServiceClient.BrowserDirectory oDirInfo = oWS.GetDirectory(key.id, key.val, _path);
            return oDirInfo;
        }
        protected void LoadDirectory(string _path, WebServiceClient.BrowserDirectory oDirInfo, TreeView _tree, TreeNode _parent, bool Directories)
        {
            if (oDirInfo == null)
            {
                DirectoryInfo _directory = new DirectoryInfo(Server.MapPath(_path));
                if (_path != "/")
                    _path += "/";
                DirectoryInfo[] _dirs = _directory.GetDirectories();
                foreach (DirectoryInfo _dir in _dirs)
                {
                    TreeNode oNode = new TreeNode(_dir.Name, _dir.Name, master.ImagePath);
                    if (String.IsNullOrEmpty(Request.QueryString["dir"]) == true)
                        oNode.SelectAction = TreeNodeSelectAction.Expand;
                    else
                        oNode.NavigateUrl = _path + _dir.Name;
                    if (_parent == null)
                        _tree.Nodes.Add(oNode);
                    else
                        _parent.ChildNodes.Add(oNode);
                    LoadDirectory(_path + _dir.Name, oDirInfo, _tree, oNode, Directories);
                }
                if (String.IsNullOrEmpty(Request.QueryString["dir"]) == true)
                {
                    FileInfo[] _files = _directory.GetFiles();
                    foreach (FileInfo _file in _files)
                    {
                        if (_parent == null)
                            _tree.Nodes.Add(new TreeNode(_file.Name, _file.Name, "", _path + _file.Name, ""));
                        else
                            _parent.ChildNodes.Add(new TreeNode(_file.Name, _file.Name, "", _path + _file.Name, ""));
                    }
                }
            }
            else
            {
                if (String.IsNullOrEmpty(oDirInfo.Error))
                    LoadDirectory(oDirInfo, _path, _tree, _parent, Directories);
                else
                    Response.Write(oDirInfo.Error);
            }
            _tree.CollapseAll();
        }
        private void LoadDirectory(WebServiceClient.BrowserDirectory dir, string _path, TreeView _tree, TreeNode _parent, bool Directories)
        {
            if (_path != "/")
                _path += "/";
            if (Directories)
            {
                foreach (WebServiceClient.BrowserDirectory _dir in dir.SubDirectories)
                {
                    TreeNode oNode = new TreeNode(_dir.Name, _dir.Name, master.ImagePath);
                    if (String.IsNullOrEmpty(Request.QueryString["dir"]) == true)
                    {
                        oNode.SelectAction = TreeNodeSelectAction.SelectExpand;
                        oNode.NavigateUrl = master.WebSiteURL + _path + _dir.Name;
                    }
                    if (_parent == null)
                        _tree.Nodes.Add(oNode);
                    else
                        _parent.ChildNodes.Add(oNode);
                    LoadDirectory(_dir, _path + _dir.Name, _tree, oNode, Directories);
                }
            }
            else
            {
                foreach (WebServiceClient.BrowserDirectory _dir in dir.SubDirectories)
                {
                    TreeNode oNode = new TreeNode(_dir.Name, _dir.Name, master.ImagePath);
                    if (String.IsNullOrEmpty(Request.QueryString["dir"]) == true)
                        oNode.SelectAction = TreeNodeSelectAction.Expand;
                    else
                        oNode.NavigateUrl = master.WebSiteURL + _path + _dir.Name;
                    if (_parent == null)
                        _tree.Nodes.Add(oNode);
                    else
                        _parent.ChildNodes.Add(oNode);
                    LoadDirectory(_dir, _path + _dir.Name, _tree, oNode, Directories);
                }
                foreach (WebServiceClient.BrowserFile _file in dir.Files)
                {
                    //string strExtension = _file.Extension.Substring(1).ToUpper();
                    //string strExtensionText = strExtension + " File";
                    //double dblSize = Math.Round(_file.Length / 1024.00);
                    //string strSize = dblSize.ToString("0") + " KB";
                    //string strIcon = _path + "/" + _file.Name;
                    if (_parent == null)
                        _tree.Nodes.Add(new TreeNode(_file.Name, _file.Name, "", master.WebSiteURL + _path + _file.Name, ""));
                    else
                        _parent.ChildNodes.Add(new TreeNode(_file.Name, _file.Name, "", master.WebSiteURL + _path + _file.Name, ""));
                }
            }
        }
    }
    public class RepeaterClass : PageClass
    {
        public Presentation.CMS._Masters.repeat master { get; set; }

        public void Initialize(string PageTitle, bool Anonymous, string BodyClass)
        {
            if (master == null)
            {
                base.Initialize(PageTitle, Anonymous, BodyClass);
                master = (Presentation.CMS._Masters.repeat)Master;
            }
        }

        public virtual List<TreeItem> Tree()
        {
            return null;
        }
    }
}
