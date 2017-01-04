<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/repeat.master" AutoEventWireup="true" CodeBehind="Leagues.aspx.cs" Inherits="Presentation.CMS._Repeat.Athletics.Leagues" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Buttons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Parent" runat="server">
    <th style="width:80px">
        Night
    </th>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Edit" runat="server">
    <div class="form-group">
        <label class="col-sm-2 control-label">Session: *</label>
        <div class="col-sm-10">
            <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control" />
            <div><small>This list only contains sessions with a start date in the future. To add a league to a session that has already started, temporarily change the start date to a date in the future, then add the league and then change the start date back.</small></div>
            <asp:RequiredFieldValidator ControlToValidate="ddlSession" CssClass="validation-required validation-text" ValidationGroup="valSave" InitialValue="0" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator1" /> 
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
        <label class="col-sm-2 control-label">Description:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Night: *</label>
        <div class="col-sm-10">
            <label class="radio-inline">
                <asp:RadioButton ID="radMonday" runat="server" GroupName="Layout" />
                <span class="text">Monday</span>
            </label>
            <label class="radio-inline">
                <asp:RadioButton ID="radTuesday" runat="server" GroupName="Layout" />
                <span class="text">Tuesday</span>
            </label>
            <label class="radio-inline">
                <asp:RadioButton ID="radWednesday" runat="server" GroupName="Layout" />
                <span class="text">Wednesday</span>
            </label>
            <label class="radio-inline">
                <asp:RadioButton ID="radThursday" runat="server" GroupName="Layout" />
                <span class="text">Thursday</span>
            </label>
            <label class="radio-inline">
                <asp:RadioButton ID="radFriday" runat="server" GroupName="Layout" />
                <span class="text">Friday</span>
            </label>
            <label class="radio-inline">
                <asp:RadioButton ID="radSunday" runat="server" GroupName="Layout" />
                <span class="text">Sunday</span>
            </label>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">EZRegister: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtEZRegister" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ControlToValidate="txtEZRegister" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator3" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">EZSchedule:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtEZSchedule" runat="server" CssClass="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Cost: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtCost" runat="server" CssClass="form-control" Width="100" />
            <asp:RequiredFieldValidator ControlToValidate="txtCost" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator5" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Display: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtDisplay" runat="server" CssClass="form-control" Width="75" />
            <asp:RequiredFieldValidator ControlToValidate="txtDisplay" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator4" /> 
            <asp:CompareValidator ControlToValidate="txtDisplay" Operator="DataTypeCheck" Type="Integer" CssClass="validation-integer validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="CompareValidator1" />
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
