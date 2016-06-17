<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
 <script type="text/javascript">
     function voteOption(voteId, voteItemId) {
             window.document.location.href = applicationPath + "/VoteResult.aspx?VoteId=" + voteId + "&&VoteItemId=" + voteItemId;
     }
</script>
<asp:DataList ID="dlstVoteList" RepeatDirection="Vertical" DataKeyField="VoteId"
    ItemStyle-Font-Size="12px" runat="Server" Width="100%">
    <HeaderTemplate>
        <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
            <tr>
    </HeaderTemplate>
    <ItemTemplate>
        <td>
            <table align="left" width="100%" style="margin-left: 7px;">
                <tr>
                    <td style="font-weight: bold;">
                        <asp:Literal ID="lblVoteName" Text='<%#Eval("VoteName") %>' runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" id='<%# this.NamingContainer.ClientID + Convert.ToString(Eval("VoteId")) + "_Value" %>' />
                        <input type="hidden" id='<%# this.NamingContainer.ClientID + Convert.ToString(Eval("VoteId")) + "_Vote" %>'
                            value='<%# Eval("VoteId") %>' />
                        <input type="hidden" id='<%# this.NamingContainer.ClientID + Convert.ToString(Eval("VoteId")) + "_MaxVote" %>'
                            value='<%# Eval("MaxCheck") %>' />
                        <asp:DataList runat="server" ID="dlstVoteItems" Visible='<%# Convert.ToInt32(Eval("MaxCheck")) == 1 %>'
                            DataSource='<%# DataBinder.Eval(Container.DataItem, "Vote") %>' RepeatDirection="Vertical"
                            Width="100%">
                            <ItemTemplate>
                                <input type="radio" value='<%# Eval("VoteItemId") %>' onclick='document.getElementById(this.name + "_Value").value = this.value;'
                                    name='<%# this.NamingContainer.ClientID + Convert.ToString(Eval("VoteId")) %>' /><%# Eval("VoteItemName") %>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:DataList runat="server" Visible='<%# Convert.ToInt32(Eval("MaxCheck")) > 1 %>'
                            ID="DataList1" DataSource='<%# DataBinder.Eval(Container.DataItem, "Vote") %>'
                            RepeatDirection="Vertical">
                            <ItemTemplate>
                                <input type="checkbox" value='<%# Eval("VoteItemId") %>' onclick='setcheckbox(this)'
                                    name='<%# this.NamingContainer.ClientID + Convert.ToString(Eval("VoteId")) %>' /><%# Eval("VoteItemName") %>
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <table>
                            <tr>
                                <td >
                                    <input type="button" name='<%# Eval("VoteId") %>' value="提交/查看" id="btnOK" class="btnVote"  onclick='voteOption(this.name , document.getElementById("<%# this.NamingContainer.ClientID + Convert.ToString(Eval("VoteId"))%>_Value").value);' />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </ItemTemplate>
    <FooterTemplate>
        </tr> </table>
    </FooterTemplate>
</asp:DataList>