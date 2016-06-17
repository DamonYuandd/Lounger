<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>

     
        <table style="width:100%;">
        <tr>
            <td>
                <div style="border:1px #e2d9c1 solid;background-color:#f4f3ea; padding:4px;">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr><td>
                        <span style="color:#ff9000;">
                            <asp:Literal ID="Literal1" Text='<%# Eval("UserName") %>' runat="server"></asp:Literal></span> 
                            说：<span style="color:#5b5b5b; font-size:11px;"><Hishop:FormatedTimeLabel Time='<%# Eval("PublishDate") %>' runat="server" /></span>
                            <input type="button" value="回复" onclick="$.myfn.OpenWindow(<%# Eval("LeaveId") %>,'<%# Eval("Title") %>')" />
                            <input type="button" value="删除" onclick="$.myfn.LeaveDelete(<%# Eval("LeaveId") %>)"/> 
                    </td></tr>
                    <tr><td style="padding-top:8px;">
                        <span style="word-break:break-all"><strong><asp:Literal ID="Literal3" Text='<%# Eval("Title") %>' runat="server"></asp:Literal></strong></span>
                    </td></tr>
                    <tr><td>
                        <span style="word-break:break-all"><asp:Literal ID="Literal4" Text='<%# Eval("PublishContent") %>' runat="server"></asp:Literal></span>
                    </td></tr>
                </table>
                </div>
            </td>
       </tr>
       <tr>
            <td style=" padding-left:40px;">

                <asp:DataList ID="dtlistLeaveCommentsReply" runat="server" Width="100%"
                    DataSource='<%# DataBinder.Eval(Container, "DataItem.LeaveCommentReplays") %>'>
                    <ItemTemplate>
                        <div style="border:1px #dedede solid;width:100%; background-color:#ffffff; padding:4px;">
                            <table >
                                <tr><td>
                                    <span style="color:#3366cc;">我的回复：</span>
                                    <span style="color:#5b5b5b; font-size:11px;"><Hishop:FormatedTimeLabel Time='<%# Eval("ReplyDate") %>' runat="server" /></span>
                                    <input type="button" value="删除" class="bindbtnReplyDelete" onclick="$.myfn.ReplyDelete(<%# Eval("ReplyId") %>)" /> 
                                </td></tr>
                                <tr><td style="padding-top:8px;">
                                    <span style="word-break:break-all"><strong><asp:Literal ID="Literal6" Text='<%# Eval("ReplyTitle") %>' runat="server"></asp:Literal></strong></span>
                                </td></tr>
                                <tr><td >
                                    <asp:Literal ID="Literal7" Text='<%# Eval("ReplyContent") %>' runat="server"></asp:Literal>
                                </td></tr>
                            </table>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </td>
       </tr>
       </table>   
       
       

    
