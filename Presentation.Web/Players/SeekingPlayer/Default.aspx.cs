using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web.Players.SeekingPlayer
{
    public partial class Default : PlayerPageClass
    {
        private int ID { get; set; }
        protected override void Page_Load(object sender, EventArgs e)
        {
            Initialize(true);

            ID = Statics.ParseInt(Request.QueryString["ID"]);
            Data.Seeking seeking = master.db.Seekings.Find(ID);
            if (seeking == null || seeking.Deleted == true || seeking.PlayerID != player.AssetID || seeking.Team == null)
                ID = 0;

            if (!IsPostBack)
            {
                master.Common.DataBindDDL(chkPositions, "Name", "AssetID", master.db.Positions.Where(o => o.Enabled && o.Deleted == false).OrderBy(o => o.Display).ToList(), "");
                if (seeking != null && ID > 0)
                {
                    List<Data.PositionMember> members = master.db.PositionMembers.Where(o => o.SeekingID == seeking.ID && o.Deleted == null).ToList();
                    foreach (ListItem item in chkPositions.Items)
                    {
                        int position = Statics.ParseInt(item.Value);
                        if (members.FirstOrDefault(o => o.PositionID == position) != null)
                            item.Selected = true;
                    }
                    txtTeam.Text = seeking.Team;
                    txtDescription.Text = seeking.Description;
                    if (seeking.Filled != null)
                    {
                        chkFilled.Checked = true;
                        lblFilled.Text = "The position was filled on " + Statics.DateTimeToString(Statics.DateTimeZone(seeking.Filled, master.TimeZone), ParseDateTimeType.LongDateTime);
                    }
                    btnAdd.Text = "Update";
                    btnDelete.Visible = true;
                }
                else
                {
                    chkFilled.Enabled = false;
                    lblFilled.Text += " (not now)";
                }
                lblContact.Text = player.First + " " + player.Last;
                lblPhone.Text = player.Phone;
                lblEmail.Text = player.Email;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            DateTime now = Statics.DateTimeUTC();
            Data.Seeking seeking = master.db.Seekings.Find(ID);
            if (seeking == null)
                seeking = new Data.Seeking();
            seeking.PlayerID = player.AssetID;
            seeking.Team = txtTeam.Text;
            seeking.Description = txtDescription.Text;
            if (chkFilled.Checked)
            {
                if (seeking.Filled == null)
                    seeking.Filled = now;
            }
            else
                seeking.Filled = null;
            seeking.Updated = now;
            seeking.Deleted = false;
            if (seeking.ID == 0)
            {
                seeking.Created = now;
                master.db.Seekings.Add(seeking);
            }
            master.db.SaveChanges();

            // Delete all previous values
            master.db.PositionMembers.Where(o => o.SeekingID == seeking.ID && o.Deleted == null).ToList().ForEach(c => c.Deleted = now);
            // Add new
            foreach (ListItem position in chkPositions.Items)
            {
                if (position.Selected)
                {
                    Data.PositionMember member = new Data.PositionMember();
                    member.SeekingID = seeking.ID;
                    member.PlayerID = 0;
                    member.PositionID = Statics.ParseInt(position.Value);
                    member.Created = now;
                    master.db.PositionMembers.Add(member);
                }
            }

            Save(master.RelativePath + "/Players/SeekingPlayers/");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Data.Seeking seeking = master.db.Seekings.Find(ID);
            if (seeking != null)
                seeking.Deleted = true;
            Save(master.RelativePath + "/Players/SeekingPlayers/");
        }

    }
}