<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/Top.Master" AutoEventWireup="true" CodeBehind="League.aspx.cs" Inherits="Presentation.Web.League" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="league">
        <p><asp:Literal ID="litDescription" runat="server" /></p>
        <div class="panel-group accordion-panel" id="league-2">
            <div class="panel">
                <div class="panel-heading">
                    <h4 class="panel-title"><a class="accordion-toggle" data-parent="#league-2" data-toggle="collapse" href="#league-2-1">Deadline</a></h4>
                </div><!-- .panel-heading -->
                <div class="panel-collapse collapse" id="league-2-1">
                    <div class="panel-body">
                        <p>The deadline for registration is <span class="semibold"><asp:Literal ID="litDeadline" runat="server" /></span></p>
                    </div><!-- .panel-body -->
                </div><!-- ./panel-collapse -->
            </div><!-- .panel -->
            <div class="panel">
                <div class="panel-heading">
                    <h4 class="panel-title"><a class="accordion-toggle" data-parent="#league-2" data-toggle="collapse" href="#league-2-2">Cost</a></h4>
                </div><!-- .panel-heading -->
                <div class="panel-collapse collapse" id="league-2-2">
                    <div class="panel-body">
                        <p>The total cost per team is <span class="semibold">$<asp:Literal ID="litCost" runat="server" /></span>.</p>
                    </div><!-- .panel-body -->
                </div><!-- ./panel-collapse -->
            </div><!-- .panel -->
        </div><!-- /.accordion -->
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
