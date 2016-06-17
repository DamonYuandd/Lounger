<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<asp:DataList runat="server" ID="dtlistArticles" Width="100%">
    <HeaderTemplate>
        <table class="articlelist" width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <th align="left">文章标题</th>  
                <th align="left">创建日期 </th>          
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td align="left">
                <a href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("ArticleDetails",Eval("ArticleId"))%>'>
                    <Hishop:Private_ArticleCenter_Title runat="server" />
                </a>
            </td>
            <td align="left"><Hishop:Private_ArticleCenter_AddDate runat="server" /></td>
       </tr>
    </ItemTemplate>
    <FooterTemplate>
            </tr>
        </table>
    </FooterTemplate>
</asp:DataList>