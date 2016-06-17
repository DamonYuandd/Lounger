<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<asp:Repeater ID="rptCategorys" runat="server">
    <HeaderTemplate>
        <table style="width: 100%" cellspacing="0" cellpadding="0" border="0">
            <tr>
    </HeaderTemplate>
    <ItemTemplate>
        <td>
            <%# Eval("Name") %>
        </td>
    </ItemTemplate>
    <FooterTemplate>
        </tr> </table>
    </FooterTemplate>
</asp:Repeater>
