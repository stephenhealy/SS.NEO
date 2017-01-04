<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/players.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Web.Players.SeekingTeam.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="heading-block">
                <h3>Player Seeking a Team</h3>
            </div>
            <div class="form form-horizontal">
                <div class="form-group">
                    <label class="control-label col-md-2">Your Name:</label>
                    <div class="col-md-10">
                        <div class="form-control-static"><asp:Literal ID="lblPlayer" runat="server" /></div>
                    </div> <!-- /.col -->
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">Your Phone:</label>
                    <div class="col-md-10">
                        <div class="form-control-static"><asp:Literal ID="lblPhone" runat="server" /></div>
                    </div> <!-- /.col -->
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">Your Email:</label>
                    <div class="col-md-10">
                        <div class="form-control-static"><asp:Literal ID="lblEmail" runat="server" /></div>
                    </div> <!-- /.col -->
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">Your Position(s):</label>
                    <div class="col-md-10">
                        <div class="form-control-static">
                            <asp:Literal ID="lblPositions" runat="server" />
                            <div><a href="<%= master.RelativePath %>/Players/Profile/">Edit Positions</a></div>
                        </div>
                    </div> <!-- /.col -->
                </div>

                <div class="form-group">
                    <label class="control-label col-md-2">Additional Information: <span>*</span></label>
                    <div class="col-md-10">
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="8" />
                        <asp:RequiredFieldValidator ControlToValidate="txtDescription" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator2" /> 
                    </div> <!-- /.col -->
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2"></label>
                    <div class="col-md-10">
                        <div class="checkbox">
                            <label>
                                <asp:CheckBox ID="chkFilled" runat="server" Text="" />
                                <asp:Label ID="lblFilled" runat="server" CssClass="text" Text="Check this when you have found a team." />
                            </label>
                        </div>
                    </div> <!-- /.col -->
                </div>
                <asp:Panel ID="panFilled" runat="server" CssClass="form-group">
                    <label class="control-label col-md-2"></label>
                    <div class="col-md-10">
                        <div class="form-control-static text-danger"><i class="fa fa-share fa-2x fa-rotate-270"></i> When you find a team, remember to come back and check this flag so everyone else knows.</div>
                    </div> <!-- /.col -->
                </asp:Panel>
                <div class="form-group">
                    <div class="col-md-10 col-md-push-2">
                        <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-secondary" Text="Submit" OnClick="btnAdd_Click" ValidationGroup="valSave" /> 
                        <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-primary" Text="Delete" OnClick="btnDelete_Click" Visible="false" OnClientClick="return confirm('Are you sure you want to delete this post?')" /> 
                        <a href="<%= master.RelativePath %>/Players/SeekingTeams" class="btn btn-default">Back</a>
                    </div> <!-- /.col -->
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
