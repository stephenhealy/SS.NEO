<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/repeat.master" AutoEventWireup="true" CodeBehind="Carousel.aspx.cs" Inherits="Presentation.CMS._Repeat.Content.Carousel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Buttons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Parent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Edit" runat="server">
    <div class="form-group">
        <label class="col-sm-2 control-label">Title: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control focus" MaxLength="50" />
            <asp:RequiredFieldValidator ControlToValidate="txtTitle" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator1" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Lead:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtLead" runat="server" CssClass="form-control" MaxLength="100" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Description: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" />
            <asp:RequiredFieldValidator ControlToValidate="txtDescription" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator2" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Image: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtImage" runat="server" CssClass="form-control" MaxLength="100" />
            <asp:LinkButton ID="btnImage" runat="server" CssClass="btn btn-primary btn-xs browse-image" Text="Browse..." /><br />
            <div><small>Dimensions: 1920px x 1080px</small></div>
            <asp:RequiredFieldValidator ControlToValidate="txtImage" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator5" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Label: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtLabel" runat="server" CssClass="form-control" MaxLength="50" />
            <div><small>The text of the button</small></div>
            <asp:RequiredFieldValidator ControlToValidate="txtLabel" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator3" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Link: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtLink" runat="server" CssClass="form-control" MaxLength="100" />
            <asp:LinkButton ID="btnLink" runat="server" CssClass="btn btn-primary btn-xs browse-link" Text="Browse..." /><br />
            <div><small>When clicking the button, this is where to go</small></div>
            <asp:RequiredFieldValidator ControlToValidate="txtLink" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator4" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Layout: *</label>
        <div class="col-sm-10">
            <label class="radio-inline">
                <asp:RadioButton ID="radLeft" runat="server" GroupName="Layout" />
                <span class="text">Left</span>
            </label>
            <label class="radio-inline">
                <asp:RadioButton ID="radRight" runat="server" GroupName="Layout" />
                <span class="text">Right</span>
            </label>
            <div><small>Show text on the left or right of carousel</small></div>
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
