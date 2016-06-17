<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<asp:DataList ID="listOrderItems" runat="server" RepeatColumns="1" RepeatDirection="Horizontal" DataKeyField="ItemId" width="100%">
    <HeaderTemplate>
        <table  style="border:1px solid #DDDDDD;" border="0" cellpadding="0" cellspacing="0" width="80%">
            <tr>
                <td width="60" style="border-bottom:1px solid #DDDDDD;">
                    <strong><asp:Literal ID="litCheck" runat="server" Text="选择"></asp:Literal></strong>
                </td>
                <td width="50%" style="border-bottom:1px solid #DDDDDD;">
                    <strong><asp:Literal ID="litItemName" runat="server" Text="订单项"></asp:Literal></strong></td>
                <td  width="20%" style="border-bottom:1px solid #DDDDDD;">
                    <span><asp:Literal ID="litProductQuantity" runat="server" Text="购买数量"></asp:Literal></span>
                </td>
                <td style="border-bottom:1px solid #DDDDDD;">
                    <strong><asp:Literal ID="litMoney" runat="server" Text="金额"></asp:Literal></strong>
                </td>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td style="border-bottom:1px dashed #DDDDDD;">
                <asp:CheckBox ID="checkboxCol" runat="server" Width="30" /></td>
            <td style="border-bottom: solid 1px #DDDDDD";>
                <asp:Literal ID="litItem" runat="server" Text='<%# Eval("ItemDescription")%>'></asp:Literal>
            </td>
            <td  style="border-bottom: solid 1px #DDDDDD";>
                <asp:Literal ID="litQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Literal></td>
            <td style="border-bottom: solid 1px #DDDDDD";>
                 <Hishop:FormatedMoneyLabel ID="lblPrice" runat="server" Money='<%# Eval("AdjustedPrice") %>' />
            </td>
                                    
        </tr>                            
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:DataList>