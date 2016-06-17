<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Import Namespace="Hishop.SystemServices" %>

<script language="javascript" type="text/javascript">
    $(document).ready(function() {
        $('#btnOrderSearch').bind('click', function() {
            var $divCatlist = $("#divOrderInfo");
            var strShipOrderNumber = "";
            $divCatlist.empty();
            var orderId = $("#txtOrderId").attr("value");
            $.getJSON(
                    "OrderHandler.aspx",
                    { OrderId: orderId },
                    function(data) {
                        $.each(data, function(i, item) {
                            if (item.OrderId == undefined) {
                                $divCatlist.append("您输入的订单号不存在！");
                            }
                            else {
                                if (item.ShipOrderNumber == undefined || item.ShipOrderNumber == "") {
                                    strShipOrderNumber = "无";
                                }
                                else {
                                    strShipOrderNumber = item.ShipOrderNumber;
                                }
                                $divCatlist.append("<div>订单号：" + item.OrderId + "&nbsp;" + item.ShippingStatus + "</div>")
                                .append("<div>发货单号：" + strShipOrderNumber + "</div>")
                                .append("<div>配送方式：" + item.ShipModeName + "</div>");
                            }
                        });
                    });
                    return false;
                });
                
            $("#txtOrderId").keydown(function(e) {
              if (e.keyCode == 13) {
                $('#btnOrderSearch').focus();
                $('#btnOrderSearch').click(function() { });
              }
        });
           });
        </script>
        

        <input type="text" id="txtOrderId" />
        <input id="btnOrderSearch" type="button" value="确定" />
        <div id="divOrderInfo"></div>
