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
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#masthead-carousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#masthead-carousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
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
	                <p class="">Located in Northeast  Ohio, the newly renovated NEO Sports Plant is a Multi-Sports complex and sports bar offering a  variety of athletic activities and leagues. We are the only facility in  Northeast Ohio to offer both Indoor Sand Volleyball and Indoor Volleyball.  With 4 indoor sand volleyball courts, spacious indoor deck, adjacent bar, kitchen and 6 indoor volleyball courts/4 basketball courts, we are able to offer something for everyone. We also offer basketball leagues, lessons and clinics, indoor bocce, baseball, court rentals, soccer clinics, ping-pong tournaments and sports specific performance training. Our  mission is to provide enjoyable, quality and affordable sports leagues that  accommodate every skill and competition level. Our onsite bar and grille is  sure to enhance your playing experience fun. Come check us out!</p>
                    <p class="">&nbsp;</p>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="img-border">
                                <img src="img/square/sandvball.gif" alt="Indoor Sand Volleyball" />
                            </div>
                            <h4>Fall 2017 League Schedules Coming Soon</h4>
                            <ul class="min-list">
                                <li><a href="https://neosportsplant.ezleagues.ezfacility.com/leagues.aspx" target="_blank">View League Schedules</a></li>
                                <li><a href="Volleyball/IndoorSand/Tournaments/Default.aspx">View Tournament Schedules</a></li>
                            </ul>
                            <div style="margin-top: 10px">
                                <p style="font-weight: 600">Join Us Saturday, April 22nd for Co-ed 4's Sand Tournament - $80 - <a href="https://tms.ezfacility.com/OnlineRegistrations/Register.aspx?CompanyID=5325&amp;GroupID=1826400" target="_blank">Register here</a></p>
                                <p style="font-weight: 600">Developmental Beach Program - 7-9th Grade - Starts May 22 - <a href="http://neosportsplant.com/Volleyball/Clinics/">Learn More</a></p>
                                <p style="font-weight: 600">Developmental Beach Program - 10-12th Grade - Starts May 23 - <a href="http://neosportsplant.com/Volleyball/Clinics/">Learn More</a></p>
                                <p style="font-weight: 600">&nbsp;</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="img-border">
                                <img src="img/square/indoorvball.gif" alt="Indoor Volleyball" />
                            </div>
                            <h4>Fall 2017 League Schedules Coming Soon</h4>
                            <ul class="min-list">
                                <li><a href="https://neosportsplant.ezleagues.ezfacility.com/leagues.aspx" target="_blank">View League Schedules</a></li>
                                <li><a href="Volleyball/Indoor/Tournaments/Default.aspx">View Tournament Schedules</a></li>
                                <li><a href="Volleyball/NEOVC/Default.aspx">NEOVC JO Volleyball Program</a></li>
                            </ul>
                            <div style="margin-top: 10px">
                              <p style="font-weight: 600">Join Us for Sunday Skills Sessions on Sunday, March 19th - April 16th 1-2pm; $60 registration fee. <a href="http://neosportsplant.com/Volleyball/Clinics/">More info</a></p>
                                <p style="font-weight: 600">Youth Summer Volleyball Camps - <a href="http://neosportsplant.com/Volleyball/Clinics/">Learn More</a></p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="img-border">
                                <img src="img/square/sportsperform.gif" alt="Sports Performance" />
                            </div>
                            <h4>Taking athletes to the next level!</h4>
                            <p>Get unlimited speed, agility and resistance training for <strong>as low as $7 </strong>per class.</p>
                            <p>Or sign up for <strong>12 weeks</strong> of performance training for $360.</p>
                            <p><a href="Performance/Default.aspx">Learn More</a></p>
                            <p>Download our <a href="SportsPerformanceFlyer_85x11.pdf" target="_blank">Sports Performance Flyer</a></p>
                        </div>
                    </div>

                    <br class="xs-30">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="img-border">
                                <img src="img/square/indoorbocce.gif" alt="Indoor Bocce" />
                            </div>
                            <h4>NEO Grand Opening - 4 man teams - Saturday, May 20th - $100/team; 8:30a.m.                           </h4>
                            <ul>
                              <li><a href="https://tms.ezfacility.com/OnlineRegistrations/Register.aspx?CompanyID=5325&amp;GroupID=1833693" target="_blank">Register for our grand opening tournament on May 20th</a></li>
                            </ul>
                            <div style="margin-top: 10px">
                                <span style="font-weight: 600">More information on open Bocce play coming soon</span>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="img-border">
                                <img src="img/square/daycamps.gif" alt="Day Camps" />
                            </div>
                            <h4>Register for our Kids Camps!</h4>
                            <p><span style="font-weight: 600">NEO Summer Camp</span> - May 29th thru August 11th</p>
                            <ul class="min-list">
                              <li><a href="http://neosportsplant.com/documents/Day%20Camp%20Flyer_lr.pdf" target="_blank">Download our NEO Summer Camp Flyer</a></li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <div class="img-border">
                                <img src="img/square/events.gif" alt="Parties & Events" />
                            </div>
                            <h4>Book Your Next Party or Event With Us!</h4>
                            <p>Book your sports specific birthday party, use our sand courts for the kids to play while the adults enjoy our bar and grille, host a fundraiser or reverse raffle.</p>
                            <p><a href="Events/Host/Default.aspx">Contact Us</a> for more details.</p>
                        </div>
                    </div>
                </div><!-- /.col -->
                <div class="col-sm-4 col-md-4 col-lg-3 layout-sidebar">
                    <asp:PlaceHolder ID="phFeatured" runat="server" Visible="false">
                        <div class="heading-block">
                            <h4>Featured Sponsor</h4>
                        </div>

                        <div class="team-member" style="display: inline-block;">
                            <div class="team-member-img">
                                <asp:HyperLink ID="hypFeatured" runat="server" Target="_blank">
                                    <asp:Image ID="imgFeatured" runat="server" ImageAlign="AbsMiddle" />
                                </asp:HyperLink>
                            </div>
                        </div>
                        <br class="xs-30">
                    </asp:PlaceHolder>
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
                        <h3 class="feature-sm-label">Sports Performance</h3>
                        <p class="feature-sm-content">We are a group of educated Strength &amp; Conditioning coaches dedicated   to take your athletic abilities to the next level.  We don&rsquo;t just train   our athlete&rsquo;s, but educate them on what they are doing, why they are   doing it and how to do it correctly.  Our Strength &amp; Conditioning   coaches also educate athletes how to become motivated and focused inside   and outside the gym, field, and courts to achieve complete wellness. A unique advantage of training at the NEO Sports Plant is the ability to train year round in our 4 sand volleyball courts.</p>
                        <ul class="fa-ul blog-ul">
                            <li>
                                <i class="fa-li fa fa-chevron-right"></i>
                                <a href="/Performance/About/">About Us</a>
                            </li>
                            <li>
                                <i class="fa-li fa fa-chevron-right"></i>
                                <a href="/Performance/Training/">Performance Training</a>
                            </li>
                            <li style="display: none">
                                <i class="fa-li fa fa-chevron-right"></i>
                                <a href="<%= master.RelativePath %>/Basketball/Youth">Youth Programs</a>
                            </li>
                            <li> <i class="fa-li fa fa-chevron-right"></i>
                            <a href="/Performance/FAQs/">FAQ's</a>
                            </li>
                            <li><i class="fa-li fa fa-chevron-right"></i>
                            Download our <a href="SportsPerformanceFlyer_85x11.pdf" target="_blank">Sports Performance Flyer</a></li>
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
    <script type="text/javascript">
    var _mfq = _mfq || [];
      (function() {
        var mf = document.createElement("script");
        mf.type = "text/javascript"; mf.async = true;
        mf.src = "//cdn.mouseflow.com/projects/2ee6c0a0-9172-441b-854e-8788179f2a0b.js";
        document.getElementsByTagName("head")[0].appendChild(mf);
      })();
    </script>
</asp:Content>
