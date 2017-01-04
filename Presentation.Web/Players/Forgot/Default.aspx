<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/players.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Players.Forgot.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="account-wrapper">
        <div class="account-body">
            <h3>Forgot Password</h3>
            <h5>Enter your e-mail address to have your account information sent.</h5>
            <div class="form account-form">
                <div class="form-group">
                    <label class="placeholder-hidden" for="login-username">Email Address</label>
                    <asp:TextBox ID="txtForgot" CssClass="form-control" runat="server" placeholder="Email Address" />
                    <asp:RequiredFieldValidator ControlToValidate="txtForgot" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator9" /> 
                    <asp:RegularExpressionValidator ControlToValidate="txtForgot" CssClass="validation-email validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^([\w-_]+\.)*[\w-_]+@([\w-_]+\.)*[\w-_]+\.[\w-_]+$" ID="RegularExpressionValidator1" />
                </div><!-- /.form-group -->
                <div class="form-group">
                    <asp:LinkButton ID="btnForgot" runat="server" CssClass="btn btn-primary btn-block btn-lg wait" OnClick="btnForgot_Click" ValidationGroup="valSave">
                        Submit &nbsp; <i class="fa fa-play-circle"></i>
                    </asp:LinkButton>
                </div><!-- /.form-group -->
            </div>
        </div><!-- /.account-body -->
        <div class="account-footer">
            <a href="<%= master.RelativePath %>/Players">Return to Login</a>
        </div><!-- /.account-footer -->
    </div><!-- /.account-wrapper -->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
