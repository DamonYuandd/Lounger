<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>

<asp:DataList ID="dlstList" RepeatDirection="Vertical" DataKeyField="OrderId"
    ItemStyle-Font-Size="12px" runat="Server" Width="100%" RepeatColumns="2">
    <ItemTemplate>
        <table align="left" width="100%">
            <tr >
                <td>订单号：<%# Eval("OrderId")%></td>
            </tr>
            <tr>
                <td>发货单号：<asp:Literal runat="server" Text='<%# Eval("ShipOrderNumber") %>'>'></asp:Literal></td>
            </tr>
             <tr>
                <td>配送方式：<asp:Literal runat="server" Text='<%# (Eval("ShippingStatus").ToString() =="1")?Eval("RealModeName"):Eval("ModeName") %>'></asp:Literal></td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>