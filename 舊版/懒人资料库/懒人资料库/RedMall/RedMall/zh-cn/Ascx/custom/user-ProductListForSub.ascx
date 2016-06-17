<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %> 

        <asp:GridView ID="grdShoppingCart" runat="server" AutoGenerateColumns="False" DataKeyNames="CartItemId"
                HeaderStyle-Height="20px" CssClass="cartdetile" BorderWidth="0"
                Width="100%">
                <Columns>
                     <asp:TemplateField HeaderText="货号" ItemStyle-HorizontalAlign="Center">
			<ItemStyle Width="104px" />
                        <ItemTemplate>
                            <asp:Literal ID="litSKU" runat="server" Text='<%# (Eval("ItemType").ToString()=="Gift")?"礼品无货号":Eval("Identity") %>'></asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="商品名称" HeaderStyle-HorizontalAlign="Left" >
			<ItemStyle Width="260px" HorizontalAlign="Left"/>
                        <ItemTemplate>
                            <Hishop:Private_ShoppingCart_ProName ID="Private_ShoppingCart_ProName1" runat="server" /><br />
                            <Hishop:Private_ShoppingCart_AttributeValues ID="Private_ShoppingCart_AttributeValues1" runat="server"/><span style="color:Red; margin-left:10px"><asp:Literal ID="skuPrice" runat="server" Text='<%#string.IsNullOrEmpty(Eval("SkuList").ToString())?"":string.Format("{0:C2}",Eval("SkuPrice")) %>'></asp:Literal></span><br />
			                <div class="YouhuiName"><%# Eval("AttributeFill")%></div>
			                <Hishop:Private_ShoppingCart_Remark ID="Private_ShoppingCart_Remark1" runat="server" />			    
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="购买数量">
			<ItemStyle Width="130px" />
                        <ItemTemplate>
                            <%# Eval("Quantity") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="商品单价" ItemStyle-HorizontalAlign="Center">
			<ItemStyle Width="126px" />
                        <ItemTemplate>
                            <Hishop:Private_ShoppingCart_Price ID="Private_ShoppingCart_Price1" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="发货数量" ItemStyle-HorizontalAlign="Center">
			<ItemStyle Width="115px" />
                        <ItemTemplate>
                            <%# Eval("ShippQuantity")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="小计" ItemStyle-HorizontalAlign="Center">
                        <ItemStyle Width="125px" />
                        <ItemTemplate>
                            <Hishop:Private_ShoppingCart_OneSubtotal ID="Private_ShoppingCart_OneSubtotal1" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>              
                </Columns>
            </asp:GridView>