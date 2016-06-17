<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Import Namespace="Hishop.SystemServices" %>

<div id="divProductAttributionValues" style="border:solid 1px #DDDDDD;width:100%;" runat="server">
    <asp:DataList runat="server" ID="dlProductAttributes" RepeatColumns="5" RepeatDirection="Horizontal" Width="100%">
        <HeaderTemplate>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="left">
                <tr>
        </HeaderTemplate>
        <ItemTemplate>
                    <td>
                          <asp:Literal ID="litAttributeName" runat="server" Text='<%# Eval("AttributeDisplayName") %>'></asp:Literal>£º
                          <asp:Literal ID="litValueStr" runat="server" Text='<%# Eval("ValueStr") %>'></asp:Literal></nobr>
                    </td>
        </ItemTemplate>
        <FooterTemplate>
                </tr>
            </table>
        </FooterTemplate>
    </asp:DataList>
</div>
