<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<asp:DataList ID="dlstPromotes" RepeatColumns="1" RepeatDirection="Horizontal" runat="server"
    ItemStyle-Font-Size="12px">
    <ItemTemplate>
       <div class="noticelist">
              <%# Eval("Name") %> 
              </div>
    </ItemTemplate>
</asp:DataList>