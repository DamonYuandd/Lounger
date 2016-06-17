<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<asp:Repeater runat="server" ID="rptListItems">
    <HeaderTemplate>
        <table  border="0" cellpadding="0" cellspacing="0" class="datalist">
            <tr height="23" class="diplayth">
                <td class="firstcell">
                    <asp:Literal ID="litJournalNumberHead" runat="server" Text="流水号"></asp:Literal></b></td>
                <td >
                    <asp:Literal ID="litTradeDateHead" runat="server" Text="时间"></asp:Literal></b></td>
                <td >
                    <asp:Literal ID="litTradeTypeHead" runat="server" Text="类型"></asp:Literal></b></td>
                <td >
                    <asp:Literal ID="litIncomeHead" runat="server" Text="收入"></asp:Literal></b></td>
                <td >
                    <asp:Literal ID="litExpensesHead" runat="server" Text="支出"></asp:Literal></b></td>
                <td >
                    <asp:Literal ID="litBalanceHead" runat="server" Text="账户余额"></asp:Literal></b></td>
                <td >
                    <asp:Literal ID="litRemarkHead" runat="server" Text="备注"></asp:Literal></b></td>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td >
                <asp:Literal ID="litJournalNumber" runat="server" Text='<%#Eval("JournalNumber") %>'></asp:Literal></td>
            <td >
                <Hishop:FormatedTimeLabel ID="lblTradeDate" runat="server" Time='<%# Eval("TradeDate") %>'></Hishop:FormatedTimeLabel></td>
            <td >
                <Hishop:TradeTypeNameLabel ID="lblTradeType" runat="server" TradeType="TradeType"></Hishop:TradeTypeNameLabel></td>
            <td >
                <Hishop:FormatedMoneyLabel ID="lblIncome" runat="server" DataField="Income"></Hishop:FormatedMoneyLabel></td>
            <td >
                <Hishop:FormatedMoneyLabel ID="lblExpenses" runat="server" DataField="Expenses"></Hishop:FormatedMoneyLabel></td>
            <td >
                <Hishop:FormatedMoneyLabel ID="lblBalance" runat="server" DataField="Balance"></Hishop:FormatedMoneyLabel></td>
            <td style="word-break:break-all;width:220px;">
                <asp:Literal ID="litRemark" runat="server" Text='<%# Eval("Remark") %>'></asp:Literal></td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </tr> </table>
    </FooterTemplate>
</asp:Repeater>
