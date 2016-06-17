<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<asp:Repeater runat="server" ID="rptListItems">
    <HeaderTemplate>
        <table border="0" cellpadding="0" cellspacing="0" class="datalist">
            <tr height="23" class="diplayth">
                <td  class="firstcell">
                    <asp:Literal ID="litJournalNumberHead" runat="server" Text="������ˮ��"></asp:Literal></b>
                </td>
                <td >
                    <asp:Literal ID="litMerchantCodeHead" runat="server" Text="�տ��˺�"></asp:Literal></b>
                </td>
                <td >
                    <asp:Literal ID="litRequestTime" runat="server" Text="����ʱ��"></asp:Literal></b>
                </td>
                <td >
                    <asp:Literal ID="litAmountHead" runat="server" Text="���ֽ��"></asp:Literal></b>
                </td>
                <td >
                    <asp:Literal ID="litRequestStatusHead" runat="server" Text="����״̬"></asp:Literal></b>
                </td>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td >
                <asp:Literal ID="litJournalNumber" runat="server" Text='<%#Eval("JournalNumber") %>'></asp:Literal>
            </td>
            <td >
                <asp:Literal ID="lblMerchantCode" runat="server" Text='<%# Bind("MerchantCode") %>'></asp:Literal>
            </td>
            <td >
                <Hishop:FormatedTimeLabel ID="lblRequestTime" runat="server" Time='<%# Eval("RequestTime") %>'></Hishop:FormatedTimeLabel>
            </td>
            <td >
                <Hishop:FormatedMoneyLabel ID="lblAmount" runat="server" DataField="Amount"></Hishop:FormatedMoneyLabel>
            </td>
            <td >
                <Hishop:BalanceDrawRequestStatusNameLabel ID="lblExpenses" runat="server" DataField="RequestStatus"></Hishop:BalanceDrawRequestStatusNameLabel>
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </tr> </table>
    </FooterTemplate>
</asp:Repeater>