<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Import Namespace="Hishop.SystemServices" %>


<Hishop:CustomGridView ID="listOrders" runat="server" SortOrderBy="OrderDate" SortOrder="DESC" CellPadding="4" ForeColor="#333333" 
    AutoGenerateColumns="False" DataKeyNames="OrderId"   AllowSorting="true" GridLines="None"    CssClass="datalist" HeaderStyle-CssClass="diplayth1">
    <Columns>
        <asp:TemplateField HeaderText="订单编号" ItemStyle-Width="110px" HeaderStyle-CssClass="firstcell">
        <itemtemplate>
            <asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("OrderId") %>' ></asp:Label>
        </itemtemplate>
        </asp:TemplateField>
        
         <asp:TemplateField HeaderText="收货人">
         <itemtemplate>                       
            <asp:Label ID="lblUsername" runat="server" Text='<%# Eval("ShipTo") %>'></asp:Label>
         </itemtemplate> 
         </asp:TemplateField>
        
         <asp:TemplateField HeaderText="支付方式">
         <itemtemplate>                       
            <asp:Label ID="lblPaymentType" runat="server" Text='<%# Eval("PaymentType") %>'></asp:Label>
         </itemtemplate> 
         </asp:TemplateField>
        
         <asp:TemplateField HeaderText="金额">
         <itemtemplate>                       
            <Hishop:FormatedMoneyLabel ID="FormatedMoneyLabel1" DataField="OrderPrice" runat="server" />
         </itemtemplate> 
         </asp:TemplateField>
        
        <asp:TemplateField HeaderText="订单状态" ItemStyle-Width="70px">
            <itemtemplate>
            <Hishop:PaymentStatusLabel ID="lblOrderPaymentStatus" Text='<%# Eval("PaymentStatus") %>' runat="server" />
            <div><Hishop:RefundStatusLabel ID="lblOrderRefundStatus" Text='<%# Eval("RefundStatus") %>' runat="server" /></div>
            <Hishop:ShippingStatusLabel ID="lblOrderShippingStatus" Text='<%# Eval("ShippingStatus") %>' runat="server" />
            <div><Hishop:ActivityStatusLabel ID="lblOrderActivityStatus" Text='<%# Eval("ActivityStatus") %>' runat="server" /></div>
            </itemtemplate>
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="下单时间" ItemStyle-Width="130px" SortExpression="OrderDate">
            <itemtemplate>
                <Hishop:FormatedTimeLabel ID="lblStartTimes" Time='<%#Eval("OrderDate") %>' ShopTime="true" runat="server" />
            </itemtemplate>
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="操作/订单留言" ItemStyle-Width="186px" ItemStyle-Height="50px" SortExpression="PublishDate">
            <itemtemplate>
            <asp:Label ID="lblIsCOD" Text='<%#Eval("IsPOD") %>' runat="server" Visible="false"></asp:Label>
            <asp:HyperLink ID="hlinkOrderDetails" runat="server" Target="_blank" NavigateUrl='<%# Globals.GetSiteUrls().UrlData.FormatUrl("user_OrderDetails",Eval("orderId"))%>' Text="查看" />
            <asp:HyperLink ID="hlinkCancel" runat="server" style="cursor:hand"  Text="取消订单" Visible="false" />
            <asp:LinkButton ID="btnCancelRefund" CommandName="CanelRefund" OnClientClick="return confirm('您真的要取消此订单的退款吗？');" runat="server" Text="取消退款" Visible="false" />
            <asp:HyperLink ID="hlinkConfirmGoods" runat="server" Target="_blank" NavigateUrl='<%# Globals.GetSiteUrls().UrlData.FormatUrl("user_ConfirmGoods",Eval("orderId"))%>' Text="确认收货" Visible="false" />
            <asp:HyperLink ID="hlinkPay" runat="server" Target="_blank" NavigateUrl='<%# Globals.GetSiteUrls().UrlData.FormatUrl("sendPayment",Eval("orderId"))%>' Text="付款" Visible="false" />
            <asp:HyperLink ID="hlinkRefund" runat="server" Target="_blank" NavigateUrl='<%# Globals.GetSiteUrls().UrlData.FormatUrl("user_RefundOrders",Eval("orderId"))%>' Text="申请退款" Visible="false" />
            <div><a  href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("user_UserOrderLeaveWords",Eval("orderId")) %>' Target="_blank">订单留言(共 <%#Eval("VisitNum") %> 条, <span style="color:red;"><%#Eval("NoVisitNum") %> </span>条未读 )</a></div>            
            </itemtemplate>
        </asp:TemplateField>
        
    </Columns>
</Hishop:CustomGridView>
<input type="hidden" runat="server" id="hiddenOrderId" />
<script type="text/javascript">
    function showDialog(orderId) {
        $("#UserOrders_list_Common_OrderManage_OrderList___hiddenOrderId").val(orderId);
        document.getElementById("spoderid").innerHTML = orderId;
        dlgCancel.Show();
    }
</script>