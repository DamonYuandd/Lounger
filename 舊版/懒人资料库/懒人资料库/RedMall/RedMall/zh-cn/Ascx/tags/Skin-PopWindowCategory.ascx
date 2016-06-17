<%@ Control Language="C#"%>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<script src="/script/popwindow.js" type="text/javascript"></script>
<!--分类弹出窗口开始-->
<div style="display:none">
    <div id="all-categories">
      <div style="border-right: #aca976 1px solid; padding-right: 12px; border-top: #aca976 1px solid; padding-left: 12px; padding-bottom: 12px; border-left: #aca976 1px solid; padding-top: 12px; border-bottom: #aca976 1px solid; background-color: #ffffff">    
        <asp:DataList ID="dlstMainCategories" RepeatDirection="Vertical" DataKeyField="CategoryId" runat="server">
            <ItemStyle Width="100%" VerticalAlign="Top" />
            <ItemTemplate>
                <table style="border-style:none; width:100%; vertical-align:top">
                    <tr>
                        <td class="productMainClass">
                           <a href='<%# Globals.GetSiteUrls().SubCategory(Convert.ToInt32(Eval("CategoryId")), Eval("RewriteName")) %>'><%# Eval("Name")%></a>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:20px; vertical-align:top">
                            <asp:DataList ID="rptSubCategories" RepeatDirection="Horizontal" RepeatColumns="5" runat="server">
                                <ItemTemplate>
                                    <span class="productSubClass"><a href='<%# Globals.GetSiteUrls().SubCategory(Convert.ToInt32(Eval("CategoryId")), Eval("RewriteName")) %>'><%# Eval("Name") %></a></span>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
      </div>
    </div>
</div>
<!--分类弹出窗口结束--> 