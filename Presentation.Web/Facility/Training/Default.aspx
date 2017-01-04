<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/interior.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Facility.Training.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    Training
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h2 class="no-bold">Athletic and Sports Specific Training!<strong></strong></h2>
            <p>NEO Sports Plant will be offering Athletic and Sports Specific Training. More information coming soon.</p>
            <p>For questions, please <a href="<%= master.RelativePath %>/Company/Contact" class="text-primary">contact our office</a> at <%= Models.Statics.FormatPhone("2164659942") %> or email us at <a href="mailto:info@neosportsplant.com" class="text-primary">info@neosportsplant.com</a>.</p>
          <p class="lead"><br class="xs-30">
          </p>
        </div>
        <!-- /.col -->
    </div><!-- /.row -->
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
