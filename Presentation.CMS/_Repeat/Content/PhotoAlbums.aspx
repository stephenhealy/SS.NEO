<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/repeat.master" AutoEventWireup="true" CodeBehind="PhotoAlbums.aspx.cs" Inherits="Presentation.CMS._Repeat.Content.PhotoAlbums" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Buttons" runat="server">
    <asp:HyperLink ID="hypImport" runat="server" CssClass="btn btn-primary" Visible="false" Text="<em class='fa fa-download fa-rotate-90'></em> Import Photos" NavigateUrl="javascript:void(0);">
        <span class="fa-stack">
            <i class="fa fa-folder fa-stack-1x"></i>
            <i class="fa fa-plus fa-stack-1x stacked"></i>
        </span> Import Photos
    </asp:HyperLink>
    <asp:LinkButton ID="btnImages" runat="server" CssClass="btn btn-primary" Visible="false" OnClick="btnImages_Click">
        <span class="fa-stack">
            <i class="fa fa-folder fa-stack-1x"></i>
            <i class="fa fa-times fa-stack-1x stacked"></i>
        </span> Delete Photos
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Parent" runat="server">
    <th style="width:80px">
        Photos
    </th>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Edit" runat="server">
    <div class="form-group">
        <label class="col-sm-2 control-label">Category: *</label>
        <div class="col-sm-10">
            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ControlToValidate="ddlCategory" CssClass="validation-required validation-text" ValidationGroup="valSave" InitialValue="0" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator1" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Name: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control focus" MaxLength="50" />
            <asp:RequiredFieldValidator ControlToValidate="txtName" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator2" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Enabled:</label>
        <div class="col-sm-10">
            <div class="checkbox">
                <label>
                    <asp:CheckBox ID="chkEnabled" runat="server" Checked="true" />
                    <span class="text"></span>
                </label>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
    <script>
        function ParentColumn() {
            return "ParentID";
        }
    </script>
</asp:Content>
