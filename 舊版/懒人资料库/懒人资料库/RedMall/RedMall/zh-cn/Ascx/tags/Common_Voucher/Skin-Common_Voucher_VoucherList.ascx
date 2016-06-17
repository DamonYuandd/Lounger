<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<asp:GridView ID="grdCoupons" AutoGenerateColumns="false" runat="server" Width="100%" CssClass="datalist" HeaderStyle-CssClass="diplayth1">
       <Columns>
             <asp:TemplateField HeaderText="�Ż�ȯ���Ƽ�����" HeaderStyle-CssClass="firstcell">
                <ItemTemplate>
                   <Hishop:SubStringLabel ID="lblName" Text='<%#Eval("Name") %>' StrLength="12" StrReplace="..  " runat="server" />
                   <div>
                    <%# Eval("ClaimCode")%>
                   </div>
                </ItemTemplate>
             </asp:TemplateField>
              <asp:TemplateField HeaderText="������">
                 <ItemTemplate>
                    <Hishop:FormatedMoneyLabel ID="lblAmount" Money='<%#Eval("Amount") %>' runat="server"></Hishop:FormatedMoneyLabel>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="��ֵ">
                 <ItemTemplate>
                    <Hishop:FormatedMoneyLabel ID="lblValue" Money='<%#Eval("DiscountValue") %>' runat="server"></Hishop:FormatedMoneyLabel>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="��Ч��(ֹ)">
                <ItemTemplate>
                   <Hishop:FormatedTimeLabel ID="lblClosingTime" Time='<%#Eval("ClosingTime") %>' runat="server"></Hishop:FormatedTimeLabel>
                </ItemTemplate>
             </asp:TemplateField>
             <asp:BoundField HeaderText="��Ч����" DataField="EnabledTimes"  />
             <asp:BoundField HeaderText="��ʹ�ô���" DataField="UsedCount"  />
    </Columns>
</asp:GridView>