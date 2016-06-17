<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>

<asp:Repeater runat="server" ID="rptListItems">
    <HeaderTemplate>
        <table  border="0" cellpadding="0" cellspacing="0" class="datalist">
            <tr height="23" class="diplayth">
                <td  class="firstcell">
                    <asp:Literal ID="litFreezeTypeHead" runat="server" Text="类型"></asp:Literal></b>
                </td>
                <td >
                    <asp:Literal ID="litAmountHead" runat="server" Text="金额"></asp:Literal></b>
                </td>
                <td >
                    <asp:Literal ID="litTRemarkHead" runat="server" Text="备注"></asp:Literal></b>
                </td>
                <td >
                    <asp:Literal ID="litFreezeTimeHead" runat="server" Text="日期"></asp:Literal></b>
                </td>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td >
                <Hishop:FreezeTypeNameLabel ID="lblTradeType" runat="server" FreezeType='<%# Bind("FreezeType") %>'></Hishop:FreezeTypeNameLabel>
            </td>
            <td >
                <Hishop:FormatedMoneyLabel ID="lblAmount" runat="server" DataField="Amount" ></Hishop:FormatedMoneyLabel>
            </td>
            <td >
                <asp:Literal ID="litRemark" runat="server" Text='<%#Eval("Remark") %>'></asp:Literal>
            </td>
            <td >
                <Hishop:FormatedTimeLabel ID="lblFreezeTime" runat="server" Time='<%# Eval("FreezeTime") %>'></Hishop:FormatedTimeLabel>
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </tr> </table>
    </FooterTemplate>
</asp:Repeater>