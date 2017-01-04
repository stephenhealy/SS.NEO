<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/interior.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Volleyball.Indoor.Leagues.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    Indoor Volleyball Leagues
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <ss:league ID="League1" runat="server" ConfigID="IndoorVolleyball" Header="Leagues for <strong>every level</strong> of play!" Body="<p>If you like a well-run and organized league, you will love NEO Sports Plant Volleyball Leagues. We have 6 indoor volleyball courts with many leagues and divisions to choose from. Leagues will be no more than 9 teams in a league/division with 4 time slots per night. There will be referees for all level of play and you will play everyone in your division at least once. All teams will make playoffs. Feel free to contact us and we’ll help place you in the correct division for your team’s skill set.</p>" />
    <ss:sidebar ID="Sidebar1" runat="server" ConfigID="IndoorVolleyball" Vertical="false" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= master.RelativePath %>/js/map.js"></script>
</asp:Content>
