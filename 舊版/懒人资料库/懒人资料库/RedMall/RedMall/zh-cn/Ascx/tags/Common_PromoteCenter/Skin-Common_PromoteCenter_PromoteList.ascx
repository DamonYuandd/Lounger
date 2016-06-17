<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>

<Hishop:CustomGridView ID="grdPromoteSales" runat="server" AutoGenerateColumns="False" ShowHeader="true" Width="100%" DataKeyNames="ActivityId" CssClass="articlelist" GridLines="None" RowStyle-CssClass="grdrow" HeaderStyle-CssClass="GridViewHeaderStyle" >
    <Columns>         
        <asp:TemplateField HeaderText="<%$ Resources:EngagedPromoteSales, IDS_Header_PromoteSalesName %>" >
        <ItemStyle />
          <ItemTemplate>
            <a href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("FavourableDetails",Eval("ActivityId"))%>' ><asp:Label ID="lblPromteSalesName" Text='<%#Eval("Name") %>' runat="server" CssClass="DropDownMenuCommand"></asp:Label></a>
          </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:EngagedPromoteSales, IDS_Header_PromoteSalesType %>" >
          <ItemTemplate>
            <asp:Label ID="lblPromoteType" Text='<%#Eval("PromoteType") %>' style="display:none" runat="server"></asp:Label>
            <asp:Label ID="lblPromoteTypeName" runat="server"></asp:Label>
          </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:EngagedPromoteSales, IDS_Header_StartTime %>" >
            <ItemTemplate>
                <Hishop:FormatedTimeLabel ID="lblStartTimes" Time='<%#Eval("StartTime") %>' runat="server" ></Hishop:FormatedTimeLabel>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:EngagedPromoteSales, IDS_Header_ClosingTime %>" >
            <ItemTemplate>
                <Hishop:FormatedTimeLabel ID="lblClosingTimes" Time='<%#Eval("ClosingTime")%>' runat="server" ></Hishop:FormatedTimeLabel>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>                    
</Hishop:CustomGridView>