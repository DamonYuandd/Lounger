<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<asp:DataList runat="server" ID="dtlistHelps" Width="95%">
   <HeaderTemplate>
        <table class="articlelist" width="100%" align="center"  valign="middle"  border="0" cellspacing="0" cellpadding="0">
            <tr>
                <th align="left">
                   帮助标题
                </th>  
                <th align="left">
                    创建日期
                </th>          
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td align="left">
              <a href='<%# Globals.GetSiteUrls().UrlData.FormatUrl("HelpDetails",Eval("HelpId"))%>'>
                    <Hishop:Private_HelpCenter_Title ID="Private_HelpCenter_Title1" runat="server" />
                </a>
            </td>
            <td align="left"><Hishop:FormatedTimeLabel ID="lblStartTimes" Time='<%#Eval("AddedDate") %>' runat="server" /></td>
       </tr>
    </ItemTemplate>
    <FooterTemplate>
            </tr>
        </table>
    </FooterTemplate> 
  
  
  
  
  
  
  
  
  
  
  

</asp:DataList>
