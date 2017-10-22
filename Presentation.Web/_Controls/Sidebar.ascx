<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sidebar.ascx.cs" Inherits="Presentation.Web._Controls.Sidebar" %>
<%= this.Vertical ? "<br class=\"xs-30 sm-0\">" : "<br/><div class=\"row sidebar\"><div class=\"col-md-6\"><br class=\"xs-30\">" %>
<div class="heading-block">
    <h4>Photo Gallery</h4>
</div>
<div class="carousel slide" data-ride="carousel" id="carousel-example-generic">
    <div class="carousel-inner" role="listbox">
        <asp:Repeater ID="rptCarousel" runat="server">
            <ItemTemplate>
                <div class='item<%# Counter++ == 0 ? " active" : "" %>'><img alt='<%# DataBinder.Eval(Container.DataItem, "Alt") %>' src='<%# page.master.RelativePath + DataBinder.Eval(Container.DataItem, "Image") %>'></div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <a class="left carousel-control" data-slide="prev" href="#carousel-example-generic" role="button"><span aria-hidden="true" class="glyphicon glyphicon-chevron-left"></span> <span class="sr-only">Previous</span></a> 
    <a class="right carousel-control" data-slide="next" href="#carousel-example-generic" role="button"><span aria-hidden="true" class="glyphicon glyphicon-chevron-right"></span> <span class="sr-only">Next</span></a>
</div>
<%= this.Vertical ? "<br /><br class=\"xs-30\">" : "</div><div class=\"col-md-6\"><br class=\"xs-30\">" %>
<div class="heading-block">
    <h4>Our Location</h4>
</div>
<div style="position: relative; height: 100%; width: 100%">
    <div class="google-map chart-holder-150" id="googlemaps"></div>
</div>
<%= this.Vertical ? "<br />" : "</div></div>" %>
<!--- Requires /js/map.js -->