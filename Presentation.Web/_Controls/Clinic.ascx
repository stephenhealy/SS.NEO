<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Clinic.ascx.cs" Inherits="Presentation.Web._Controls.Clinic" %>
<div class="layout layout-stack-sm layout-main-left">
    <div class="col-sm-8 layout-main">
        <div class="heading-block">
            <h3>Upcoming</h3>
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
                                <h5>Registration Fee: $<%# Models.Statics.ParseDouble(DataBinder.Eval(Container.DataItem, "Cost").ToString()).ToString("F") %></h5>
                                <a href="mailto:<%# DataBinder.Eval(Container.DataItem, "Email") %>" class="btn btn-default">Contact Us</a>
                                <%# DataBinder.Eval(Container.DataItem, "Link") == null || DataBinder.Eval(Container.DataItem, "Link").ToString() == "" ? "" : "<a href=\"" + DataBinder.Eval(Container.DataItem, "Link") + "\" class='btn btn-inverse'>Learn More</a>" %>
                                <%# (DataBinder.Eval(Container.DataItem, "EZRegister") != null && DataBinder.Eval(Container.DataItem, "EZRegister").ToString() != "" ? "<a href=\"" + DataBinder.Eval(Container.DataItem, "EZRegister") + "\" target=\"_blank\" class='btn btn-primary'>Register Now</a>" : "") %>
                            </div><!-- /.post-content -->
                        </div><!-- /.post-main -->
                    </div><!-- /.post -->
                </ItemTemplate>
            </asp:Repeater>
            <asp:Literal ID="litUpcoming" runat="server" Text="<div class='col-md-12'>At this time, there are no upcoming camps &amp; clinics.  Please check back again soon...</div>" />
        </div><!-- /.posts -->
    </div><!-- /.col-sm-6 -->

    <div class="col-sm-4 layout-sidebar">
        <div class="heading-block">
            <h3>Recent</h3>
        </div>

        <div class="posts recent">
            <asp:Repeater ID="rptRecent" runat="server">
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
                                <h5>Registration Fee: $<%# Models.Statics.ParseDouble(DataBinder.Eval(Container.DataItem, "Cost").ToString()).ToString("F") %></h5>
                                <a href="mailto:<%# DataBinder.Eval(Container.DataItem, "Email") %>" class="btn btn-default">Contact Us</a>
                                <%# DataBinder.Eval(Container.DataItem, "Link") == null || DataBinder.Eval(Container.DataItem, "Link").ToString() == "" ? "" : "<a href=\"" + DataBinder.Eval(Container.DataItem, "Link") + "\" class='btn btn-inverse'>Learn More</a>" %>
                                <%# (DataBinder.Eval(Container.DataItem, "EZRegister") != null && DataBinder.Eval(Container.DataItem, "EZRegister").ToString() != "" ? "<a href=\"" + DataBinder.Eval(Container.DataItem, "EZRegister") + "\" target=\"_blank\" class='btn btn-primary'>Register Now</a>" : "") %>
                            </div><!-- /.post-content -->
                        </div><!-- /.post-main -->
                    </div><!-- /.post -->
                </ItemTemplate>
            </asp:Repeater>
            <asp:Literal ID="litRecent" runat="server" Text="<div class='col-md-12'>There are no recent camps &amp; clinics.</div>" />
    </div><!-- /.col-sm-6 -->
</div><!-- /.row -->
