<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<asp:DataList ID="dlstPtConsultationReply" runat="server" Width="100%" DataKeyField="ConsultationId">
    <ItemTemplate>
        <table cellspacing="0" border="0" width="100%" style="border-bottom: solid 1px #C0C0C0;">
            <!-- ��һ��[����] -->
            <tr>
                <td colspan="2" style="text-align: left;">
                    <span class="clewB">
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("IndexId")%>'></asp:Label>.
                    </span>&nbsp;&nbsp;��
                    ��<span class="productMainClass">
                        <Hishop:ProductNavigationDetails ID="productNavigationDetails" ProductName='<%# Eval("ProductName") %>'
                            ProductId='<%# Eval("ProductId") %>' runat="server" />
                    </span><strong>&nbsp;��</strong>
                    ����ѯ
                </td>
            </tr>
            <!-- �ڶ���[��ƷͼƬ����ѯ���ݡ���ѯʱ��] -->
            <tr>
                <!-- ��ƷͼƬ -->
                <td style="text-align: left; padding-left: 20px; padding-right: 20px; vertical-align: top;
                    width: 20%;">
                    <Hishop:Common_ProductThumbnail runat="server" DataField="ThumbnailsUrl"/>
                </td>
                <td style="text-align: left; vertical-align: top; width: 80%;">
                    <table cellspacing="0" border="0" width="100%">
                        <!-- ��ѯ���� -->
                        <tr>
                            <td style="text-align: left; color: #525757; width:550px">
                                <span style="word-break:break-all;"> <asp:Label ID="lbltext" runat="server" Text='<%# Eval("ConsultationText") %>'></asp:Label></span>
                            </td>
                        </tr>
                        <!-- ��ѯʱ�� -->
                        <tr>
                            <td style="text-align: right; padding-right: 10px; padding-top: 6px;" class="fontgrey">
                                ������
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