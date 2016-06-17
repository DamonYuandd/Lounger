<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %> 

<script type="text/javascript">
    function Quantity(q) {
        var quantity = q.value;
        
        if (isNaN(quantity) || quantity == "") {
            alert("����д��ȷ������");
            q.value = 1;
        }
        if (quantity.length > 5){
            alert("��д�Ĺ����������ܳ���99999!");
            q.value = 1;
        }
        if ((quantity + 0) <= 0) {
            alert("��Ʒ��������Ϊ0���߸���");
            q.value = 1;
        }
    }
</script>
        <asp:GridView ID="grdShoppingCart" runat="server" AutoGenerateColumns="False" DataKeyNames="CartItemId"
                HeaderStyle-BackColor="#F5F5F5" HeaderStyle-Height="20px" CssClass="cartdetile" BorderWidth="0"
                Width="100%">
                <Columns>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="��ƷͼƬ">
                        <ItemStyle Width="80px" />
                        <ItemTemplate>
                            <asp:Panel ID="plGiftThumbnail" Visible='<%# (Eval("ItemType").ToString()=="Gift")?true:false %>' runat="server">
                            <Hishop:Common_ProductThumbnail ID="Common_ProductThumbnail2" Width="65" runat="server" DataField="ImageUrl"/>
                            </asp:Panel>
                            <asp:Panel ID="plProductThumbnail" Visible='<%# (Eval("ItemType").ToString()=="Product")?true:false %>' runat="server">
                            <Hishop:Common_ShoppingCart_LinkProduct ID="lnkProductThumbnail" runat="server"><Hishop:Common_ProductThumbnail ID="Common_ProductThumbnail1" Width="65" runat="server" DataField="ImageUrl"/></Hishop:Common_ShoppingCart_LinkProduct>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="��Ʒ����" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Literal ID="litSKU" runat="server" Text='<%# (Eval("ItemType").ToString()=="Gift")?"��Ʒ�޻���":Eval("Identity") %>'></asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="��Ʒ����" ItemStyle-HorizontalAlign="left" ItemStyle-Width="65%">
                        <ItemStyle Width="23%" />
                        <ItemTemplate>
                            <asp:Panel ID="plGiftName" Visible='<%# (Eval("ItemType").ToString()=="Gift")?true:false %>' runat="server">
                            <Hishop:Private_ShoppingCart_ProName ID="Private_ShoppingCart_ProName2" runat="server" /><br />
                            </asp:Panel>
                            <asp:Panel ID="plProductName" Visible='<%# (Eval("ItemType").ToString()=="Product")?true:false %>' runat="server">
                            <Hishop:Common_ShoppingCart_LinkProduct ID="lnkProductName" runat="server"><Hishop:Private_ShoppingCart_ProName ID="Private_ShoppingCart_ProName1" runat="server" /></Hishop:Common_ShoppingCart_LinkProduct><br />
                            </asp:Panel>
                            <Hishop:Private_ShoppingCart_AttributeValues ID="Private_ShoppingCart_AttributeValues1" runat="server"/><span style="color:Red; margin-left:10px"><Hishop:FormatedMoneyLabel ID="FormatedMoneyLabel1" runat="server" Money='<%#Eval("SkuPrice") %> ' Visible='<%#string.IsNullOrEmpty(Eval("SkuList").ToString())?false:true %>' /></span><br />
			                <div class="YouhuiName"><%# Eval("AttributeFill")%></div>
			                <div class="YouhuiName"><Hishop:Private_ShoppingCart_Remark ID="Private_ShoppingCart_Remark1" runat="server" /></div>			                
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="��Ʒ����" ItemStyle-HorizontalAlign="Center">
                        <ItemStyle Width="80px" />
                        <ItemTemplate>
                            <Hishop:Private_ShoppingCart_Price ID="Private_ShoppingCart_Price1" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="��������">
                        <ItemStyle Width="120px" />
                        <ItemTemplate>
                            <asp:Panel ID="plGift" Visible='<%# (Eval("ItemType").ToString()=="Gift")?true:false %>' runat="server">
                            <asp:Literal ID="litGift" runat="server" Text='<%# Eval("Quantity") %>'></asp:Literal>
                            </asp:Panel>
                            <asp:Panel ID="plProduct" Visible='<%# (Eval("ItemType").ToString()=="Product")?true:false %>' runat="server">
                            <Hishop:Private_ShoppingCart_BuyNum ID="Private_ShoppingCart_BuyNum1" onkeyup="Quantity(this)" runat="server" Style="width: 25px" />
                            <Hishop:Private_ShoppingCart_UpdateNum ID="Private_ShoppingCart_UpdateNum1" runat="server" ImageUrl="images/refresh.jpg" ShowText="false" />
                            <div><asp:Literal ID="litGiveQuantity" Text='<%# (int)Eval("GiveQuantity")==0?"":"���ͣ�"+Eval("GiveQuantity") %>' runat="server"></asp:Literal></div>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="���">
                        <ItemStyle Width="60px" />
                        <ItemTemplate>
                            <Hishop:Private_ShoppingCart_Stock  runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>                   
                    <asp:TemplateField HeaderText="С��" ItemStyle-HorizontalAlign="Center">
                        <ItemStyle HorizontalAlign="Right" Width="90px" />
                        <ItemTemplate>
                            <Hishop:Private_ShoppingCart_OneSubtotal ID="Private_ShoppingCart_OneSubtotal1" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ɾ����Ʒ" ItemStyle-HorizontalAlign="Center">
                        <ItemStyle HorizontalAlign="center" Width="80px"/>
                        <ItemTemplate>
                            <Hishop:Private_ShoppingCart_Delete ID="Private_ShoppingCart_Delete1" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>