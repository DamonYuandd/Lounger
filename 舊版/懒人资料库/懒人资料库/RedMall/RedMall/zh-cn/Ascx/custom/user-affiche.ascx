<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<asp:DataList ID="dlstAffiches" RepeatColumns="1" RepeatDirection="horizontal" CssClass="userAffiche" runat="server">
    <ItemTemplate>
    <td width="12" align="center" valign="middle"><Hishop:ThemesImage src="images/li.gif" runat="server"></td>
    <td><a href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("AffichesDetails",Eval("AfficheId"))%>'
            target="AffichesDetails" Title='<%#Eval("Title") %>'><Hishop:Private_Affiche_Title Length="15" runat="server" /></a></td>
    </ItemTemplate>
</asp:DataList>