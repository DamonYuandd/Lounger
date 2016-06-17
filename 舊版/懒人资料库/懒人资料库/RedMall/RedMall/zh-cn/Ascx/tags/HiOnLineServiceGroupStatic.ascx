<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Import Namespace="Hishop.SystemServices" %>


                    <div id="tblOnlineServices" runat="server">
                        <asp:DataList ID="ds" runat="server" RepeatColumns="20" RepeatDirection="Horizontal" >
                            <HeaderTemplate>
                                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                    <td align="right"><div  style="padding-left:4px; width:24px;overflow:hidden;">
                                        <Hishop:ThemesImage ID="ThemesImage1" runat="server" src='<%# Eval("ServiceType").ToString()!="QQ" ? 
                                            
                                              ( Eval("ServiceType").ToString()!="MSN" ? 
                                              
                                                "http://amos1.taobao.com/online.ww?v=2&uid="+Globals.UrlEncode(Eval("ServiceAccount").ToString())+"&s=2" : "images/onlineService/MsnOnline.jpg"
                                            
                                               ): "http://wpa.qq.com/pa?p=1:"+Eval("ServiceAccount")+":4" %>'  alt="" /></div>
                                    </td>
                                    <td align="left" style="font-size:12px;padding-left:2px;">
                                        <a target="_blank" href='<%# Eval ("ServiceType").ToString()!="QQ" ? 
                                            
                                              ( Eval("ServiceType").ToString()!="MSN" ? 
                                              
                                                "http://amos1.taobao.com/msg.ww?v=2&uid="+Globals.UrlEncode(Eval("ServiceAccount").ToString())+"&s=2" : "msnim:chat?contact="+Eval("ServiceAccount").ToString()
                                            
                                               ): "http://wpa.qq.com/msgrd?V=1&Uin="+Eval("ServiceAccount").ToString()+"&Menu=yes"%>' >
                                            
                                            <asp:Label id="lblServiceName" Text='<%#Eval("ServiceName")%>' runat="server"></asp:Label>
                                        </a>
                                    </td>
                                
                            </ItemTemplate>
                            <FooterTemplate>
                                    </tr>
                                </table>
                            </FooterTemplate>
                        </asp:DataList>
                     </div>

