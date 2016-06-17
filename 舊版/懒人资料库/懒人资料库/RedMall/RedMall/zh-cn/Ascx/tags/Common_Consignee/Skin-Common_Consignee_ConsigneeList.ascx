<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<asp:DataList ID="dtlstRegionsSelect" runat="server" Width="100%" DataKeyField="ShippingId">
     <ItemTemplate>
         收货人姓名：
         <asp:Label ID="lblShipTo" runat="server" Text='<%#Bind("ShipTo") %>'></asp:Label><br />
         街道地址：
         <Hishop:RegionAllName ID="RegionAllName1" RegionId='<%# Eval("RegionId") %>' runat="server"></Hishop:RegionAllName>
         <asp:Label ID="lblAddress" runat="server" Text='<%#Bind("Address") %>'></asp:Label><br/>
         邮政编码：
         <asp:Label ID="lblZipcode" runat="server" Text='<%#Bind("ZipCode") %>'></asp:Label><br />
         <!--09.01.08-修改增加显示电子邮件-->
         <!--begin-->
         电子邮件： 
         <asp:Label ID="lblEmailAddress" runat="server" Text='<%#Eval("EmailAddress") %>'></asp:Label><br />
         <!--end-->
         电话号码：
         <asp:Label ID="lblTellPhone" runat="server" Text='<%#Bind("TelPhone")%>'></asp:Label><br />
         手机号码：
         <asp:Label ID="lblPhone" runat="server" Text='<%#Bind("CellPhone") %>'></asp:Label><br />
         <asp:Button ID="btnEdit" CssClass="button-2" Height="24px" runat="server" CommandName="Edit" Text="编辑" />
         <asp:Button ID="btnDelete" CssClass="button-2" Height="24px" runat="server" CommandName="Delete" Text="删除" />
         <br/><br/><hr />
    </ItemTemplate>
</asp:DataList>

