<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<asp:DataList runat="server" ID="dlProductAttributes" RepeatColumns="5" RepeatDirection="Horizontal" Width="100%">
        <HeaderTemplate>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="left">
                <tr>
        </HeaderTemplate>
        <ItemTemplate>
                    <td>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-bottom:#ccc 1px dashed;margin-bottom:8px;">
                <tr>
              <td align="left" valign="top" width="90" class="t14"><b><asp:Literal ID="litAttributeName" runat="server" Text='<%# Eval("AttributeName") %>'></asp:Literal>£º</b></td>
              <td width="8" valign="top" align="left"><Hishop:ThemesImage ID="ThemesImage1" src="images/pro_details_line3.jpg" runat="server"></td>
              <td align="left" valign="top" class="t14"><asp:Literal ID="litValueStr" runat="server" Text='<%# Eval("ValueStr") %>'></asp:Literal></td>
                </tr>
              </table>
                    </td>
        </ItemTemplate>
        <FooterTemplate>
                </tr>
            </table>
        </FooterTemplate>
</asp:DataList>