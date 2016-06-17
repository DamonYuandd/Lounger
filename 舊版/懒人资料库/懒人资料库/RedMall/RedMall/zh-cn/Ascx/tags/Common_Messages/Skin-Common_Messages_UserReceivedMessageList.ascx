<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>
        
        <UI:Grid ID="gridMessageList" runat="server" AutoGenerateColumns="False"  DataKeyNames="ReceiveMessageId"
                    CellPadding="4" ForeColor="#333333" GridLines="None" AllowSorting="false" 
                    Width="100%" RunningMode="Callback" CssClass="datalist" HeaderStyle-CssClass="diplayth1">
                    <Columns>
                        <Hishop:CheckBoxColumn HeaderStyle-CssClass="firstcell" />
                        <asp:TemplateField HeaderText="编号" ItemStyle-Width="100" >
                            <ItemTemplate>
                                <asp:Label runat="server" Id="lblMessage" Text='<%# Eval("ReceiveMessageId") %>' Visible="false" ></asp:Label>
                                <asp:Label runat="server" Text='<%# Eval("Id")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="标题">
                            <ItemTemplate>
                                <a Style=" color:#444CBA;cursor:hand;" onclick="$.myfn.OpenWindow('<%# Eval("ReceiveMessageId")%>','<%# Eval("Addresser")== null?123:Eval("Addresser") %>','<%# Eval("Title")%>','<%# Eval("PublishDate")%>','<%# (Eval("PublishContent")).ToString().Replace("\r\n", "<br/>")%>','<%# Eval("AddresserId")%>');" ><asp:Label runat="server" Text='<%# Eval("Title")%>'></asp:Label></a>
                            </ItemTemplate>
                        </asp:TemplateField>                       
                        <asp:TemplateField HeaderText="发件人">
                            <ItemTemplate>
                                管理员
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="时间">
                            <ItemTemplate>
                                <Hishop:FormatedTimeLabel ID="litDateTime" Time='<%# Eval("PublishDate")%>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="已读" SortExpression="IsRead">
                            <ItemTemplate>
                                <img src='<%# Eval("IsRead").ToString()=="False"? Globals.ApplicationPath+"/utility/pics/false.gif":Globals.ApplicationPath+"/utility/pics/true.gif" %>'  />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="操作" ItemStyle-Width="160px" ItemStyle-Height="50px" SortExpression="PublishDate">
                            <itemtemplate>
                                <a style=" color:#444CBA;cursor:hand;" onclick="$.myfn.OpenWindow('<%# Eval("ReceiveMessageId")%>','<%# Eval("Addresser")== null?123:Eval("Addresser") %>','<%# Eval("Title")%>','<%# Eval("PublishDate")%>','<%# (Eval("PublishContent")).ToString().Replace("\r\n", "<br/>")%>','<%# Eval("AddresserId")%>');" >回复</a>
                                <a style=" color:#444CBA;cursor:hand;" onclick="$.myfn.MessageDelete('<%# Eval("ReceiveMessageId")%>');" >删除</a>
                            </itemtemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle CssClass="grdrow" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <AlternatingRowStyle BackColor="White" />
                </UI:Grid>