<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/Site.master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Presentation.CMS.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="layout layout-stack-sm layout-main-left">
        <div class="col-sm-7 col-md-8 layout-main">
            <div class="portlet portlet-default">
                <div class="portlet-header">
                    <h4 class="portlet-title">Your Dashboard</h4>
                </div><!-- /.portlet-header -->
                <div class="portlet-body">
                    <asp:ListView ID="lstAction" runat="server">
                        <ItemTemplate>
                            <div class="row-stat">
                                <i class="fa fa-<%# DataBinder.Eval(Container.DataItem, "Icon") %> text-<%# DataBinder.Eval(Container.DataItem, "Css") %> fa-3x pull-left" style="margin: .2em .3em .8em;"></i> 
                                <p><%# DataBinder.Eval(Container.DataItem, "Message") %></p>
                                <a href="<%# Link(DataBinder.Eval(Container.DataItem, "Link").ToString(), DataBinder.Eval(Container.DataItem, "ID").ToString()) %>" class="btn btn-<%# DataBinder.Eval(Container.DataItem, "Css") %>"><%# DataBinder.Eval(Container.DataItem, "Label") %></a>
                                <%# Email(DataBinder.Eval(Container.DataItem, "Email")) %>
                                <%# Phone(DataBinder.Eval(Container.DataItem, "Phone")) %>
                            </div>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            No action required.
                        </EmptyDataTemplate>
                    </asp:ListView>
                </div><!-- /.portlet-body -->
            </div><!-- /.portlet -->
        </div><!-- /.layout-main -->
        <div class="col-sm-5 col-md-4 layout-sidebar">
            <div class="portlet portlet-default">
                <div class="portlet-header">
                    <h4 class="portlet-title">Court Availability</h4>
                </div><!-- /.portlet-header -->
                <div class="portlet-body">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#Bocce" data-toggle="tab">Bocce</a>
                        </li>
                        <li>
                            <a href="#Volleyball" data-toggle="tab">Volleyball</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade active in" id="Bocce">
                            <div class="form-group">
                                <label>Bocce Court Message:</label>
                                <asp:TextBox ID="txtBocce" runat="server" CssClass="form-control focus" TextMode="MultiLine" Rows="3" />
                                <asp:RequiredFieldValidator ControlToValidate="txtBocce" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator4" /> 
                            </div>
                        </div>
                        <div class="tab-pane fade" id="Volleyball">
                            <div class="form-group">
                                <label>Volleyball Court Message:</label>
                                <asp:TextBox ID="txtVolleyball" runat="server" CssClass="form-control focus" TextMode="MultiLine" Rows="3" />
                                <asp:RequiredFieldValidator ControlToValidate="txtVolleyball" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator1" /> 
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:LinkButton ID="btnCourts" runat="server" CssClass="btn btn-secondary" Text="<em class='fa fa-check'></em> Save Messages" OnClick="btnCourts_Click" OnClientClick="return DoValidation('valSave',this);" />
                    </div>
                </div>
                <a class="btn btn-primary btn-jumbo btn-block" href="<%= master.RelativePath %>/_Repeat/Athletics/Leagues.aspx?ID=0">New League</a><br>
                <a class="btn btn-warning btn-lg btn-block" href="<%= master.RelativePath %>/_Repeat/Athletics/Sessions.aspx?ID=0">New Session</a>
                <a class="btn btn-success btn-md btn-block" href="<%= master.RelativePath %>/_Modals/Export.aspx">Export Players Connection</a>
            </div><!-- /.portlet -->
            <h4>Recent Activity</h4>
            <div class="well">
                <ul class="icons-list text-md">
                    <asp:ListView ID="lstActivity" runat="server">
                        <ItemTemplate>
                            <li>
                                <i class="icon-li fa fa-check-square text-secondary"></i> 
                                <strong class="semibold"><%# Models.Statics.DateTimeToString(DataBinder.Eval(Container.DataItem, "CreatedOn"), Models.ParseDateTimeType.LongDateTime, master.User.TimeZone)%></strong><br />
                                <span class="text-primary"><%# GetIt(DataBinder.Eval(Container.DataItem, "Avatar").ToString(), DataBinder.Eval(Container.DataItem, "AssetID").ToString()) %></span> was modified in <strong class="semi-bold"><%# DataBinder.Eval(Container.DataItem, "Avatar") %></strong> by <em><%# DataBinder.Eval(Container.DataItem, "CreatedBy") %></em>
                            </li>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <li>
                                No recent activity.
                            </li>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </ul>
            </div><!-- /.well -->
        </div><!-- /.layout-sidebar -->
    </div><!-- /.layout -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
