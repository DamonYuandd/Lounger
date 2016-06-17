<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Import Namespace="Hishop.SystemServices" %>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
               <td>
		<h1 class="t14">配件</h1>
<asp:DataList runat="server" ID="dlProductAttributes" RepeatColumns="5" RepeatDirection="Horizontal" Width="100%">
    <ItemTemplate>
		<table width="385" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30"><input type="checkbox" id="chek" /></td>
                        <td width="224" class="color_F25800_12"><asp:Literal ID="litProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Literal><asp:Literal ID="litValueValues" runat="server" Text='<%# Eval("AttributeValues") %>'></asp:Literal></td>
                        <td width="69">配件价格：</td>
                        <td width="62" class="color_fd3f0d_b"><Hishop:FormatedMoneyLabel ID="lblRnakPrice" runat="server" DataField="RankPrice" /></td>
                      </tr>
                    </table>
    </ItemTemplate>
</asp:DataList>
		</td>
              </tr>
            </table>
