<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/Top.Master" AutoEventWireup="true" CodeBehind="Session.aspx.cs" Inherits="Presentation.CMS._Modals.Session" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="<%= master.RelativePath %>/vendor/bootstrap-datepicker/css/datepicker3.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 100%; overflow: hidden">
        <div class="container" style="position: absolute; top: 0px; left: 0px; bottom: 60px; overflow: auto; width: 99%;">
            <asp:Panel ID="panSaved" runat="server" role="alert" CssClass="alert alert-success alert-hide" Visible="false">
                <a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
                <strong>Done!</strong> You successfully saved this information.
            </asp:Panel>

            <div class="form-horizontal">
                <div class="form-group">
                    <div class="col-sm-12">
                        <p class="form-control-static">
                            Enter the following information to copy session <strong><asp:Literal ID="litCurrent" runat="server" /></strong>.  Copying a session will also copy its associated leagues (but will clear the EZ Register and EZ Schedule fields).
                        </p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">New Name: *</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control focus" MaxLength="50" />
                        <asp:RequiredFieldValidator ControlToValidate="txtName" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator2" /> 
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">New Deadline: *</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtDeadline" runat="server" CssClass="form-control date" MaxLength="10" Width="150" />
                        <asp:RequiredFieldValidator ControlToValidate="txtDeadline" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator3" /> 
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">New Start Date: *</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control date" MaxLength="10" Width="150" />
                        <asp:RequiredFieldValidator ControlToValidate="txtStartDate" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator4" /> 
                    </div>
                </div>
            </div>
        </div>
        <div style="position: absolute; bottom: 0px; left: 5px; height: 50px; overflow: hidden; width: 99%;" class="modal-footer">
            <div style="float: right">
                <asp:LinkButton ID="btnClose" runat="server" CssClass="btn btn-labeled btn-default" OnClick="btnClose_Click" OnClientClick="return Confirm(this,'You will lose any unsaved changes');">
                    <span class="btn-label"><i class="fa fa-times"></i></span>Cancel
                </asp:LinkButton>
                <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-labeled btn-primary" OnClick="btnSave_Click" Enabled="false" OnClientClick="return DoValidation('valSave',this);">
                    <span class="btn-label"><i class="fa fa-check"></i></span>Start Copy
                </asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
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
