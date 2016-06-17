<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>

        <UI:Grid ID="messagesList" runat="server" AutoGenerateColumns="False"   DataKeyNames="sendmessageid"
                    CellPadding="4"  GridLines="None" AllowSorting="false" CssClass="datalist" HeaderStyle-CssClass="dlth1"
                    Width="100%" RunningMode="Server" >
                    <Columns>
                        <Hishop:CheckBoxColumn HeaderStyle-CssClass="first_cell"/>
                        <asp:TemplateField HeaderText="编号" ItemStyle-Width="100">
                            <ItemTemplate>
                                <asp:Label runat="server" Id="lblMessage" Text='<%# Eval("sendmessageid") %>' Visible="false" ></asp:Label>
                                <asp:Label runat="server" Text='<%# Eval("Id")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>                    
                        <asp:TemplateField HeaderText="标题">
                            <ItemTemplate>
                                <a style=" color:#444CBA;cursor:hand;" onclick="$.myfn.OpenWindow('<%# Eval("sendmessageid")%>','<%# Eval("Addressee")%>','<%# Eval("Title")%>','<%# Eval("PublishDate")%>','<%# (Eval("PublishContent")).ToString().Replace("\r\n", "<br/>")%>');" ><span style="color:Blue;"><asp:Label runat="server" Text='<%# Eval("Title")%>'></asp:Label></span></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="收件人">
                            <ItemTemplate>
                                <Hishop:Link_User runat="server" Text='<%# Eval("Addressee")%>' UserId='<%# Eval("AddresseeID") %>' DefaultText="管理员" Style=" color:Blue;" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="时间" SortExpression="PublishDate">
                            <ItemTemplate>
                                <Hishop:FormatedTimeLabel ID="litDateTime" Time='<%# Eval("PublishDate")%>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="操作" ItemStyle-Width="160px" ItemStyle-Height="50px" SortExpression="PublishDate">
                            <itemtemplate>
                                <a style=" color:#444CBA;cursor:hand;" onclick="$.myfn.OpenWindow('<%# Eval("sendmessageid")%>','<%# Eval("Addressee")%>','<%# Eval("Title")%>','<%# Eval("PublishDate")%>','<%# (Eval("PublishContent")).ToString().Replace("\r\n", "<br/>")%>');" >查看</a>
                                <Hishop:DeleteImageLinkButton runat="server"  Text="<%$ Resources:Resources, IDS_Button_Delete %>" CommandName="Delete"/>
                            </itemtemplate>
                        </asp:TemplateField>
                    </Columns>
                </UI:Grid>