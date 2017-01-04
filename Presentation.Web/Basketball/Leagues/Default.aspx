<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/interior.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Basketball.Leagues.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    Basketball Leagues
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <ss:league ID="League1" runat="server" ConfigID="Basketball" Header="Leagues for every level of <strong>play!</strong>" Body="<p>NEO Sports Plant will be offering Basketball Leagues year round to cater to all. We have 4 indoor basketball courts with many leagues and divisions to choose from. There will be referees for all levels of play along with a score keeper. Feel free to contact us and we’ll help place you in the correct division for your team’s skill set.</p>" />            
    <ss:sidebar ID="Sidebar1" runat="server" ConfigID="Basketball" Vertical="false" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= master.RelativePath %>/js/map.js"></script>
</asp:Content>
