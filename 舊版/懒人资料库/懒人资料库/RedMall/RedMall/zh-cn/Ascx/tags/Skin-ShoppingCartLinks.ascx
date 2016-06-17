<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<table border="0" align="left" cellpadding="0" cellspacing="0">
    <tr align="left">
        <!-- 链接到购物车 -->
        <td>
            <Hishop:ImageHyperLink ID="lkbProducts" runat="server" ImagePosition="Left" BuyImageUrl="images/cart.jpg"
                NoteImageUrl="images/cancel.jpg"></Hishop:ImageHyperLink>
        </td>
        <td width="12%" style="text-align: left;">
            &nbsp;</td>
    </tr>
</table>
