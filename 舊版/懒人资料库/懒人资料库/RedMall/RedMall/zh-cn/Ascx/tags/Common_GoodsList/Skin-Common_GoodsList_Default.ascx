<%@ Control Language="C#"%>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<!--�Ƽ���Ʒ�б�-->
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
              <li><Hishop:Private_PriceName runat="server" NamePrice="���ļ�" /><!--09.01.13_��ʾ��Ʒ��ʽ���ۼ۵�����-->
                <span class="pros-price-local"><Hishop:Private_Price ID="Private_Price1" runat="server"  PriceTextNoLogin="���¼�鿴" /><!--09.01.13_��û��¼ǰ��������ʾ����,Ҳ������������¼ǰ�͵�¼�����ʾ��ʽ--></span>
              </li>
              <li class="prosp-rice-market">�г��� <Hishop:Private_MarkerPrice ID="Private_MarkerPrice1" runat="server" /></li>
              <li class="prosp-rice-market">һ�ڼ� <Hishop:Private_SalePrice ID="Private_SalePrice1" runat="server" /></li> <!--09.01.13_��ʾ��ƷĬ�����ۼ�-->
              <li class="pros-btn">
              <%--<Hishop:Private_ShoppingCart Text="����" runat="server"  />--%>
              <Hishop:ListBuyButton runat="server">���빺�ﳵ</Hishop:ListBuyButton>
              <Hishop:ListNotifyButton runat="server">����֪ͨ</Hishop:ListNotifyButton>
              </li>
            </ul>
            <br class="clear-left" />
            </td>
            </itemtemplate>
    <footertemplate>
</tr></table>
    </footertemplate>
</asp:DataList>
<!--����-->
