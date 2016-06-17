<%@ Control Language="C#"%>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<!--推荐商品列表-->
<asp:DataList runat="server" RepeatDirection="Horizontal" RepeatColumns="3" ID="rptListItems" LineType="NewRow">
    <headertemplate>
		<table border="0" cellpadding="0" cellspacing="0">
                <tr>
            </headertemplate>
    <itemtemplate>
    		<table width="107" border="0" cellpadding="0" cellspacing="0" class="mar_left10">
                <tr>
                  <td height="179" align="center" style="padding:3px;" class="pro_index_listbg"><Hishop:Common_Link_Product ID="Common_Link_Product1" target="_blank" runat="server" >
                <Hishop:Common_ProductThumbnail ID="Common_ProductThumbnail1" runat="server" width="135" DataField="ThumbnailsUrl" CustomToolTip="ProductName"/></Hishop:Common_Link_Product></td>
                </tr>
                <tr>
                  <td align="left" class="pad_top5" align="center"><Hishop:Private_ProName ID="Private_ProName1" length="10" runat="server" /><br/>
                    <span class="color_black">零售价：</span><span class="price1"><Hishop:Private_SalePrice ID="Private_SalePrice1" runat="server" /></span>
		    <br>
		    <span class="color_black"><Hishop:Private_PriceName ID="Private_PriceName1" runat="server" NamePrice="您的价" />：</span><span class="price1"><Hishop:Private_Price ID="Private_Price1" runat="server" PriceTextNoLogin="请登录" /></span>
		    </td>
                </tr>
              </table>
            </itemtemplate>
    <footertemplate>
                </tr>
              </table>
    </footertemplate>
</asp:DataList>
<!--结束-->

