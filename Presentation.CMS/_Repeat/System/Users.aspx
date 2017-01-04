<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/repeat.master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Presentation.CMS._Repeat.System.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="<%= master.RelativePath %>/vendor/bootstrap-jasny/jasny-bootstrap.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Buttons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Parent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Edit" runat="server">
    <div class="form-group">
        <label class="col-sm-2 control-label">First: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtFirst" runat="server" CssClass="form-control focus" MaxLength="50" />
            <asp:RequiredFieldValidator ControlToValidate="txtFirst" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator1" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Last: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtLast" runat="server" CssClass="form-control" MaxLength="50" />
            <asp:RequiredFieldValidator ControlToValidate="txtLast" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator2" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Email: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" MaxLength="50" />
            <asp:RequiredFieldValidator ControlToValidate="txtEmail" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator3" /> 
            <asp:RegularExpressionValidator ControlToValidate="txtEmail" CssClass="validation-email validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^([\w-_]+\.)*[\w-_]+@([\w-_]+\.)*[\w-_]+\.[\w-_]+$" ID="RegularExpressionValidator1" />
        </div>
    </div>
    <asp:Panel ID="panPasswordHidden" runat="server" CssClass="form-group">
        <label class="col-sm-2 control-label">Password: </label>
        <div class="col-sm-10">
            <asp:LinkButton ID="btnPassword" runat="server" Text="Change" CssClass="btn btn-primary" OnClick="btnPassword_Click" />
        </div>
    </asp:Panel>
    <asp:PlaceHolder ID="phPassword" runat="server" Visible="false">
        <div class="form-group">
            <label class="col-sm-2 control-label">Password: *</label>
            <div class="col-sm-10">
                <asp:TextBox ID="txtPassword1" runat="server" CssClass="form-control" MaxLength="50" TextMode="Password" />
                <asp:RequiredFieldValidator ControlToValidate="txtPassword1" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator4" /> 
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">Confirm: *</label>
            <div class="col-sm-10">
                <asp:TextBox ID="txtPassword2" runat="server" CssClass="form-control" MaxLength="50" TextMode="Password" />
                <asp:RequiredFieldValidator ControlToValidate="txtPassword2" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator5" /> 
                <asp:CompareValidator ControlToValidate="txtPassword2" ControlToCompare="txtPassword1" CssClass="validation-compare validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="CompareValidator1" />
            </div>
        </div>
    </asp:PlaceHolder>
    <div class="form-group">
        <label class="col-sm-2 control-label">Staff Member:</label>
        <div class="col-sm-10">
            <div class="checkbox">
                <label>
                    <asp:CheckBox ID="chkStaff" runat="server" Text="&nbsp;" />
                    <span class="text">Selecting this option will make you appear on the &quot;Our Staff&quot; page</span>
                </label>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Title:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" MaxLength="50" />
            <div><small>Your title within the organization</small></div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Biography:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtBiography" runat="server" CssClass="form-control focus" TextMode="MultiLine" Rows="5" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Picture:</label>
        <div class="col-sm-10">
            <div class="fileinput fileinput-new" data-provides="fileinput">
                <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;">
                    <asp:Literal ID="litPicture" runat="server" />
                </div>
                <div>
                    <span class="btn btn-default btn-file">
                        <span class="fileinput-new">Select image</span>
                        <span class="fileinput-exists">Change</span>
                        <asp:FileUpload ID="filPicture" runat="server" />
                    </span>
                    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                </div>
            </div>
            <div><small>Will be used in the CMS and on the &quot;Our Staff&quot; page (keep it professional)</small></div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Facebook:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtFacebook" runat="server" CssClass="form-control" MaxLength="100" />
            <div><small>Your personal facebook page (optional)</small></div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Twitter:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtTwitter" runat="server" CssClass="form-control" MaxLength="100" />
            <div><small>Your personal twitter page (optional)</small></div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Phone:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control phone" MaxLength="15" />
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
    <script src="<%= master.RelativePath %>/vendor/bootstrap-jasny/js/fileinput.js"></script>
</asp:Content>
