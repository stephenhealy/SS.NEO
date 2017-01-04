<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/interior.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Company.Staff.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    Our Staff
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="heading-block heading-minimal heading-center">
        <h1>Check Out Our Amazing Team</h1>
        <p class="lead text-center"><em>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Expedita quo, quasi accusantium esse aperiam totam delectus ad deserunt sit, eveniet, voluptates, adipisci dicta! Quo accusamus natus veniam in. Ratione, fuga quasi dicta amet.</em></p>
    </div>
    <div class="row">
        <div class="col-md-10 col-md-offset-1"></div>
    </div>
    <div class="row">
        <!-- Staff -->
        <asp:Repeater ID="rptStaff" runat="server">
            <ItemTemplate>
                <div class="col-sm-4">
                    <div class="team-member">
                        <div class="team-member-img">
                            <img alt="" class="img-responsive" src="<%# DataBinder.Eval(Container.DataItem, "Image") %>">
                            <div class="team-member-info">
                                <span class="team-member-name"><%# DataBinder.Eval(Container.DataItem, "First") + " " + DataBinder.Eval(Container.DataItem, "Last") %></span> 
                                <span class="team-member-title"><%# DataBinder.Eval(Container.DataItem, "Title") %></span>
                            </div>
                        </div><!-- /.team-member-img -->
                        <div class="team-member-caption" style="word-wrap: break-word">
                            <p><%# Models.Statics.TextToHtml(DataBinder.Eval(Container.DataItem, "Bio").ToString()) %></p>
                            <div class="team-member-social">
                                <a class="social-icon" href="<%# DataBinder.Eval(Container.DataItem, "Facebook") %>"><i class="fa fa-facebook"></i></a> 
                                <a class="social-icon" href="<%# DataBinder.Eval(Container.DataItem, "Twitter") %>"><i class="fa fa-twitter"></i></a> 
                                <a class="social-icon" href="mailto:<%# DataBinder.Eval(Container.DataItem, "Email") %>"><i class="fa fa-envelope"></i></a> 
                                <em><%# Models.Statics.FormatPhone(DataBinder.Eval(Container.DataItem, "Phone").ToString()) %></em>
                            </div><!-- /.team-member-social -->
                        </div><!-- /.team-member-caption -->
                    </div><!-- /.team-member -->
                </div><!-- /.col -->
            </ItemTemplate>
        </asp:Repeater>
    </div><!-- /.row -->
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
