<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/repeat.master" AutoEventWireup="true" CodeBehind="Tournaments.aspx.cs" Inherits="Presentation.CMS._Repeat.Content.Tournaments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Buttons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Parent" runat="server">
    <th style="width:80px">
        Date
    </th>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Edit" runat="server">
    <div class="form-group">
        <label class="col-sm-2 control-label">Sport: *</label>
        <div class="col-sm-10">
            <asp:DropDownList ID="ddlSport" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ControlToValidate="ddlSport" CssClass="validation-required validation-text" ValidationGroup="valSave" InitialValue="0" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator8" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Name: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control focus" MaxLength="50" />
            <asp:RequiredFieldValidator ControlToValidate="txtName" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator1" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Description: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" />
            <asp:RequiredFieldValidator ControlToValidate="txtDescription" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator2" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Location: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" MaxLength="100" />
            <asp:RequiredFieldValidator ControlToValidate="txtLocation" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator5" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Date: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtDate" runat="server" CssClass="form-control date" MaxLength="10" Width="150" />
            <asp:RequiredFieldValidator ControlToValidate="txtDate" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator4" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Deadline: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtDeadline" runat="server" CssClass="form-control date" MaxLength="10" Width="150" />
            <asp:RequiredFieldValidator ControlToValidate="txtDeadline" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator6" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Cost: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtCost" runat="server" CssClass="form-control" Width="100" />
            <asp:RequiredFieldValidator ControlToValidate="txtCost" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator7" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Director: *</label>
        <div class="col-sm-10">
            <asp:DropDownList ID="ddlDirector" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ControlToValidate="ddlDirector" CssClass="validation-required validation-text" ValidationGroup="valSave" InitialValue="0" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator3" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">EZRegister: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtEZRegister" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ControlToValidate="txtEZRegister" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator9" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">EZSchedule:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtEZSchedule" runat="server" CssClass="form-control" />
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
    <script>
        function ParentColumn() {
        }
    </script>
</asp:Content>
