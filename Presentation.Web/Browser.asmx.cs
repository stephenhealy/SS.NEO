using Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Presentation.Web
{
    /// <summary>
    /// Summary description for Browser
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Browser : System.Web.Services.WebService
    {

        [WebMethod]
        public string Version()
        {
            return "10.2";
        }




        #region DIRECTORIES
        [WebMethod]
        public string AddDirectory(int _wid, string _wval, string _site_relative_dir, string _name)
        {
            string WebServiceURL = ConfigurationManager.AppSettings["WebServiceURL"];
            if (String.IsNullOrEmpty(WebServiceURL) == false)
            {
                WebServiceCMS.Browser oWservice = new WebServiceCMS.Browser();
                oWservice.Url = WebServiceURL;
                if (oWservice.ValidKey(_wid, _wval))
                {
                    _site_relative_dir = Path(_site_relative_dir, true);
                    if (Directory.Exists(_site_relative_dir + _name))
                        return "A directory with the name you specified already exists (Directory Name: " + _name + ")";
                    else
                    {
                        try
                        {
                            Directory.CreateDirectory(_site_relative_dir + _name);
                            return "";
                        }
                        catch (Exception ex)
                        {
                            return "There was a problem creating the directory (Error Message: " + ex.Message + ")";
                        }
                    }
                }
                else
                    return "Access Denied";
            }
            else
                return "Your settings have been corrupted";
        }
        [WebMethod]
        public string RenameDirectoryName(int _wid, string _wval, string _site_relative_dir, string _name_old, string _name_new)
        {
            string WebServiceURL = ConfigurationManager.AppSettings["WebServiceURL"];
            if (String.IsNullOrEmpty(WebServiceURL) == false)
            {
                WebServiceCMS.Browser oWservice = new WebServiceCMS.Browser();
                oWservice.Url = WebServiceURL;
                if (oWservice.ValidKey(_wid, _wval))
                {
                    _site_relative_dir = Path(_site_relative_dir, true);
                    if (Directory.Exists(_site_relative_dir + _name_old) == false)
                        return "A directory with the name you specified does not exist (Directory Name: " + _name_old + ")";
                    else if (Directory.Exists(_site_relative_dir + _name_new))
                        return "A directory with the name you specified already exists (Directory Name: " + _name_new + ")";
                    else
                    {
                        try
                        {
                            Directory.Move(_site_relative_dir + _name_old, _site_relative_dir + _name_new);
                            return "";
                        }
                        catch (Exception ex)
                        {
                            return "There was a problem renaming the directory (Error Message: " + ex.Message + ")";
                        }
                    }
                }
                else
                    return "Access Denied";
            }
            else
                return "Your settings have been corrupted";
        }
        [WebMethod]
        public string RenameDirectory(int _wid, string _wval, string _site_relative_dir, string _name_new)
        {
            string WebServiceURL = ConfigurationManager.AppSettings["WebServiceURL"];
            if (String.IsNullOrEmpty(WebServiceURL) == false)
            {
                WebServiceCMS.Browser oWservice = new WebServiceCMS.Browser();
                oWservice.Url = WebServiceURL;
                if (oWservice.ValidKey(_wid, _wval))
                {
                    string _path = Path(_site_relative_dir, false); // skip the last \\ since we'll be looking for that later
                    if (Directory.Exists(_path) == false)
                        return "A directory with the name you specified does not exist (Directory Name: " + _site_relative_dir + ")";
                    else
                    {
                        string _parent_dir = _path.Substring(0, _path.LastIndexOf("\\") + 1);
                        if (Directory.Exists(_parent_dir + _name_new))
                            return "A directory with the name you specified already exists (Directory Name: " + _name_new + ")";
                        else
                        {
                            try
                            {
                                Directory.Move(_path, _parent_dir + _name_new);
                                return "";
                            }
                            catch (Exception ex)
                            {
                                return "There was a problem renaming the directory (Error Message: " + ex.Message + ")";
                            }
                        }
                    }
                }
                else
                    return "Access Denied";
            }
            else
                return "Your settings have been corrupted";
        }
        [WebMethod]
        public string DeleteDirectory(int _wid, string _wval, string _site_relative_dir)
        {
            string WebServiceURL = ConfigurationManager.AppSettings["WebServiceURL"];
            if (String.IsNullOrEmpty(WebServiceURL) == false)
            {
                WebServiceCMS.Browser oWservice = new WebServiceCMS.Browser();
                oWservice.Url = WebServiceURL;
                if (oWservice.ValidKey(_wid, _wval))
                {
                    if (String.IsNullOrEmpty(_site_relative_dir) || _site_relative_dir == "/" || _site_relative_dir == "\\")
                        return "You cannot delete the root directory (Directory Name: " + _site_relative_dir + ")";
                    else
                    {
                        string _path = Path(_site_relative_dir, true);
                        if (Directory.Exists(_path) == false)
                            return "A directory with the name you specified does not exist (Directory Name: " + _site_relative_dir + ")";
                        else
                        {
                            try
                            {
                                return DeleteDirectory(new DirectoryInfo(_path));
                            }
                            catch (Exception ex)
                            {
                                return "There was a problem deleting the directory (Error Message: " + ex.Message + ")";
                            }
                        }
                    }
                }
                else
                    return "Access Denied";
            }
            else
                return "Your settings have been corrupted";
        }
        [WebMethod]
        public string DeleteDirectoryName(int _wid, string _wval, string _site_relative_dir, string _name)
        {
            string WebServiceURL = ConfigurationManager.AppSettings["WebServiceURL"];
            if (String.IsNullOrEmpty(WebServiceURL) == false)
            {
                WebServiceCMS.Browser oWservice = new WebServiceCMS.Browser();
                oWservice.Url = WebServiceURL;
                if (oWservice.ValidKey(_wid, _wval))
                {
                    _site_relative_dir = Path(_site_relative_dir, true);
                    if (Directory.Exists(_site_relative_dir + _name) == false)
                        return "A directory with the name you specified does not exist (Directory Name: " + _name + ")";
                    else
                    {
                        try
                        {
                            return DeleteDirectory(new DirectoryInfo(_site_relative_dir + _name));
                        }
                        catch (Exception ex)
                        {
                            return "There was a problem deleting the directory (Error Message: " + ex.Message + ")";
                        }
                    }
                }
                else
                    return "Access Denied";
            }
            else
                return "Your settings have been corrupted";
        }
        [WebMethod]
        public BrowserDirectory GetDirectory(int _wid, string _wval, string _site_relative_dir)
        {
            BrowserDirectory oReturn = new BrowserDirectory();
            string WebServiceURL = ConfigurationManager.AppSettings["WebServiceURL"];
            if (String.IsNullOrEmpty(WebServiceURL) == false)
            {
                WebServiceCMS.Browser oWservice = new WebServiceCMS.Browser();
                oWservice.Url = WebServiceURL;
                if (oWservice.ValidKey(_wid, _wval))
                {
                    string _path = Path(_site_relative_dir, true);
                    if (Directory.Exists(_path) == false)
                        oReturn.Error = "A directory with the name you specified does not exist (Directory Name: " + _site_relative_dir + ")";
                    else
                    {
                        try
                        {
                            oReturn = LoadDirectory(new DirectoryInfo(_path));
                        }
                        catch (Exception ex)
                        {
                            oReturn.Error = "There was a problem retrieving the directory (Error Message: " + ex.Message + ")";
                        }
                    }
                }
                else
                    oReturn.Error = "Access Denied";
            }
            else
                oReturn.Error = "Your settings have been corrupted";
            return oReturn;
        }
        private BrowserDirectory LoadDirectory(DirectoryInfo dir)
        {
            BrowserDirectory _return = new BrowserDirectory();
            _return.Name = dir.Name;
            _return.Extension = dir.Extension;
            _return.CreationTimeUTC = dir.CreationTimeUtc;
            _return.LastAccessTimeUTC = dir.LastAccessTimeUtc;
            _return.LastWriteTimeUTC = dir.LastWriteTimeUtc;

            List<BrowserDirectory> sub = new List<BrowserDirectory>();
            DirectoryInfo[] _dirs = dir.GetDirectories();
            foreach (DirectoryInfo _dir in _dirs)
                sub.Add(LoadDirectory(_dir));
            _return.SubDirectories = sub;

            List<BrowserFile> files = new List<BrowserFile>();
            FileInfo[] _files = dir.GetFiles();
            foreach (FileInfo _file in _files)
            {
                BrowserFile ss_file = new BrowserFile();
                ss_file.Name = _file.Name;
                ss_file.Extension = _file.Extension;
                ss_file.Length = _file.Length;
                ss_file.ReadOnly = _file.IsReadOnly;
                ss_file.CreationTimeUTC = _file.CreationTimeUtc;
                ss_file.LastAccessTimeUTC = _file.LastAccessTimeUtc;
                ss_file.LastWriteTimeUTC = _file.LastWriteTimeUtc;
                files.Add(ss_file);
            }
            _return.Files = files;
            return _return;
        }

        private string Path(string _path, bool _directory)
        {
            return Server.UrlDecode(Server.MapPath(_path + (_directory ? "\\" : "")));
        }
        private string DeleteDirectory(DirectoryInfo oDir)
        {
            string strReturn = "";
            // First, delete the files
            FileInfo[] _files = oDir.GetFiles();
            foreach (FileInfo _file in _files)
            {
                if ((File.GetAttributes(_file.FullName) & FileAttributes.ReadOnly) != FileAttributes.ReadOnly)
                    _file.Delete();
                else
                    strReturn = "One or more files are marked Read-Only and have not been deleted (File Name: " + _file.Name + ")";
            }
            // Second, delete the sub-directories
            DirectoryInfo[] _dirs = oDir.GetDirectories();
            foreach (DirectoryInfo _dir in _dirs)
            {
                string strTemp = DeleteDirectory(_dir);
                if (strTemp != "")
                {
                    if (strReturn == "")
                        strReturn = strTemp;
                    break;
                }
            }
            // Third, delete the actual directory
            if (strReturn == "")
                oDir.Delete();
            return strReturn;
        }
        #endregion





        #region FILES
        [WebMethod]
        public string JSON(int _wid, string _wval, byte[] f, string _name)
        {
            string json = ConfigurationManager.AppSettings["JSON"];
            string dir = Path(json, true);
            if (Directory.Exists(dir) == false)
                Directory.CreateDirectory(dir);
            return UploadFile(_wid, _wval, f, json, _name);
        }
        [WebMethod]
        public string UploadFile(int _wid, string _wval, byte[] f, string _site_relative_dir, string _name)
        {
            string WebServiceURL = ConfigurationManager.AppSettings["WebServiceURL"];
            if (String.IsNullOrEmpty(WebServiceURL) == false)
            {
                WebServiceCMS.Browser oWservice = new WebServiceCMS.Browser();
                oWservice.Url = WebServiceURL;
                if (oWservice.ValidKey(_wid, _wval))
                {
                    string _path = Path(_site_relative_dir, true);
                    if (Directory.Exists(_path) == false)
                        return "A directory with the name you specified does not exist (Directory Name: " + _site_relative_dir + ")";
                    else
                    {
                        try
                        {
                            MemoryStream ms = new MemoryStream(f);
                            FileStream fs = new FileStream(_path + _name, FileMode.Create);
                            ms.WriteTo(fs);
                            ms.Close();
                            fs.Close();

                            return "";
                        }
                        catch (Exception ex)
                        {
                            return "There was a problem uploading the file (Error Message: " + ex.Message + " ~ " + _path + _name + ")";
                        }
                    }
                }
                else
                    return "Access Denied";
            }
            else
                return "Your settings have been corrupted";
        }
        [WebMethod]
        public string RenameFile(int _wid, string _wval, string _site_relative_dir, string _name_old, string _name_new)
        {
            string WebServiceURL = ConfigurationManager.AppSettings["WebServiceURL"];
            if (String.IsNullOrEmpty(WebServiceURL) == false)
            {
                WebServiceCMS.Browser oWservice = new WebServiceCMS.Browser();
                oWservice.Url = WebServiceURL;
                if (oWservice.ValidKey(_wid, _wval))
                {
                    string _path = Path(_site_relative_dir, true);
                    if (Directory.Exists(_path) == false)
                        return "A directory with the name you specified does not exist (Directory Name: " + _site_relative_dir + ")";
                    else if (File.Exists(_path + _name_new))
                        return "A file with the name you specified already exists (File Name: " + _name_new + ")";
                    else
                    {
                        try
                        {
                            File.Move(_path + _name_old, _path + _name_new);
                            return "";
                        }
                        catch (Exception ex)
                        {
                            return "There was a problem renaming the file (Error Message: " + ex.Message + ")";
                        }
                    }
                }
                else
                    return "Access Denied";
            }
            else
                return "Your settings have been corrupted";
        }
        [WebMethod]
        public string DeleteFile(int _wid, string _wval, string _path_to_file)
        {
            string WebServiceURL = ConfigurationManager.AppSettings["WebServiceURL"];
            if (String.IsNullOrEmpty(WebServiceURL) == false)
            {
                WebServiceCMS.Browser oWservice = new WebServiceCMS.Browser();
                oWservice.Url = WebServiceURL;
                if (oWservice.ValidKey(_wid, _wval))
                {
                    string _path = Path(_path_to_file, false);
                    if (File.Exists(_path) == false)
                        return "A file with the name you specified does not exist (File Name: " + _path_to_file + ")";
                    else
                    {
                        try
                        {
                            File.Delete(_path);
                            return "";
                        }
                        catch (Exception ex)
                        {
                            return "There was a problem deleting the file (Error Message: " + ex.Message + ")";
                        }
                    }
                }
                else
                    return "Access Denied";
            }
            else
                return "Your settings have been corrupted";
        }
        [WebMethod]
        public string DeleteFileName(int _wid, string _wval, string _site_relative_dir, string _name)
        {
            string WebServiceURL = ConfigurationManager.AppSettings["WebServiceURL"];
            if (String.IsNullOrEmpty(WebServiceURL) == false)
            {
                WebServiceCMS.Browser oWservice = new WebServiceCMS.Browser();
                oWservice.Url = WebServiceURL;
                if (oWservice.ValidKey(_wid, _wval))
                {
                    string _path = Path(_site_relative_dir, true);
                    if (Directory.Exists(_path) == false)
                        return "A directory with the name you specified does not exist (Directory Name: " + _site_relative_dir + ")";
                    else if (File.Exists(_path + _name) == false)
                        return "A file with the name you specified does not exist (File Name: " + _name + ")";
                    else
                    {
                        try
                        {
                            File.Delete(_path + _name);
                            return "";
                        }
                        catch (Exception ex)
                        {
                            return "There was a problem deleting the file (Error Message: " + ex.Message + ")";
                        }
                    }
                }
                else
                    return "Access Denied";
            }
            else
                return "Your settings have been corrupted";
        }

        #endregion


        [WebMethod]
        public string Exists(int _wid, string _wval, string _site_relative_path)
        {
            string WebServiceURL = ConfigurationManager.AppSettings["WebServiceURL"];
            if (String.IsNullOrEmpty(WebServiceURL) == false)
            {
                WebServiceCMS.Browser oWservice = new WebServiceCMS.Browser();
                oWservice.Url = WebServiceURL;
                if (oWservice.ValidKey(_wid, _wval))
                {
                    string strType = "";
                    if (Directory.Exists(Server.MapPath(_site_relative_path)))  // should be local only
                        strType = "D";
                    else if (File.Exists(Server.MapPath(_site_relative_path)))  // should be local only
                        strType = "F";
                    return strType;
                }
                else
                    return "Access Denied";
            }
            else
                return "Your settings have been corrupted";
        }
    }
}
