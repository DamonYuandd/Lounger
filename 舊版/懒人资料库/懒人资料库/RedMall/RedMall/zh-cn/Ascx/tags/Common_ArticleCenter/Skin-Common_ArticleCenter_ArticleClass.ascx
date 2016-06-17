<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<asp:DataList runat="server" ID="dlstArticleCategories">
    <HeaderTemplate>
    <ul class="helpnews-classul">
    </HeaderTemplate>
    <ItemTemplate>
         <li class="helpnews-classbg">aaaaaaaaaaaa<a href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("Articles",Eval("CategoryId"))%>'><Hishop:Private_ArticleCenter_CategoryName Length="10" runat="server" /></a></li>
    </ItemTemplate>
    <FooterTemplate>
          </ul>
    </FooterTemplate>
</asp:DataList>