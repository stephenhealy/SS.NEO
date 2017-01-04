using Models;
using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.CMS._Masters
{
    public partial class repeat : DBClass
    {
        public bool Trash { get; set; }
        public int TreeLevel = 0;
        public bool ShowOrder { get; set; }
        public Literal Heading { get; set; }
        private TreeNode SelectedTreeNode { get; set; }
        public int BackParentID = 0;

        public override void Initialize(bool AllowNoUser)
        {
            Heading = litHeading;
            base.Initialize(AllowNoUser);
        }

        public override void PageLoad()
        {
            Trash = (String.IsNullOrEmpty(Request.QueryString["Trash"]) == false);

            Common.CheckSession(Page, Sessions.Saved, panSaved);
            Common.CheckSession(Page, Sessions.Deleted, panDeleted);
            Common.CheckSession(Page, Sessions.Error, panError, litError);
            //Common.CheckSession(Page, Sessions.Deleted, "NotifyRed('" + Statics.EscapeSingleJS("The record has been moved to trash.") + "', null, 'Deleted!');");
            //Common.CheckSession(Page, Sessions.Restored, "NotifyGreen('%value%" + Statics.EscapeSingleJS(" records have been restored.") + "', null, 'Restored!');");
            //Common.CheckSession(Page, Sessions.Purged, "NotifyRed('%value%" + Statics.EscapeSingleJS(" records have been permanently deleted.") + "', null, 'Purged!');");

            //Common.CheckSession(Page, Sessions.SaveWarning, "NotifyWarning('The following fields could not be saved : %value%', null, 'Warning');");

            if (String.IsNullOrEmpty(Request.QueryString["JSON"]) == false)
            {
                if (String.IsNullOrEmpty(Request.QueryString["Parent"]) == false)
                    ParentID = Statics.ParseInt(Request.QueryString["Parent"]);
                Response.ContentType = "application/json";
                string jsonString = EditPage.Json(Trash).ToString();
                Response.Write("{\"aaData\": " + jsonString + "}");
                Response.End();
            }
            else if (String.IsNullOrEmpty(Request.QueryString["ID"]) == false)
            {
                AssetID = Statics.ParseInt(Request.QueryString["ID"]);
                if (AssetID > 0)
                    litAssetID.Text = AssetID.ToString();
                hdEdit.Visible = panSave.Visible = btnCancel.Visible = divEdit.Visible = ftEdit.Visible = true;
                if (AssetID > 0)
                {
                    hypHistory.Visible = btnDelete.Visible = true;
                    hypOrder.Visible = ShowOrder;
                }
                if (!IsPostBack)
                {
                    litHeading.Text = "New Record";
                    EditPage.Edit(AssetID);
                    if (ParentID > 0)
                        lblParentID.Text = ParentID.ToString();
                }
            }

            if (Trash || divEdit.Visible == false)
            {
                hdList.Visible = true;
                if (TreeLevel > 0 && Trash == false)
                {
                    if (String.IsNullOrEmpty(Request.QueryString["Back"]) == false)
                        BackParentID = Statics.ParseInt(Request.QueryString["Back"]);
                    LoadTree(EditPage.Tree(), treTree, 1);
                    Statics.ExpandTree(treTree, SelectedTreeNode, "fa fa-folder-o", "fa fa-folder-open-o");
                    divTable.Visible = phTree.Visible = ftTable.Visible = true;
                }
                else
                    divTable.Visible = phTable.Visible = ftTable.Visible = true;
                if (Trash)
                    btnRestore.Visible = btnPurge.Visible = btnCancel.Visible = phDeleted.Visible = true;
                else
                {
                    btnAdd.Visible = hypHistory.Visible = btnTrash.Visible = phList.Visible = true;
                    hypOrder.Visible = (ShowOrder && TreeLevel < 2);
                }
            }

            if (hypHistory.Visible)
                hypHistory.Attributes.Add("onclick", "return LoadModal('mainModal', '" + master.RelativePath + "/_Modals/History.aspx?k=" + this.LoggingKey + "&i=" + this.AssetID + "', 'History: <small>" + litHeading.Text + "</small>');");
            if (hypOrder.Visible)
                hypOrder.Attributes.Add("onclick", "return LoadModal('mainModal', '" + master.RelativePath + "/_Modals/Order.aspx?k=" + this.LoggingKey + "&i=" + this.AssetID + "&p=" + this.ParentID + "', 'Order: <small>" + litHeading.Text + "</small>');");
        }

        private void LoadTree(List<TreeItem> items, TreeView tree, int level)
        {
            if (items != null && items.Count > 0)
            {
                List<TreeItem> all = items.AsEnumerable().ToList();
                foreach (TreeItem item in items)
                    tree.Nodes.Add(AddNode(item, level + 1));
                tree.ExpandDepth = 0;
            }
        }
        private void LoadTree(List<TreeItem> items, TreeNode parent, int level)
        {
            foreach (TreeItem item in items)
                parent.ChildNodes.Add(AddNode(item, level + 1));
        }
        private TreeNode AddNode(TreeItem item, int level)
        {
            TreeNode node = new TreeNode();
            if (level == TreeLevel)
            {
                node.Text = (TreeLevel > 2 ? "<i class='fa fa-level-up fa-rotate-90'></i> " : "") + item.Name + " <small>(" + item.Count.ToString() + ")</small>";
                //node.Text = "<i class='fa fa-angle-right'></i> " + item.Name + " <span class=\"badge badge-tertiary\">" + item.Count.ToString() + "</span>";
                node.SelectAction = TreeNodeSelectAction.Select;
                node.NavigateUrl = "javascript:SelectTreeItem('" + item.AssetID.ToString() + "');";
                if (item.AssetID == BackParentID)
                    SelectedTreeNode = node;
            }
            else
            {
                node.Text = "<i class='fa fa-folder-o folder'></i> " + item.Name + " <small>(" + item.Count.ToString() + ")</small>";
                //node.Text = "<i class='fa fa-folder-o folder'></i> " + item.Name + " <span class=\"badge badge-default\">" + item.Count.ToString() + "</span>";
                node.SelectAction = TreeNodeSelectAction.Expand;
            }
            node.ToolTip = item.Name;
            if (item.Children != null)
                LoadTree(item.Children, node, level);
            return node;
        }

        public void HideSave()
        {
            panSave.Visible = btnDelete.Visible = false;
            panReadOnly.Visible = btnRestore.Visible = btnPurge.Visible = true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Save())
                Response.Redirect(Request.Path + "?ID=" + AssetID);
        }

        protected void btnSaveReturn_Click(object sender, EventArgs e)
        {
            if (Save())
            {
                ParentID = Statics.ParseInt(lblParentID.Text);
                if (ParentID == 0)
                    Back("");
                else
                    Back("?Back=" + ParentID.ToString());
            }
        }

        protected void btnSaveNew_Click(object sender, EventArgs e)
        {
            if (Save())
                Response.Redirect(Request.Path + "?ID=0");
        }

        private bool Save()
        {
            string errors = EditPage.Save();
            if (String.IsNullOrEmpty(errors))
            {
                Sessions.Set(Sessions.Saved, "0");
                return true;
            }
            else
            {
                panError.Visible = true;
                litError.Text = errors;
                //Page.ClientScript.RegisterStartupScript(Page.GetType(), "errored", "NotifyError('" + Statics.EscapeSingleJS(errors) + "', null, 'The following error occurred...');", true);
                return false;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ParentID = Statics.ParseInt(lblParentID.Text);
            if (ParentID == 0)
                Back("");
            else
                Back("?Back=" + ParentID.ToString());
        }

        protected void Back(string querystring)
        {
            Response.Redirect(Request.Path + querystring);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Path + "?ID=0");
        }

        protected void btnTrash_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Path + "?Trash=true");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            EditPage.Delete();
            Sessions.Set(Sessions.Deleted, "0");
            Response.Redirect(Request.Path);
        }

        protected void btnRestore_Click(object sender, EventArgs e)
        {
            int count = EditPage.Restore(Request.Form[TrashRecords.UniqueID]);
            Sessions.Set(Sessions.Restored, count.ToString());
            Response.Redirect(Request.Path);
        }

        protected void btnPurge_Click(object sender, EventArgs e)
        {
            int count = EditPage.Purge(Request.Form[TrashRecords.UniqueID]);
            Sessions.Set(Sessions.Purged, count.ToString());
            Response.Redirect(Request.Path + "?Trash=true");
        }
    }
}