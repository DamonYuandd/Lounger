<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>

<asp:DataList ID="dlstPtConsultationReplyed" runat="server" Width="100%" DataKeyField="ConsultationId">
    <ItemTemplate>
        <table cellspacing="0" border="0" width="100%" style="border-bottom: solid 1px #C0C0C0;">
            <!-- 第一行[标题] -->
            <tr>
                <td colspan="2" style="text-align: left;">
                    <span class="clewB">
                        <asp:Label ID="Label8" runat="server" Text='<%#Eval("IndexId")%>'></asp:Label>.
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
                    width: 10%;">
                    <Hishop:Common_ProductThumbnail runat="server"  DataField="ThumbnailsUrl"/>
                </td>
                <td style="text-align: left; width: 80%;">
                    <table cellspacing="0" border="0" width="100%">
                        <!-- 咨询内容 -->
                        <tr>
                            <td style="text-align: left; color: #525757; width:550px">
                                您发表了：<span style="word-break:break-all;"> <asp:Label ID="lbltext" runat="server" Text='<%# Eval("ConsultationText") %>' Width="300px"></asp:Label></span>
                            </td>
                        </tr>
                        <!-- 咨询时间 -->
                        <tr>
                            <td style="text-align: right;  color: #898989; padding-right: 10px;" class="fontgrey">
                                您发表于：
                                <Hishop:FormatedTimeLabel ID="FormatedTimeLabel2" Time='<%# Eval("ConsultationDate") %>'
                                    runat="server"></Hishop:FormatedTimeLabel>
                            </td>
                        </tr>
                        <!-- 回复信息 - 嵌套 -->
                        <tr>
                            <td style="padding: 10px 5px 10px 20px;">
                                <asp:DataList ID="dlstPtConsultationReply" runat="server" Width="100%" DataKeyField="ConsultationId"
                                    DataSource='<%# DataBinder.Eval(Container.DataItem, "ConsultationReplys") %>'>
                                    <ItemTemplate>
                                        <table cellspacing="0" border="0" width="100%" style="background: #f7f7f7; line-height: 2em;">
                                            <!-- 回复内容 -->
                                            <tr>
                                                <td style="text-align: left; width: 95%; padding-left: 10px; color:#d75509">
                                                    管理员回复：<asp:Label ID="lblReplyContent" runat="server" Text='<%# Eval("ReplyText") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <!-- 回复人、回复时间 -->
                                            <tr>
                                                <td colspan="2" style="padding-left: 30px; padding-top: 6px; color: #898989;">
                                                    回复于
                                                    <Hishop:FormatedTimeLabel ID="FormatedTimeLabel1" Time='<%# Eval("ReplyDate") %>'
                                                        runat="server"></Hishop:FormatedTimeLabel>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>