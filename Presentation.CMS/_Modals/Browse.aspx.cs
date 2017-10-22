using Data;
using Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.CMS._Modals
{
    public partial class Browse : PageClass
    {
        protected bool IsImage { get; set; }
        protected bool IsLink { get; set; }
        protected bool IsFile { get; set; }
        protected string Value { get; set; }
        protected string Control { get; set; }

        protected string SaveClientClick { get; set; }
        protected bool RemoveURL { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("", true, "");

            if (String.IsNullOrEmpty(Request.QueryString["v"]) == false)
                Value = Request.QueryString["v"];

            if (String.IsNullOrEmpty(Request.QueryString["i"]) == false)
            {
                IsImage = true;
                Control = Request.QueryString["i"];
            }
            else if (String.IsNullOrEmpty(Request.QueryString["l"]) == false)
            {
                IsLink = true;
                Control = Request.QueryString["l"];
            }
            else
            {
                IsFile = true;
                if (String.IsNullOrEmpty(Request.QueryString["f"]) == false)
                    Control = Request.QueryString["f"];
            }

            if (!IsPostBack)
            {
                if (String.IsNullOrEmpty(Request.QueryString["error"]) == false)
                {
                    string error = Statics.decryptQueryString(Request.QueryString["error"]);
                    if (String.IsNullOrEmpty(error) && Session[Sessions.Error] != null && Session[Sessions.Error] != "")
                        error += " - " + Session[Sessions.Error];
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "errored", "alert('" + Statics.EscapeSingleJS(error) + "');", true);
                }
                else if (String.IsNullOrEmpty(Request.QueryString["upload"]) == false)
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "uploaded", "alert('Upload Complete!');", true);
                else if (String.IsNullOrEmpty(Request.QueryString["create"]) == false)
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "created", "alert('Folder Created!');", true);
                else if (String.IsNullOrEmpty(Request.QueryString["delete"]) == false)
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "deleted", "alert('Folder Deleted!');", true);
                else if (String.IsNullOrEmpty(Request.QueryString["image"]) == false)
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "imaged", "alert('Image Deleted!');", true);
                else if (String.IsNullOrEmpty(Request.QueryString["file"]) == false)
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "filed", "alert('File Deleted!');", true);

                WebServiceClient.BrowserDirectory oDirInfo = GetDirectoryInfo("/");

                if (IsImage)
                {
                    //Images
                    WebServiceClient.BrowserDirectory oDirInfoImage = GetDirectoryInfo(master.ImagePath);
                    LoadDirectory(master.ImagePath, oDirInfoImage, treImage, null, false);
                    btnImage.OnClientClick = "return DoConfirm('valImage','" + btnImage.ClientID + "','WARNING! This action CANNOT be undone.\\n\\nAre you sure you want to delete this item?');";
                }
                else if (IsLink)
                {
                    //Pages
                    LoadDirectory("/", oDirInfo, trePages, null, true);

                    // Files
                    LoadDirectory("/", oDirInfo, treFile, null, false);
                    btnFile.OnClientClick = "return DoConfirm('valFile','" + btnFile.ClientID + "','WARNING! This action CANNOT be undone.\\n\\nAre you sure you want to delete this item?');";
                }
                else
                {
                    // CMS
                    LoadDirectory("/", null, treAdmin, null, false);
                    btnCMS.OnClientClick = "return DoConfirm('valCMS','" + btnCMS.ClientID + "','WARNING! This action CANNOT be undone.\\n\\nAre you sure you want to delete this item?');";

                    // Files
                    LoadDirectory("/", oDirInfo, treFile, null, false);
                    btnFile.OnClientClick = "return DoConfirm('valFile','" + btnFile.ClientID + "','WARNING! This action CANNOT be undone.\\n\\nAre you sure you want to delete this item?');";

                    //Images
                    WebServiceClient.BrowserDirectory oDirInfoImage = GetDirectoryInfo(master.ImagePath);
                    LoadDirectory(master.ImagePath, oDirInfoImage, treImage, null, false);
                    btnImage.OnClientClick = "return DoConfirm('valImage','" + btnImage.ClientID + "','WARNING! This action CANNOT be undone.\\n\\nAre you sure you want to delete this item?');";
                }

                //Upload
                LoadDirectory("/", oDirInfo, treUpload, null, true);
                btnDelete.OnClientClick = "return DoConfirm('valDelete','" + btnDelete.ClientID + "','WARNING! Deleting a folder will also delete all the files and folders within that folder.\\nThis action CANNOT be undone!\\n\\nAre you sure you want to delete this folder and all its contents?');";

                //btnSave.OnClientClick = "return CMS_BrwoserSave('" + Request.QueryString["CKEditorFuncNum"] + "','" + Request.QueryString["cms_c"] + "','" + Request.QueryString["cms_h"] + "','" + (RemoveURL ? Statics.EscapeSingleJS(Statics.RequestPathHttp(Request, false)) : "") + "');";
                //SaveClientClick = "return CMS_BrwoserSave('" + Request.QueryString["CKEditorFuncNum"] + "','" + Request.QueryString["cms_c"] + "','" + Request.QueryString["cms_h"] + "','" + (RemoveURL ? Statics.EscapeSingleJS(Statics.RequestPathHttp(Request, false)) : "") + "');";
            }
        }
        //protected void LoadImages(WebServiceClient.BrowserDirectory dir, string _path, TreeView _tree, TreeNode _parent)
        //{
        //    if (_path != "/")
        //        _path += "/";
        //    foreach (WebServiceClient.BrowserDirectory _dir in dir.SubDirectories)
        //    {
        //        TreeNode oNode = new TreeNode(_dir.Name, _dir.Name, master.ImagePath);
        //        oNode.ImageUrl = master.RelativePath + "/img/folder.gif";
        //        oNode.SelectAction = TreeNodeSelectAction.Expand;
        //        if (_parent == null)
        //            _tree.Nodes.Add(oNode);
        //        else
        //            _parent.ChildNodes.Add(oNode);
        //        LoadImages(_dir, _path + _dir.Name, _tree, oNode);
        //    }
        //    foreach (WebServiceClient.BrowserFile _file in dir.Files)
        //    {
        //        if (_parent == null)
        //            _tree.Nodes.Add(new TreeNode(_file.Name, _file.Name, "", master.WebSiteURL + _path + _file.Name, ""));
        //        else
        //            _parent.ChildNodes.Add(new TreeNode(_file.Name, _file.Name, "", master.WebSiteURL + _path + _file.Name, ""));
        //    }
        //}

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string value = Request.Form[hdnValue.UniqueID];
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "browsed", "window.parent.BrwoserSave('" + Control + "','" + value + "','" + master.WebSiteURL + "');", true);
        }

        protected string Upload(FileUpload file)
        {
            string error = "";

            if (file.FileName != "" && file.PostedFile != null)
            {
                string parent = GetPath("/");

                try
                {
                    string filename = file.PostedFile.FileName;
                    int numBytes = file.PostedFile.ContentLength;
                    double dLen = Convert.ToDouble(numBytes / 1000000);

                    // Default limit of 4 MB on web server
                    // have to change the web.config to if
                    // you want to allow larger uploads
                    //if (dLen < 4)
                    //{
                    // set up a file stream and binary reader for the
                    // selected file
                    //FileStream fStream = new FileStream(filename, FileMode.Open, FileAccess.Read);
                    //BinaryReader br = new BinaryReader(fStream);
                    BinaryReader br = new BinaryReader(file.PostedFile.InputStream);

                    // convert the file to a byte array
                    byte[] data = br.ReadBytes(numBytes);
                    br.Close();

                    Data.Key key = Models.Key.New(master.db);
                    WebServiceClient.Browser oWS = new WebServiceClient.Browser();
                    oWS.Url = master.WebServiceURL;
                    error = oWS.UploadFile(key.id, key.val, data, parent.Replace("/", "\\") + "\\", file.FileName);
                    //fStream.Close();
                    //fStream.Dispose();
                    file.PostedFile.InputStream.Close();
                }
                catch (Exception ex)
                {
                    error = ex.Message;
                }
            }
            return error;
        }

        private void Redirect(string additional)
        {
            if (IsImage)
                Response.Redirect(Request.Path + "?i=" + Request.QueryString["i"] + "&v=" + Request.QueryString["v"] + additional);
            else if (IsLink)
                Response.Redirect(Request.Path + "?l=" + Request.QueryString["l"] + "&v=" + Request.QueryString["v"] + additional);
            else
                Response.Redirect(Request.Path + "?f=" + Request.QueryString["f"] + "&v=" + Request.QueryString["v"] + additional);
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string error1 = Upload(file1);
            string error2 = Upload(file2);
            string error3 = Upload(file3);
            if (String.IsNullOrEmpty(error1) && String.IsNullOrEmpty(error2) && String.IsNullOrEmpty(error3))
                Redirect("&upload=true");
            else if (String.IsNullOrEmpty(error1) == false)
            {
                Redirect("&error=" + Statics.encryptQueryString("There was a problem uploading the file " + file1.FileName));
                Session[Sessions.Error] = error1;
            }
            else if (String.IsNullOrEmpty(error2) == false)
            {
                Redirect("&error=" + Statics.encryptQueryString("There was a problem uploading the file " + file2.FileName));
                Session[Sessions.Error] = error2;
            }
            else
            {
                Redirect("&error=" + Statics.encryptQueryString("There was a problem uploading the file " + file3.FileName));
                Session[Sessions.Error] = error3;
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string parent = GetPath("");

            string folder = txtCreate.Text;
            Data.Key key = Models.Key.New(master.db);
            WebServiceClient.Browser oWS = new WebServiceClient.Browser();
            oWS.Url = master.WebServiceURL;
            string error = oWS.AddDirectory(key.id, key.val, parent.Replace("/", "\\") + "\\", folder);
            if (String.IsNullOrEmpty(error) == false)
            {
                Redirect("&error=" + Statics.encryptQueryString("There was a problem creating the folder " + folder));
                Session[Sessions.Error] = error;
            }
            else
                Redirect("&create=true");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string parent = GetPath("");
            if (String.IsNullOrEmpty(parent) == false)
            {
                Data.Key key = Models.Key.New(master.db);
                WebServiceClient.Browser oWS = new WebServiceClient.Browser();
                oWS.Url = master.WebServiceURL;
                string error = oWS.DeleteDirectory(key.id, key.val, parent.Replace("/", "\\"));
                if (String.IsNullOrEmpty(error) == false)
                {
                    Redirect("&error=" + Statics.encryptQueryString("There was a problem deleting the folder " + parent));
                    Session[Sessions.Error] = error;
                }
                else
                    Redirect("&delete=true");
            }
            else
                Redirect("&error=" + Statics.encryptQueryString("You must select a folder to delete"));
        }

        private string GetPath(string root)
        {
            string folder = Request.Form[hdnValue.UniqueID];
            if (String.IsNullOrEmpty(folder))
                folder = root;
            else if (folder.StartsWith(master.WebSiteURL) == true)
                folder = folder.Replace(master.WebSiteURL, "");
            return folder;
        }

        protected void btnImage_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(GetPath("")) == false)
                Delete("image");
            else
                Redirect("&error=" + Statics.encryptQueryString("You must select an image to delete"));
        }

        protected void btnFile_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(GetPath("")) == false)
                Delete("file");
            else
                Redirect("&error=" + Statics.encryptQueryString("You must select a file to delete"));
        }

        private void Delete(string type)
        {
            string file = GetPath("");
            Data.Key key = Models.Key.New(master.db);
            WebServiceClient.Browser oWS = new WebServiceClient.Browser();
            oWS.Url = master.WebServiceURL;
            string error = oWS.DeleteFile(key.id, key.val, file);
            if (String.IsNullOrEmpty(error) == false)
            {
                Redirect("&error=" + Statics.encryptQueryString("There was a problem deleting the " + type + " " + file));
                Session[Sessions.Error] = error;
            }
            else
                Redirect("&" + type + "=true");
        }

        protected void btnCMS_Click(object sender, EventArgs e)
        {
            string file = GetPath("");
            if (String.IsNullOrEmpty(file) == false)
            {
                string full = Server.MapPath(file);
                if (File.Exists(HttpUtility.UrlDecode(full)) == true)
                {
                    try
                    {
                        File.Delete(full);
                        Redirect("&cms=true");
                    }
                    catch (Exception ex)
                    {
                        Redirect("&error=" + Statics.encryptQueryString("There was a problem deleting the file " + file));
                        Session[Sessions.Error] = ex.Message;
                    }
                }
                else
                    Redirect("&error=" + Statics.encryptQueryString("Could not find the file " + file));
            }
            else
                Redirect("&error=" + Statics.encryptQueryString("You must select a file to delete"));
        }
    }
}