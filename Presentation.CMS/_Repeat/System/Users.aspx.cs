using Models;
using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Presentation.CMS._Repeat.System
{
    public partial class Users : RepeaterClass, EditPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initialize("Users", false, "");
            master.EditPage = this;
            master.ShowOrder = true;
            //master.TreeLevel = 2;   // leave off if not a tree.
            if (!IsPostBack)
                master.Heading.Text = "Users";
            master.LoggingKey = LoggingKeys.Users;
        }

        public object Json(bool trash)
        {
            List<AdminList> items = master.Selector.Users(trash);
            return Output.SerializeJSON(items);
        }

        public void Edit(int id)
        {
            //master.Common.DataBindDDL(ddlParent, "Name", "AssetID", master.Selector.Parent());
            Data.User item = master.Selector.User(id);
            if (item != null)
            {
                master.Heading.Text = txtFirst.Text = item.First;
                txtLast.Text = item.Last;
                txtEmail.Text = item.Email;
                chkStaff.Checked = item.Staff;
                txtTitle.Text = item.Title;
                txtBiography.Text = item.Bio;
                if (String.IsNullOrEmpty(item.Image) == false)
                    litPicture.Text = "<img src=\"" + master.RelativePath + item.Image + "\" alt\"\" />";
                txtFacebook.Text = item.Facebook;
                txtTwitter.Text = item.Twitter;
                txtPhone.Text = item.Phone;
                chkEnabled.Checked = item.Enabled;
                if (item.Deleted)
                    master.HideSave();
            }
            else
            {
                panPasswordHidden.Visible = false;
                phPassword.Visible = true;
            }
        }

        public string Save()
        {
            List<Data.LogDetail> details = new List<Data.LogDetail>();
            Data.User item = master.Selector.User(master.AssetID);
            if (item == null)
            {
                item = new Data.User();
                item.AssetID = Models.Asset.New(master.db, master.User.ID);
                item.Super = false;
                master.db.Users.Add(item);
                panPasswordHidden.Visible = false;
                phPassword.Visible = true;
            }
            item.First = txtFirst.Text;
            item.Last = txtLast.Text;
            item.Email = txtEmail.Text;
            if (phPassword.Visible)
                item.Password = Encryption.Encrypt(txtPassword1.Text, Encryption.PassPhrase);
            item.Staff = chkStaff.Checked;
            item.Title = txtTitle.Text;
            item.Bio = txtBiography.Text;
            if (filPicture.FileName != "" && filPicture.PostedFile != null)
            {
                try
                {
                    string filename = filPicture.PostedFile.FileName;
                    int numBytes = filPicture.PostedFile.ContentLength;
                    double dLen = Convert.ToDouble(numBytes / 1000000);
                    if (dLen > 1.00)
                        Sessions.Set(Sessions.Error, "The image is too big.  Try a smaller photo");
                    else
                    {
                        BinaryReader br = new BinaryReader(filPicture.PostedFile.InputStream);

                        // convert the file to a byte array
                        byte[] data = br.ReadBytes(numBytes);
                        br.Close();

                        Data.Key key = Models.Key.New(master.db);
                        WebServiceClient.Browser oWS = new WebServiceClient.Browser();
                        oWS.Url = master.WebServiceURL;
                        string error = oWS.UploadFile(key.id, key.val, data, master.ImagePath.Replace("/", "\\") + "\\", master.AssetID.ToString() + ".png");
                        //fStream.Close();
                        //fStream.Dispose();
                        filPicture.PostedFile.InputStream.Close();
                        item.Image = master.WebSiteURL + master.ImagePath + "/" + master.AssetID.ToString() + ".png";
                    }
                }
                catch (Exception ex)
                {
                    Sessions.Set(Sessions.Error, ex.Message);
                }
            }
            item.Facebook = txtFacebook.Text;
            item.Twitter = txtTwitter.Text;
            item.Phone = Statics.ClearPhone(txtPhone.Text);
            item.Enabled = chkEnabled.Checked;
            // Add data from other tables

            return master.SaveChanges(item.AssetID, details);
        }

        public void Delete()
        {
            Data.User item = master.Selector.User(master.AssetID);
            if (item != null)
                update(item, true);
        }

        public int Restore(string _records)
        {
            int total = 0;
            if (master.AssetID > 0)
            {
                Data.User item = master.Selector.User(master.AssetID);
                if (item != null)
                {
                    update(item, false);
                    total = 1;
                }
            }
            else
            {
                string[] records = _records.Split(new char[] { ',' });
                foreach (string record in records)
                {
                    int id = Statics.ParseInt(record);
                    Data.User item = master.db.Users.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
                    if (item != null)
                    {
                        update(item, false);
                        total++;
                    }
                }
            }
            return total;
        }

        public int Purge(string _records)
        {
            int total = 0;
            if (master.AssetID > 0)
            {
                Data.User item = master.Selector.User(master.AssetID);
                if (item != null)
                {
                    master.db.Users.Remove(item);
                    total = 1;
                }
            }
            else
            {
                string[] records = _records.Split(new char[] { ',' });
                foreach (string record in records)
                {
                    int id = Statics.ParseInt(record);
                    Data.User item = master.db.Users.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
                    if (item != null)
                    {
                        master.db.Users.Remove(item);
                        total++;
                    }
                }
            }
            master.db.SaveChanges();
            return total;
        }

        public void update(Data.User item, bool delete)
        {
            item.Deleted = delete;
            master.SaveChanges(item.AssetID);
        }

        protected void btnPassword_Click(object sender, EventArgs e)
        {
            panPasswordHidden.Visible = false;
            phPassword.Visible = true;
        }

    }
}