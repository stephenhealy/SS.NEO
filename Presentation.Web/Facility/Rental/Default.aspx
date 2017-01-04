<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/interior.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Facility.Rental.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    Court Rental
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-7">
            <h2 class="no-bold">Where most of your sports and entertainment needs are met - <strong>under one roof!</strong></h2>
            <p>NEO Sports Plant offers court rentals to all organizations. If you’re looking for a facility to hold practices, scrimmages or other events, we have over 40,000 square feet of space to rent. Whether you’re looking to use the basketball courts, volleyball courts or sand volleyball area, we have the ability to meet your goals. We rent space either hourly or in blocks or time either weekly or monthly. Please <a href="<%= master.RelativePath %>/Company/Contact" class="text-primary">contact us</a> for available court time.</p>
            <div class="row">
                <div class="col-sm-6">
                    <div class="feature-sm">
                        <i class="fa fa-check-square-o feature-sm-icon text-primary"></i>
                        <h3 class="feature-sm-label">Basketball Courts</h3>
                        <p class="feature-sm-content">We offer 4 regulation-size indoor basketball courts for leagues, camps, clinics, lessons or tournaments. Bring your event to us!</p>
                    </div><!-- /.feature-sm -->
                    <div class="feature-sm">
                        <i class="fa fa-check-square-o feature-sm-icon text-primary"></i>
                        <h3 class="feature-sm-label">Volleyball Courts</h3>
                        <p class="feature-sm-content">6 indoor volleyball courts consist of sport court and are available to rent for leagues, camps, clinics, lessons or tournaments.</p>
                    </div><!-- /.feature-sm -->
                </div>
                <div class="col-sm-6">
                    <div class="feature-sm">
                        <i class="fa fa-check-square-o feature-sm-icon text-primary"></i>
                        <h3 class="feature-sm-label">Sand Volleyball Area</h3>
                        <p class="feature-sm-content">4 indoor sand volleyball courts consisting of over 16,000 square feet of space sectioned off privately from the indoor volleyball/basketball facility. Space is available to rent for athletic training, indoor sand soccer, dodgeball or other leisurely activities. Contact us for more information.</p>
                    </div><!-- /.feature-sm -->
                </div>
            </div><!-- /.row -->
        </div><!-- /.col -->
        <div class="col-md-5">
            <br class="xs-30 sm-0">
            <div class="heading-block">
                <h4>Our Facility</h4>
            </div>
            <div class="carousel slide" data-ride="carousel" id="carousel-example-generic">
                <ol class="carousel-indicators">
                    <li class="active" data-slide-to="0" data-target="#carousel-example-generic"></li>
                    <li class="" data-slide-to="1" data-target="#carousel-example-generic"></li>
                    <li class="" data-slide-to="2" data-target="#carousel-example-generic"></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <div class="item active"><img alt="Facility #1" src="<%= master.RelativePath %>/img/facility1.jpg"></div>
                    <div class="item"><img alt="Facility #2" src="<%= master.RelativePath %>/img/facility2.jpg"></div>
                    <div class="item"><img alt="Facility #3" src="<%= master.RelativePath %>/img/facility3.jpg"></div>
                </div><a class="left carousel-control" data-slide="prev" href="#carousel-example-generic" role="button"><span aria-hidden="true" class="glyphicon glyphicon-chevron-left"></span> <span class="sr-only">Previous</span></a> <a class="right carousel-control" data-slide="next" href="#carousel-example-generic" role="button"><span aria-hidden="true" class="glyphicon glyphicon-chevron-right"></span> <span class="sr-only">Next</span></a>
            </div><br class="xs-60">
            <div class="heading-block">
                <h4>Our Location</h4>
            </div>
            <div class="google-map chart-holder-150" id="googlemaps"></div><br>
            <a class="btn btn-default btn-block" href="<%= master.RelativePath %>/Contact/">Contact Us!</a>
        </div><!-- /.col -->
    </div><!-- /.row -->
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= master.RelativePath %>/js/map.js"></script>
</asp:Content>
