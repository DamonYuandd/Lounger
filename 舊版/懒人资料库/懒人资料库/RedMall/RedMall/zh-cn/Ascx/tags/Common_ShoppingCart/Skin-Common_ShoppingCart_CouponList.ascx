<%@ Control Language="C#" %>
<asp:GridView ID="grdCoupon" runat="server" AutoGenerateColumns="false" ShowHeader="false">
    <Columns>
        <asp:BoundField DataField="DiscountName" />
        <%--     <asp:BoundField DataField="Amount" DataFormatString="{0:N2}" HtmlEncode="false" />
                                <asp:BoundField DataField="DiscountValue" DataFormatString="{0:N2}" HtmlEncode="false" />--%>
    </Columns>
</asp:GridView>
