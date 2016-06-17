<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %> 
<div style="font-size:14px;font-weight:700;color:red;padding-top:14px;padding-bottom:10px;text-align:left;">可选的礼品</div>
<asp:DataList ID="grdSaleGifts" runat="server" Width="100%" RepeatDirection="Horizontal" RepeatColumns="3" CssClass="giftlist">
    <ItemTemplate>
            <table width="130" border="0" cellspacing="0" cellpadding="0" class="giftFloat">
              <tr>
                <td valign="top"><table width="100" border="0" cellspacing="0" cellpadding="0" class="giftMargin">
                    <tr>
                      <td height="120" align="center" valign="middle" class="giftBorder"><Hishop:Common_ProductThumbnail ID="Common_ProductThumbnail1" runat="server" DataField="ThumbnailsUrl" width="80" CustomToolTip="Name"/></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td>礼品名称：<span class="color_blue"><asp:Label ID="Label1" runat="server" Text='<%#Eval("Name") %>'></asp:Label></span></td>
              </tr>
              <tr>
                <td>礼品价格：<span class="color_red"><Hishop:FormatedMoneyLabel ID="FormatedMoneyLabel1" runat="server" DataField="SalePrice"></Hishop:FormatedMoneyLabel></span></td>
              </tr>
              <tr>
                <td>　　库存：<span class="color_blue"><Hishop:Private_ShoppingCart_Stock ID="Private_ShoppingCart_Stock1"  runat="server" /></span></td>
              </tr>
              <tr>
                <td align="center"><asp:LinkButton ID="lkbSelect" runat="server" CommandArgument='<%# Bind("GiftId") %>' CommandName="Select"><Hishop:ThemesImage ID="ThemesImage1" runat="server" src="images/gift_cart.gif" width="91" height="24" /></asp:LinkButton></td>
              </tr>
            </table>    
    </ItemTemplate>
</asp:DataList>
