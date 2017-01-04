<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/landing.master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="Presentation.CMS._Repeat.System.Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="<%= master.RelativePath %>/vendor/bootstrap-datepicker/css/datepicker3.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Buttons" runat="server">
    <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-primary" Text="<em class='fa fa-check'></em> Save" OnClick="btnSave_Click" OnClientClick="return DoValidation('valSave',this);" />
    <asp:HyperLink ID="hypHistory" runat="server" CssClass="btn btn-primary" Text="<em class='fa fa-history'></em> History" NavigateUrl="javascript:void(0);" /> 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">
    Settings
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="panError" runat="server" role="alert" CssClass="alert alert-danger" Visible="false">
        <h3>Oops! The following error occurred :</h3> <asp:Literal ID="litError" runat="server" />
    </asp:Panel>
    <asp:Panel ID="panSaved" runat="server" role="alert" CssClass="alert alert-success alert-hide" Visible="false">
        <a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
        <strong>Done!</strong> You successfully saved this information.
    </asp:Panel>

    <div class="layout layout-stack-sm layout-main-left">
        <div class="col-sm-6 col-md-7 layout-main">
            <div class="portlet portlet-default">
                <div class="portlet-body">
                    <div class="form-group">
                        <label>Alert Message:</label>
                        <asp:TextBox ID="txtAlert" runat="server" CssClass="form-control focus" TextMode="MultiLine" Rows="5" />
                    </div>
                    <div class="form-group">
                        <label>Alert Start Date:</label>
                        <asp:TextBox ID="txtAlertStart" runat="server" CssClass="form-control date" MaxLength="10" Width="150" />
                    </div>
                    <div class="form-group">
                        <label>Alert End Date:</label>
                        <asp:TextBox ID="txtAlertEnd" runat="server" CssClass="form-control date" MaxLength="10" Width="150" />
                    </div>
                    <div class="form-group">
                        <label>Email From: *</label>
                        <asp:TextBox ID="txtEmailFrom" runat="server" CssClass="form-control" MaxLength="100" />
                        <asp:RequiredFieldValidator ControlToValidate="txtEmailFrom" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator3" /> 
                    </div>
                    <div class="form-group">
                        <label><em>Host an Event</em> To: *</label>
                        <asp:TextBox ID="txtEventTo" runat="server" CssClass="form-control" MaxLength="200" />
                        <asp:RequiredFieldValidator ControlToValidate="txtEventTo" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator4" /> 
                    </div>
                    <div class="form-group">
                        <label><em>Host an Event</em> Cc:</label>
                        <asp:TextBox ID="txtEventCc" runat="server" CssClass="form-control" MaxLength="200" />
                    </div>
                    <div class="form-group">
                        <label><em>Host an Event</em> Bcc:</label>
                        <asp:TextBox ID="txtEventBcc" runat="server" CssClass="form-control" MaxLength="200" />
                    </div>
                    <div class="form-group">
                        <label><em>Contact Us</em> To: *</label>
                        <asp:TextBox ID="txtContactTo" runat="server" CssClass="form-control" MaxLength="200" />
                        <asp:RequiredFieldValidator ControlToValidate="txtContactTo" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator5" /> 
                    </div>
                    <div class="form-group">
                        <label><em>Contact Us</em> Cc:</label>
                        <asp:TextBox ID="txtContactCc" runat="server" CssClass="form-control" MaxLength="200" />
                    </div>
                    <div class="form-group">
                        <label><em>Contact Us</em> Bcc:</label>
                        <asp:TextBox ID="txtContactBcc" runat="server" CssClass="form-control" MaxLength="200" />
                    </div>
                </div><!-- /.portlet-body -->
            </div><!-- /.portlet -->
        </div><!-- /.layout-main -->
        <div class="col-sm-6 col-md-5">
            <br class="xs-60" />
            <div class="portlet demo-icheck">
                <div class="portlet-header">
                    <h4 class="portlet-title">
                        <u><i class="fa fa-exclamation-triangle portlet-icon"></i>Dashboard Notifications</u>
                    </h4>
                </div> <!-- /.portlet-header -->
                <div class="portlet-body">
                    <div class="form-group">
                        <label>League Error Threshold:</label><br />
                        Notify <asp:TextBox ID="txtLeagueError" runat="server" CssClass="form-control demo-element" MaxLength="4" Width="50" Text="0" /> days before start
                        <div><small>These alerts cannot be disabled.</small></div>
                    </div>
                    <div class="form-group">
                        <label>League Warning Threshold:</label><br />
                        Notify <asp:TextBox ID="txtLeagueWarning" runat="server" CssClass="form-control demo-element" MaxLength="4" Width="50" Text="7" /> days before start
                        <div><small>Set to -1 to disable league warnings.</small></div>
                    </div>
                    <div class="form-group">
                        <label>Lesson Threshold:</label><br />
                        Notify <asp:TextBox ID="txtLesson" runat="server" CssClass="form-control demo-element" MaxLength="4" Width="50" Text="4" /> week(s) after registering
                        <div><small>Set to -1 to disable lesson notifications.</small></div>
                    </div>
                    <div class="form-group">
                        <label>Event Threshold:</label><br />
                        Notify <asp:TextBox ID="txtEvent" runat="server" CssClass="form-control demo-element" MaxLength="4" Width="50" Text="4" /> week(s) after submitting
                        <div><small>Set to -1 to disable event notifications.</small></div>
                    </div>
                    <div class="form-group">
                        <label>Player Seeking Team Threshold:</label><br />
                        Notify <asp:TextBox ID="txtPlayers" runat="server" CssClass="form-control demo-element" MaxLength="4" Width="50" Text="4" /> week(s) after requesting team
                        <div><small>Set to -1 to disable player notifications.</small></div>
                    </div>
                    <div class="form-group">
                        <label>Team Seeking Player Threshold:</label><br />
                        Notify <asp:TextBox ID="txtTeams" runat="server" CssClass="form-control demo-element" MaxLength="4" Width="50" Text="4" /> week(s) after requesting player
                        <div><small>Set to -1 to disable team notifications.</small></div>
                    </div>
                </div> <!-- /.portlet-body -->
            </div>
        </div>
    </div>
    <asp:ValidationSummary id="sumSave" HeaderText="The following errors were found:" ShowMessageBox="false" ShowSummary="false" DisplayMode="BulletList" runat="server" ValidationGroup="valSave" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
        <script>
            arrLoad.push(new CodeBlock(function () {
                $('.date').datepicker({
                    autoclose: true,
                    todayHighlight: true
                });

            }));
        </script>
        <script src="<%= master.RelativePath %>/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
</asp:Content>
