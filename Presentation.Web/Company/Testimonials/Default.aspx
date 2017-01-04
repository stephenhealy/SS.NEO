<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/interior.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Company.Testimonials.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    Our Sponsors
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="heading-block heading-minimal heading-center">
        <h1>What People are Saying...</h1>
        <p class="lead text-center"></p>
    </div><!-- /.heading-block -->
    <div class="row">
        <asp:Repeater ID="rptTestimonials" runat="server">
            <ItemTemplate>
                <div class="col-sm-6 col-md-4">
                    <div class="testimonial">
                        <div class="testimonial-icon bg-secondary">
                            <i class="fa fa-quote-left"></i>
                        </div><!-- /.testimonial-icon -->
                        <div class="testimonial-content">
                            <%# Models.Statics.TextToHtml(DataBinder.Eval(Container.DataItem, "Testimonial1").ToString()) %>
                        </div><!-- /.testimonial-content -->
                        <div class="testimonial-author">
                            <div class="testimonial-image"><%# String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "Image").ToString()) ? "" : "<img alt='' src='" + DataBinder.Eval(Container.DataItem, "Image").ToString() + "' />" %></div>
                            <div class="testimonial-author-info">
                                <h5><%# String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "Email").ToString()) ? DataBinder.Eval(Container.DataItem, "Name") : "<a href='mailto:" + DataBinder.Eval(Container.DataItem, "Email").ToString() + "'>" + DataBinder.Eval(Container.DataItem, "Name") + "</a>" %></h5><%# DataBinder.Eval(Container.DataItem, "Company") %>
                            </div>
                        </div><!-- /.testimonial-author -->
                    </div><!-- /.testimonial -->
                    <br class="xs-30">
                </div><!-- /.col -->
            </ItemTemplate>
        </asp:Repeater>
    </div><!-- /.row -->
    <br class="xs-30">
    <p class="text-center">Have something to say? <a href="<%= master.RelativePath %>/Company/Contact" class="text-primary">Send us your comments</a> and you may end up here...</p>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
