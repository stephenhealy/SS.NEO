<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/interior.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Company.About.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    About Us
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-7">
            <p>Our company is based on the belief that our customers' needs are of the utmost importance. Our entire team is committed to meeting those needs. As a result, a high percentage of our business is from repeat customers and referrals. </p>
            <p>We would welcome the opportunity to earn your trust and deliver you the best service in the industry.  Please feel free to contact us and we can help you host your next indoor sporting event, birthday party, tournament, or practice at our facility. We look forward to <a href="<%= master.RelativePath %>/Company/Contact" class="text-primary">hearing from you</a>!</p>
        </div><!-- /.col -->
        <div class="col-md-5">
            <br class="xs-30 sm-0">
            <div class="heading-block">
                <h4>Our Location</h4>
            </div>
            <div class="google-map chart-holder-150" id="googlemaps"></div><br>
            <a class="btn btn-default btn-block" href="<%= master.RelativePath %>/Company/Contact/">Contact Us!</a>
        </div><!-- /.col -->
    </div><!-- /.row -->
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= master.RelativePath %>/js/map.js"></script>
</asp:Content>
