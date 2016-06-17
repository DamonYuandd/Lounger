<%@ Control Language="C#"%>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<!--推荐商品列表-->
<asp:DataList runat="server" RepeatDirection="Horizontal" RepeatColumns="3" ID="rptListItems" LineType="NewRow">
    <headertemplate>
<table><tr>
            </headertemplate>
    <itemtemplate>
            <td  valign="top">
               <ul class="ascxstyle">
               
              <li class="pros-img"><Hishop:Common_Link_Product ID="Common_Link_Product1" target="_blank" runat="server" >
                <Hishop:Common_ProductThumbnail ID="Common_ProductThumbnail1" runat="server" DataField="ThumbnailsUrl" CustomToolTip="ProductName"/></Hishop:Common_Link_Product></li>
              <li class="pros-name"><Hishop:Private_ProName ID="Private_ProName1" length="15" runat="server" /></li>
              <li><Hishop:Private_PriceName runat="server" NamePrice="您的价" /><!--09.01.13_显示商品正式销售价的名称-->
                <span class="pros-price-local"><Hishop:Private_Price ID="Private_Price1" runat="server"  PriceTextNoLogin="请登录查看" /><!--09.01.13_在没登录前设置其显示内容,也可以设置他登录前和登录后的显示样式--></span>
              </li>
              <li class="prosp-rice-market">市场价 <Hishop:Private_MarkerPrice ID="Private_MarkerPrice1" runat="server" /></li>
              <li class="prosp-rice-market">一口价 <Hishop:Private_SalePrice ID="Private_SalePrice1" runat="server" /></li> <!--09.01.13_显示商品默认销售价-->
              <li class="pros-btn">
              <%--<Hishop:Private_ShoppingCart Text="购买" runat="server"  />--%>
              <Hishop:ListBuyButton runat="server">加入购物车</Hishop:ListBuyButton>
              <Hishop:ListNotifyButton runat="server">到货通知</Hishop:ListNotifyButton>
              </li>
            </ul>
            <br class="clear-left" />
            </td>
            </itemtemplate>
    <footertemplate>
</tr></table>
    </footertemplate>
</asp:DataList>
<!--结束-->
