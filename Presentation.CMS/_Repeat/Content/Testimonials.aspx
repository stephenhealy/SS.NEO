<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/repeat.master" AutoEventWireup="true" CodeBehind="Testimonials.aspx.cs" Inherits="Presentation.CMS._Repeat.Content.Testimonials" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Buttons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Parent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Edit" runat="server">
    <div class="form-group">
        <label class="col-sm-2 control-label">Name: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control focus" MaxLength="100" />
            <asp:RequiredFieldValidator ControlToValidate="txtName" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator2" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Company: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtCompany" runat="server" CssClass="form-control" MaxLength="100" />
            <asp:RequiredFieldValidator ControlToValidate="txtCompany" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator1" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Testimonial: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtTestimonial" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" />
            <asp:RequiredFieldValidator ControlToValidate="txtTestimonial" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator3" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Email:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" MaxLength="100" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Image:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtImage" runat="server" CssClass="form-control" MaxLength="100" />
            <asp:LinkButton ID="btnImage" runat="server" CssClass="btn btn-primary btn-xs browse-image" Text="Browse..." /><br />
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
