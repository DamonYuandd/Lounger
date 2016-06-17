<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Import Namespace="Hishop.SystemServices" %>

<asp:DataList runat="server" ID="dlProductAttributes" RepeatColumns="5" RepeatDirection="Horizontal" Width="100%">
    <ItemTemplate>
        <div style="width:100%">
              <input type="checkbox" id="chek" />
              <span style="color:Blue; width:60%">                  
                  <asp:Literal ID="litProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Literal>
                  <asp:Literal ID="litValueValues" runat="server" Text='<%# Eval("AttributeValues") %>'></asp:Literal>
              </span>
              <span style="text-align:right; width:35%">Åä¼þ¼Û¸ñ£º<Hishop:FormatedMoneyLabel ID="lblRnakPrice" runat="server" DataField="RankPrice" /></span>
       </div>
    </ItemTemplate>
</asp:DataList>
