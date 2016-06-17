<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>

<asp:DataList ID="dtlstFavorite" runat="server" Width="100%" DataKeyField="FavoriteId">
    <ItemTemplate>
            <table style="margin:2em auto;border-bottom:1px solid #d4d0c8;" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                   <tr>
                      <td width="5%" rowspan="4" align="center" valign="top">
                           <asp:CheckBox ID="checkboxCol" runat="server" />
				           </td>
                      <td width="23%" rowspan="4" align="center" valign="middle" >
                           <table cellspacing="0" cellpadding="0" class="Favorites_pic">
				           <tr>
				           <td align="center" valign="middle"><Hishop:Common_Link_Product ID="Common_Link_Product1" runat="server"><Hishop:Common_ProductThumbnail ID="Common_ProductThumbnail1" AutoResize="true" Width="120" Height="120" runat="server" DataField="ThumbnailsUrl" CustomToolTip="ProductName"/></Hishop:Common_Link_Product></td>
				           </tr>
			              </table>
				          </td>
                      <td style="font-weight:bold;"  class="pad-left-20" >
                          <span><Hishop:ProductNavigationDetails ID="ProductNavigationDetails1" ProductName='<%# Eval("ProductName") %>' ProductId='<%# Eval("ProductId") %>' runat="server"/></span>
				          </td>
                      <td width="10%" rowspan="4" align="center" class="blueFontStyle" >
                         <Hishop:ListBuyButton ID="ListBuyButton1" runat="server"><Hishop:ThemesImage ID="ThemesImage3" src="images/icon_buy.gif" runat="server"></Hishop:ListBuyButton>
                         <br />
				         <span class="list-btnedit" style="margin-top:10px">
                             <asp:LinkButton ID="lbtnEdit" CommandName="Edit" runat="server" Text="编辑"></asp:LinkButton>
                          </span><br /><br />

				           <span class="list-btndelete" >
                             <Hishop:DeleteImageLinkButton runat="server" ID="lbtnDeleted"  Text="删除"  CommandName="Deleted"/>
                          </span>
				          </td>
                   </tr>
                   <tr>
                      <td>
                            市场价：<Hishop:FormatedMoneyLabel ID="FormatedMoneyLabel1" DataField="MarketPrice" runat="server" /> 
                            销售价：<Hishop:FormatedMoneyLabel ID="FormatedMoneyLabel2" DataField="RankPrice" runat="server" /> 
                            节省：<span class="color_blue"><Hishop:Private_Favorite_SavePrice ID="Private_Favorite_SavePrice1" runat="server"></Hishop:Private_Favorite_SavePrice></span></td>
                   </tr>
                   <tr>
                      <td style="word-break: break-all;"><asp:Label ID="lblDescription" runat="server" Text='<%#Bind("ShortDescription") %>'></asp:Label></td>
                   </tr>
                   <tr>
                      <td>
                         <span class="Tags_icon1" style="padding:0 10px 0 20px;">标签</span> 
                             <asp:Label ID="lblTags" runat="server" Text='<%#Bind("Tags") %>'></asp:Label>
					         <div style="clear:both;">
                         <span class="Tags_icon2" style="padding:0 10px 0 20px;">备注</span> 
                        <asp:Label ID="Label1" runat="server" Text='<%#Bind("Remark") %>' CssClass="color_gray"" Width="200" style="word-break:break-all" ></asp:Label>
				        </div></td>
                   </tr>                
               </table>
     </ItemTemplate>
     <EditItemTemplate>
            <table style="margin:2em auto;border-bottom:1px solid #d4d0c8;" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                   <tr>
                      <td width="5%" rowspan="4" align="center" valign="top">
                           <asp:CheckBox ID="checkboxCol" runat="server" />
				           </td>
                      <td width="23%" rowspan="4" align="center" valign="middle" >
                           <table cellspacing="0" cellpadding="0" class="Favorites_pic">
				           <tr>
				           <td align="center" valign="middle"><Hishop:Common_Link_Product ID="Common_Link_Product2" runat="server"><Hishop:Common_ProductThumbnail ID="Common_ProductThumbnail2" AutoResize="true" Width="120" Height="120" runat="server" DataField="ThumbnailsUrl" CustomToolTip="ProductName"/></Hishop:Common_Link_Product></td>
				           </tr>
			              </table>
				          </td>
                      <td style="font-weight:bold;"  class="pad-left-20" >
                          <span><Hishop:ProductNavigationDetails ID="ProductNavigationDetails1" ProductName='<%# Eval("ProductName") %>' ProductId='<%# Eval("ProductId") %>' runat="server"/></span>
				          </td>
                      <td width="10%" rowspan="4" align="center" class="blueFontStyle" >
			          <span>
				         <span class="list-btnedit" >
                             <asp:LinkButton ID="lbtnUpdate" CommandName="Update" runat="server" Text="更新"></asp:LinkButton>
                          </span><br /><br />

				           <span class="list-btndelete" >
                             <asp:LinkButton ID="lbtnCancel" CommandName="Cancel" runat="server" Text="取消"></asp:LinkButton>
                          </span>
				          </td>
                   </tr>
                   <tr>
                      <td>
                            市场价：<Hishop:FormatedMoneyLabel ID="FormatedMoneyLabel1" DataField="MarketPrice" runat="server" /> 
                            销售价：<Hishop:FormatedMoneyLabel ID="FormatedMoneyLabel2" DataField="RankPrice" runat="server" /> 
                            节省：<span class="color_blue"><Hishop:Private_Favorite_SavePrice ID="Private_Favorite_SavePrice1" runat="server"></Hishop:Private_Favorite_SavePrice></span></td>
                   <tr>
                      <td style="word-break: break-all;"><asp:Label ID="Label2" runat="server" Text='<%#Bind("ShortDescription") %>'></asp:Label></td>
                   </tr>
                   <tr>
                      <td>
                         <span class="Tags_icon1" style="padding:0 10px 0 20px;">标签</span> 
                             <asp:TextBox ID="txtTags" runat="server" Width="200" Text='<%#Bind("Tags") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="valrTags" ControlToValidate="txtTags" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
					         <div style="clear:both;">
                         <span class="Tags_icon2" style="padding:0 10px 0 20px;">备注</span> 
                        <asp:TextBox ID="txtRemark" runat="server" Text='<%#Bind("Remark") %>' Height="50px" Width="200px" TextMode="MultiLine"></asp:TextBox>
				        </div></td>
                   </tr>                
               </table>
    </EditItemTemplate>
</asp:DataList>	