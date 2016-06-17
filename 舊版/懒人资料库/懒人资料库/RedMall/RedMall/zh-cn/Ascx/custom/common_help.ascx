<%@ Control Language="C#"%>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<asp:DataList ID="dlstHelpCategories" RepeatDirection="Horizontal" CellPadding="0" CellSpacing="0" DataKeyField="CategoryId" ItemStyle-Font-Size="12px" runat="Server" Width="100%">
   <ItemStyle VerticalAlign="Top" />
   <ItemTemplate>
     <table width="100" border="0" cellpadding="0" cellspacing="0" class="mar_top10">
    
      <tr>
        <td height="20" align="left" valign="middle" class="help_bottom"><Hishop:Private_HelpClass_Title ID="Private_HelpClass_Title" runat="server"  /></td>
      </tr>
      <tr>
        <td valign="top"> 
        <asp:DataList ID="dlstHelp" RepeatDirection="Vertical" runat="server" DataSource='<%# DataBinder.Eval(Container.DataItem, "Category") %>'>
        <ItemTemplate><table width="100" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="20" align="left" valign="middle">
            <a href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("HelpDetails",Eval("HelpId"))%>' target="_blank"  Title='<%#Eval("Title") %>'>
            <span style="font:12px"><Hishop:Private_Help_Title ID="Private_Help_Title" runat="server"  /></span>
            </a>
            </td>
          </tr>
        </table>
        </ItemTemplate>
        </asp:DataList>
    </td>
      </tr>
    </table>
   </ItemTemplate>
</asp:DataList>

