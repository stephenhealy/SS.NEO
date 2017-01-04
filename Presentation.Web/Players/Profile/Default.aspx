<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/players.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Players.Profile.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <div class="heading-block">
                <h3>Profile</h3>
            </div>

            <div class="form form-horizontal">
                <div class="form-group">
                    <label class="control-label col-sm-2">Email <span>*</span>:</label>
                    <div class="col-md-4 col-sm-6">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" MaxLength="100" />
                        <asp:RequiredFieldValidator ControlToValidate="txtEmail" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator9" /> 
                        <asp:RegularExpressionValidator ControlToValidate="txtEmail" CssClass="validation-email validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^([\w-_]+\.)*[\w-_]+@([\w-_]+\.)*[\w-_]+\.[\w-_]+$" ID="RegularExpressionValidator1" />
                    </div> <!-- /.col -->
                </div>
                <asp:Panel ID="panPassword" runat="server" Visible="false" CssClass="form-group">
                    <label class="control-label col-sm-2">Password <span>*</span>:</label>
                    <div class="col-md-3 col-sm-5">
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" MaxLength="50" TextMode="Password" />
                        <asp:RequiredFieldValidator ControlToValidate="txtPassword" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator1" /> 
                    </div> <!-- /.col -->
                </asp:Panel>
                <asp:Panel ID="panConfirm" runat="server" Visible="false" CssClass="form-group">
                    <label class="control-label col-sm-2">Confirm Password <span>*</span>:</label>
                    <div class="col-md-3 col-sm-5">
                        <asp:TextBox ID="txtConfirm" runat="server" CssClass="form-control" MaxLength="50" TextMode="Password" />
                        <asp:RequiredFieldValidator ControlToValidate="txtConfirm" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator10" /> 
                        <asp:CompareValidator ControlToValidate="txtConfirm" ControlToCompare="txtPassword" CssClass="validation-compare validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="CompareValidator1" />
                    </div> <!-- /.col -->
                </asp:Panel>
                <div class="form-group">
                    <label class="control-label col-sm-2">First Name <span>*</span>:</label>
                    <div class="col-md-3 col-sm-5">
                        <asp:TextBox ID="txtFirst" runat="server" CssClass="form-control" MaxLength="50" />
                        <asp:RequiredFieldValidator ControlToValidate="txtFirst" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator2" /> 
                    </div> <!-- /.col -->
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">Last Name <span>*</span>:</label>
                    <div class="col-md-3 col-sm-5">
                        <asp:TextBox ID="txtLast" runat="server" CssClass="form-control" MaxLength="50" />
                        <asp:RequiredFieldValidator ControlToValidate="txtLast" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator3" /> 
                    </div> <!-- /.col -->
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">Address <span>*</span>:</label>
                    <div class="col-md-5 col-sm-8">
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" MaxLength="100" />
                        <asp:RequiredFieldValidator ControlToValidate="txtAddress" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator4" /> 
                    </div> <!-- /.col -->
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">City <span>*</span>:</label>
                    <div class="col-md-4 col-sm-6">
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" MaxLength="50" />
                        <asp:RequiredFieldValidator ControlToValidate="txtCity" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator6" /> 
                    </div> <!-- /.col -->
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">State <span>*</span>:</label>
                    <div class="col-md-2 col-sm-2">
                        <asp:TextBox ID="txtState" runat="server" CssClass="form-control" MaxLength="2" />
                        <asp:RequiredFieldValidator ControlToValidate="txtState" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator5" /> 
                    </div> <!-- /.col -->
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">Zip <span>*</span>:</label>
                    <div class="col-md-2 col-sm-3">
                        <asp:TextBox ID="txtZip" runat="server" CssClass="form-control" MaxLength="10" />
                        <asp:RequiredFieldValidator ControlToValidate="txtZip" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator7" /> 
                    </div> <!-- /.col -->
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">Phone <span>*</span>:</label>
                    <div class="col-md-3 col-sm-5">
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" MaxLength="15" />
                        <asp:RequiredFieldValidator ControlToValidate="txtPhone" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator8" /> 
                    </div> <!-- /.col -->
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">Position(s) <span>*</span>:</label>
                    <div class="col-md-10">
                        <asp:CheckBoxList ID="chkPositions" runat="server" CssClass="text" RepeatDirection="Vertical" RepeatLayout="UnorderedList" />
                    </div> <!-- /.col -->
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Privacy:</label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <asp:RadioButton ID="radPublic" runat="server" GroupName="Privacy" Checked="true" />
                            <span class="text">Show both my phone and email</span>
                        </label>
                        <label class="radio-inline">
                            <asp:RadioButton ID="radPrivatePhone" runat="server" GroupName="Privacy" />
                            <span class="text">Hide my phone number</span>
                        </label>
                        <label class="radio-inline">
                            <asp:RadioButton ID="radPrivateEmail" runat="server" GroupName="Privacy" />
                            <span class="text">Hide my email address</span>
                        </label>
                        <div class="small">Your phone number and/or email address will only be shown when seeking for a player or team.</div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-10 col-sm-push-2">
                        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" ValidationGroup="valSave" />
                        &nbsp;
                        <a href="<%= master.RelativePath %>/Players" class="btn btn-default">Back</a>
                    </div> <!-- /.col -->
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
