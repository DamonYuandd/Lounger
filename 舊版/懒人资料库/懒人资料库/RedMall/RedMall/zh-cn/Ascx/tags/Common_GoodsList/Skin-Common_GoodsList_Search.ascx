<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<!--顶部商品列表-->
<asp:DataList runat="server" ID="rptSearchProducts"  RepeatColumns="1">
    <headertemplate>
       <table  class="adtop" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
          <tr>
            </headertemplate>
    <itemtemplate>
            <td width="155" valign="top">
             <ul class="ascxstyle2">
  <li class="pros-img2">  <Hishop:Common_Link_Product ID="Common_Link_Product1" target="_blank" runat="server" >
                    <Hishop:Common_ProductThumbnail ID="Common_ProductThumbnail1" runat="server" DataField="ThumbnailsUrl" CustomToolTip="ProductName"/></Hishop:Common_Link_Product></li>
  <li class="pros-name2"><Hishop:Private_ProName ID="Private_ProName1" runat="server" /></li>
  <li><span class="pros-price-local2"><Hishop:Private_Price ID="Private_Price1" runat="server" /></span><span class="prosp-rice-market2"><Hishop:Private_MarkerPrice ID="Private_MarkerPrice1" runat="server" /></span></li>
  
</ul>
            </td>
            </itemtemplate>
    <footertemplate>
          </tr>
        </table>
    </footertemplate>
</asp:DataList>
<!--结束-->
