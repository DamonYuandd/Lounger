<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<asp:DataList ID="dlstOrderItems" runat="server" Width="100%" DataKeyField="ItemId">
        <HeaderTemplate>
            <table cellspacing="0" border="0" >
                <tr class="GridViewHeaderStyle" style="color:#858585; text-align:left;">
                    <th class="content_table_title" width="60px">
                        <span><asp:Literal ID="litProcuct" runat="server" Text="商品图片"></asp:Literal></span></th>
                     <th class="content_table_title" width="130px">
                        <span><asp:Literal ID="litSKU" runat="server" Text="货号"></asp:Literal></span></th>
                    <th class="content_table_title" width="350">
                        <span><asp:Literal ID="litProductName" runat="server" Text="商品名称"></asp:Literal></span></th>
                    <th class="content_table_title" width="60">
                        <span><asp:Literal ID="litProductQuantity" runat="server" Text="购买数量"></asp:Literal></span></th>
                     <th class="content_table_title" width="70">
                        <span><asp:Literal ID="litAmount" runat="server" Text="商品单价"></asp:Literal></span></th>
                     <th class="content_table_title" width="60">
                        <span><asp:Literal ID="litShipQuantity" runat="server" Text="发货数量"></asp:Literal></span></th>
                     <th class="content_table_title" width="70">
                        <span><asp:Literal ID="litRemark" runat="server" Text="小计"></asp:Literal></span></th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td >
                    <Hishop:Common_Link_Product ID="Common_Link_Product1" runat="server">
                        <Hishop:Common_ProductThumbnail ID="Common_ProductThumbnail1" Width="60px" Height="60px" runat="server" DataField="ThumbnailsUrl"/>
                    </Hishop:Common_Link_Product>                            
                </td>
                <td>
                    <asp:Literal ID="litSKU" runat="server" Text='<%# Eval("SKU")+"&nbsp;" %>'></asp:Literal></td>
                <td>
                    <Hishop:ProductNavigationDetails ID="productNavigationDetails"  ProductName='<%# Eval("ItemDescription") %>'  ProductId='<%# Eval("ProductId") %>' runat="server"/>
                    <%# Eval("ItemAttribute")%><br />
                    <%# Eval("Remark") %>
                </td>
                <td>
                    <asp:Literal ID="lblProductQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Literal></td>
                <td>
                    <Hishop:FormatedMoneyLabel ID="FormatedMoneyLabelForAdmin1" runat="server"  Money='<%# Eval("ItemListPrice") %>' />                 
                </td>
                <td>
                    <asp:Literal ID="lblShipQuantity" runat="server" Text='<%# Eval("ShipmentQuantity") %>'></asp:Literal></td>
                <td>
                    <Hishop:FormatedMoneyLabel ID="FormatedMoneyLabel1" runat="server"  Money='<%# (decimal)Eval("ItemAdjustedPrice")*(int)Eval("Quantity") %>' />         
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:DataList>