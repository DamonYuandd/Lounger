<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<asp:DataList runat="server" RepeatDirection="Horizontal"  ID="rptBrandProducts">
    <headertemplate>
       <table  border="0" cellspacing="0" cellpadding="0">
          <tr>
            </headertemplate>
    <itemtemplate>
    <td valign="top">
		   <table width="195" border="0" cellpadding="0" cellspacing="0" class="pro_list">
                      <tr>
                        <td height="177" align="center" valign="middle" class="pro_list_bg">
			<Hishop:Common_Link_Product ID="Common_Link_Product1" target="_blank" runat="server" >
                    <Hishop:Common_ProductThumbnail ID="Common_ProductThumbnail1" runat="server" DataField="ThumbnailsUrl" CustomToolTip="ProductName"/></Hishop:Common_Link_Product>
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
                            <tr>
                                <td colspan="2" height="20">
                                    <div class="buy_width" style="text-align:center;">
			                        <Hishop:ListBuyButton ID="ListBuyButton1" runat="server"><Hishop:ThemesImage src="images/icon_buy.gif" runat="server"></Hishop:ListBuyButton>
			                        <span><Hishop:ListNotifyButton ID="ListNotifyButton1" runat="server"><Hishop:ThemesImage src="images/icon_tz.gif" runat="server"></Hishop:ListNotifyButton></span>
			                       <span class="buy_style">
			                       <%--<a href='<%# Globals.GetSiteUrls().SubCategory(Convert.ToInt32(Eval("CategoryId")), null) %>'><Hishop:ThemesImage ID="ThemesImage2" src="images/icon_more.gif" runat="server"></a>--%>
			                       <Hishop:Private_Collection ID="Private_Collection" ImageURL="images/icon_sc.gif" runat="server"  />
                                </td>
                            </tr>
							 <tr>
                                <td   height="20"> 
				  </td>
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

