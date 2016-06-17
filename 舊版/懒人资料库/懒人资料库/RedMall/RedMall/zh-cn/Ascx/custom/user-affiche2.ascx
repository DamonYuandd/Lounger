<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<asp:DataList ID="dlstAffiches" RepeatColumns="1" RepeatDirection="horizontal" CssClass="userAffiche" runat="server">
    <HeaderTemplate>
        <table style="width:100%" cellspacing="0" cellpadding="0" border="0">
            <tr>
    </HeaderTemplate>
   <ItemTemplate>
		<table width="203" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="16" height="25" align="center" valign="middle"><Hishop:ThemesImage src="images/icon4.jpg" runat="server"></td>
                      <td width="187" valign="middle"><a href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("AffichesDetails",Eval("AfficheId"))%>'
            target="AffichesDetails" Title='<%#Eval("Title") %>'><Hishop:Private_Affiche_Title runat="server" Length="16"  /></a></td>
                    </tr>
                  </table>
   </ItemTemplate>
   <FooterTemplate>
            </tr>
        </table>
   </FooterTemplate>
</asp:DataList>