<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>

<asp:GridView ID="grdPayment" runat="server" AutoGenerateColumns="false" DataKeyNames="Gateway"
    Width="100%"  BorderWidth="0" CssClass="peisongstyle">
    <Columns>
        <asp:TemplateField HeaderText="ѡ��"
            ItemStyle-Width="5%">
            <ItemTemplate>
                <input type="radio" name="payButton" value='<%# Eval("ModeId") %>' onclick="$.myfn.PaymentSelect('<%# Eval("ModeId") %>', '<%# Eval("Name") %>', '<%# Eval("Charge", "{0:c}") %>', '<%# Eval("Charge") %>');" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="֧����ʽ"
            ItemStyle-Width="20%">
            <ItemTemplate>
                <%#Eval("Name")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="��ϸ����"
            ItemStyle-Width="65%">
            <ItemTemplate>
                <span style="word-break:break-all;"><%# Eval("Description") %></span>
                
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
