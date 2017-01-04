<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Advertisement.ascx.cs" Inherits="Presentation.Web._Controls.Advertisement" %>
<!-- Advertisement -->
<div class="row">
    <div class="col-sm-8">
        <div style="color: #999;"><small>Sponsored Advertisement</small></div>
        <br class="xs-10">
        <h2><asp:Literal ID="litHeading" runat="server" /></h2>
        <p class="lead"><asp:Literal ID="litMessage" runat="server" /></p>
    </div><!-- /.col -->
    <div class="col-sm-4 text-center">
        <br class="xs-30">
        <asp:Literal ID="litAbove" runat="server" />
        <br class="xs-30">
        <asp:HyperLink ID="hypLink" runat="server" CssClass="btn btn-primary btn-lg" Target="_blank" />
        <br class="xs-30">
    </div><!-- /.col -->
</div><!-- /.row -->
