<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/Top.Master" AutoEventWireup="true" CodeBehind="League.aspx.cs" Inherits="Presentation.Web.League" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="league">
        <p><asp:Literal ID="litDescription" runat="server" /></p>
        <br class="xs-30">

        <h4>Deadline</h4>
        <p>The deadline for registration is <span class="semibold"><asp:Literal ID="litDeadline" runat="server" /></span></p>

        <h4>Cost</h4>
        <p>The total cost per team is <span class="semibold">$<asp:Literal ID="litCost" runat="server" /></span>.</p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
