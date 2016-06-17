<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %> 

        <asp:GridView ID="grdShoppingCart" runat="server" AutoGenerateColumns="False" DataKeyNames="CartItemId"
                HeaderStyle-BackColor="#F5F5F5" HeaderStyle-Height="20px" CssClass="cartdetile"
                Width="100%">
                <Columns>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <ItemStyle Width="80px" />
                        <ItemTemplate>
                            <%--<Hishop:Common_Link_Product ID="Common_Link_Product1" runat="server"></Hishop:Common_Link_Product>--%><Hishop:Common_ProductThumbnail ID="Common_ProductThumbnail1" Width="65" runat="server" DataField="ImageUrl"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="货号" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Literal ID="litSKU" runat="server" Text='<%# (Eval("ItemType").ToString()=="Gift")?"礼品无货号":Eval("Identity") %>'></asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="商品名称" ItemStyle-HorizontalAlign="Center" >
                        <ItemTemplate>
                            <Hishop:Private_ShoppingCart_ProName ID="Private_ShoppingCart_ProName1" runat="server" /><br />
                            <Hishop:Private_ShoppingCart_AttributeValues ID="Private_ShoppingCart_AttributeValues1" runat="server"/><span style="color:Red; margin-left:10px"><asp:Literal ID="skuPrice" runat="server" Text='<%#string.IsNullOrEmpty(Eval("SkuList").ToString())?"":string.Format("{0:C2}",Eval("SkuPrice")) %>'></asp:Literal></span><br />
			                <Hishop:Private_ShoppingCart_Remark ID="Private_ShoppingCart_Remark1" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="商品单价" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <Hishop:Private_ShoppingCart_Price ID="Private_ShoppingCart_Price1" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="赠送积分" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <Hishop:Private_ShoppingCart_Point ID="Private_ShoppingCart_Point1" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="购买数量">
                        <ItemTemplate>
                            <%# Eval("Quantity") %>
                        </ItemTemplate>
                    </asp:TemplateField>                
                    <asp:TemplateField HeaderText="小计" ItemStyle-HorizontalAlign="Center">
                        <ItemStyle HorizontalAlign="Right" Width="90px" />
                        <ItemTemplate>
                            <Hishop:Private_ShoppingCart_OneSubtotal ID="Private_ShoppingCart_OneSubtotal1" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>