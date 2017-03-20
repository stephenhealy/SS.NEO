<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="League.ascx.cs" Inherits="Presentation.Web._Controls.League" %>
<h2 class="no-bold"><%= this.Header %></h2>
<%= this.Body %>
<p class="semi-bold">Below you will find our current league schedules and standings.  Once new leagues become available, you will be able to sign up online.</p>

    <a href="#upcoming" class="btn btn-success"><i class="fa fa-check-square-o"></i> Register for Upcoming Leagues <asp:Label ID="lblUpcoming" runat="server" CssClass="badge badge-primary" /></a>
    <a href="#current" class="btn btn-primary"><i class="fa fa-calendar"></i> View Current League Schedule & Standings <asp:Label ID="lblCurrent" runat="server" CssClass="badge badge-primary" /></a>

    <div id="upcoming">
        <br class="xs-30">
        <div class="heading-block">
            <h3>Upcoming <%= this.Sport %> Leagues</h3>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="pricing-tables">
                    <div class="row">
                        <asp:Repeater ID="rptUpcoming" runat="server" OnItemDataBound="rptUpcoming_ItemDataBound">
                            <ItemTemplate>
                                <div class="col-md-2 pricing-col">
                                    <div class="pricing-table">
                                        <div class="pricing-table-head">
                                            <h2 class="pricing-table-head-title"><%# DataBinder.Eval(Container.DataItem, "Name") %></h2>
                                        </div><!-- /.pricing-table-head -->
                                        <div class="pricing-table-amount">
                                            <em></em>
                                        </div>
                                        <ul class="pricing-table-content">
                                            <asp:Repeater ID="rptLeagues" runat="server">
                                                <ItemTemplate>
                                                    <li>
                                                        <h5<%# (DataBinder.Eval(Container.DataItem, "AssetID").ToString() == "0" ?  " class='text-muted'" : "") %>><%# DataBinder.Eval(Container.DataItem, "Name") %></h5>
                                                        <%# (DataBinder.Eval(Container.DataItem, "AssetID").ToString() == "0" ?  "&nbsp;" : (DataBinder.Eval(Container.DataItem, "EZSchedule").ToString() == "" ? "<a data-toggle=\"modal\" class=\"text-primary\" href=\"javascript:void(0);\" onclick=\"LoadModal('mainModal', '" + page.master.RelativePath + "/League.aspx?ID=" + DataBinder.Eval(Container.DataItem, "AssetID") + "', '" + Models.Statics.EscapeSingleJS(DataBinder.Eval(Container.DataItem, "Name").ToString()) + "', '" + Models.Statics.EscapeSingleJS(DataBinder.Eval(Container.DataItem, "EZRegister").ToString()) + "');\">Register Now</a>" : "<a href=\"" + DataBinder.Eval(Container.DataItem, "EZSchedule").ToString() + "\" target=\"_blank\">Schedule / Standings</a>")) %>
                                                    </li>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </ul>
                                    </div><!-- /.pricing-table -->
                                </div><!-- /.col -->
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:Literal ID="litUpcoming" runat="server" Text="<div class='col-md-12'>At this time, there are no upcoming leagues.  Please check back again soon...</div>" />
                    </div><!-- /.row -->
                </div><!-- /.pricing-tables -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div> <!-- /.tab-pane -->
    <div id="current">
        <br class="xs-30">
        <div class="heading-block">
            <h3>Current <%= this.Sport %> Leagues</h3>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="pricing-tables">
                    <div class="row">
                        <asp:Repeater ID="rptCurrent" runat="server" OnItemDataBound="rptCurrent_ItemDataBound">
                            <ItemTemplate>
                                <div class="col-md-2 pricing-col">
                                    <div class="pricing-table">
                                        <div class="pricing-table-head">
                                            <h2 class="pricing-table-head-title"><%# DataBinder.Eval(Container.DataItem, "Name") %></h2>
                                        </div><!-- /.pricing-table-head -->
                                        <div class="pricing-table-amount">
                                            <em></em>
                                        </div>
                                        <ul class="pricing-table-content">
                                            <asp:Repeater ID="rptLeagues" runat="server">
                                                <ItemTemplate>
                                                    <li>
                                                        <h5<%# (DataBinder.Eval(Container.DataItem, "AssetID").ToString() == "0" ?  " class='text-muted'" : "") %>><%# DataBinder.Eval(Container.DataItem, "Name") %></h5>
                                                        <%# (DataBinder.Eval(Container.DataItem, "AssetID").ToString() == "0" ?  "&nbsp;" : (DataBinder.Eval(Container.DataItem, "EZSchedule").ToString() == "" ? "<a data-toggle=\"modal\" class=\"text-primary\" href=\"javascript:void(0);\" onclick=\"LoadModal('mainModal', '" + page.master.RelativePath + "/League.aspx?ID=" + DataBinder.Eval(Container.DataItem, "AssetID") + "', '" + Models.Statics.EscapeSingleJS(DataBinder.Eval(Container.DataItem, "Name").ToString()) + "', '" + Models.Statics.EscapeSingleJS(DataBinder.Eval(Container.DataItem, "EZRegister").ToString()) + "');\">Register Now</a>" : "<a href=\"" + DataBinder.Eval(Container.DataItem, "EZSchedule").ToString() + "\" target=\"_blank\">Schedule / Standings</a>")) %>
                                                    </li>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </ul>
                                    </div><!-- /.pricing-table -->
                                </div><!-- /.col -->
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:Literal ID="litCurrent" runat="server" Text="<div class='col-md-12'>At this time, there are no current leagues.  Please check back again soon...</div>" />
                    </div><!-- /.row -->
                </div><!-- /.pricing-tables -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div> <!-- /.tab-pane -->
