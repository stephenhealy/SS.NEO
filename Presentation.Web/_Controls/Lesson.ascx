<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Lesson.ascx.cs" Inherits="Presentation.Web._Controls.Lesson" %>
<div class="layout layout-stack-sm layout-main-left">
    <div class="col-sm-8 layout-main">
        <h2 class="no-bold"><%= this.Header %></h2>
        <%= this.Body %>
        <p class="semi-bold">Benefits Include:</p>
        <ul class="icons-list">
            <li><i class="icon-li fa fa-check-square"></i>Individual instruction or team instruction to focus on form and technique – skill session is 100% focused on the client</li>
            <li><i class="icon-li fa fa-check-square"></i>Specialized drills for your position</li>
            <li><i class="icon-li fa fa-check-square"></i>In-speed game drills and simulate game play</li>
            <li><i class="icon-li fa fa-check-square"></i>Building chemistry with your teammate</li>
            <li><i class="icon-li fa fa-check-square"></i>Focus on fundamental drills by position</li>
        </ul>
        <br class="xs-30">
        <div class="row">
            <div class="col-sm-12 col-md-10 col-md-offset-1">
                <div class="row">
                    <!-- News -->
                    <asp:Repeater ID="rptLesson" runat="server">
                        <ItemTemplate>
                            <div class="col-sm-4">
                                <div class="pricing-plan">
                                    <div class="pricing-header">
                                        <h3 class="pricing-plan-title"><%# DataBinder.Eval(Container.DataItem, "Name") %></h3>
                                    </div>
                                    <div class="pricing-plan-price">
                                        <span class="pricing-plan-amount">$<%# DataBinder.Eval(Container.DataItem, "Rate") %></span><%# Models.Statics.ParseBool(DataBinder.Eval(Container.DataItem, "Hourly").ToString()) ? " / hour" : "" %>
                                    </div>
                                    <ul class="pricing-plan-details">
                                    </ul>
                                    <a class="btn btn-secondary scrolly" href="#register" onclick="Select('<%# Models.Statics.EscapeSingleJS(DataBinder.Eval(Container.DataItem, "Value").ToString()) %>');">Choose Lesson</a>
                                </div><!-- /.pricing-plan -->
                            </div><!-- /.col -->
                        </ItemTemplate>
                    </asp:Repeater>
                </div><!-- /.row -->
            </div><!-- /.col -->
        </div><!-- /.row -->
        <p><em>Lessons typically last for one hour.</em></p>
        <p>For additional lessons, please contact <a href="mailto:<%= this.EmailTo %>"><%= this.EmailTo %></a> or <a href="<%= page.master.RelativePath %>/Company/Contact" class="text-primary">contact our office</a> at <%= Models.Statics.FormatPhone("2164659942") %>.</p>
    </div><!-- /.col-sm-6 -->

    <div class="col-sm-4 layout-sidebar">
        <div id="register" class="heading-block">
            <h4>Register Now</h4>
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
                    <label>Parent's Name (if minor)</label> 
                    <asp:TextBox ID="txtParent" runat="server" CssClass="form-control" />
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
            <div class="col-md-6">
                <div class="form-group">
                    <label>Phone Number</label> 
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ControlToValidate="txtPhone" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator2" /> 
                </div><!-- /.form-group -->
            </div><!-- /.col -->
            <div class="col-md-6">
                <div class="form-group">
                    <label><%= this.Label %></label>
                    <asp:DropDownList ID="ddlValues" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ControlToValidate="ddlValues" CssClass="validation-required validation-text" ValidationGroup="valSave" InitialValue="0" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator5" /> 
                </div><!-- /.form-group -->
            </div><!-- /.col -->
        </div><!-- /.row -->
        <div class="row">
            <div class="col-md-12">
                After submitting, you will be contacted via phone or email to schedule your lesson and arrange payment.
            </div><!-- /.col -->
        </div><!-- /.row -->
        <br class="xs-30" />
        <div class="form-group">
            <asp:LinkButton ID="btnRegister" runat="server" CssClass="btn btn-primary btn-block btn-lg" OnClick="btnRegister_Click" CausesValidation="true" ValidationGroup="valSave">
                Register
            </asp:LinkButton>
        </div>
    </div><!-- /.col-sm-6 -->
</div><!-- /.row -->
<asp:ValidationSummary id="sumSave" HeaderText="The following errors were found:" ShowMessageBox="false" ShowSummary="false" DisplayMode="BulletList" runat="server" ValidationGroup="valSubscribe" />


<script>
    function Select(opt) {
        $("#<%= ddlValues.ClientID%>").focus();
        setTimeout(function () {
            $("#<%= ddlValues.ClientID%>").val(opt);
        }, 500);
        setTimeout(function () {
            $("#<%= txtFirst.ClientID%>").focus();
        }, 1500);
    }
</script>
