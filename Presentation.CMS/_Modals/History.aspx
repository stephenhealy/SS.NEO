<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/Top.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="Presentation.CMS._Modals.History" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 100%; overflow: hidden">
        <div style="position: absolute; top: 0px; left: 0px; bottom: 60px; overflow: auto; width: 99%;">
            <asp:ListView ID="lvLogs" runat="server" ItemPlaceholderID="phItem" OnPagePropertiesChanging="OnPagePropertiesChanging" OnItemDataBound="lvLogs_ItemDataBound">
                <LayoutTemplate>
                    <table class="table table-striped">
                        <tbody>
                            <asp:PlaceHolder runat="server" ID="phItem" />
                        </tbody>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="text-center">
                            <strong><%# DataBinder.Eval(Container.DataItem, "CreatedBy")%></strong>
                        </td>
                        <td class="text-right">
                            <span><%# Models.Statics.DateTimeToString(DataBinder.Eval(Container.DataItem, "CreatedOn"), Models.ParseDateTimeType.LongDateTime, master.User.TimeZone)%></span>
                        </td>
                     </tr>
                    <tr>
                        <td style="width: 15%; vertical-align: top;" class="text-center">
                           <div class="mt">
                                 <img src='<%# DataBinder.Eval(Container.DataItem, "Avatar")%>' alt="" class="img-circle thumb64">
                           </div>
                        </td>
                        <td>
                            <table class="cms-history">
                                <asp:Repeater ID="rptDetails" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <%# Lookup(DataBinder.Eval(Container.DataItem, "Field").ToString(), DataBinder.Eval(Container.DataItem, "Now").ToString(), DataBinder.Eval(Container.DataItem, "Was").ToString())%>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </td>
                     </tr>
                </ItemTemplate>
                <EmptyDataTemplate>
                    There is no history.
                </EmptyDataTemplate>
            </asp:ListView>
        </div>
        <div style="position: absolute; bottom: 0px; left: 5px; height: 50px; overflow: hidden; width: 99%;">
            Page:&nbsp;&nbsp;
            <asp:DataPager ID="pgLogs" runat="server" PagedControlID="lvLogs" PageSize="2" class="btn-group pager-buttons">
                <Fields>
                    <asp:NextPreviousPagerField ShowLastPageButton="False" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn btn-primary wait" RenderNonBreakingSpacesBetweenControls="false" />
                    <asp:NumericPagerField ButtonType="Button" RenderNonBreakingSpacesBetweenControls="false" NumericButtonCssClass="btn btn-primary wait" CurrentPageLabelCssClass="btn btn-primary disabled" NextPreviousButtonCssClass="btn" />
                    <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn btn-primary wait" RenderNonBreakingSpacesBetweenControls="false" />
                </Fields>
            </asp:DataPager>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
