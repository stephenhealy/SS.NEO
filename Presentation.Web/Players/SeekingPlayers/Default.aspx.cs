using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation.Web.Players.SeekingPlayers
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

        protected void lstTeams_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dpTeams.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindListView();
        }

        private void BindListView()
        {
            DateTime YearAgo = Statics.DateTimeUTC().AddYears(-1);
            lstTeams.DataSource = (from seeking in master.db.Seekings
                                   join players in master.db.Players on seeking.PlayerID equals players.AssetID
                                   where players.Enabled && players.Deleted == false
                                    && seeking.Deleted == false && seeking.Team != null
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
                                         seeking.Created,
                                         seeking.Team
                                     }).OrderByDescending(o => o.Created).ToList();
            lstTeams.DataBind();
            CurrentPage = (dpTeams.StartRowIndex / dpTeams.MaximumRows) + 1;
            Pages = Statics.Ceiling(dpTeams.TotalRowCount, dpTeams.PageSize);
        }

        protected void lstTeams_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            ListViewItem item = (ListViewItem)e.Item;
            Label lblPositions = (Label)item.FindControl("lblPositions");
            int ID = Statics.ParseInt(lblPositions.Text);
            if (ID > 0)
            {
                lblPositions.Text = string.Join("<br/>", (from positions in master.db.Positions
                                                      join members in master.db.PositionMembers on positions.AssetID equals members.PositionID
                                                      where members.Deleted == null && members.PlayerID == 0 && members.SeekingID == ID
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