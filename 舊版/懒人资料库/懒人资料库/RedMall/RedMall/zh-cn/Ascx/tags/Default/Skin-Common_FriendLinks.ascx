<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>
<asp:DataList ID="dlstFriendlyLinks" runat="server" ItemStyle-Font-Size="12px" RepeatDirection="Vertical">
    <ItemTemplate>
        <table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="50" align="center">
                    <a href='<%#Eval("LinkUrl") %>' target="_blank">
                    <%#(string.IsNullOrEmpty(DataBinder.Eval(Container.DataItem,"ImageUrl").ToString())) ? (Eval("Title")):""%><UI:ResizeableImage  ID="Common_Image1" runat="server" DataField="ImageUrl" Width="88" Height="31" AlternateText='<%#Eval("Title") %>'  />
                    </a></td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
