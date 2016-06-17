<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>

<asp:HyperLink runat="server" ID="hlkCategoryName"></asp:HyperLink>
<asp:DataList runat="server" ID="dlSubCategory">
     <ItemTemplate>
         <a href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("subCategory",Eval("CategoryId")) %>'><asp:Literal ID="litSubCategoryName" Text='<%# Eval("Name") %>' runat="server"></asp:Literal></a>
     </ItemTemplate>
</asp:DataList>
