<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tournament.ascx.cs" Inherits="Presentation.Web._Controls.Tournament" %>
<div class="heading-block">
    <h3>Upcoming Tournaments</h3>
</div>

<ul id="myJump" class="nav nav-pills">
    <asp:Repeater ID="rptJump" runat="server">
        <ItemTemplate>
            <li>
                <a href="#<%# DataBinder.Eval(Container.DataItem, "Parent") %>" class="scrolly"><%# DataBinder.Eval(Container.DataItem, "Name") %></a>
            </li>
        </ItemTemplate>
    </asp:Repeater>
</ul>

<div class="posts">
    <asp:Repeater ID="rptUpcoming" runat="server">
        <ItemTemplate>
            <div class="post" id="<%# Models.Statics.DateTimeToDateTime(DataBinder.Eval(Container.DataItem, "Date").ToString(), page.master.TimeZone).ToString("MMM", System.Globalization.CultureInfo.InvariantCulture) %>">
                <div class="post-aside">
                    <div class="post-date">
                        <span class="post-date-day"><%# Models.Statics.DateTimeToDateTime(DataBinder.Eval(Container.DataItem, "Date").ToString(), page.master.TimeZone).Day.ToString() %></span> 
                        <span class="post-date-month"><%# Models.Statics.DateTimeToDateTime(DataBinder.Eval(Container.DataItem, "Date").ToString(), page.master.TimeZone).ToString("MMM", System.Globalization.CultureInfo.InvariantCulture) %></span> 
                        <span class="post-date-year"><%# Models.Statics.DateTimeToDateTime(DataBinder.Eval(Container.DataItem, "Date").ToString(), page.master.TimeZone).Year.ToString() %></span>
                    </div>
                </div><!-- /.post-aside -->
                <div class="post-main">
                    <h3 class="post-title"><%# DataBinder.Eval(Container.DataItem, "Name") %></h3>
                    <h4 class="post-meta">Directed by <a href="mailto:<%# DataBinder.Eval(Container.DataItem, "Email") %>"><%# DataBinder.Eval(Container.DataItem, "User") %></a></h4>
                    <div class="post-content">
                        <p><%# Models.Statics.TextToHtml(DataBinder.Eval(Container.DataItem, "Description").ToString()) %></p>
                        <h5>Entry Fee: $<%# Models.Statics.ParseDouble(DataBinder.Eval(Container.DataItem, "Cost").ToString()).ToString("F") %></h5>
                        <a href="mailto:<%# DataBinder.Eval(Container.DataItem, "Email") %>" class="btn btn-default">Contact Us</a>
                        <%# (DataBinder.Eval(Container.DataItem, "EZSchedule") != null && DataBinder.Eval(Container.DataItem, "EZSchedule").ToString() != "" ? "<a href=\"" + DataBinder.Eval(Container.DataItem, "EZSchedule") + "\" target=\"_blank\" class='btn btn-primary'>View Schedule</a>" : (DataBinder.Eval(Container.DataItem, "EZRegister") != null && DataBinder.Eval(Container.DataItem, "EZRegister").ToString() != "" ? "<a href=\"" + DataBinder.Eval(Container.DataItem, "EZRegister") + "\" target=\"_blank\" class='btn btn-primary'>Register Now</a>" : "")) %>
                    </div><!-- /.post-content -->
                </div><!-- /.post-main -->
            </div><!-- /.post -->
        </ItemTemplate>
    </asp:Repeater>
    <asp:Literal ID="litUpcoming" runat="server" Text="<div class='col-md-12'>At this time, there are no upcoming tournaments.  Please check back again soon...</div>" />
</div><!-- /.posts -->
