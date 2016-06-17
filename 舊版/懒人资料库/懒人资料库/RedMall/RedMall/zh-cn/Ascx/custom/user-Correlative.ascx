<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>

<asp:DataList runat="server" RepeatDirection="Horizontal" RepeatColumns="6" ID="listItems" LineType="NewRow" >
    <HeaderTemplate>
        <table cellspacing="0" cellpadding="0" border="0">
            <tr>
    </HeaderTemplate>
    <ItemTemplate>
        <td>
	<table width="230" border="0" cellpadding="0" cellspacing="0" class="mar10" >
        <tr>
          <td width="95" align="center" valign="middle"><Hishop:Common_Link_Product target="_blank" runat="server"><Hishop:Common_ProductThumbnail runat="server" width="89" height="95" DataField="ThumbnailsUrl" CustomToolTip="ProductName"/></Hishop:Common_Link_Product></td>
          <td width="10"></td>
          <td width="125"><span class="color_4eb"><Hishop:Private_ProName length="15" runat="server" /></span><br />
              <span class="price2"><Hishop:Private_SalePrice runat="server" /></span><span class="price3"><Hishop:Private_Price ID="Private_Price1" runat="server" PriceTextNoLogin="ÇëµÇÂ¼" /></span>
			 </td>
        </tr>
      </table>
        </td>
    </itemtemplate>
    <FooterTemplate>
            </tr>
        </table>
    </FooterTemplate>
</asp:DataList>