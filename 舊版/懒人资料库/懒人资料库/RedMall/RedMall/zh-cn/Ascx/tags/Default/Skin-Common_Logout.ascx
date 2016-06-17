<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<div class="login">
    <table width="90%" style="margin: auto;" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td colspan="2" style="padding-left: 12px;">
                ���ã�<span style="color: Green;"><%= HiContext.Current.User.Username %></span> ��<asp:Literal
                    ID="litUserRank" runat="server" />
                ��
            </td>
        </tr>
        <tr>
            <td style="padding-top: 10px; text-align: right">
                Ԥ������
            </td>
            <td style="color: Red; font-weight: bold; padding-top: 10px;">
                <asp:Literal ID="litAccount" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="padding-top: 6px; text-align: right">
                ���û��֣�
            </td>
            <td style="color: Red; font-weight: bold; padding-top: 6px;">
                <%= HiContext.Current.User.Points %>
            </td>
        </tr>
        <tr>
            <td style="padding-top: 6px; text-align: right">
                ���ﳵС�ƣ�
            </td>
            <td style="color: Red; font-weight: bold; padding-top: 6px;">
                <Hishop:Common_ShoppingCart_Money runat="server" />
                Ԫ
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="padding-top: 10px;">
                <span id="btnlogin"><Hishop:Common_Link_MyAccount ID="Common_Link_MyAccount1" runat="server" Target="_parent" /> </span>
                <span id="btnreg"><a href='<%= Globals.GetSiteUrls().UrlData.FormatUrl("logout") %>' target="_parent">
                    �˳�
                </a></span>
            </td>
        </tr>
    </table>
</div>
