<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/players.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Players.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <!-- LOGIN -->
    <asp:Panel ID="panLogin" CssClass="account-wrapper" runat="server" Visible="false">
        <div class="account-body">
            <asp:PlaceHolder ID="phForgot" runat="server" Visible="false">
                <div role="alert" class="alert alert-success">
                    <a class="close" data-dismiss="alert" href="#" aria-hidden="true">×</a>
                    Your password has been sent to <strong><asp:Literal ID="litForgot" runat="server" /></strong>.
                </div>
            </asp:PlaceHolder>

            <asp:PlaceHolder ID="phRegister" runat="server" Visible="false">
                <div role="alert" class="alert alert-success">
                    <a class="close" data-dismiss="alert" href="#" aria-hidden="true">×</a>
                    <strong>Thank you for registering!</strong> You may now login.
                </div>
            </asp:PlaceHolder>

            <asp:PlaceHolder ID="phInvalid" runat="server" Visible="false">
                <div role="alert" class="alert alert-danger">
                    Invalid Username or Password.
                </div>
            </asp:PlaceHolder>

            <h3>Welcome back!</h3>
            <h5>Please sign in to get access.</h5>
            <div class="form account-form">
                <div class="form-group">
                    <label class="placeholder-hidden" for="login-username">Email Address</label>
                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="Email Address" />
                    <asp:RequiredFieldValidator ControlToValidate="txtEmail" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator9" /> 
                    <asp:RegularExpressionValidator ControlToValidate="txtEmail" CssClass="validation-email validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^([\w-_]+\.)*[\w-_]+@([\w-_]+\.)*[\w-_]+\.[\w-_]+$" ID="RegularExpressionValidator1" />
                </div><!-- /.form-group -->
                <div class="form-group">
                    <label class="placeholder-hidden" for="login-password">Password</label>
                    <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" placeholder="Password" TextMode="Password" />
                    <asp:RequiredFieldValidator ControlToValidate="txtPassword" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator1" /> 
                </div><!-- /.form-group -->
                <div class="form-group clearfix">
                    <div class="pull-right">
                        <small><a href="<%= master.RelativePath %>/Players/Forgot">Forgot Password?</a></small>
                    </div>
                </div><!-- /.form-group -->
                <div class="form-group">
                    <asp:LinkButton ID="btnLogin" runat="server" CssClass="btn btn-primary btn-block btn-lg wait" OnClick="btnLogin_Click" ValidationGroup="valSave">
                        Sign In &nbsp; <i class="fa fa-play-circle"></i>
                    </asp:LinkButton>
                </div><!-- /.form-group -->
            </div>
        </div><!-- /.account-body -->
        <div class="account-footer">
            <p>Don't have an account? &nbsp; <a href="<%= master.RelativePath %>/Players/Profile">Create an Account!</a></p>
        </div><!-- /.account-footer -->
    </asp:Panel><!-- /.account-wrapper -->


    <!-- DASHBOARD -->
    <asp:PlaceHolder ID="phLoggedIn" runat="server" Visible="false">
        <div class="row">
            <div class="col-md-12">
                <h2 class="no-bold">Welcome to the <strong>Player's Connection!</strong></h2>
            </div><!-- /.col -->
        </div><!-- /.row -->

        <div class="row">
            <div class="col-md-4">
                <br class="xs-30">
                <div class="heading-block">
                    <h3>Players Seeking Teams</h3>
                </div>
                <ul class="fa-ul blog-ul">
                    <li>
                        <i class="fa-li fa fa-chevron-right"></i>
                        <a href="<%= master.RelativePath %>/Players/SeekingTeams">View all players seeking teams</a>
                    </li>
                    <li>
                        <i class="fa-li fa fa-chevron-right"></i>
                        <a href="<%= master.RelativePath %>/Players/SeekingTeam">I am seeking a team</a>
                    </li>
                </ul>
            </div><!-- /.col -->

            <div class="col-md-4">
                <br class="xs-30">
                <div class="heading-block">
                    <h3>Teams Seeking Players</h3>
                </div>
                <ul class="fa-ul blog-ul">
                    <li>
                        <i class="fa-li fa fa-chevron-right"></i>
                        <a href="<%= master.RelativePath %>/Players/SeekingPlayers">View all teams seeking players</a>
                    </li>
                    <li>
                        <i class="fa-li fa fa-chevron-right"></i>
                        <a href="<%= master.RelativePath %>/Players/SeekingPlayer">I am seeking a player</a>
                    </li>
                </ul>
            </div><!-- /.col -->

            <div class="col-md-4">
                <br class="xs-30">
                <div class="heading-block">
                    <h3>Settings</h3>
                </div>
                <ul class="fa-ul blog-ul">
                    <li>
                        <i class="fa-li fa fa-chevron-right"></i>
                        <a href="<%= master.RelativePath %>/Players/Profile">Edit my profile</a>
                    </li>
                    <li>
                        <i class="fa-li fa fa-chevron-right"></i>
                        <a href="<%= master.RelativePath %>/Players/Password">Change password</a>
                    </li>
                    <li>
                        <i class="fa-li fa fa-chevron-right"></i>
                        <a href="<%= master.RelativePath %>/Players/Logout">Log out</a>
                    </li>
                </ul>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </asp:PlaceHolder>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
