<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/repeat.master" AutoEventWireup="true" CodeBehind="Lessons.aspx.cs" Inherits="Presentation.CMS._Repeat.Athletics.Lessons" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Buttons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Parent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Edit" runat="server">
    <div class="form-group">
        <label class="col-sm-2 control-label">Sport: *</label>
        <div class="col-sm-10">
            <asp:DropDownList ID="ddlSport" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ControlToValidate="ddlSport" CssClass="validation-required validation-text" ValidationGroup="valSave" InitialValue="0" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator1" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Name: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control focus" MaxLength="50" />
            <asp:RequiredFieldValidator ControlToValidate="txtName" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator2" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Rate: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtRate" runat="server" CssClass="form-control" Width="100" />
            <asp:RequiredFieldValidator ControlToValidate="txtRate" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator5" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Frequency: *</label>
        <div class="col-sm-10">
            <label class="radio-inline">
                <asp:RadioButton ID="radHourly" runat="server" GroupName="Frequency" />
                <span class="text">Hourly</span>
            </label>
            <label class="radio-inline">
                <asp:RadioButton ID="radOnce" runat="server" GroupName="Frequency" />
                <span class="text">One-time</span>
            </label>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Benefit #1:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtBenefit1" runat="server" CssClass="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Benefit #2:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtBenefit2" runat="server" CssClass="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Benefit #3:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtBenefit3" runat="server" CssClass="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Value: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtValue" runat="server" CssClass="form-control focus" MaxLength="10" Width="100" />
            <div><small>The value of the drop-down when selecting this lesson (advanced)</small></div>
            <asp:RequiredFieldValidator ControlToValidate="txtValue" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator3" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Enabled:</label>
        <div class="col-sm-10">
            <div class="checkbox">
                <label>
                    <asp:CheckBox ID="chkEnabled" runat="server" Checked="true" />
                    <span class="text"></span>
                </label>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
