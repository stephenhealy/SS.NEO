using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web.Players.SeekingTeam
{
    public partial class Default : PlayerPageClass
    {
        private int ID { get; set; }
        protected override void Page_Load(object sender, EventArgs e)
        {
            Initialize(true);

            ID = Statics.ParseInt(Request.QueryString["ID"]);
            Data.Seeking seeking = master.db.Seekings.Find(ID);
            if (seeking == null || seeking.Deleted == true || seeking.PlayerID != player.AssetID || seeking.Team != null)
                ID = 0;

            if (!IsPostBack)
            {
                if (seeking != null && ID > 0)
                {
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
                lblPlayer.Text = player.First + " " + player.Last;
                lblPhone.Text = player.Phone;
                lblEmail.Text = player.Email;
                lblPositions.Text = string.Join("<br/>", (from positions in master.db.Positions
                                                      join members in master.db.PositionMembers on positions.AssetID equals members.PositionID
                                                      where members.Deleted == null && members.PlayerID == player.AssetID && members.SeekingID == 0
                                                       && positions.Enabled && positions.Deleted == false
                                                      select positions.Name).ToList());
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            DateTime now = Statics.DateTimeUTC();
            Data.Seeking seeking = master.db.Seekings.Find(ID);
            if (seeking == null)
                seeking = new Data.Seeking();
            seeking.PlayerID = player.AssetID;
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
            Save(master.RelativePath + "/Players/SeekingTeams/");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Data.Seeking seeking = master.db.Seekings.Find(ID);
            if (seeking != null)
                seeking.Deleted = true;
            Save(master.RelativePath + "/Players/SeekingTeams/");
        }

    }
}