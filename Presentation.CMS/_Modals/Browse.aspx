<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/Browser.master" AutoEventWireup="true" CodeBehind="Browse.aspx.cs" Inherits="Presentation.CMS._Modals.Browse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="<%= master.RelativePath %>/css/browse.css" />
    <link rel="stylesheet" href="<%= master.RelativePath %>/vendor/bootstrap-jasny/jasny-bootstrap.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="position: absolute; top: 0px; left: 0px; right: 0px; bottom: 45px; height: auto; overflow: hidden;">
        <div class="row full-height">
            <div class="col-sm-12 full-height">
                <ul id="myTab1" class="nav nav-tabs">
                    <li class="<%= IsLink ? "active" : "" %>" style="<%= IsLink ? "" : "display:none" %>">
                        <a href="#pages" data-toggle="tab">Web Page</a>
                    </li>
                    <li class="<%= IsFile ? "active" : "" %>" style="<%= IsLink || IsFile ? "" : "display:none" %>">
                        <a href="#file" data-toggle="tab">File</a>
                    </li>
                    <li class="" style="<%= IsFile && master.User.Super ? "" : "display:none" %>">
                        <a href="#cms" data-toggle="tab">CMS</a>
                    </li>
                    <li class="<%= IsImage ? "active" : "" %>" style="<%= IsImage || IsFile ? "" : "display:none" %>">
                        <a href="#image" data-toggle="tab">Image</a>
                    </li>
                    <li class="" style="<%= IsLink || IsFile ? "" : "display:none" %>">
                        <a href="#link" data-toggle="tab">Direct Link</a>
                    </li>
                    <li class="">
                        <a href="#upload" data-toggle="tab">Upload</a>
                    </li>
                </ul>
                <div id="myTabContent" class="tab-content full-height">
                    <!-- Web Pages -->
                    <div class="tab-pane fade full-height<%= IsLink ? " active in" : "" %>" id="pages">
                        <div class="full-height preview">
                            <div class="browser-top-left">
                                Site Navigation:
                            </div>
                            <div class="browser-bottom-left">
                                <asp:TreeView ID="trePages" runat="server" NodeIndent="25" ShowLines="true" />
                            </div>
                            <div class="browser-top-right">
                                Path to Page:
                                <input class="browser-value form-control" type="text" />
                                <br />
                                Preview of the Page:
                            </div>
                            <div class="browser-bottom-right">
                                <div class="browse-iframe full-height"></div>
                            </div>
                        </div>
                    </div> <!-- /Web Pages -->

                    <!-- File -->
                    <div class="tab-pane fade full-height<%= IsFile ? " active in" : "" %>" id="file">
                        <div class="full-height preview">
                            <div class="browser-top-left">
                                Files on your website:
                            </div>
                            <div class="browser-bottom-left">
                                <asp:TreeView ID="treFile" runat="server" NodeIndent="25" ShowLines="true" />
                            </div>
                            <div class="browser-top-right">
                                Path to File:
                                <asp:TextBox ID="txtFile" runat="server" CssClass="browser-value form-control" ReadOnly="true" placeholder="Use tree in side panel to select..." />
                                <asp:RequiredFieldValidator ControlToValidate="txtFile" CssClass="validation-required validation-text" ValidationGroup="valFile" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator5" /> 
                                <br />
                                Preview of the File:
                                <div class="browser-delete">
                                    <asp:Button ID="btnFile" runat="server" CssClass="btn btn-primary btn-sm" Text="Delete Selected File" OnClick="btnFile_Click" /> 
                                </div>
                            </div>
                            <div class="browser-bottom-right">
                                <div class="browse-iframe full-height"></div>
                            </div>
                        </div>
                    </div> <!-- /File -->

                    <!-- CMS -->
                    <div class="tab-pane fade full-height" id="cms">
                        <div class="full-height preview">
                            <div class="browser-top-left">
                                Files in the CMS:
                            </div>
                            <div class="browser-bottom-left">
                                <asp:TreeView ID="treAdmin" runat="server" NodeIndent="25" ShowLines="true" />
                            </div>
                            <div class="browser-top-right">
                                Path to File:
                                <asp:TextBox ID="txtCMS" runat="server" CssClass="browser-value form-control" ReadOnly="true" placeholder="Use tree in side panel to select..." />
                                <asp:RequiredFieldValidator ControlToValidate="txtCMS" CssClass="validation-required validation-text" ValidationGroup="valCMS" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator4" /> 
                                <br />
                                Preview of the File:
                                <div class="browser-delete">
                                    <asp:Button ID="btnCMS" runat="server" CssClass="btn btn-primary btn-sm" Text="Delete Selected File" OnClick="btnCMS_Click" /> 
                                </div>
                            </div>
                            <div class="browser-bottom-right">
                                <div class="browse-iframe full-height"></div>
                            </div>
                        </div>
                    </div> <!-- /CMS -->

                    <!-- Image -->
                    <div class="tab-pane fade full-height<%= IsImage ? " active in" : "" %>" id="image">
                        <div class="full-height preview">
                            <div class="browser-top-left">
                                Images on your website:
                            </div>
                            <div class="browser-bottom-left">
                                <asp:TreeView ID="treImage" runat="server" NodeIndent="25" ShowLines="true" />
                            </div>
                            <div class="browser-top-right">
                                Path to Image:
                                <asp:TextBox ID="txtImage" runat="server" CssClass="browser-value form-control" ReadOnly="true" placeholder="Use tree in side panel to select..." />
                                <asp:RequiredFieldValidator ControlToValidate="txtImage" CssClass="validation-required validation-text" ValidationGroup="valImage" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator3" /> 
                                <br />
                                Preview of the Image:
                                <div class="browser-delete">
                                    <asp:Button ID="btnImage" runat="server" CssClass="btn btn-primary btn-sm" Text="Delete Selected Image" OnClick="btnImage_Click" />
                                </div>
                            </div>
                            <div class="browser-bottom-right">
                                <div class="browse-iframe full-height"></div>
                            </div>
                        </div>
                    </div> <!-- /Image -->

                    <!-- Direct -->
                    <div class="tab-pane fade full-height" id="link">
                        <div class="full-height">
                            <div class="browser-top-left">
                            </div>
                            <div class="browser-bottom-left">
                                <a href="#" onclick="ShowPreview(this);" class="btn btn-primary">Show Preview</a>
                            </div>
                            <div class="browser-top-right">
                                Link:
                                <input class="browser-value form-control direct" type="text" />
                                <br />
                                Preview of the Link:
                            </div>
                            <div class="browser-bottom-right">
                                <div class="browse-iframe full-height"></div>
                            </div>
                        </div>
                    </div> <!-- /Direct -->

                    <!-- Upload -->
                    <div class="tab-pane fade full-height" id="upload">
                        <div class="full-height preview">
                            <div class="browser-top-left">
                                Destination Folders:
                            </div>
                            <div class="browser-bottom-left">
                                <asp:TreeView ID="treUpload" runat="server" NodeIndent="25" ShowLines="true" />
                            </div>
                            <div class="browser-top-right">
                                Upload Destination:<small style="padding-left: 10px">(where the uploaded files will go...)</small>
                                <div class="input-group">
                                    <asp:TextBox ID="txtDelete" runat="server" CssClass="browser-value form-control" ReadOnly="true" placeholder="Use tree in side panel to select..." />
                                    <div class="input-group-btn open">
                                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">Create Folder <span class="caret"></span></button>
                                        <ul class="dropdown-menu dropdown-menu-right" style="width: 300px;">
                                            <li>
                                                <asp:TextBox ID="txtCreate" runat="server" CssClass="form-control" style="display: inline-block; width: 200px;" />
                                                <asp:Button ID="btnCreate" runat="server" CssClass="btn btn-primary" Text="Create" OnClick="btnCreate_Click" style="display: inline-block; margin-left: 5px;" OnClientClick="return DoValidation('valDelete',this) && DoValidation('valCreate',this);" />
                                                <asp:RequiredFieldValidator ControlToValidate="txtCreate" CssClass="validation-required validation-text" ValidationGroup="valCreate" runat="server" ErrorMessage="" Text="" Display="Static" SetFocusOnError="true" ID="RequiredFieldValidator2" /> 
                                            </li>
                                        </ul>
                                    </div><!-- /btn-group -->
                                </div>
                                <asp:RequiredFieldValidator ControlToValidate="txtDelete" CssClass="validation-required validation-text" ValidationGroup="valDelete" runat="server" ErrorMessage="" Text="" Display="Dynamic" SetFocusOnError="true" ID="RequiredFieldValidator1" /> 
                                <br />
                                To Upload Files:
                                <div class="browser-delete">
                                    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-primary btn-sm" Text="Delete Selected Folder" OnClick="btnDelete_Click" /> 
                                </div>
                            </div>
                            <div class="browser-bottom-right" style="border: none">
                                <ol>
                                    <li>Select the destination folder</li>
                                    <li>Select your files (<a href="javascript:;" onclick="alert('If your files are larger than 4 MB, you should request FTP access to your site and upload them using an FTP program such as FileZilla.');">less than 4 MB</a>)</li>
                                    <li>Click <strong>Upload File(s)</strong> button</li>
                                </ol>

                                <!-- File -->
                                <div class="fileinput fileinput-new input-group" data-provides="fileinput">
                                    <div class="form-control" data-trigger="fileinput"><i class="glyphicon glyphicon-file fileinput-exists"></i> <span class="fileinput-filename"></span></div>
                                    <span class="input-group-addon btn btn-default btn-file">
                                        <span class="fileinput-new">Select File</span>
                                        <span class="fileinput-exists">Change</span>
                                        <asp:FileUpload ID="file1" runat="server" />
                                    </span>
                                    <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                </div> <!-- /File -->
                                <!-- File -->
                                <div class="fileinput fileinput-new input-group" data-provides="fileinput">
                                    <div class="form-control" data-trigger="fileinput"><i class="glyphicon glyphicon-file fileinput-exists"></i> <span class="fileinput-filename"></span></div>
                                    <span class="input-group-addon btn btn-default btn-file">
                                        <span class="fileinput-new">Select File</span>
                                        <span class="fileinput-exists">Change</span>
                                        <asp:FileUpload ID="file2" runat="server" />
                                    </span>
                                    <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                </div> <!-- /File -->
                                <!-- File -->
                                <div class="fileinput fileinput-new input-group" data-provides="fileinput">
                                    <div class="form-control" data-trigger="fileinput"><i class="glyphicon glyphicon-file fileinput-exists"></i> <span class="fileinput-filename"></span></div>
                                    <span class="input-group-addon btn btn-default btn-file">
                                        <span class="fileinput-new">Select File</span>
                                        <span class="fileinput-exists">Change</span>
                                        <asp:FileUpload ID="file3" runat="server" />
                                    </span>
                                    <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                </div> <!-- /File -->
                                <div>
                                    <div style="float: right" class="text-danger"><strong>NOTE:</strong> Each file size cannot exceed 4 MB.</div>
                                    <asp:LinkButton ID="btnUpload" runat="server" CssClass="btn btn-primary" Text="Upload File(s)" OnClick="btnUpload_Click" />
                                </div>
                            </div>
                        </div>
                    </div> <!-- /Upload -->

                </div> <!-- /.tab-content -->
            </div>
        </div>
    </div>
    <div style="position: absolute; top: auto; left: 0px; right: 0px; bottom: 0px; height: 35px">
        <div class="row">
            <div class="col-sm-12">
                <asp:LinkButton ID="btnClose" runat="server" CssClass="btn btn-primary pull-right" style="margin-right: 5px;" Text="Close" OnClientClick="window.parent.HideModal('mainModal');return false;" />
                <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-primary pull-right" style="margin-right: 5px;" Text="OK" OnClick="btnSave_Click" />
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hdnValue" runat="server" />
    <asp:ValidationSummary id="sumUpload" HeaderText="The following errors were found:" ShowMessageBox="false" ShowSummary="false" DisplayMode="BulletList" runat="server" ValidationGroup="valUpload" />
    <asp:ValidationSummary id="sumCreate" HeaderText="The following errors were found:" ShowMessageBox="false" ShowSummary="false" DisplayMode="BulletList" runat="server" ValidationGroup="valCreate" />
    <asp:ValidationSummary id="sumDelete" HeaderText="The following errors were found:" ShowMessageBox="false" ShowSummary="false" DisplayMode="BulletList" runat="server" ValidationGroup="valDelete" />
    <asp:ValidationSummary id="sumFolder" HeaderText="The following errors were found:" ShowMessageBox="false" ShowSummary="false" DisplayMode="BulletList" runat="server" ValidationGroup="valFolder" />
    <asp:ValidationSummary id="sumImage" HeaderText="The following errors were found:" ShowMessageBox="false" ShowSummary="false" DisplayMode="BulletList" runat="server" ValidationGroup="valImage" />
    <asp:ValidationSummary id="sumFile" HeaderText="The following errors were found:" ShowMessageBox="false" ShowSummary="false" DisplayMode="BulletList" runat="server" ValidationGroup="valFile" />
    <asp:ValidationSummary id="sumCMS" HeaderText="The following errors were found:" ShowMessageBox="false" ShowSummary="false" DisplayMode="BulletList" runat="server" ValidationGroup="valCMS" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="<%= master.RelativePath %>/vendor/bootstrap-jasny/js/fileinput.js"></script>
    <script type="text/javascript">
        arrLoad.push(new CodeBlock(function () {
            $('.preview').find('a').bind('click', function (e) {  // page preview
                if ($(this).hasClass("fileinput-exists") == false) {
                    e.preventDefault();
                    if ($(this).attr("href").indexOf("javascript:") < 0) {  // exclude treeview +/-
                        var cms_val = $(this).attr("href");
                        var cms_div = $(this).closest(".full-height");
                        cms_div.find(".browser-value").val(cms_val);
                        $('#<%= hdnValue.ClientID%>').val(cms_val);
                        cms_div.find("div.browse-iframe").empty().append("<iframe width='100%' height='100%' frameborder='0' scrolling='auto' allowtransparency='true' src='" + cms_val + "'></iframe>");
                    }
                    else   // execute href function
                        eval($(this).attr("href"));
                }
            });
            $(".direct").keyup(function () {
                $('#<%= hdnValue.ClientID%>').val($(this).val());
            });
        }));
        function ShowPreview(btn) {
            var cms_div = $(btn).closest(".full-height");
            try {
                cms_div.find("div.browse-iframe").empty().append("<iframe width='100%' height='100%' frameborder='0' scrolling='auto' allowtransparency='true' src='" + cms_div.find(".browser-value").val() + "'></iframe>");
            }
            catch (ex) {
                alert(ex);
            }
        }
        function DoConfirm(validation, button, text) {
            var but = $('#' + button);
            if (DoValidation(validation, but) == true) {
                return Confirm(but, text)
            }
            else {
                return false;
            }
        }
    </script>
</asp:Content>
