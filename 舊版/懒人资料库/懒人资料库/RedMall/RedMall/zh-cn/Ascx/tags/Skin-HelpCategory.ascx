<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices"%>
<asp:DataList ID="dlstMainCategories" RepeatDirection="Vertical" DataKeyField="CategoryId" runat="server">
    <ItemStyle Width="100%" VerticalAlign="Top" />
    <ItemTemplate>
        <table style="border-style:none; width:100%; vertical-align:top">
            <tr>
                <td class="productMainClass" style="padding-left:10px">
                   <a href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("Helps",Eval("CategoryId"))%>'><%# Eval("Name")%></a>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>