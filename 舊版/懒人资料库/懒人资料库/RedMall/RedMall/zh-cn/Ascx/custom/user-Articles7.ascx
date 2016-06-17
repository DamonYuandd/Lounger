<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<asp:DataList runat="server" RepeatDirection="Horizontal" RepeatColumns="2" ID="rptArticle" LineType="NewRow">
    <HeaderTemplate>
        <table style="width:100%" cellspacing="0" cellpadding="0" border="0">
            <tr>
    </HeaderTemplate>
   <ItemTemplate>

                  
                  	<table width="167" border="0" cellspacing="0" cellpadding="0"  class="margin_lr10">
                      <tr>
                        <td width="12" height="25" align="center" valign="middle"><Hishop:ThemesImage src="images/icon5.jpg" runat="server"></td>
                        <td width="155" valign="middle"><a href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("ArticleDetails",Eval("ArticleId"))%>' target="ArticleDetails"  Title='<%#Eval("Title") %>'>
            <Hishop:Private_Article_Title Length="11" runat="server" />
         </a></td>
                      </tr>
                    </table>
   </ItemTemplate>
   <FooterTemplate>
            </tr>
        </table>
   </FooterTemplate>
</asp:DataList>


    

    