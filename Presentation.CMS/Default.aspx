<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/Top.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.CMS.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <br class="xs-80" />
    <div class="account-wrapper">
        <div class="account-body">
            <asp:PlaceHolder ID="phError" runat="server" Visible="false">
                <div role="alert" class="alert alert-danger">
                    <asp:Literal ID="litError" runat="server" />
                </div>
            </asp:PlaceHolder>

            <asp:PlaceHolder ID="phDenied" runat="server" Visible="false">
                <div role="alert" class="alert alert-danger">
                    <strong>Access Denied!</strong> You must wait at least 30 minutes before you can attempt to login again.
                </div>
            </asp:PlaceHolder>

            <asp:PlaceHolder ID="phSuccess" runat="server" Visible="false">
                <div role="alert" class="alert alert-success">
                    <a class="close" data-dismiss="alert" href="#" aria-hidden="true">×</a>
                    <strong>Great News!</strong> Your password has been reset.<br />If you are logged into a PNC computer, it is recommended you log off and log back in at this time.
                </div>
            </asp:PlaceHolder>

            <asp:PlaceHolder ID="phInvalidPassword" runat="server" Visible="false">
                <div role="alert" class="alert alert-danger">
                    <strong>Invalid Email or Password!</strong> After <asp:Literal ID="litAttempts" runat="server" /> more invalid attempt(s), you will not be able to login for 30 minutes.
                </div>
            </asp:PlaceHolder>

            <asp:PlaceHolder ID="phLogin" runat="server" Visible="false">
                <h3>Welcome back!</h3>
                <h5>Please sign in to get access.</h5>
                <div class="form account-form">
                    <div class="form-group">
                        <label for="login-username" class="placeholder-hidden">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" TabIndex="2" />
                        <asp:RequiredFieldValidator ID="valUsername" ControlToValidate="txtEmail" CssClass="validation-required text-danger text-sm" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" />
                    </div><!-- /.form-group -->
                    <div class="form-group">
                        <label for="login-password" class="placeholder-hidden">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password" TabIndex="2" />
                        <asp:RequiredFieldValidator ID="valPassword" ControlToValidate="txtPassword" CssClass="validation-required text-danger text-sm" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" />
                    </div><!-- /.form-group -->
                    <asp:PlaceHolder ID="phCaptcha" runat="server" Visible="false">
                        <hr />
                        <asp:PlaceHolder ID="phInvalidCaptcha" runat="server" Visible="false">
                            <div role="alert" class="alert alert-danger">
                                <strong>Invalid Captcha!</strong> Re-enter the code in the image below.
                            </div>
                        </asp:PlaceHolder>
                        <div class="form-group">
                            <img src="GenerateCaptcha.ashx" />
                            <asp:LinkButton ID="btnCaptcha" runat="server" CssClass="pull-right" Text="<i class='fa fa-refresh'></i> Refresh" OnClick="btnCaptcha_Click" />
                        </div>
                        <div class="form-group">
                            <label for="login-password" class="">Enter the characters in the image shown above:</label>
                            <asp:TextBox ID="txtCaptcha" runat="server" CssClass="form-control" placeholder="Enter Captcha" TabIndex="2" />
                            <asp:RequiredFieldValidator ID="valCaptcha" ControlToValidate="txtCaptcha" CssClass="validation-required text-danger text-sm" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" />
                        </div>
                    </asp:PlaceHolder>
                    <div class="form-group clearfix">
                        <div class="pull-left checkbox">
                            <label>
                                <asp:CheckBox ID="chkEnabled" runat="server" Text="&nbsp;" />
                                <span class="text">Remember me</span>
                            </label>
                        </div>
                    </div><!-- /.form-group -->
                    <div class="form-group">
                        <asp:LinkButton ID="btnLogin" runat="server" CssClass="btn btn-primary btn-block btn-lg wait" tabindex="4" OnClick="btnLogin_Click" ValidationGroup="valSave" OnClientClick="return DoValidation('valSave',this);">
                            Submit &nbsp; <i class="fa fa-play-circle"></i>
                        </asp:LinkButton>
                    </div><!-- /.form-group -->
                </div>
            </asp:PlaceHolder>

            <asp:PlaceHolder ID="phReset" runat="server" Visible="false">
                <h3>Reset Password!</h3>
                <h5>Enter a new password.</h5>
                <asp:Panel ID="panReset" runat="server" DefaultButton="btnReset" CssClass="form account-form">
                    <div class="form-group">
                        <label for="login-password" class="">New Password</label>
                        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control demo-element ui-popover new-password" data-toggle="tooltip" data-html="true" data-placement="bottom" data-trigger="focus" data-content="<ul id='requirements'><li id='lower' class='invalid'>At least <strong>one lowercase letter</strong></li><li id='capital' class='invalid'>At least <strong>one uppercase letter</strong></li><li id='number' class='invalid'>At least <strong>one number</strong></li><li id='special' class='invalid'>Contains at least <strong>one of &quot;@#$%&quot;</strong></li><li id='length' class='invalid'>Between <strong>6 and 20 characters</strong></li></ul>" title="Password Strength Meter" />
                        <asp:RequiredFieldValidator ID="valNewPassword" ControlToValidate="txtNewPassword" CssClass="validation-required text-danger text-sm" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" />
                        <asp:RegularExpressionValidator  ID="regPassword" ControlToValidate="txtNewPassword" CssClass="validation-regex text-danger text-sm" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" />
                    </div>
                    <!-- /.form-group -->
                    <div class="form-group">
                        <label>New Password Confirm</label>
                        <asp:TextBox ID="txtConfirm" runat="server" CssClass="form-control" TextMode="Password" />
                        <asp:RequiredFieldValidator ID="valConfirm" ControlToValidate="txtConfirm" CssClass="validation-required text-danger text-sm" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" />
                        <asp:RegularExpressionValidator  ID="regConfirm" ControlToValidate="txtConfirm" CssClass="validation-regex text-danger text-sm" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" />
                        <asp:CompareValidator  ID="comConfirm" ControlToValidate="txtConfirm" ControlToCompare="txtNewPassword" CssClass="validation-compare text-danger text-sm" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" />
                    </div>
                    <asp:LinkButton ID="btnReset" runat="server" CssClass="btn btn-primary btn-block btn-lg processing" tabindex="4" OnClick="btnReset_Click" ValidationGroup="valSave" OnClientClick="return DoValidation('valSave',this);" >
                        Submit &nbsp; <i class="fa fa-play-circle"></i>
                    </asp:LinkButton>
                </asp:Panel>
            </asp:PlaceHolder>

        </div><!-- /.account-body -->
        <div class="account-footer">
            <p>Forgot Password? &nbsp; <a class="" href="./account-signup.html">Click here to Recover!</a></p>
        </div><!-- /.account-footer -->
    </div><!-- /.account-wrapper -->
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
