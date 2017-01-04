<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/interior.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Company.Contact.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    Contact Us
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BeforeContent" runat="server">
    <div id="contact-map-container">
        <div id="googlemaps" class="google-map chart-holder-250" style="width: 100%"></div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="layout layout-stack-sm layout-main-left">
        <div class="col-sm-8 layout-main">
            <div class="heading-block">
                <h4>Get in Touch</h4>
            </div>

            <asp:Panel ID="panSent" runat="server" role="alert" CssClass="alert alert-success alert-hide" Visible="false">
                <a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
                <strong>Thanks!</strong> Your message was sent.
            </asp:Panel>

            <p>We want to hear from you! Fill out the form below to send us your comments.</p>
            <br />
            <div class="heading-block">
                <h4>Send an Email</h4>
            </div>
            <div class="form form-horizontal">
                <div class="form-group">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <label>Name: <span class="required">*</span></label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ControlToValidate="txtName" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator1" /> 
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <label>Email: <span class="required">*</span></label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                        <asp:RegularExpressionValidator ControlToValidate="txtEmail" CssClass="validation-email validation-text" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ValidationGroup="valSave" ValidationExpression="^([\w-_]+\.)*[\w-_]+@([\w-_]+\.)*[\w-_]+\.[\w-_]+$" ID="RegularExpressionValidator1" />
                        <asp:RequiredFieldValidator ControlToValidate="txtEmail" CssClass="validation-required validation-text" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ValidationGroup="valSave" ID="RequiredFieldValidator3" /> 
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label>Subject: <span class="required">*</span></label>
                        <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ControlToValidate="txtSubject" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator4" /> 
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label>Message: <span class="required">*</span></label> 
                        <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="6" />
                        <asp:RequiredFieldValidator ControlToValidate="txtMessage" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator2" /> 
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:LinkButton ID="btnSend" runat="server" CssClass="btn btn-primary" OnClick="btnSend_Click" CausesValidation="true" ValidationGroup="valSave">
                            Send Message
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div><!-- /.col -->
        <div class="col-sm-4 layout-sidebar">
            <div class="heading-block">
                <h4>Office Location</h4>
            </div>
            <ul class="icons-list">
                <li><i class="icon-li fa fa-map-marker"></i> 20001 Euclid Ave<br>
                Cleveland, OH 44117</li>
                <li><i class="icon-li fa fa-phone"></i> <%= Models.Statics.FormatPhone("2164659942") %></li>
                <li>
                    <i class="icon-li fa fa-envelope"></i> <a href="mailto:info@neosportsplant.com">info@neosportsplant.com</a>
                </li>
            </ul><br>
            <br>
            <div class="heading-block">
                <h4>Business Hours</h4>
            </div>
            <ul class="icons-list">
                <li><i class="icon-li fa fa-clock-o"></i> Monday to Friday - 11am to 11pm</li>
                <li><i class="icon-li fa fa-clock-o"></i> Saturday &amp; Sunday - 8am to 10pm</li>
                <li><em>Times are subject to change</em></li>
            </ul>
        </div><!-- /.col -->
    </div><!-- /.row -->
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= master.RelativePath %>/js/map.js"></script>
</asp:Content>
