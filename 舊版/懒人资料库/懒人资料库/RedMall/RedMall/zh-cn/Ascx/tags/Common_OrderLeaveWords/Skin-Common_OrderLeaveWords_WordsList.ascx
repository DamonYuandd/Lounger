<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Import Namespace="Hishop.SystemServices" %>

<asp:DataList ID="dls" runat="server" Width="100%" DataKeyField="LeaveId" >      
    <HeaderTemplate>
        <table cellspacing="0" align="left" border="0" width="100%" >
    </HeaderTemplate>                    
    <ItemTemplate>
         <tr>
            <td Width="25%" style="vertical-align:top;"><asp:Label ID="lblUserName" runat="server" Text='<%# Eval("UserName")%>' style="word-break:break-all" ></asp:Label>£º</td>
            <td Width="75%"><asp:Label ID="lblPublishContent" runat="server" Text='<%# Eval("PublishContent")%>' style="word-break:break-all" ></asp:Label></td>
         </tr>
         <tr>
            <td colspan="2" style="border-bottom:dashed 1px #CCCCCC;text-align:right;">
                <Hishop:FormatedTimeLabel ID="lblStartTimes" Time='<%#Eval("PublishDate") %>' runat="server" />
            </td>
        </tr>                                          
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>                                                                               
 </asp:DataList>  