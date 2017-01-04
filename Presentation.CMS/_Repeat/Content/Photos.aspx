<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/repeat.master" AutoEventWireup="true" CodeBehind="Photos.aspx.cs" Inherits="Presentation.CMS._Repeat.Content.Photos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Buttons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Parent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Edit" runat="server">
    <div class="form-group">
        <label class="col-sm-2 control-label">Album: *</label>
        <div class="col-sm-10">
            <asp:DropDownList ID="ddlAlbum" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ControlToValidate="ddlAlbum" CssClass="validation-required validation-text" ValidationGroup="valSave" InitialValue="0" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator1" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Title: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control focus" MaxLength="50" />
            <div><small>Will not be displayed on the site - internal reference only.</small></div>
            <asp:RequiredFieldValidator ControlToValidate="txtTitle" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator2" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Caption: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtCaption" runat="server" CssClass="form-control focus" MaxLength="100" />
            <div><small>Will be displayed underneath the image.</small></div>
            <asp:RequiredFieldValidator ControlToValidate="txtCaption" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator3" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Image: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtImage" runat="server" CssClass="form-control" MaxLength="100" />
            <asp:LinkButton ID="btnImage" runat="server" CssClass="btn btn-primary btn-xs browse-image" Text="Browse..." /><br />
            <asp:RequiredFieldValidator ControlToValidate="txtImage" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator5" /> 
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
</asp:Content>
