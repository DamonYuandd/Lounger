<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<table cellspacing="0" cellpadding="0">
<tr>
    <td style="padding-right:10px;"><Hishop:Common_CurrentUser runat="server" ID="lblCurrentUser"/> <span class="login_logout">
	
	
	<Hishop:Common_Link_MyAccount ID="linkMyAccount" style=" display:none;" runat="server" /> </span></td>
		   <td style="padding-right:10px;">
		    <Hishop:SiteUrl UrlName="shoppingCart" runat="server"> 
              <Hishop:ThemesImage runat="server" alt="购物车" height="18" longdesc="您的购物车信息" src="images/icon-shoppingcart.jpg" width="19" />  <span style="color:#000000">购物车共计商品 </span><span class="color-clew"><Hishop:Common_ShoppingCart_ProductNum ID="Common_ShoppingCart_ProductNum1" runat="server" /></span> <span style="color:#000000">件
              合计</span> <span class="color-clew"><Hishop:Common_ShoppingCart_Money ID="Common_ShoppingCart_Money1" runat="server" /></span>      </Hishop:SiteUrl>
           </td>
  </tr>
</table>
