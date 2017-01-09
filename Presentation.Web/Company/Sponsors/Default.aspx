<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/interior.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Company.Sponsors.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    Our Sponsors
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <p>As part of NEO Sports Plant, we have a select group of sponsors that will provide our members with value-added services. We are trusted in the community and provide a facility for multiple sports, both youth and adults, and our demographic reach pulls a diverse group of people from both the east, west and south side of Cleveland. With more than 1,000 people coming through our doors on a weekly basis, we provide a great opportunity to advertise your company and create community partnerships.</p>
    <p><a href="<%= master.RelativePath %>/Company/Contact" class="text-primary">Contact us</a> for more information on our community partnership programs.</p>
    <br class="xs-60" />
    <div class="row">
        <asp:Repeater ID="rptSponsors" runat="server">
            <ItemTemplate>
                <div class="row"><!-- item -->
                    <div class="col-sm-2"><!-- company logo -->
                        <img alt="<%# DataBinder.Eval(Container.DataItem, "Name") %>" class="img-responsive" src="<%# DataBinder.Eval(Container.DataItem, "Logo") %>">
                    </div>
                    <div class="col-sm-10"><!-- company detail -->
                        <h4><%# DataBinder.Eval(Container.DataItem, "Name") %></h4>
                        <ul class="list-inline">
                            <li><i class="fa fa-phone text-warning"></i> <span class="text-warning"><%# Models.Statics.FormatPhone(DataBinder.Eval(Container.DataItem, "Phone")) %></span></li>
                            <li><i class="fa fa-globe text-success"></i> <a class="text-success" href='<%# master.RelativePath + "/Sponsor.aspx?i=" + Models.Statics.encryptQueryString(DataBinder.Eval(Container.DataItem, "AssetID").ToString()) %>' target="_blank"><%# DataBinder.Eval(Container.DataItem, "Web") %></a></li>
                        </ul>
                        <p><%# Models.Statics.TextToHtml(DataBinder.Eval(Container.DataItem, "Description"), false) %></p>
                        <div style="letter-spacing: 1px; font-size: 0.9em; color: #999;">
                            <%# Address(DataBinder.Eval(Container.DataItem, "Address").ToString(), DataBinder.Eval(Container.DataItem, "City").ToString(), DataBinder.Eval(Container.DataItem, "State").ToString(), DataBinder.Eval(Container.DataItem, "Zip").ToString()) %>

                        </div>
                    </div>
                </div><!-- /item -->
            </ItemTemplate>
            <SeparatorTemplate>
                <hr />
            </SeparatorTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
