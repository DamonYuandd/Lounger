<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>


<asp:GridView ID="grdShippingMode" runat="server" AutoGenerateColumns="false" DataKeyNames="ModeId"
    Width="100%" BorderWidth="0" CssClass="peisongstyle" >
    <Columns>
        <asp:TemplateField HeaderText="Ñ¡Ôñ"
            ItemStyle-Width="5%">
            <ItemTemplate>
                <Hishop:ListRadioButton ID="radioButton" GroupName="shippButton" runat="server" value='<%# Eval("ModeId") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ÅäËÍ·½Ê½"
            ItemStyle-Width="20%" DataField="Name" />
        <asp:TemplateField HeaderText="ÏêÏ¸½éÉÜ"
            ItemStyle-Width="65%">
                <ItemTemplate>
                <span style="word-break:break-all;"><%# Eval("Description") %></span>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>