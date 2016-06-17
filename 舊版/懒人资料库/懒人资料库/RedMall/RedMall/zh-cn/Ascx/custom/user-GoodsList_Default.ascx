<%@ Control Language="C#"%>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<!--推荐商品列表-->
<asp:DataList runat="server" RepeatDirection="Horizontal" RepeatColumns="3" ID="rptListItems" LineType="NewRow">
    <headertemplate>
       <table  border="0" cellspacing="0" cellpadding="0">
          <tr>
            </headertemplate>
    <itemtemplate>
    <td valign="top">
		   <table width="193" border="0" cellpadding="0" cellspacing="0" class="pro_list">
                      <tr>
                        <td height="190" align="center" valign="middle" class="pro_list_bg">
			<Hishop:Common_Link_Product ID="Common_Link_Product1"  target="_blank" runat="server" >
                    <Hishop:Common_ProductThumbnail ID="Common_ProductThumbnail1" width="170"  height="170" runat="server" DataField="ThumbnailsUrl" CustomToolTip="ProductName"/></Hishop:Common_Link_Product>
			</td>
                      </tr>
                      <tr>
                        <td height="5"></td>
                      </tr>
                      <tr>
                        <td align="center" height="30"><span class="proName"><Hishop:Private_ProName ID="Private_ProName1" length="12" runat="server" /></span></td>
                      </tr>
                      <tr>
                        <td align="center">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="20">市场价：</td>
                                <td><span class="color_black"><Hishop:Private_MarkerPrice ID="Private_MarkerPrice1" runat="server" /></span></td>
                            </tr>
                            <tr>
                                <td>零售价：</td>
                                <td><span class="color_black"><Hishop:Private_SalePrice ID="Private_SalePrice1" runat="server" /></span></td>
                            </tr>
                            <tr>
                                <td class="price1"><Hishop:Private_PriceName ID="Private_PriceName1" runat="server" NamePrice="您的价" />：</td>
                                <td><span class="price1"><Hishop:Private_Price ID="Private_Price1" runat="server" PriceTextNoLogin="请登录" /></span></td>
                            </tr>
                        </table>                           
                          </td>
                      </tr>
                  </table></td>
            </itemtemplate>
    <footertemplate>
          </tr>
        </table>
    </footertemplate>
</asp:DataList>
<!--结束-->

