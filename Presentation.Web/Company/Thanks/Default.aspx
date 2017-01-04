<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/interior.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Company.Thanks.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    Your Information has been Submitted!
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="no-bold">Thank you for subscribing to <strong>NEO Sports Plant's mailing list</strong>.</h2>
    <div class="row">
        <div class="col-md-12">
            <p>We'll keep you up to date on upcoming information and events at NEO Sports Plant.</p>
            <p>If you have any questions, please don't hesitate to <a href="<%= master.RelativePath %>/Company/Contact" class="text-primary">contact our office</a> at <%= Models.Statics.FormatPhone("2164659942") %> or email us at <a href="mailto:info@neosportsplant.com">info@neosportsplant.com</a>.</p>
            <p>Thank you for your interest and we hope to see you soon!</p>
            <p><em>NEO Management</em></p>
        </div><!-- /.col -->
    </div><!-- /.row -->
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
