<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<asp:DataList runat="server" ID="dtlistAffiches" Width="100%">
    <HeaderTemplate>
        <table class="dash_bottom_line" width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <th align="left">公告标题 </th>  
                <th align="left">创建日期 </th>          
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td align="left">
                <a href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("AffichesDetails",Eval("AfficheId"))%>'>
                    <asp:Literal ID="litTitle" runat="server" Text='<%#Eval("Title") %>' />
                </a>
            </td>
            <td align="left"><Hishop:FormatedTimeLabel id="lblAddedDate" Time='<%#Eval("AddedDate") %>' runat="server" /></td>
       </tr>
    </ItemTemplate>
    <FooterTemplate>
            </tr>
        </table>
    </FooterTemplate>
</asp:DataList>