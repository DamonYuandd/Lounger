<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>

<%@ Import Namespace="Hishop.SystemServices" %>

   <table style="margin:auto;">
     <tr>
     <td bgcolor="#F2F8FE" class="productName">���ţ�<Hishop:Private_CutdownSearch_SKU ID="Private_CutdownSearch_SKU1" CssClass="cut-price" runat="server" Width="50px" /></td>
       <td> �ؼ��֣�<Hishop:Private_CutdownSearch_Keywords  CssClass="cut-keyword"   runat="server" Width="60" MaxLength="80" /></td>
       <td>�۸�Χ��<Hishop:Private_CutdownSearch_Price1 ID="Private_CutdownSearch_Price1" CssClass="cut-price" runat="server" Width="30" />
            ��<Hishop:Private_CutdownSearch_Price2 ID="Private_CutdownSearch_Price2" CssClass="cut-price"  runat="server" Width="30" />
       </td>
       <td ><div class="cut-slist">
      <asp:CheckBoxList ID="ckbListproductSearchType" BorderWidth="0" CellPadding="0" CellSpacing="0"   runat="server"></asp:CheckBoxList></div>
       </td>
       <td>
         <label>
                <Hishop:Private_CutdownSearch_Button ID="Private_CutdownSearch_Button1" runat="server" Text="����"  />
                <Hishop:Private_CutdownSearch_ResetButton ID="Private_CutdownSearch_ResetButton1" runat="server"  Text="����" />
            </label>
       </td>
     </tr>
   </table>