<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Import Namespace="Hishop.SystemServices" %>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td>
            <a href="javascript:openDialog('<%= Globals.GetSiteUrls().UrlData.FormatUrl("ProductImages",Globals.SafeInt((string)Page.Request.QueryString["productId"], 0)) %>')">
                <img ID="imgProducts" runat="server"/>
            </a>            
        </td>
    </tr>
    <tr>
        <td  style="padding-top:8px;">
            <a href="javascript:openDialog('<%= Globals.GetSiteUrls().UrlData.FormatUrl("ProductImages",Globals.SafeInt((string)Page.Request.QueryString["productId"], 0)) %>')">
                <Hishop:ThemesImage src="images/morepics.gif" runat="server" width="117" height="15"
                    Style="border: 0px; display: block">
                </Hishop:ThemesImage></a></td>
    </tr>
    <tr>
        <td align="center">
            &nbsp;</td>
    </tr>
</table>
