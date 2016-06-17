<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<asp:DataList ID="dlstPtConsultationReply" runat="server" Width="100%" DataKeyField="ConsultationId">
    <ItemTemplate>
        <table cellspacing="0" border="0" width="100%" style="border-bottom: solid 1px #C0C0C0;">
            <!-- 第一行[标题] -->
            <tr>
                <td colspan="2" style="text-align: left;">
                    <span class="clewB">
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("IndexId")%>'></asp:Label>.
                    </span>&nbsp;&nbsp;对
                    “<span class="productMainClass">
                        <Hishop:ProductNavigationDetails ID="productNavigationDetails" ProductName='<%# Eval("ProductName") %>'
                            ProductId='<%# Eval("ProductId") %>' runat="server" />
                    </span><strong>&nbsp;”</strong>
                    的咨询
                </td>
            </tr>
            <!-- 第二行[商品图片、咨询内容、咨询时间] -->
            <tr>
                <!-- 商品图片 -->
                <td style="text-align: left; padding-left: 20px; padding-right: 20px; vertical-align: top;
                    width: 20%;">
                    <Hishop:Common_ProductThumbnail runat="server" DataField="ThumbnailsUrl"/>
                </td>
                <td style="text-align: left; vertical-align: top; width: 80%;">
                    <table cellspacing="0" border="0" width="100%">
                        <!-- 咨询内容 -->
                        <tr>
                            <td style="text-align: left; color: #525757; width:550px">
                                <span style="word-break:break-all;"> <asp:Label ID="lbltext" runat="server" Text='<%# Eval("ConsultationText") %>'></asp:Label></span>
                            </td>
                        </tr>
                        <!-- 咨询时间 -->
                        <tr>
                            <td style="text-align: right; padding-right: 10px; padding-top: 6px;" class="fontgrey">
                                发表于
                                <Hishop:FormatedTimeLabel ID="FormatedTimeLabel2" Time='<%# Eval("ConsultationDate") %>'
                                    runat="server"></Hishop:FormatedTimeLabel>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>