<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>

<asp:DataList runat="server" ID="dlstHelpCategories">
      <HeaderTemplate>
       <ul class="helpnews-classul">
    </HeaderTemplate>
    <ItemTemplate>
               <li class="helpnews-classbg"><a href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("Helps",Eval("CategoryId"))%>'><Hishop:Private_HelpCenter_CategoryName runat="server" /></a></li>
    </ItemTemplate>
    <FooterTemplate>
          </ul>
    </FooterTemplate>
  
  
  
  
  
  
  
  
  

</asp:DataList>
