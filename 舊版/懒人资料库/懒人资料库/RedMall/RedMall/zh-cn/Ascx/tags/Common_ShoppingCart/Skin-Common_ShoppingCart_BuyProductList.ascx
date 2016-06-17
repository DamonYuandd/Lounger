<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>

<asp:GridView ID="grdCartProduct" runat="server" AutoGenerateColumns="false" Width="96%" HorizontalAlign="Center" CssClass="ShoppingCart_BuyProductList">
    <Columns>
        <asp:TemplateField HeaderText="商品名称"
            ItemStyle-HorizontalAlign="Center" ItemStyle-Width="63%">
            <ItemTemplate>
                <asp:Literal ID="litProductName" runat="server" Text='<%# Bind("ItemDescription") %>'></asp:Literal>
                <%# Eval("Remark") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="购买数量" DataField="Quantity"
            ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
        <asp:TemplateField HeaderText="价格" ItemStyle-HorizontalAlign="Center"
            ItemStyle-Width="9%">
            <ItemTemplate>
                <Hishop:FormatedMoneyLabel ID="lblPrice" runat="server" Money='<%# Bind("AdjustedPrice") %>'></Hishop:FormatedMoneyLabel>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="发货数量" DataField="ShipmentQuantity"
            ItemStyle-HorizontalAlign="Center" ItemStyle-Width="70px" />
        <asp:TemplateField HeaderText="小计"
            ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
            <ItemTemplate>
                <Hishop:Private_ShoppingCart_OneSubtotalForOrder ID="Private_ShoppingCart_OneSubtotal1" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>