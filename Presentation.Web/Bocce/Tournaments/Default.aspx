<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/interior.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Bocce.Tournaments.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    Bocce Tournaments
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="layout layout-stack-sm layout-main-left">
        <div class="col-sm-8 layout-main">
            <ss:tournament ID="Tournament1" runat="server" ConfigID="Bocce" />            
        </div><!-- /.col-sm-8 -->

        <div class="col-sm-4 layout-sidebar">
            <ss:sidebar ID="Sidebar1" runat="server" ConfigID="Bocce" Vertical="true" />
        </div><!-- /.col-sm-4 -->
    </div><!-- /.row -->
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= master.RelativePath %>/js/map.js"></script>
</asp:Content>
