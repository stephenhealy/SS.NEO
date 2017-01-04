<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/Site.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BannerContent" runat="server">
<section class="home-section" style="background-color: #111; padding-top: 15px; padding-bottom: 15px; margin-top: 0px; color: #FFF; ">

        <div class="container">

          <div class="row">
            <div class="col-sm-8">
              <h3>Don't Forget . . .</h3>
              <p>Sign up for our email list and stay up to date on all activities and events as they are added.</p>
            </div>

            <div class="col-sm-4 text-center">
              <a href="#" onclick="return Subscribe()" class="btn btn-default btn-lg">&nbsp;&nbsp;&nbsp;&nbsp;Join Now!&nbsp;&nbsp;&nbsp;&nbsp;</a>
            </div>
          </div>

        </div> <!-- /.container -->

      </section>
    <div class="carousel slide carousel-fade masthead-carousel" id="masthead-carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <asp:Repeater ID="rptCarouselIndicators" runat="server">
                <ItemTemplate>
                    <li data-target="#masthead-carousel" data-slide-to="<%= Indicator++ %>" class="<%= Indicator == 1 ? "active" : "" %>"></li>
                </ItemTemplate>
            </asp:Repeater>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <asp:Repeater ID="rptCarousel" runat="server">
                <ItemTemplate>
                    <div class="item<%# Models.Statics.ParseInt(DataBinder.Eval(Container.DataItem, "AssetID").ToString()) == 0 ? " active" : "" %>" style="background-image: url(<%# master.RelativePath + DataBinder.Eval(Container.DataItem, "Image") %>);">
                        <br class="sm-10 lg-30" />
                        <div class="container">
                            <div class="row">
                                <%# (Models.Statics.ParseBool(DataBinder.Eval(Container.DataItem, "Left").ToString()) == false ? "<div class=\"col-md-6\"></div><!-- /.masthead-text -->" : "") %>
                                <div class="col-md-6 masthead-text animated fadeInDownBig">
                                    <h4 class="masthead-title"><%# DataBinder.Eval(Container.DataItem, "Title") %></h4>
                                    <%# DataBinder.Eval(Container.DataItem, "Lead") == null || DataBinder.Eval(Container.DataItem, "Lead").ToString() == "" ? "" : "<h4>" + DataBinder.Eval(Container.DataItem, "Lead") + "</h4>" %>
                                    <p><%# Models.Statics.TextToHtml(DataBinder.Eval(Container.DataItem, "Description").ToString()) %></p>
                                    <div class="masthead-actions">
                                        <a class="btn btn-primary btn-jumbo" href="<%# DataBinder.Eval(Container.DataItem, "Link") %>"><%# DataBinder.Eval(Container.DataItem, "Label") %></a>
                                    </div><!-- /.masthead-actions -->
                                </div><!-- /.masthead-text -->
                                <%# (Models.Statics.ParseBool(DataBinder.Eval(Container.DataItem, "Left").ToString()) == true ? "<div class=\"col-md-6\"></div><!-- /.masthead-text -->" : "") %>
                            </div><!-- /.row -->
                        </div><!-- /.container -->
                    </div><!-- /.item -->
                </ItemTemplate>
            </asp:Repeater>
        </div><!-- /.carousel-inner -->
    </div><!-- /.masthead-carousel -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <section class="home-section">
        <div class="container">
<div class="layout layout-stack-sm layout-main-left">
                <div class="col-sm-8 col-md-8 col-lg-9 layout-main">
                    <div class="heading-block heading-minimal heading-center">
                        <h1>Welcome to NEO Sports Plant</h1>
                        <h4 style="color: #d74b4b; margin-top: 5px">Formerly Euclid Sports Plant</h4>
                    </div>
	                <p class="">We are under new ownership and will be making several renovations through the summer to be ready for our grand re-opening in September. We will  continue to remain open all summer during our renovations. We will be running Volleyball Clinics, Camps and Private/Group Lessons. We will also be running Basketball Leagues, Tournaments, Camps, Clinics, Private/Group Lessons & Open Gyms. Court rentals for sports, parties and events are also available year round-  call for availability.</p>
	                <p class="">As part of our grand re-opening we will be putting in 4 Indoor Sand Volleyball  Courts  to go along with 6 Indoor Volleyball/4 Basketball Courts making  NEO Sports the 1st sports facility in Ohio to offer both Indoor Volleyball &  Indoor Sand Volleyball at one facility.</p>
	                <p class="semibold">If you have any questions please <a href="<%= master.RelativePath %>/Company/Contact" class="text-primary">contact us</a> at 216-288-6918.</p>
	                <p class="">We look forward to seeing old faces and meeting new people.</p>
	                <p class="">Sincerely,<br /><em>NEO Management</em></p>
                </div><!-- /.col -->
                <div class="col-sm-4 col-md-4 col-lg-3 layout-sidebar">
                    <div class="heading-block">
                        <h4>Latest News</h4>
                    </div>

                    <!-- News -->
                    <asp:Repeater ID="rptNews" runat="server">
                        <ItemTemplate>
                            <h5><%# DataBinder.Eval(Container.DataItem, "Title") %></h5>
                            <p><%# Models.Statics.TextToHtml(DataBinder.Eval(Container.DataItem, "Description").ToString()) %></p>
                            <%# DataBinder.Eval(Container.DataItem, "Link") == null || DataBinder.Eval(Container.DataItem, "Link").ToString() == "" ? "" : "<p><a href=\"" + DataBinder.Eval(Container.DataItem, "Link") + "\" class='text-primary'>Learn More...</a></p>" %>
                            <br class="xs-30">

                        </ItemTemplate>
                    </asp:Repeater>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div> <!-- /.container -->
    </section>

    <section class="home-section" style="background-color: #f3f3f3;">
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="feature-sm">
                        <h3 class="feature-sm-label">Volleyball Programs & Events</h3>
                        <p class="feature-sm-content">NEO Sports Plant offers volleyball leagues, tournaments, camps, clinics and lessons on our 6 indoor volleyball courts and 4 indoor sand volleyball courts. Come be a part of the first indoor sand and indoor sport court volleyball facility in Ohio.</p>
                        <ul class="fa-ul blog-ul">
                            <li>
                                <i class="fa-li fa fa-chevron-right"></i>
                                <a href="<%= master.RelativePath %>/Volleyball/IndoorSand/Leagues">Adult Indoor Sand Leagues</a>
                            </li>
                            <li>
                                <i class="fa-li fa fa-chevron-right"></i>
                                <a href="<%= master.RelativePath %>/Volleyball/Indoor/Tournaments">Adult Indoor Tournaments</a>
                            </li>
                            <li>
                                <i class="fa-li fa fa-chevron-right"></i>
                                <a href="<%= master.RelativePath %>/Volleyball/Indoor/Leagues">Adult Indoor Leagues</a>
                            </li>
                            <li>
                                <i class="fa-li fa fa-chevron-right"></i>
                                <a href="<%= master.RelativePath %>/Volleyball/Lessons">Camps/Clinics/Private Lessons</a>
                            </li>
                            <li>
                                <i class="fa-li fa fa-chevron-right"></i>
                                <a href="<%= master.RelativePath %>/Volleyball/Youth">Junior Olympic Volleyball</a>
                            </li>
                            <li>
                                <i class="fa-li fa fa-chevron-right"></i>
                                <a href="<%= master.RelativePath %>/Players">Player’s Connection</a>
                            </li>
                        </ul>
                    </div><!-- /.feature-sm -->
                </div><!-- /.col -->
                <div class="col-sm-4">
                    <div class="feature-sm">
                        <h3 class="feature-sm-label">Basketball Programs & Events</h3>
                        <p class="feature-sm-content">NEO Sports Plant offers basketball leagues, tournaments, camps, clinics and lessons on our 4 regulation-size basketball courts. Don’t miss out on the fun – join today!</p>
                        <ul class="fa-ul blog-ul">
                            <li>
                                <i class="fa-li fa fa-chevron-right"></i>
                                <a href="<%= master.RelativePath %>/Basketball/Leagues">Adult Leagues</a>
                            </li>
                            <li>
                                <i class="fa-li fa fa-chevron-right"></i>
                                <a href="<%= master.RelativePath %>/Basketball/Tournaments">Adult Tournaments</a>
                            </li>
                            <li style="display: none">
                                <i class="fa-li fa fa-chevron-right"></i>
                                <a href="<%= master.RelativePath %>/Basketball/Youth">Youth Programs</a>
                            </li>
                            <li>
                                <i class="fa-li fa fa-chevron-right"></i>
                                <a href="<%= master.RelativePath %>/Players">Player’s Connection</a>
                            </li>
                        </ul>
                    </div><!-- /.feature-sm -->
                </div><!-- /.col -->
                <div class="col-sm-4">
                    <div class="feature-sm">
                        <h3 class="feature-sm-label">Court Rental</h3>
                        <p class="feature-sm-content">NEO Sports Plant offers court rentals to all organizations. If you’re looking for a facility to hold practices, scrimmages or other events, we have over 40,000 square feet of space to rent. Whether you’re looking to use the basketball courts, volleyball courts or sand volleyball area, we have the ability to meet your goals. Please <a href="<%= master.RelativePath %>/Company/Contact" class="text-primary">contact us</a> for available court time.</p>
                        <ul class="fa-ul blog-ul">
                            <li>
                                <i class="fa-li fa fa-chevron-right"></i>
                                <a href="<%= master.RelativePath %>/Facility/Rental">Basketball Courts</a>
                            </li>
                            <li>
                                <i class="fa-li fa fa-chevron-right"></i>
                                <a href="<%= master.RelativePath %>/Facility/Rental">Volleyball Courts</a>
                            </li>
                            <li>
                                <i class="fa-li fa fa-chevron-right"></i>
                                <a href="<%= master.RelativePath %>/Facility/Rental">Indoor Sand Volleyball Courts</a>
                            </li>
                            <li>
                                <i class="fa-li fa fa-chevron-right"></i>
                                <a href="<%= master.RelativePath %>/Events/Host">Host an Event</a>
                            </li>
                        </ul>
                    </div><!-- /.feature-sm -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div> <!-- /.container -->
    </section>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="AfterContent" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
