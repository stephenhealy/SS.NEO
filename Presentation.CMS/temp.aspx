<%@ Page Title="" Language="C#" MasterPageFile="~/_Masters/Top.master" AutoEventWireup="true" Inherits="Presentation.CMS.PageClass" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="Models" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        Initialize("Temp", true, "");
        string pass = Encryption.Decrypt("gw3E+39LSiazZLyfvxYbwQ==", Encryption.PassPhrase);
        pass = Encryption.Encrypt("indians", Encryption.PassPhrase);

        if (!IsPostBack)
        {
            string TimeZone = "Eastern Standard Time";
            Data.Setting setting = master.db.Settings.FirstOrDefault();
            if (setting != null && setting.Date != null)
            {
                DateTime now = DateTime.Parse(setting.Date.ToString());
                Response.Write("<p><b>DateTime.Now to LongDateTime</b><br/>" + Models.Statics.DateTimeToString(now, Models.ParseDateTimeType.LongDateTime) + "</p>");
                Response.Write("<p><b>DateTime.Now to LongDateTime EST</b><br/>" + Models.Statics.DateTimeToString(now, Models.ParseDateTimeType.LongDateTime, TimeZone) + "</p>");
            }
        }
    }
    
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Data.Setting setting = master.db.Settings.FirstOrDefault();
        if (setting != null)
        {
            setting.Date = Statics.ParseDateTime(txtDate.Text, chkUTC.Checked);
            master.db.SaveChanges();
        }
        Response.Redirect(Request.Path);
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p><asp:TextBox ID="txtDate" runat="server" Width="200" /></p>
    <p><asp:CheckBox ID="chkUTC" runat="server" Text="UTC" /></p>
    <p>
        <asp:LinkButton ID="btnLogin" runat="server" CssClass="btn btn-primary" OnClick="btnLogin_Click">
            Submit &nbsp; <i class="fa fa-play-circle"></i>
        </asp:LinkButton>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
