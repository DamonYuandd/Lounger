<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<asp:DataList ID="dlstAttribute" runat="server" width="100%">

    <ItemTemplate>
      <dl>
           <dt class="search-expand-title">°´<%# Eval("Name")%> ËÑË÷</dt>
       <dd class="search-expand-list"><asp:DataList ID="dlstAttributeValues" runat="server" DataSource='<%# DataBinder.Eval(Container.DataItem, "AttributeValue") %>' RepeatColumns="5" Width="100%">
                    <ItemTemplate>
                        <Hishop:Private_SearchExpand_Value ID="attributeValue" runat="server" Text='<%# Eval("DisplayName") %>' AttributeId='<%# Eval("AttributeId") %>' />                       
                    </ItemTemplate>
                </asp:DataList> </dd> 
                     </dl>
    </ItemTemplate>

</asp:DataList>

