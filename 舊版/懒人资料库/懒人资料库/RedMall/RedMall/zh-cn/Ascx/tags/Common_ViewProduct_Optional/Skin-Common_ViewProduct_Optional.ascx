<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Import Namespace="Hishop.SystemServices" %>

<div id="divProductLookupLists" style="border:solid 1px #DDDDDD;width:100%;" runat="server">
    <asp:DataList runat="server" ID="dlProductLookupLists" RepeatColumns="1" RepeatDirection="Horizontal" Width="100%">
    <HeaderTemplate>
        <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" 
            <tr>
    </HeaderTemplate>
    <ItemTemplate>        
            <td width="100%" height="25" style="padding-left:2px;padding-right:2px;">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="100%">
                            <asp:Literal ID="litCLListId" runat="server" Text='<%# Eval("CLListId") %>' Visible="false"></asp:Literal>                     
                            <asp:Literal ID="lblLookupName" runat="server" Text='<%# Eval("DisplayName") %>'></asp:Literal>£º<asp:Literal ID="lblItemValue" runat="server" Text='<%# Eval("ItemValue") %>'></asp:Literal>
                        </td>
                    </tr>
                </table>
            </td>
    </ItemTemplate>    
    <AlternatingItemTemplate>
            <td width="100%" height="25" style="padding-left:2px;padding-right:2px;">
                <!-- ½»»»ÐÐÄÚÈÝ --> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#F6F6F6">
                    <tr>
                        <td width="100%">
                            <strong>
                            <asp:Literal ID="litCLListId" runat="server" Text='<%# Eval("CLListId") %>' Visible="false"></asp:Literal>                     
                            <asp:Literal ID="lblLookupName" runat="server" Text='<%# Eval("DisplayName") %>'></asp:Literal>£º<asp:Literal ID="lblItemValue" runat="server" Text='<%# Eval("ItemValue") %>'></asp:Literal>
                            </strong>
                        </td>
                    </tr>
                </table>
            </td>        
    </AlternatingItemTemplate>
    <FooterTemplate>
        </tr> </table>
    </FooterTemplate>
</asp:DataList>

    <div style="text-align:left;border-top:dashed 1px #DDDDDD;margin-left:6px;margin-right:6px;padding-top:6px;display:none;">
        <%--<asp:Button ID="btnLookupList" runat="server" Text="<%$Resources:ProductLookupLists ,IDS_Button_LookupList %>" CssClass="clewB" />--%>
        <Hishop:ImageLinkButton ID="btnLookupList"  ImageUrl="images/ProductLookupList.gif" runat="server"/>
    </div>
</div>
