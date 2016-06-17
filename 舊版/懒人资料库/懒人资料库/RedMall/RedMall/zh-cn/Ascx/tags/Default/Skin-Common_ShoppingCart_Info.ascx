<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<span><Hishop:ThemesImage runat="server" alt="购物车" height="18" longdesc="您的购物车信息" src="images/icon-shoppingcart.jpg" width="19" /> 共计商品 <span class="color-clew font-style-b"><Hishop:Common_ShoppingCart_ProductNum ID="Common_ShoppingCart_ProductNum1" runat="server" /></span> 件，合计 <span class="color-clew font-style-b"><Hishop:Common_ShoppingCart_Money ID="Common_ShoppingCart_Money1" runat="server" /></span></span> 