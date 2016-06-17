<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<asp:DataList ID="dlstPts" runat="server" Width="100%" DataKeyField="ProductId">
    <ItemTemplate>
        <table cellspacing="0" border="0" width="100%">
            <!-- 第一层第一行[商品名称] -->
            <tr>
                <td style="text-align: left; width: 96%;">
                    对
                    “<span style="color: #c00000; font-weight: bold;">
                        <Hishop:ProductNavigationDetails ID="productNavigationDetails" ProductName='<%# Eval("ProductName") %>'
                            ProductId='<%# Eval("ProductId") %>' runat="server" />
                    </span>”
                    的评论
                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding-left: 20px;">
                    <!-- 第二层[商品评论] -->
                    <asp:DataList ID="dlstPtReviews" runat="server" Width="100%" DataKeyField="ReviewId"
                        DataSource='<%# DataBinder.Eval(Container.DataItem, "PtReviews") %>'>
                        <ItemTemplate>
                            <table id="Table1" cellspacing="0" border="0" style="text-align: left; width: 100%;
                                border-top: solid 1px #C0C0C0;">
                                <tr>
                                    <td colspan="3" style="text-align: left;">
                                        <table cellspacing="0" border="0" style="text-align: left; width: 100%;">
                                            <tr>
                                                <!-- 评论类型、标题 -->
                                                <td style="text-align: left; width: 70%">
                                                    <span style="color: #FF8C00; font-weight: bold;">
                                                    </span><span style="font-weight: bold;">
                                                       
                                                    </span>
                                                </td>
                                                <!-- 评级 -->
                                                <td style="text-align: right;">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <!-- 评论内容 -->
                                    <td colspan="3" style="text-align: left; padding-left: 42px;">
                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("ReviewText") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
<script>
	var isIE = !!document.all;
	function errorEventTable(tableObject)
	{		
	    tableObject.runat="server";	
		if (isIE)
		{
			var nextNodeObject = tableObject.parentNode.parentNode.nextSibling;
		}
		else
		{
			var nextNodeObject = tableObject.parentNode.parentNode.nextSibling.nextSibling;
		}
		(nextNodeObject.style.display == "none")?nextNodeObject.style.display = "":nextNodeObject.style.display = "none";
		(nextNodeObject.style.display == "none")?tableObject.src = '<%= Globals.GetSkinPath() + "/images/plus.gif" %>':tableObject.src ='<%= Globals.GetSkinPath() + "/images/minus.gif" %>';
	}
</script>
