<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<div style="font-size:14px;font-weight:700;color:red;padding-top:14px;border-bottom:1px solid #ddd">ÄúÑ¡ÔñµÄÀñÆ·</div>
<asp:GridView ID="grdGifts" runat="server" AutoGenerateColumns="false" ShowHeader="true" DataKeyNames="GiftId"  HeaderStyle-Height="20px" Width="99%" CssClass="selectgift" >
    <Columns>
          <asp:TemplateField ItemStyle-Width="35%">
            <ItemTemplate>
                <asp:Label runat="server" Text='<%#Eval("GiftName") %>'></asp:Label>                   
            </ItemTemplate>
        </asp:TemplateField>       
        <asp:TemplateField ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:LinkButton ID="Delete" runat="server" Text="ÒÆ³ý"
                    CommandName="Delete" CommandArgument="GiftId"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>