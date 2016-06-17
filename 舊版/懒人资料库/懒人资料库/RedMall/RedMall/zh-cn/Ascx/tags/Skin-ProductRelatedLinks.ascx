
<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">   
    <tr align="left" style="padding-bottom:10px;">            
        <!-- ���ӵ������ύҳ -->
        <td>
            <a href='<%= Globals.GetSiteUrls().UrlData.FormatUrl("ProductReviewRefer",Page.Request.QueryString["productId"])%>'
                target="_blank">
                <Hishop:themesimage src="images/ProductReviewspl.jpg" runat="server" style="border: 0px;
                    display: block">
                </Hishop:themesimage>
            </a>
        </td>
        <!-- ���ӵ��ҵ��ղؼ� -->
        <td>
            <a href="<%= Globals.GetSiteUrls().UrlData.FormatUrl("User_Favorites",Page.Request.QueryString["productId"])%>"
                target="_blank">
                <Hishop:themesimage src="images/ProductReviewsjr.jpg" runat="server" style="border: 0px;
                    display: block">
                </Hishop:themesimage>
            </a>
        </td>
    </tr>
    <tr style="vertical-align: top;">        
        <!-- ���ӵ���ѯ -->
        <td>
            <a href="<%= Globals.GetSiteUrls().UrlData.FormatUrl("ProductConsultations",Page.Request.QueryString["productId"])%>"
                target="_blank">
                <Hishop:themesimage src="images/ProductReviewszx.jpg" runat="server" style="border: 0px;
                    display: block">
                </Hishop:themesimage>
            </a>
        </td>
        <!-- ���ӵ����ܸ��ҵ����� -->
        <td>
            <a href="<%= Globals.GetSiteUrls().UrlData.FormatUrl("IntroducedToFriend",Page.Request.QueryString["productId"])%>"
                target="_blank">
                <Hishop:themesimage src="images/ProductReviewsjs.jpg" runat="server" style="border: 0px;
                    display: block">
                </Hishop:themesimage>
            </a>
        </td>
    </tr>
</table>
