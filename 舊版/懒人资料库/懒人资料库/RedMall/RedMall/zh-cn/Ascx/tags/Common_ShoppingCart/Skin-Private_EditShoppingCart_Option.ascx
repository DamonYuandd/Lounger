<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<asp:Repeater ID="rptProductOption" runat="server">
    <ItemTemplate>
        <div style="clear: both;margin-right: 4px;">
            <div style="float: left; margin-right: 4px;">
                <UI:ResizeableImage runat="server" ImageUrl='<%# Eval("ImageUrl") %>' Height="25"
                    Width="25" />
            </div>
                <asp:Literal ID="litListName" runat="server" Text='<%# Eval("ListDescription") %>' />£º<asp:Literal ID="litItemName" runat="server" Text='<%# Eval("ItemDescription") %>' />
            <span style="color: red">(<Hishop:FormatedMoneyLabel ID="FormatedMoneyLabel1" runat="server" Money='<%# Eval("AdjustedPrice") %>' />)</span>
        </div>
    </ItemTemplate>
</asp:Repeater>
