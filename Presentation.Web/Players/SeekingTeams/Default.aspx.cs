using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web.Players.SeekingTeams
{
    public partial class Default : PlayerPageClass
    {
        public int CurrentPage { get; set; }
        public int Pages { get; set; }

        protected override void Page_Load(object sender, EventArgs e)
        {
            Initialize(true);

            if (!IsPostBack)
                BindListView();
        }

        protected void lstPlayers_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dpPlayers.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindListView();
        }

        private void BindListView()
        {
            DateTime YearAgo = Statics.DateTimeUTC().AddYears(-1);
            lstPlayers.DataSource = (from seeking in master.db.Seekings
                                     join players in master.db.Players on seeking.PlayerID equals players.AssetID
                                     where players.Enabled && players.Deleted == false
                                     && seeking.Deleted == false && seeking.Team == null
                                    && (seeking.Filled == null || chkFilled.Checked)
                                    && seeking.Created > YearAgo
                                     select new
                                     {
                                         players.AssetID,
                                         players.First,
                                         players.Last,
                                         Email = players.PrivateEmail ? "" : players.Email,
                                         Phone = players.PrivatePhone ? "" : players.Phone,
                                         seeking.Description,
                                         seeking.Filled,
                                         seeking.ID,
                                         seeking.Created
                                     }).OrderByDescending(o => o.Created).ToList();
            lstPlayers.DataBind();
            CurrentPage = (dpPlayers.StartRowIndex / dpPlayers.MaximumRows) + 1;
            Pages = Statics.Ceiling(dpPlayers.TotalRowCount, dpPlayers.PageSize);
        }

        protected void lstPlayers_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            ListViewItem item = (ListViewItem)e.Item;
            Label lblPositions = (Label)item.FindControl("lblPositions");
            int ID = Statics.ParseInt(lblPositions.Text);
            if (ID > 0)
            {
                lblPositions.Text = string.Join("<br/>", (from positions in master.db.Positions
                                                          join members in master.db.PositionMembers on positions.AssetID equals members.PositionID
                                                          where members.Deleted == null && members.PlayerID == player.AssetID && members.SeekingID == 0
                                                           && positions.Enabled && positions.Deleted == false
                                                          select positions.Name).ToList());
            }
        }

        protected void chkFilled_CheckedChanged(object sender, EventArgs e)
        {
            BindListView();
        }

    }
}