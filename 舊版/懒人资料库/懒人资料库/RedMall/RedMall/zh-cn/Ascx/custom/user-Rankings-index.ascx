<%@ Control Language="C#"%>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<asp:DataList ID="dlstRankings" RepeatDirection="Horizontal" CellPadding="0" CssClass="billboard-list" ItemStyle-Font-Size="12px" runat="Server" Width="100%">
   <ItemStyle VerticalAlign="Top" />
   <ItemTemplate>
      <span id="spPic" runat="server">
        <Hishop:Common_Link_Product ID="Common_Link_Product1" target="_blank" runat="server" >
            <Hishop:Common_ProductThumbnail ID="Common_ProductThumbnail1" runat="server" DataField="ThumbnailsUrl" CustomToolTip="ProductName"/>
        </Hishop:Common_Link_Product>
      </span>
      <span id="spName" runat="server"><Hishop:Private_ProName Length="10" runat="server" /></span>

   </ItemTemplate>
</asp:DataList>