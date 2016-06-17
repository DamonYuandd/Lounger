<%@ Control Language="C#"%>
<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Import Namespace="Hishop.SystemServices" %>

    <table style="width:100%;word-break:break-all;"cellspacing="0" cellpadding="0" >
        <tr>
            <td style="Width:100%;">
                <div style="Width:100%;">
                    <asp:DataList ID="dlstPtReviews" runat="server" Width="100%" DataKeyField="ReviewId" >                                    
                        <ItemTemplate>
                           <div style="padding:5px 10px;width:760px;">
                             <div class="proreview-que-box">
                               <ul>
                                 <li class="proreview-title"><asp:Label ID="lblReviewTitle" runat="server" Text='<%# Eval("ReviewTitle") %>'></asp:Label></li>
                                 <li><span class="proreview-type">评论类型：<span class="fontred"></span> 
                                    <span class="proreview-user">评论人：<asp:Label ID="lblUserName" runat="server" Text='<%# Eval("UserName") %>'></asp:Label></span></li>
                                 <li class="proreview-con"><asp:Label ID="ReviewText" runat="server" Text='<%# Eval("ReviewText") %>'></asp:Label></li>
                                 <li><Hishop:FormatedTimeLabel ID="ConsultationDateTime" Time='<%# Eval("ReviewDate") %>' runat="server"></Hishop:FormatedTimeLabel><a href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("ProductReviewReply",Eval("ReviewId"))%>' target="_blank"><Hishop:ThemesImage   alt="回复" height="20" src="images/btn-reply.jpg" width="67"  runat="server"></a>  <a href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("ProductReviewReport",Eval("ReviewId"))%>' target="_blank"><Hishop:ThemesImage  alt="举报" height="20" src="images/btn-report.jpg" width="67"  runat="server"></a></li>
                               </ul>
                             </div>
                            </div>                            
                        </ItemTemplate>                                                                               
                     </asp:DataList>                                    
                </div>
                <!--分页开始-->
                <div style="text-align:right;margin-top:10px;">
                    <UI:Pager runat="server" ListToPaging="dlstPtReviews" ID="pager" />           
                </div>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>

