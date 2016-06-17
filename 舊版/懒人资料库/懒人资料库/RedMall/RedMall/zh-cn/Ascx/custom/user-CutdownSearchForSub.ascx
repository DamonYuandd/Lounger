<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>

<%@ Import Namespace="Hishop.SystemServices" %>
 <span>货号
                    <Hishop:Private_CutdownSearch_SKU ID="Private_CutdownSearch_SKU1" CssClass="input1" runat="server" width="50"/>
                    </span> <span> 关键字
                      <Hishop:Private_CutdownSearch_Keywords  CssClass="input1"   runat="server" MaxLength="50" />
                    </span> <span>价格范围
                      <Hishop:Private_CutdownSearch_Price1 ID="Private_CutdownSearch_Price1" CssClass="input1" runat="server" width="30" />
                      至
                      <Hishop:Private_CutdownSearch_Price2 ID="Private_CutdownSearch_Price2" CssClass="input1" width="30" runat="server" />
                    </span> <span class="search_exact_input">
                    <asp:CheckBoxList ID="ckbListproductSearchType" BorderWidth="0" RepeatLayout="Flow" runat="server"></asp:CheckBoxList>
		    <span class="color_f60b_over"><Hishop:Private_CutdownSearch_Button ID="Private_CutdownSearch_Button1" runat="server" Text="搜索"  /></span>
		    <span class="color_f60b_over"><Hishop:Private_CutdownSearch_ResetButton ID="Private_CutdownSearch_ResetButton1" runat="server"  Text="重置" /></span>
		    
		    
<script type="text/javascript">

      $(document).ready(function() {
          $('#SubCategory_search_Common_CutdownSearch___txt_Private_CutdownSearch_SKU').keydown(function(e) {
              if (e.keyCode == 13) {
                  $("#btn_Private_CutdownSearch_Button").click();
              }
          })

          $('#SubCategory_search_Common_CutdownSearch___txt_Private_CutdownSearch_Keywords').keydown(function(e) {
              if (e.keyCode == 13) {
                  $("#btn_Private_CutdownSearch_Button").click();
              }
          })
      
          $('#SubCategory_search_Common_CutdownSearch___txt_Private_CutdownSearch_Price1').keydown(function(e) {
              if (e.keyCode == 13) {
                  $("#btn_Private_CutdownSearch_Button").click();
              }
          }) 

          $('#SubCategory_search_Common_CutdownSearch___txt_Private_CutdownSearch_Price2').keydown(function(e) {
              if (e.keyCode == 13) {
                  $("#btn_Private_CutdownSearch_Button").click();
              }
          })
          
          $('#pager_txtGoto').keydown(function(e) {
              if (e.keyCode == 13) {
                  $("#SubCategory_pager_btnGoto").click();
              }
          })
      });
  </script>