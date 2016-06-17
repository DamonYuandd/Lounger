<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<asp:Repeater ID="rptHotKeywords" runat="server">
   <ItemTemplate>
      <a href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("keywordsSearch",Globals.UrlEncode(Globals.HtmlDecode(Eval("Keywords").ToString())))%>'>
       <Hishop:Private_KeywordName runat="server" />
      </a>
   </ItemTemplate>
   <SeparatorTemplate>
      <span class="spirlLines"> | </span> 
   </SeparatorTemplate>
</asp:Repeater>
