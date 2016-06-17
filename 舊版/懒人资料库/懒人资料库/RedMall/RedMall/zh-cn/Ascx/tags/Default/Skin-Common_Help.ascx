<%@ Control Language="C#"%>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<asp:DataList ID="dlstHelpCategories" CssClass="helplist" RepeatDirection="Horizontal" CellPadding="0" CellSpacing="0" DataKeyField="CategoryId" ItemStyle-Font-Size="12px" runat="Server" Width="100%" HorizontalAlign="Center">
   <ItemStyle VerticalAlign="Top"/>
  
  
  <ItemTemplate>
 <table class="helplist" width="100%">
      <tr>
        <th> <%#(string.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "IconUrl").ToString())) ? (Eval("Name")) : ""%>
        <UI:ResizeableImage runat="server" DataField="IconUrl" Width="88" Height="31" AlternateText='<%#Eval("Name") %>'  />
</th>
      
      </tr>
      <tr>
        <td align="center" >  <asp:DataList ID="dlstHelp" RepeatDirection="Vertical" runat="server" DataSource='<%# DataBinder.Eval(Container.DataItem, "Category") %>' Width="95%">
                          <ItemTemplate>
                          <a href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("HelpDetails",Eval("HelpId"))%>' target="_blank"  Title='<%#Eval("Title") %>'>
                                <span class="helpicon" style="font:12px;"><Hishop:Private_Help_Title ID="Private_Help_Title" runat="server"  /></span>
                            </a>
                          </ItemTemplate>
                </asp:DataList></td>
      </tr>
    </table>
   </ItemTemplate>
  
  </asp:DataList>
  
  
  
  
  
  
  
  
 