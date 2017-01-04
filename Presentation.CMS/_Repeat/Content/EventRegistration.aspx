<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/repeat.master" AutoEventWireup="true" CodeBehind="EventRegistration.aspx.cs" Inherits="Presentation.CMS._Repeat.Content.EventRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Buttons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Parent" runat="server">
    <th style="width:80px">
        Scheduled
    </th>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Edit" runat="server">
    <div class="form-group mb">
        <label class="col-sm-2 control-label">Sport:</label>
        <div class="col-sm-10">
            <p class="form-control-static">
                <asp:Literal ID="litSport" runat="server" />
            </p>
        </div>
    </div>
    <div class="form-group mb">
        <label class="col-sm-2 control-label">First:</label>
        <div class="col-sm-10">
            <p class="form-control-static">
                <asp:Literal ID="litFirst" runat="server" />
            </p>
        </div>
    </div>
    <div class="form-group mb">
        <label class="col-sm-2 control-label">Last:</label>
        <div class="col-sm-10">
            <p class="form-control-static">
                <asp:Literal ID="litLast" runat="server" />
            </p>
        </div>
    </div>
    <div class="form-group mb">
        <label class="col-sm-2 control-label">Requested Date:</label>
        <div class="col-sm-10">
            <p class="form-control-static">
                <asp:Literal ID="litDate" runat="server" />
            </p>
        </div>
    </div>
    <div class="form-group mb">
        <label class="col-sm-2 control-label">Email:</label>
        <div class="col-sm-10">
            <p class="form-control-static">
                <asp:Literal ID="litEmail" runat="server" />
            </p>
        </div>
    </div>
    <div class="form-group mb">
        <label class="col-sm-2 control-label">Phone:</label>
        <div class="col-sm-10">
            <p class="form-control-static">
                <asp:Literal ID="litPhone" runat="server" />
            </p>
        </div>
    </div>
    <div class="form-group mb">
        <label class="col-sm-2 control-label">Description:</label>
        <div class="col-sm-10">
            <p class="form-control-static">
                <asp:Literal ID="litDescription" runat="server" />
            </p>
        </div>
    </div>
    <div class="form-group mb">
        <label class="col-sm-2 control-label">Web Site:</label>
        <div class="col-sm-10">
            <p class="form-control-static">
                <asp:Literal ID="litWebsite" runat="server" />
            </p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Scheduled:</label>
        <div class="col-sm-10">
            <asp:TextBox ID="txtScheduled" runat="server" CssClass="form-control date" MaxLength="10" Width="150" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
    <script>
        function ParentColumn() {
            $("#ModifiedOn").html("Submitted");
        }
    </script>
</asp:Content>
