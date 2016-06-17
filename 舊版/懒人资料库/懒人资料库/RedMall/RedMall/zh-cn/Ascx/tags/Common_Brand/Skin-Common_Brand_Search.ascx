<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<asp:DataList ID="dlstBrandList" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" Width="100%">
  <HeaderTemplate>
     <table width="100%" class="Plist" border="0" cellspacing="0" cellpadding="0">
         <tr>
  </HeaderTemplate>
  <ItemTemplate>
     <td align="center">
        <a href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("brand",Eval("BrandId"))%>' runat="server"> 
            <asp:Label ID="lblBrandName" runat="server" Text='<%# Bind("BrandName") %>'></asp:Label>
        </a>
     </td>
     <td style="width:10px;"></td>
  </ItemTemplate>
  <FooterTemplate>
        </tr>
     </table>
  </FooterTemplate>
</asp:DataList>