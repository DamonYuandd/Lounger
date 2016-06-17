<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>

<asp:DataList ID="dlstOrderLookupList" DataKeyField="LookupListId" runat="server" RepeatDirection="Vertical">
    <ItemTemplate>
        <table  border="0" cellpadding="3" cellspacing="0">
            <tr>
          
                <td align="left"><Hishop:ThemesImage ID="ThemesImage1"   src="images/recive-adress_icon.jpg" width="12" height="12"  runat="server"> 
                 <span class="color-8f12b">  <%# Eval("Name") %></span> 
                </td>
            </tr>
            <tr>
                <td >
                    <Hishop:Private_OrderOptionItems runat="server" LookupListId='<%# Eval("LookupListId")%>' SelectMode='<%# Eval("SelectMode")%>' />
                    </td>
                    <td>
                    <div>
                          <table border="0" cellpadding="0"  cellspacing="0"  style="display:none;">
                            <tr>
                                <td>
                                    <input runat="server" id="litInputTitle" readonly="readonly" style="border: 0 0 0 0; text-align:right;"/>£º
                                </td>
                                <td>
                                    <input runat="server" id="txtInputContent" maxLength="200"/>
                                    <input type="hidden" name="submmitorder_optionPrice" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>