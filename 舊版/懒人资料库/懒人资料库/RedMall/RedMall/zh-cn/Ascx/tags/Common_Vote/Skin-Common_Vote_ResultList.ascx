<%@ Control Language="C#"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<asp:DataList ID="dtlstVoteResult" runat="server" Width="100%" DataKeyNames="VoteItemId" >                                                                                            
            <HeaderTemplate>
            <table width="100%">
<%--                <tr align="left">
                    <th><asp:Literal ID="litVoteName" runat="server" Text="<%$ Resources:VoteItems,IDM_grdVoteItmeName %>"></asp:Literal></th>
                    <th><asp:Literal ID="litVoteitemLen" runat="server" Text="<%$ Resources:VoteItems, IDS_grdVoteItmeLenth %>"></asp:Literal></th>
                    <th><asp:Literal ID="litPercentage" runat="server" Text="<%$ Resources:VoteItems,IDS_grdVoteItmePercentage %>"></asp:Literal></th>
                    <th><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:VoteItems,IDS_grdVoteItmeCount %>"></asp:Literal></th>
                </tr>--%>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td colspan="4"><asp:Label ID="lblVoteItemName" runat="server" Text='<%# Eval("VoteItemName") %>'></asp:Label></td>
               </tr>
                <tr align="left">
                    <td width="421">
                      <div class="votefacebg">
                        <div style='<%# string.Format("width:{0}px;overflow:hidden;", Eval("Lenth")) %>'><Hishop:ThemesImage ID="themesImg5" runat="server" src="images/voteface.jpg" /></div>
                      </div>
                    </td>  
                    <td><asp:Label ID="lblPercentage" runat="server" Text='<%# Eval("Percentage", "{0:N2}") %>' ></asp:Label>%</td>
                    <td><asp:Label ID="Label1" runat="server" Text='<%# Eval("ItemCount") %>' ></asp:Label></td>
               </tr>
            </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>                                                                                                                                                                                                                                                                                       
</asp:DataList>