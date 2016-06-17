<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>

<asp:DataList runat="server" RepeatDirection="Horizontal" RepeatColumns="6" ID="listItems" LineType="NewRow" >
    <HeaderTemplate>
        <table style="width:100%" cellspacing="0" cellpadding="0" border="0">
            <tr>
    </HeaderTemplate>
    <ItemTemplate>
        <td style="font-size:12px;">
            <table cellspacing="0"  style="width:100px;margin-left:30px; margin-right:30px;" cellpadding="0" border="0"  style="font-size:12px;">
                <tr>
                    <td height="125" colspan="2">
                        <Hishop:Common_Link_Product target="_blank" runat="server"><Hishop:Common_ProductThumbnail runat="server" DataField="ThumbnailsUrl" CustomToolTip="ProductName"/></Hishop:Common_Link_Product>
                    </td>
                </tr>
                <tr>
                    <td height="20" colspan="2" class="productName">
                        <Hishop:Private_ProName length="15" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td height="20" colspan="2"><span class="pricetwo"><Hishop:Private_Price runat="server" /></span>
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
