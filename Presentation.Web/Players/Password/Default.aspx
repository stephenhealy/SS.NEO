<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/players.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Players.Password.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="heading-block">
                <h3>Change Password</h3>
            </div>

            <div class="form form-horizontal">
                <div class="form-group">
                    <label class="control-label col-md-2">Old Password:</label>
                    <div class="col-md-3 col-sm-5">
                        <asp:TextBox ID="txtChangePassword" runat="server" CssClass="form-control" MaxLength="50" TextMode="Password" />
                        <asp:RequiredFieldValidator ControlToValidate="txtChangePassword" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator1" /> 
                    </div> <!-- /.col -->
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">New Password:</label>
                    <div class="col-md-3 col-sm-5">
                        <asp:TextBox ID="txtChangePassword1" runat="server" CssClass="form-control" MaxLength="50" TextMode="Password" />
                        <asp:RequiredFieldValidator ControlToValidate="txtChangePassword1" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator2" /> 
                    </div> <!-- /.col -->
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">Confirm Password:</label>
                    <div class="col-md-3 col-sm-5">
                        <asp:TextBox ID="txtChangePassword2" runat="server" CssClass="form-control" MaxLength="50" TextMode="Password" />
                        <asp:RequiredFieldValidator ControlToValidate="txtChangePassword2" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator3" /> 
                        <asp:CompareValidator ControlToValidate="txtChangePassword2" ControlToCompare="txtChangePassword1" CssClass="validation-compare validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="CompareValidator1" />
                    </div> <!-- /.col -->
                </div>
                <div class="form-group">
                    <div class="col-md-10 col-md-push-2">
                        <asp:Button ID="btnChange" runat="server" CssClass="btn btn-primary" Text="Change" OnClick="btnChange_Click" ValidationGroup="valSave" />
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
