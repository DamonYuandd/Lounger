<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<asp:DataList ID="dlstMainCategories" RepeatDirection="Vertical" DataKeyField="CategoryId" runat="server" Width="100%">
    <ItemStyle Width="100%" VerticalAlign="Top" />
    <ItemTemplate>
        <dl>
 <dt><a href='<%# Globals.GetSiteUrls().SubCategory(Convert.ToInt32(Eval("CategoryId")), Eval("RewriteName")) %>'>
                        <%# Eval("Name")%> 
                    </a></dt>
                  <dd class="classlist2">
                    <asp:DataList ID="dlstSubCategries" RepeatDirection="Horizontal" runat="server">
                        <ItemTemplate>
                              <table cellpadding="0" style="width: 100%">
              <tr>
                <td height="20" class="z12"><a href='<%# Globals.GetSiteUrls().SubCategory(Convert.ToInt32(Eval("CategoryId")), Eval("RewriteName")) %>'>
                                <Hishop:Private_Class_Name ID="Private_Class_Name1" runat="server" />
                            </a></td>
            
              </tr>
            
            </table>
                        </ItemTemplate>
                        <SeparatorTemplate>
                            <asp:Literal ID="litSeparator" runat="server"></asp:Literal>
                        </SeparatorTemplate>
                    </asp:DataList>
        
          </dd>
</dl>
    </ItemTemplate>
    <SeparatorTemplate>
        <asp:Literal ID="litNubblySeparator" runat="server"></asp:Literal>
    </SeparatorTemplate>
</asp:DataList>

   
      