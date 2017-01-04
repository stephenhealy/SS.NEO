<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/players.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Players.SeekingPlayers.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="heading-block">
                <h3>Teams Seeking Players</h3>
            </div>
        </div>
        <div class="col-md-12">
            <span class="text-lg">Are you seeking a player?</span> <a href="<%= master.RelativePath %>/Players/SeekingPlayer" class="text-primary text-lg">Click Here</a>
            <div class="pull-right">
                <div class="checkbox">
                    <label>
                        <asp:CheckBox ID="chkFilled" runat="server" Text="" AutoPostBack="true" OnCheckedChanged="chkFilled_CheckedChanged" />
                        <span class="text">Include requests that have been filled</span>
                    </label>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:ListView ID="lstTeams" runat="server" ItemPlaceholderID="phItem" OnPagePropertiesChanging="lstTeams_PagePropertiesChanging" OnItemDataBound="lstTeams_ItemDataBound">
                <LayoutTemplate>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Contact</th>
                                <th>Description</th>
                                <th>Position(s)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:PlaceHolder ID="phItem" runat="server" />
                        </tbody>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# DataBinder.Eval(Container.DataItem, "First")%> <%# DataBinder.Eval(Container.DataItem, "Last")%>
                            <br />
                            <%# DataBinder.Eval(Container.DataItem, "Email").ToString() == "" ? "<em>Private Email</em>" : "<a href='mailto:" + DataBinder.Eval(Container.DataItem, "Email") + "'>" + DataBinder.Eval(Container.DataItem, "Email") + "</a>" %>
                            <br />
                            <%# DataBinder.Eval(Container.DataItem, "Phone").ToString() == "" ? "<em>Private Phone</em>" : Models.Statics.FormatPhone(DataBinder.Eval(Container.DataItem, "Phone").ToString())%>
                            <br />
                            <%# Models.Statics.ParseInt(DataBinder.Eval(Container.DataItem, "AssetID").ToString()) == player.AssetID ? "<a href=" + master.RelativePath + "/Players/SeekingPlayer/?ID=" + DataBinder.Eval(Container.DataItem, "ID") + " class='btn btn-secondary btn-xs'>Update</a>" : "" %>
                        </td>
                        <td>
                            <span class="text-primary"><%# DataBinder.Eval(Container.DataItem, "Team")%></span> is searching for the following...<br />
                            <em><%# Models.Statics.TextToHtml(DataBinder.Eval(Container.DataItem, "Description").ToString()) %></em><br />
                            <span class="text-success" style='display:<%# DataBinder.Eval(Container.DataItem, "Filled") == null ? "none" : "inline"%>'><br /><small>Filled On <%# (DataBinder.Eval(Container.DataItem, "Filled") == null ? "" : Models.Statics.DateTimeToString(DataBinder.Eval(Container.DataItem, "Filled"), Models.ParseDateTimeType.LongDateTime, master.TimeZone)) %></small></span>
                        </td>
                        <td><asp:Label ID="lblPositions" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID")%>' /></td>
                    </tr>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <tr>
                        <td colspan="5"><p>At this time, there are no teams seeking players. Check back soon!</p></td>
                    </tr>
                </EmptyDataTemplate>
            </asp:ListView>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:DataPager ID="dpTeams" runat="server" PagedControlID="lstTeams" PageSize="10">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="btn btn-default btn-sm" />
                </Fields>
            </asp:DataPager> 
            <div class="pull-right text-primary">Page <%= CurrentPage %> of <%= Pages %></div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
