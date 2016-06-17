<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>

        <UI:Grid  ID="gridUserList" runat="server" AutoGenerateColumns="false" Width="100%"
            ShowHeader="true" DataKeyNames="hi_UserId" GridLines="None"
            CssClass="datalist" HeaderStyle-CssClass="dlth1" AllowSorting="true" SortOrderBy="CreateDate" SortOrder="DESC" RunningMode="Server">
            <Columns>
                <Hishop:CheckBoxColumn HeaderStyle-CssClass="first_cell"/>
                <asp:TemplateField HeaderText="<%$ Resources:ManageMembers, IDS_Header_Name %>" SortExpression="UserName" ItemStyle-Width="200px">                            
                    <itemtemplate>
                        <asp:Label runat="server" id="lblUserId" Text='<%# Eval("HI_UserId") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblUserName" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                     </itemtemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="<%$ Resources:ManageMembers, IDS_Header_CreateDate %>"
                    SortExpression="CreateDate"  >
                    <itemtemplate>
                       <Hishop:FormatedTimeLabel ID="litDateTime" Time='<%# Eval("CreateDate") %>' runat="server" />
                    </itemtemplate>
                </asp:TemplateField>
            </Columns>
        </UI:Grid > 