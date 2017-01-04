<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/Top.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Presentation.CMS._Modals.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="<%= master.RelativePath %>/vendor/nestable/jquery.nestable.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 100%; overflow: hidden">
        <div style="position: absolute; top: 0px; left: 0px; bottom: 60px; overflow: auto; width: 99%;">
            <asp:Panel ID="panSaved" runat="server" role="alert" CssClass="alert alert-success alert-hide" Visible="false">
                <a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
                <strong>Done!</strong> You successfully saved this information.
            </asp:Panel>
            <asp:ListView ID="lstOrder" runat="server" ItemPlaceholderID="phItem">
                <LayoutTemplate>
                     <div id="nestable" class="dd">
                        <ol class="dd-list">
                            <asp:PlaceHolder ID="phItem" runat="server" />
                        </ol>
                     </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <li data-id='<%# DataBinder.Eval(Container.DataItem, "AssetID")%>' class="dd-item">
                        <div class="dd-handle"><em class="fa fa-reorder fa-fw text-muted mr-lg"></em><%# DataBinder.Eval(Container.DataItem, "Name")%></div>
                    </li>
                </ItemTemplate>
            </asp:ListView>
            <asp:HiddenField ID="hdnOrder" runat="server" />
        </div>
        <div style="position: absolute; bottom: 0px; left: 5px; height: 50px; overflow: hidden; width: 99%;" class="modal-footer">
            <div style="float: left">
                <asp:LinkButton ID="btnRefresh" runat="server" CssClass="btn btn-labeled btn-default" OnClick="btnRefresh_Click" OnClientClick="return Confirm(this,'You will lose any unsaved changes');">
                    <span class="btn-label"><i class="fa fa-refresh"></i></span>Reload List
                </asp:LinkButton>
            </div>
            <div style="float: right">
                <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-labeled btn-primary wait" OnClick="btnSave_Click">
                    <span class="btn-label"><i class="fa fa-save"></i></span>Save Order
                </asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= master.RelativePath %>/vendor/nestable/jquery.nestable.js"></script>
    <script>
        arrLoad.push(new CodeBlock(function () {
            var updateOutput = function (e) {
                var list = e.length ? e : $(e.target),
                    output = list.data('output');
                if (window.JSON) {
                    $('#<%=hdnOrder.ClientID%>').val(window.JSON.stringify(list.nestable('serialize')));//, null, 2));
                    //alert($('#<%=hdnOrder.ClientID%>').val());
                } else {
                    alert('JSON browser support required for this demo.');
                }
            };

            // activate Nestable for list 1
            $('#nestable').nestable({
                group: 1,
                maxDepth: 1
            })
            .on('change', updateOutput);

            // output initial serialised data
            updateOutput($('#nestable').data('output', $('#nestable-output')));

        }));
    </script>
</asp:Content>
