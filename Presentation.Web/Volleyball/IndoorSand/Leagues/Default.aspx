<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/interior.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Volleyball.IndoorSand.Leagues.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    Indoor Sand Volleyball Leagues
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <ss:league ID="League1" runat="server" ConfigID="IndoorSandVolleyball" Header="Play year-round sand in <strong>Cleveland’s 1<sup>st</sup> indoor sand volleyball</strong> facility!" Body="<p>NEO Sports Plant is excited to be the 1<sup>st</sup> indoor sand facility in Cleveland since the 90's. We are the only facility in Ohio to offer indoor sand and indoor volleyball under one roof. We have 4 sand courts offering all levels of play for the advanced competitor to the casual recreational fan. Leagues are every night of the week and consist of the following formats: Co-ed 6's, Co-ed 4's, Men's 2's and Women's 2's. Feel free to contact us and we’ll help place you in the correct division for your team’s skill set.</p>" />
    <ss:sidebar ID="Sidebar1" runat="server" ConfigID="IndoorSandVolleyball" Vertical="false" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= master.RelativePath %>/js/map.js"></script>
</asp:Content>
