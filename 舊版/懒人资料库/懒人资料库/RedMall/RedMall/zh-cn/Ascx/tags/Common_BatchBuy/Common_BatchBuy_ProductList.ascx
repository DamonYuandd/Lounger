<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<%@ Import Namespace="Hishop.SystemServices" %>


<script type="text/javascript">
     function ValidateBuyAmount(q)
     {
        var quantity = q.value;
        
        if (isNaN(quantity) || quantity == "") {
            alert("请填写正确的数量");
            q.value = 1;
        }
        if (quantity.length > 5){
            alert("填写的购买数量不能超过99999!");
            q.value = 1;
        }
        if ((quantity + 0) <= 0) {
            alert("商品数量不能为0或者负数");
            q.value = 1;
        }
     }
</script>

<Hishop:CustomGridView ID="grdProducts" runat="server" CellPadding="4" ForeColor="#333333" 
    AutoGenerateColumns="False" AllowSorting="true" GridLines="None" CssClass="datalist" HeaderStyle-CssClass="diplayth1">
    <Columns>
        <Hishop:CheckBoxField HeadWidth="35" />
        <asp:TemplateField>
            <itemtemplate>
            <Hishop:Common_ProductThumbnail ID="Common_ProductThumbnail1" runat="server" EnabledTimestamp="true" AutoResize="true" Width="50px" Height="50px" DataField="ThumbnailsUrl"  />
           </itemtemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="货号">
            <itemtemplate>
             <asp:Literal runat="server" Text='<%# Eval("RealSKU")%>' ID="litRealSKU"></asp:Literal>
            </itemtemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="商品名称" ItemStyle-HorizontalAlign="left">
            <itemtemplate>
              <a href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("productDetails",Eval("ProductId")) %>' target="_blank" style="color:Blue;">
              <asp:Literal ID="litName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Literal></a><br />
              <Hishop:Common_BatchBuy_SKUList runat="server" /><span style="color:Red; margin-left:10px"><Hishop:FormatedMoneyLabel ID="FormatedMoneyLabel1" runat="server" Money='<%#Eval("SkuPrice") %> ' Visible='<%#string.IsNullOrEmpty(Eval("AttributeNames").ToString())?false:true %>' /></span>
            </itemtemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="购买数量">
            <itemtemplate>
             <asp:TextBox runat="server" Text="1" Width="30px" ID="txtBuyNum" onkeyup="ValidateBuyAmount(this);"></asp:TextBox>
             <span style="display:none"><asp:Literal runat="server" ID="litQuantityLimit" Text='<%# Eval("QuantityLimit") %>'></asp:Literal>
             <asp:Literal runat="server" ID="litMinQuantity" Text='<%# Eval("MinQuantity") %>'></asp:Literal></span>
            </itemtemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="商品单价">
            <itemtemplate>
             <%# string.Format("{0:C2}", Eval("RealPrice"))%>
            </itemtemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="库存">
            <itemtemplate>
            <asp:Literal ID="litStock" runat="server" Text='<%# Eval("RealStock") %>'></asp:Literal>
          </itemtemplate>
        </asp:TemplateField>
    </Columns>
</Hishop:CustomGridView>