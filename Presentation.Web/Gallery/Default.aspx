<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/interior.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Gallery.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="<%= master.RelativePath %>/vendor/magnific-popup/dist/magnific-popup.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    Photo Gallery
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-feature">
        <div id="accordion" class="container">
            <asp:Repeater ID="rptCategories" runat="server" OnItemDataBound="rptCategory_ItemDataBound">
                <ItemTemplate>
                    <div class="portlet">
                        <div class="heading-block">
                            <h3 class="album" data-href="album-<%# DataBinder.Eval(Container.DataItem, "AssetID") %>">
                                <%# DataBinder.Eval(Container.DataItem, "Name") %>
                                <asp:Label ID="lblAlbums" runat="server" />
                            </h3>
                        </div>
                    </div>
                    <div id='album-<%# DataBinder.Eval(Container.DataItem, "AssetID") %>' class="row collapse">
                        <asp:ListView ID="lstAlbums" runat="server" ItemPlaceholderID="phItem" OnItemDataBound="lstAlbums_ItemDataBound">
                            <ItemTemplate>
                                <div class="col-sm-3">
                                    <div class="feature-grab">
                                        <div class="thumbnail-view">
                                            <asp:HyperLink ID="lnkFirst" runat="server" CssClass="gallery-link thumbnail-view-hover">
                                                <i class="fa fa-plus"></i>
                                            </asp:HyperLink>
                                            <asp:Image ID="imgFirst" runat="server" />
                                        </div><!-- /.thumbnail-view -->
                                        <h4 style="margin-bottom: 0"><%# DataBinder.Eval(Container.DataItem, "Name") %></h4>
                                        <div class="gallery">
                                            <asp:Repeater ID="rptPhotos" runat="server">
                                                <ItemTemplate>
                                                    <a href="<%# DataBinder.Eval(Container.DataItem, "Image") %>" title="<%# DataBinder.Eval(Container.DataItem, "Caption") %>"></a>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <p><asp:Label ID="lblPhotos" runat="server" CssClass="text-primary" /></p>
                                    </div><!-- /.feature-grab -->
                                </div><!-- /.col -->
                            </ItemTemplate>
                            <EmptyDataTemplate>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </div><!-- /.row -->
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= master.RelativePath %>/vendor/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
    <script>
        var current_albumID = null;
        $(document).ready(function () {
            $('.album').on('click', function () {
                // Remove old
                $(".active-album").removeClass("active-album");
                $(".collapse").slideUp("fast");
                var albumID = $(this).data("href");
                if (current_albumID != albumID) {
                    current_albumID = albumID;
                    // Add new
                    $(this).addClass("active-album");
                    $("#" + albumID).slideDown("slow");
                }
                else
                    current_albumID = "";
            });
            $('.gallery-link').on('click', function () {
                $(this).closest(".feature-grab").find('.gallery').magnificPopup('open');
            });
            //$('.gallery-link').on('click', function () {
            //    alert('here');
            //    $(this).next().magnificPopup('open');
            //});

            $('.gallery').each(function () {
                $(this).magnificPopup({
                    delegate: 'a',
                    type: 'image',
                    gallery: {
                        enabled: true,
                        navigateByImgClick: true
                    },
                    fixedContentPos: false
                });
            });
        });
    </script>
</asp:Content>
