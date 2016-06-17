<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>

<table width="832" border="0" cellpadding="0" cellspacing="0" class="message_list">
  <tr>
    <td width="35" align="left" valign="top" class="message_lefticon_bg"><Hishop:ThemesImage ID="ThemesImage1" src="images/message_lefticon.jpg" runat="server"></td>
    <td width="735" align="left" valign="top"><table width="735" border="0" cellspacing="0" cellpadding="0">

      <tr>
        <td height="40"><table width="735" border="0" cellpadding="0" cellspacing="0" class="border_bottom_dotted">
          <tr>
            <td width="32" height="25" align="right" valign="top"><Hishop:ThemesImage ID="ThemesImage6" src="images/message_icon1.jpg" runat="server"></td>
            <td width="313" align="left" valign="middle" class="message_list_title" style="word-break:break-all"><asp:Literal ID="Literal1" Text='<%# Eval("Title") %>' runat="server"></asp:Literal></td>
            <td width="10">&nbsp;</td>
            <td width="18" align="left" valign="top"><Hishop:ThemesImage ID="ThemesImage2" src="images/message_icon2.jpg" runat="server"></td>
            <td width="152" align="left"><span class="message_list_title">留言人：</span><asp:Literal ID="Literal2" Text='<%# Eval("UserName") %>' runat="server"></asp:Literal></td>
            <td width="6">&nbsp;</td>
            <td width="194"><span class="message_list_title">发布时间：</span><Hishop:FormatedTimeLabel Time='<%# Eval("PublishDate") %>' runat="server" /></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td align="left" valign="top" class="message_list_content" ><span  style="word-break:break-all"><asp:Literal ID="Literal4" Text='<%# Eval("PublishContent") %>' runat="server"></asp:Literal></span></td>
      </tr>
    </table>
                  <asp:DataList ID="dtlistLeaveCommentsReply" runat="server" Width="100%" 
                    DataSource='<%# DataBinder.Eval(Container, "DataItem.LeaveCommentReplays") %>'>
                    <ItemTemplate>
      <table width="735" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td align="left" valign="top" class="message_list_reply"><span class="color_red">管理员回复：</span><span style="word-break:break-all"><asp:Literal ID="Literal5" Text='<%# Eval("ReplyTitle") %>' runat="server"></asp:Literal></span>
			<div  style="word-break:break-all"><asp:Literal ID="Literal7" Text='<%# Eval("ReplyContent") %>' runat="server"></asp:Literal></div>
			<div class="message_list_reply_time"><Hishop:FormatedTimeLabel Time='<%# Eval("ReplyDate") %>' runat="server" /></div></td>
        </tr>
        </table>
                    </ItemTemplate>
                </asp:DataList>
        </td>
    <td width="62" align="right" valign="top" class="message_righticon_bg"><Hishop:ThemesImage ID="ThemesImage3" src="images/message_righticon.jpg" runat="server"></td>
  </tr>
  <tr><td colspan="3"><table width="832" border="0" cellpadding="0" cellspacing="0" class="message_list_bottom">
  <tr>
    <td width="33" align="left" valign="top"><Hishop:ThemesImage ID="ThemesImage4" src="images/message_bottom_left.jpg" runat="server"></td>
    <td width="782"></td>
    <td width="17" align="right" valign="top"><Hishop:ThemesImage ID="ThemesImage5" src="images/message_bottom_right.jpg" runat="server"></td>
  </tr>
</table></td></tr>
</table>