<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/interior.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Events.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    Events
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="layout layout-stack-sm layout-main-left">
        <div class="col-sm-8 layout-main">
            <div class="heading-block">
                <h3>Upcoming Events</h3>
            </div>

            <div class="posts">
                <asp:Repeater ID="rptUpcoming" runat="server">
                    <ItemTemplate>
                        <div class="post">
                            <div class="post-aside">
                                <div class="post-date">
                                    <span class="post-date-day"><%# Models.Statics.DateTimeToDateTime(DataBinder.Eval(Container.DataItem, "StartDate").ToString(), master.TimeZone).Day.ToString() %></span> 
                                    <span class="post-date-month"><%# Models.Statics.DateTimeToDateTime(DataBinder.Eval(Container.DataItem, "StartDate").ToString(), master.TimeZone).ToString("MMM", System.Globalization.CultureInfo.InvariantCulture) %></span> 
                                    <span class="post-date-year"><%# Models.Statics.DateTimeToDateTime(DataBinder.Eval(Container.DataItem, "StartDate").ToString(), master.TimeZone).Year.ToString() %></span>
                                </div>
                            </div><!-- /.post-aside -->
                            <div class="post-main">
                                <h3 class="post-title"><%# DataBinder.Eval(Container.DataItem, "Title") %></h3>
                                <h4 class="post-meta">Directed by <a href="mailto:<%# DataBinder.Eval(Container.DataItem, "Email") %>"><%# DataBinder.Eval(Container.DataItem, "User") %></a></h4>
                                <div class="post-content">
                                    <p><%# Models.Statics.TextToHtml(DataBinder.Eval(Container.DataItem, "Description").ToString()) %></p>
                                    <a href="mailto:<%# DataBinder.Eval(Container.DataItem, "Email") %>" class="btn btn-default">Contact Us</a>
                                    <%# DataBinder.Eval(Container.DataItem, "Link") == null || DataBinder.Eval(Container.DataItem, "Link").ToString() == "" ? "" : "<a href=\"" + DataBinder.Eval(Container.DataItem, "Link") + "\" class='btn btn-primary'>Learn More</a>" %>
                                </div><!-- /.post-content -->
                            </div><!-- /.post-main -->
                        </div><!-- /.post -->
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Literal ID="litUpcoming" runat="server" Text="<div class='col-md-12'>At this time, there are no upcoming events.  Please check back again soon...</div>" />
            </div><!-- /.posts -->
        </div><!-- /.col-sm-6 -->

        <div class="col-sm-4 layout-sidebar">
            <div class="heading-block">
                <h3>Recent Events</h3>
            </div>

            <div class="posts recent">
                <asp:Repeater ID="rptRecent" runat="server">
                    <ItemTemplate>
                        <div class="post">
                            <div class="post-aside">
                                <div class="post-date">
                                    <span class="post-date-day"><%# Models.Statics.DateTimeToDateTime(DataBinder.Eval(Container.DataItem, "StartDate").ToString(), master.TimeZone).Day.ToString() %></span> 
                                    <span class="post-date-month"><%# Models.Statics.DateTimeToDateTime(DataBinder.Eval(Container.DataItem, "StartDate").ToString(), master.TimeZone).ToString("MMM", System.Globalization.CultureInfo.InvariantCulture) %></span> 
                                    <span class="post-date-year"><%# Models.Statics.DateTimeToDateTime(DataBinder.Eval(Container.DataItem, "StartDate").ToString(), master.TimeZone).Year.ToString() %></span>
                                </div>
                            </div><!-- /.post-aside -->
                            <div class="post-main">
                                <h3 class="post-title"><%# DataBinder.Eval(Container.DataItem, "Title") %></h3>
                                <h4 class="post-meta">Directed by <a href="mailto:<%# DataBinder.Eval(Container.DataItem, "Email") %>"><%# DataBinder.Eval(Container.DataItem, "User") %></a></h4>
                                <div class="post-content">
                                    <p><%# Models.Statics.TextToHtml(DataBinder.Eval(Container.DataItem, "Description").ToString()) %></p>
                                    <a href="mailto:<%# DataBinder.Eval(Container.DataItem, "Email") %>" class="btn btn-default btn-sm">Contact Us</a>
                                    <%# DataBinder.Eval(Container.DataItem, "Link") == null || DataBinder.Eval(Container.DataItem, "Link").ToString() == "" ? "" : "<a href=\"" + DataBinder.Eval(Container.DataItem, "Link") + "\" class='btn btn-primary btn-sm'>Learn More</a>" %>
                                </div><!-- /.post-content -->
                            </div><!-- /.post-main -->
                        </div><!-- /.post -->
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Literal ID="litRecent" runat="server" Text="<div class='col-md-12'>There are no recent events.</div>" />
        </div><!-- /.col-sm-6 -->
    </div><!-- /.row -->
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
