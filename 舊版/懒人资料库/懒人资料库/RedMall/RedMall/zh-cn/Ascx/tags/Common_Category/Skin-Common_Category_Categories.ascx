<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>

<asp:DataList ID="dlstCategories" runat="server" RepeatDirection="Vertical" Width="100%" DataKeyField="CategoryId">
    <ItemTemplate>
        <table width="960" border="0" cellspacing="0" cellpadding="0" align="center" style="margin:10px 0 0 0;" >
        <tr>
            <td class="production_title">
	            <div class="text_center production_title_color"><a href='<%# Globals.GetSiteUrls().SubCategory(Convert.ToInt32(Eval("CategoryId")), Eval("RewriteName")) %>'><asp:Label runat="server" Text='<%# Eval("Name")%>' /></a></div>
	        </td>
	    </tr>
	    <tr>
	        <td valign="top" style="border-left:1px solid #e4e4e4;border-right:1px solid #e4e4e4; padding:0 0 0 8px;">
                <asp:DataList ID="dlstTwoCategories" runat="server"  DataKeyField="CategoryId"
                        DataSource='<%# DataBinder.Eval(Container.DataItem, "One") %>' RepeatDirection="Horizontal" RepeatColumns="4">                                                                                                                                                            
                    <ItemStyle VerticalAlign="Top" />
                    <ItemTemplate> 
					<table  border="0" cellspacing="0"  align="center" cellpadding="0">
  <tr>
    <td><div class="production">
                    <ul>
                        <h2><a href='<%# Globals.GetSiteUrls().SubCategory(Convert.ToInt32(Eval("CategoryId")), Eval("RewriteName")) %>'><asp:Label runat="server" Text='<%# Eval("Name")%>' /> </a></h2>
                        <li>
                            <Hishop:Common_Categorys runat="server" Data='<%# Eval("CategoryId") %>' />
                        </li>
                    </ul>
                    </div>     </td>
  </tr>
</table>
  
                                        
                    </ItemTemplate>                           
                </asp:DataList>
            </td>
	    </tr>
      <tr>
          <td height="7" class="allclass_bottom"></td>
      </tr>
      </table>
  </ItemTemplate>
</asp:DataList>