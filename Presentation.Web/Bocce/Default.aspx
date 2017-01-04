<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/interior.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Bocce.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    Bocce
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-7">
            <h2 class="no-bold">NEO Sports Plant <strong>Indoor Bocce</strong></h2>
            <p>North East Ohio can finally play the great game of Bocce on a sand court year round! With 6 Indoor Limestone Surfaced courts we plan to become one of the best bocce destinations in the area through the winter months! Tournaments, Leagues, Parties and Open Play will all be made available to players and friends of all skill levels. NEO will have the capability of running a 64 team tournament and the software to hold the most well run, up to date leagues possible. With an adjacent 7,000Sq Ft party center and a full bar and grille being added we will be able to host all of your party needs. Feel free to <a href="<%= master.RelativePath %>/Company/Contact" class="text-primary">contact us</a> with any and all questions regarding our newly added bocce facility.</p>
            <br class="xs-30">
                    <div class="feature-sm">
                        <i class="fa fa-check-square-o feature-sm-icon text-primary"></i>
                        <h3 class="feature-sm-label">Tournaments</h3>
                        <p class="feature-sm-content">We will be hosting weekly mini tourneys as well as numerous large scale weekend long open tournaments. Look for a full schedule soon!</p>
                    </div><!-- /.feature-sm -->
                    <div class="feature-sm">
                        <i class="fa fa-check-square-o feature-sm-icon text-primary"></i>
                        <h3 class="feature-sm-label">Open Play and Rentals</h3>
                        <p class="feature-sm-content">All our courts will be open to players for use at various times. Please call for court availability and rates.</p>
                    </div><!-- /.feature-sm -->
                    <div class="feature-sm">
                        <i class="fa fa-check-square-o feature-sm-icon text-primary"></i>
                        <h3 class="feature-sm-label">League Play</h3>
                        <p class="feature-sm-content">NEO will be the home to the best ran leagues in the area! We currently host over 200 volleyball teams per week and have all the means necessary for a well-organized league. Please see our 2017 league schedule below for information and registration. Don’t hesitate at all to call us with any and all questions regarding league play. </p>
                    </div><!-- /.feature-sm -->
            <br/>
        </div><!-- /.col -->
        <div class="col-md-5">
            <br class="xs-30 sm-0">
            <div class="heading-block">
                <h4>Court Availability</h4>
            </div>
            <div>
                <asp:Literal ID="litBocce" runat="server" />
            </div>
            <br class="xs-30">
            <ss:sidebar ID="Sidebar1" runat="server" ConfigID="Bocce" Vertical="True" />
        </div><!-- /.col -->
    </div><!-- /.row -->
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= master.RelativePath %>/js/map.js"></script>
</asp:Content>
