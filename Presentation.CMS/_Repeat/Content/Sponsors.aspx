<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/repeat.master" AutoEventWireup="true" CodeBehind="Sponsors.aspx.cs" Inherits="Presentation.CMS._Repeat.Content.Sponsors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Buttons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Parent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Edit" runat="server">
    <ul class="nav nav-tabs" id="myTab1">
	    <li class="active">
		    <a data-toggle="tab" href="#general">General</a>
	    </li>
	    <li class="">
		    <a data-toggle="tab" href="#featured">Set as Featured</a>
	    </li>
    </ul>
    <div id="myTab1Content" class="tab-content">
        <div class="tab-pane fade active in" id="general">
            <div class="form-group">
                <label class="col-sm-2 control-label">Name: *</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control focus" MaxLength="50" />
                    <asp:RequiredFieldValidator ControlToValidate="txtName" CssClass="validation-required validation-text" ValidationGroup="valSave" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator2" /> 
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Logo:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtLogo" runat="server" CssClass="form-control" MaxLength="100" />
                    <asp:LinkButton ID="btnLogo" runat="server" CssClass="btn btn-primary btn-xs browse-image" Text="Browse..." /><br />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Website:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtWebsite" runat="server" CssClass="form-control" MaxLength="100" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Address:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" MaxLength="50" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">City:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" MaxLength="50" />
                </div>
                <label class="col-sm-1 control-label">State:</label>
                <div class="col-sm-1">
                    <asp:TextBox ID="txtState" runat="server" CssClass="form-control" MaxLength="2" />
                </div>
                <label class="col-sm-1 control-label">Zip:</label>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtZip" runat="server" CssClass="form-control" MaxLength="10" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Phone:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control phone" MaxLength="15" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Description:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
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
        </div>
        <div class="tab-pane fade" id="featured">
            <div class="form-group">
                <label class="col-sm-2 control-label">Enable:</label>
                <div class="col-sm-10">
                    <div class="checkbox">
                        <label>
                            <asp:CheckBox ID="chkFeatured" runat="server" />
                            <span class="text"></span>
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Advertisement:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtAdvertisement" runat="server" CssClass="form-control" MaxLength="100" />
                    <asp:LinkButton ID="btnAdvertisement" runat="server" CssClass="btn btn-primary btn-xs browse-image" Text="Browse..." /><br />
                    <div><small>Dimensions: 180px x 150px</small></div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Link:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtLink" runat="server" CssClass="form-control" MaxLength="100" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Times Clicked:</label>
                <div class="col-sm-2">
                    <p class="form-control-static">
                        <asp:Literal ID="litTimes" runat="server" Text="<small><em>Never</em></small>" />
                    </p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Last Clicked:</label>
                <div class="col-sm-10">
                    <p class="form-control-static">
                        <asp:Literal ID="litLast" runat="server" Text="<small><em>Never</em></small>" />
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
