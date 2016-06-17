<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>
        
        <UI:Grid ID="gridMessageList" runat="server" AutoGenerateColumns="False"  DataKeyNames="ReceiveMessageId"
                    CellPadding="4" GridLines="None" AllowSorting="false" CssClass="datalist" HeaderStyle-CssClass="dlth1"
                    Width="100%" RunningMode="Callback" >
                    <Columns>
                        <Hishop:CheckBoxColumn HeaderStyle-CssClass="first_cell"/>
                        <asp:TemplateField HeaderText="编号" ItemStyle-Width="100">
                            <ItemTemplate>
                                <asp:Label runat="server" Id="lblMessage" Text='<%# Eval("ReceiveMessageId") %>' Visible="false" ></asp:Label>
                                <asp:Label runat="server" Text='<%# Eval("Id")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="标题">
                            <ItemTemplate>
                                <a style=" color:#444CBA;cursor:hand;" onclick="$.myfn.OpenWindow('<%# Eval("ReceiveMessageId")%>','<%# Eval("Addresser")== null?123:Eval("Addresser") %>','<%# Eval("Title")%>','<%# Eval("PublishDate")%>','<%# (Eval("PublishContent")).ToString().Replace("\r\n", "<br/>")%>','<%# Eval("AddresserId")%>');" ><asp:Label runat="server" Text='<%# Eval("Title")%>'></asp:Label></a>
                            </ItemTemplate>
                        </asp:TemplateField>                       
                        <asp:TemplateField HeaderText="发件人">
                            <ItemTemplate>
                                <Hishop:Link_User runat="server" Text='<%# Eval("Addresser")%>' UserId='<%# Eval("AddresserID") %>' DefaultText="管理员" Style=" color:Blue;" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="时间">
                            <ItemTemplate>
                                <Hishop:FormatedTimeLabel ID="litDateTime" Time='<%# Eval("PublishDate") %>' runat="server" />
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
                </UI:Grid>