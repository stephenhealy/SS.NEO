<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/repeat.master" AutoEventWireup="true" CodeBehind="Advertisements.aspx.cs" Inherits="Presentation.CMS._Repeat.Content.Advertisements" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Buttons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Parent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Edit" runat="server">
    <div class="form-group">
        <label class="col-sm-2 control-label">Name: *</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control focus" MaxLength="50" />
            <asp:RequiredFieldValidator ControlToValidate="txtName" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator2" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Heading:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtHeading" runat="server" CssClass="form-control" MaxLength="75" />
            <asp:RequiredFieldValidator ControlToValidate="txtHeading" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator1" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Message:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
            <asp:RequiredFieldValidator ControlToValidate="txtMessage" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator3" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Link:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtLink" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
            <asp:RequiredFieldValidator ControlToValidate="txtLink" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator4" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Label:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtLabel" runat="server" CssClass="form-control" MaxLength="25" />
            <asp:RequiredFieldValidator ControlToValidate="txtLabel" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator5" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Frequency:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtFrequency" runat="server" CssClass="form-control" MaxLength="2" />
            <div><small>0 to 10 - 0 being least frequent, 10 being most frequent</small></div>
            <asp:RequiredFieldValidator ControlToValidate="txtFrequency" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator6" /> 
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Times Shown:</label>
        <div class="col-sm-2">
            <p class="form-control-static">
                <asp:Literal ID="litShownTimes" runat="server" Text="<small><em>Never</em></small>" />
            </p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Last Shown:</label>
        <div class="col-sm-10">
            <p class="form-control-static">
                <asp:Literal ID="litShownLast" runat="server" Text="<small><em>Never</em></small>" />
            </p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Times Clicked:</label>
        <div class="col-sm-2">
            <p class="form-control-static">
                <asp:Literal ID="litClickedTimes" runat="server" Text="<small><em>Never</em></small>" />
            </p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Last Clicked:</label>
        <div class="col-sm-10">
            <p class="form-control-static">
                <asp:Literal ID="litClickedLast" runat="server" Text="<small><em>Never</em></small>" />
            </p>
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
