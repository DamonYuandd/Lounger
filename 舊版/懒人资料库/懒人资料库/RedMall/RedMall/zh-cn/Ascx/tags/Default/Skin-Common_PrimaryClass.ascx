<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<asp:DataList ID="dlstMainCategorys" runat="server" RepeatLayout="Flow">
    <ItemTemplate>
        <a href='<%# Globals.GetSiteUrls().SubCategory(Convert.ToInt32(Eval("CategoryId")), Eval("RewriteName")) %>'>
            <Hishop:Private_Class_Image runat="server" />
        </a>
    </ItemTemplate>
    <SeparatorTemplate>
        <asp:Literal ID="litSeparator" runat="server"></asp:Literal>
    </SeparatorTemplate>
</asp:DataList>
