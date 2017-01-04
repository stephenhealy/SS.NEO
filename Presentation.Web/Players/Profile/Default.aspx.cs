using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web.Players.Profile
{
    public partial class Default : PlayerPageClass
    { 
        protected override void Page_Load(object sender, EventArgs e)
        {
            Initialize(false);

            if (!IsPostBack)
            {
                master.Common.DataBindDDL(chkPositions, "Name", "AssetID", master.db.Positions.Where(o => o.Enabled && o.Deleted == false).OrderBy(o => o.Display).ToList(), "");
                if (player != null)
                {
                    txtEmail.Text = player.Email;
                    txtFirst.Text = player.First;
                    txtLast.Text = player.Last;
                    txtAddress.Text = player.Address;
                    txtCity.Text = player.City;
                    txtState.Text = player.State;
                    txtZip.Text = player.Zip;
                    if (player.PrivateEmail)
                        radPrivateEmail.Checked = true;
                    else if (player.PrivatePhone)
                        radPrivatePhone.Checked = true;
                    else
                        radPublic.Checked = true;
                    txtPhone.Text = Statics.ClearPhone(player.Phone);

                    List<Data.PositionMember> members = master.db.PositionMembers.Where(o => o.PlayerID == player.AssetID && o.Deleted == null).ToList();
                    foreach (ListItem item in chkPositions.Items)
                    {
                        int position = Statics.ParseInt(item.Value);
                        if (members.FirstOrDefault(o => o.PositionID == position) != null)
                            item.Selected = true;
                    }
                }
                else
                {
                    btnSave.Text = "Register";
                    panConfirm.Visible = panPassword.Visible = true;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                bool existing = false;
                if (player == null)
                {
                    player = master.db.Players.Where(o => o.Email.ToUpper().Trim() == txtEmail.Text.ToUpper().Trim() && o.Enabled && o.Deleted == false).FirstOrDefault();
                    if (player != null)
                        Error("An account with that email address already exists.");
                    else
                        player = new Data.Player();
                }
                else
                    existing = true;

                if (existing == false)
                    player.AssetID = Models.Asset.New(master.db, -1);
                player.First = txtFirst.Text;
                player.Last = txtLast.Text;
                player.Email = txtEmail.Text;
                player.Password = Encryption.Encrypt(txtPassword.Text, Encryption.PassPhrase);
                player.Address = txtAddress.Text;
                player.City = txtCity.Text;
                player.State = txtState.Text;
                player.Zip = txtZip.Text;
                player.Phone = Statics.ClearPhone(txtPhone.Text);
                player.PrivateEmail = radPrivateEmail.Checked;
                player.PrivatePhone = radPrivatePhone.Checked;
                player.Enabled = true;
                if (existing == false)
                    master.db.Players.Add(player);
                master.db.SaveChanges();

                // Delete all previous values
                DateTime now = Statics.DateTimeUTC();
                master.db.PositionMembers.Where(o => o.PlayerID == player.AssetID && o.Deleted == null).ToList().ForEach(c => c.Deleted = now);
                // Add new
                foreach (ListItem position in chkPositions.Items)
                {
                    if (position.Selected)
                    {
                        Data.PositionMember member = new Data.PositionMember();
                        member.SeekingID = 0;
                        member.PlayerID = player.AssetID;
                        member.PositionID = Statics.ParseInt(position.Value);
                        member.Created = now;
                        master.db.PositionMembers.Add(member);
                    }
                }
                if (existing == false)
                    Save(master.RelativePath + "/Players/");
                else
                    Save(master.RelativePath + "/Players/Profile/");
            }
            else
                Error("There was a problem submitting your information. Please try again...");
        }

    }
}