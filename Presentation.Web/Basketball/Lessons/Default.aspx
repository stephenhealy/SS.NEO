<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/interior.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Basketball.Lessons.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    Basketball Lessons
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <ss:lesson ID="Lesson1" runat="server" ConfigID="Basketball" Label="Participants" Header="Looking to <strong>sharpen your skills?</strong>" Body="<p>NEO Sports Plant will be offering camps, clinics and individual or group private lessons for all ages from youth to adult with some of the best instructors in Northeast Ohio. Sharpen your skills and book a private lesson today.</p>" EmailTo="bblessons@neosportsplant.com" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
