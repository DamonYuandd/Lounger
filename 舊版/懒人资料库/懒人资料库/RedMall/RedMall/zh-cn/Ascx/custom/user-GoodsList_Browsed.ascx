<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<!--浏览过的商品列表-->
<asp:DataList runat="server" ID="listBrowsedProduct" >
    <headertemplate>
      <table width="100%" class="adtop" border="0" cellspacing="0" cellpadding="0" style="margin-top:8px;">
        <tr>
    </headertemplate>
    <itemtemplate>            
		 <td align="center" style="padding-bottom:10px;">
    <table style="width: 100%;text-align:center;margin-bottom:5px;">
          <tr>
            <td><Hishop:Common_Link_Product ID="Common_Link_Product1" target="_blank" runat="server">
                    <Hishop:Common_ProductThumbnail ID="Common_ProductThumbnail1" runat="server" DataField="ThumbnailsUrl" CustomToolTip="ProductName"/>
            </Hishop:Common_Link_Product></td>
          </tr>
          <tr>
            <td><Hishop:Private_ProName ID="Private_ProName1"  Length="12" runat="server" /></td>
          </tr>
        </table>
        </td>
    </itemtemplate>
    <footertemplate>
            </tr>
        </table>
    </footertemplate>
</asp:DataList>
<!--结束-->
<div class="clear_font" style="margin-top:10px; margin-left:40px;"><asp:LinkButton ID="btnDeleteListItems" runat="server" Text="清除我的浏览记录" ></asp:LinkButton ></div>