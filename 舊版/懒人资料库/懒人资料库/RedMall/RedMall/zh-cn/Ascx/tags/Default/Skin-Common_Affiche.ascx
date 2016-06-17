<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<asp:DataList ID="dlstAffiches" RepeatColumns="1" RepeatDirection="horizontal" runat="server">
    <ItemTemplate>
      <td><a href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("AffichesDetails",Eval("AfficheId"))%>'
            target="AffichesDetails"><Hishop:Private_Affiche_Title ID="Private_Affiche_Title1" runat="server" Length="11" /></a></td>
      <td align="right" class="noticedate"><Hishop:Private_Affiche_Time ID="Private_Affiche_Time1" runat="server" /></td>
    </ItemTemplate>
</asp:DataList>