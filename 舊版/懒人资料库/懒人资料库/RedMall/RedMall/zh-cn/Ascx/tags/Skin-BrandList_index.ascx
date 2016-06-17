<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>
<asp:DataList ID="dlstBrandList" runat="server" RepeatDirection="Horizontal" Width="100%">
  <HeaderTemplate>
     <table width="100%" class="Plist" border="0" cellspacing="0" cellpadding="0">
         <tr>
  </HeaderTemplate>
  <ItemTemplate>
     <td>
        <table><tr><td height="37" valign="middle"> <a id="A1" href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("brand",Eval("BrandId"))%>' runat="server">  
                 <UI:ResizeableImage  runat="server" DataField="Logo" width="62" height="37"  />
            </a></td></tr> 
		<tr><td valign="middle"><a id="A2" href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("brand",Eval("BrandId"))%>' runat="server">  
            <asp:Label ID="lblBrandName" runat="server" Text='<%# Bind("BrandName") %>' ></asp:Label>
        </a></td></tr> </table>

     </td>
  </ItemTemplate>
  <FooterTemplate>
        </tr>
     </table>
  </FooterTemplate>
</asp:DataList>