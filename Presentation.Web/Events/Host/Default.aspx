<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/interior.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Events.Host.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="<%= master.RelativePath %>/vendor/bootstrap-3-timepicker/css/bootstrap-timepicker.css" />
    <link rel="stylesheet" href="<%= master.RelativePath %>/vendor/bootstrap-datepicker/css/datepicker3.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    Host an Event
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="layout layout-stack-sm layout-main-left">
        <div class="col-sm-8 layout-main">
            <h2 class="no-bold">Parties and Special Events are welcome!</h2>
            <p>NEO Sports Plant offers the perfect spot to host any of the following events:</p>
            <ul class="icons-list">
                <li><i class="icon-li fa fa-check-square"></i>Birthday Parties</li>
                <li><i class="icon-li fa fa-check-square"></i>First Communions</li>
                <li><i class="icon-li fa fa-check-square"></i>High school after prom</li>
                <li><i class="icon-li fa fa-check-square"></i>Graduation Parties</li>
                <li><i class="icon-li fa fa-check-square"></i>Corporate team-building events</li>
                <li><i class="icon-li fa fa-check-square"></i>Reverse Raffles</li>
                <li><i class="icon-li fa fa-check-square"></i>After work and/or holiday parties</li>
                <li><i class="icon-li fa fa-check-square"></i>Special events/other occasions</li>
                <li><i class="icon-li fa fa-check-square"></i>Kids events</li>
            </ul>
            <p>We have over 40,000 square foot of space available consisting of 4 indoor regulation-size basketball courts, 6 indoor volleyball courts and 4 indoor sand courts. Call for pricing and information or submit the form with your event details and a representative will contact you.</p>
            <br class="xs-30">
            <p><img src="<%= master.RelativePath %>/img/host.jpg" alt="" class="img-responsive" /></p>
        </div><!-- /.col-sm-6 -->

        <div class="col-sm-4 layout-sidebar">
            <div class="heading-block">
                <h4>Event Information and Details</h4>
            </div>

            <asp:Panel ID="panRegistered" runat="server" role="alert" CssClass="alert alert-success alert-hide" Visible="false">
                <a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
                <strong>Thanks!</strong> You successfully registered.
            </asp:Panel>

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>First Name</label> 
                        <asp:TextBox ID="txtFirst" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ControlToValidate="txtFirst" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator1" /> 
                    </div><!-- /.form-group -->
                </div><!-- /.col -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Last Name</label> 
                        <asp:TextBox ID="txtLast" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ControlToValidate="txtLast" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator4" /> 
                    </div><!-- /.form-group -->
                </div><!-- /.col -->
            </div><!-- /.row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label>Email Address</label> 
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                        <asp:RegularExpressionValidator ControlToValidate="txtEmail" CssClass="validation-email validation-text" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ValidationGroup="valSave" ValidationExpression="^([\w-_]+\.)*[\w-_]+@([\w-_]+\.)*[\w-_]+\.[\w-_]+$" ID="RegularExpressionValidator1" />
                        <asp:RequiredFieldValidator ControlToValidate="txtEmail" CssClass="validation-required validation-text" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ValidationGroup="valSave" ID="RequiredFieldValidator3" /> 
                    </div><!-- /.form-group -->
                </div><!-- /.col -->
            </div><!-- /.row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label>Phone Number</label> 
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ControlToValidate="txtPhone" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator2" /> 
                    </div><!-- /.form-group -->
                </div><!-- /.col -->
            </div><!-- /.row -->
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Start Date</label> 
                        <asp:TextBox ID="txtDate" runat="server" CssClass="form-control date" />
                        <asp:RequiredFieldValidator ControlToValidate="txtDate" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator5" /> 
                    </div><!-- /.form-group -->
                </div><!-- /.col -->
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Start Time</label>
                        <div class="bootstrap-timepicker">
                            <asp:TextBox ID="txtTime" runat="server" CssClass="form-control time" />
                            <asp:RequiredFieldValidator ControlToValidate="txtTime" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator6" /> 
                        </div>
                    </div><!-- /.form-group -->
                </div><!-- /.col -->
            </div><!-- /.row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label>Description of Event (Optional)</label> 
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
                    </div><!-- /.form-group -->
                </div><!-- /.col -->
            </div><!-- /.row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label>Website (If Any)</label> 
                        <asp:TextBox ID="txtWebsite" runat="server" CssClass="form-control" />
                    </div><!-- /.form-group -->
                </div><!-- /.col -->
            </div><!-- /.row -->
            <div class="row">
                <div class="col-md-12">
                    After submitting, you will be contacted via phone or email to book your event and arrange payment.
                </div><!-- /.col -->
            </div><!-- /.row -->
            <br class="xs-30" />
            <div class="form-group">
                <asp:LinkButton ID="btnRegister" runat="server" CssClass="btn btn-primary btn-block btn-lg" OnClick="btnRegister_Click" CausesValidation="true" ValidationGroup="valSave">
                    Send
                </asp:LinkButton>
            </div>
        </div><!-- /.col-sm-6 -->
    </div><!-- /.row -->
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= master.RelativePath %>/vendor/bootstrap-3-timepicker/js/bootstrap-timepicker.js"></script>
    <script src="<%= master.RelativePath %>/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script>
        jQuery(window).load(function () {
            $('.time').timepicker();
            $('.date').datepicker({
                autoclose: true,
                todayHighlight: true
            });
        });
    </script>
</asp:Content>
