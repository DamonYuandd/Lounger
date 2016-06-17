<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<asp:DataList ID="dlstPointHistorys" runat="server"  Width="100%" DataKeyField="JournalNumber" >
        <HeaderTemplate>
            <table width="100%" border="0" class="datalist" cellspacing="0" cellpadding="0" >
                  <tr class="diplayth1" >
                    <!-- 流水号 -->
                    <th class="firstcell"><asp:Literal ID="Literal1" runat="server" Text="流水号"></asp:Literal></th>
                    <!--订单编号-->
                    <th style="width:20%;"><asp:Literal ID="Literal2" runat="server" Text="订单编号"/></th>
                    <!-- 日期 -->
                    <th style="width:20%;"><asp:Literal ID="Literal4" runat="server" Text="时间"/></th>
                    <!-- 类型 -->
                    <th style="width:15%;"><asp:Literal ID="Literal5" runat="server" Text="类型"/></th>
                    <!-- 增加 -->
                    <th style="width:10%;"><asp:Literal ID="Literal6" runat="server" Text="增加"/></th>
                    <!-- 减少 -->
                    <th style="width:10%;"><asp:Literal ID="Literal7" runat="server" Text="减少"/></th>
                    <!-- 当前积分 -->
                    <th class="rightborder"  ><asp:Literal ID="Literal8" runat="server" Text="当前积分"/></th>
                  </tr>                  
        </HeaderTemplate>
        <ItemTemplate>
                  <tr>
                    <td align=center>
                        <asp:Label ID="lblJournalNumber" runat="server" Text='<%# Eval("JournalNumber") %>'></asp:Label>
                    </td>
                    <td align=center >
                        <asp:Label ID="lblOrderId" runat="server" Text='<%# string.IsNullOrEmpty(DataBinder.Eval(Container.DataItem,"OrderId").ToString())?"*":DataBinder.Eval(Container.DataItem,"OrderId").ToString() %>'></asp:Label>
                    </td>
                    <td align=center ><Hishop:FormatedTimeLabel ID="FormatedTimeLabel1" Time='<%#Eval("TradeDate") %>' runat="server" /></td>
                    <td align=center >
                        <Hishop:FormatUserPointTypeLabel ID="lblPaymentType" PointType='<%#Eval("TradeType") %>' runat="server"/>
                    </td>
                    <td align=center >
                        <Hishop:FormatUserPointNumberLabel ID="increasedNumber" Point='<%#Eval("Increased") %>' runat="server" />
                    </td>
                    <td align=center >
                        <Hishop:FormatUserPointNumberLabel ID="reducedNumber" Point='<%#Eval("Reduced") %>' runat="server" />
                    </td>
                    <td align=center class="rightborder">
                        <Hishop:FormatUserPointNumberLabel ID="pointNumber" Point='<%#Eval("Points") %>' runat="server" />
                    </td>
                  </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
</asp:DataList>