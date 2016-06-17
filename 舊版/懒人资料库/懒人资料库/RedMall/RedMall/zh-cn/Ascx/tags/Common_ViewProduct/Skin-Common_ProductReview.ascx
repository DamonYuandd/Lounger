<%@ Control Language="C#"%>
<%@ Register TagPrefix="UI" Namespace="ASPNET.WebControls" Assembly="ASPNET.WebControls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Validator" Assembly="Hishop.Web.Validator" %>
<%@ Import Namespace="Hishop.SystemServices" %>

<script type="text/javascript">

$(document).ready(function() { 

    var isMember='<%=HiContext.Current.User.IsMember%>';
    var isAgent='<%=HiContext.Current.User.IsAgent%>';
    if (isMember=="False" && isAgent=="False")
    {
        $("#spReviewUserName").css({"display":""});
        $("#spReviewPsw").css({"display":""});
        $("#spReviewReg").css({"display":""});
        $("#btnReview").val("��¼������");
    }
    else
    {
        $("#txtReviewName").val('<%=HiContext.Current.User.Username%>');
        $("#txtReviewEmail").val('<%=HiContext.Current.User.Email%>');
        $("#txtReviewUserName").attr('');
        $("#txtReviewPsw").attr('');       
        $("#spReviewUserName").css({"display":"none"});
        $("#spReviewPsw").css({"display":"none"});
        $("#spReviewReg").css({"display":"none"});
        $("#btnReview").val("����");
    }
    
})

    function ResetPagerReview(sender, eventArgs) 
    {
        cbReviewPage.callback();
    }
    
    function addReview() {

        var email = $("#txtReviewEmail").attr("value");
        var name = $("#txtReviewName").attr("value");
        var info = $("#txtReviewMessage").attr("value"); 
        var userName = $("#txtReviewUserName").attr("value");
        var password = $("#txtReviewPsw").attr("value");
        var code = $("#txtReviewCode").attr("value");
        var productId = <%=Request.QueryString["ProductId"]%>;
                
        $.ajax({
            url: "ProductHandler.aspx",
            type: 'Post', dataType: 'json', timeout: 10000,
            data:{action:"ProductReview",productId:productId,Name:name,Email:email,Content:info,username:userName,password:password,code:code},
            async: false,
            success: function(resultData) {

                if (resultData.Status == "1") {
                    cbProductReviews.callback();
                    $("#txtReviewEmail").attr("value","");
                    $("#txtReviewName").attr("value","");
                    $("#txtReviewMessage").attr("value","");
                    alert("���۳ɹ�");
                    if ($("#txtReviewUserName").val()!=''&& $("#txtReviewPsw").val()!=''  )
                    {
                        window.location.reload();
                    }
                    $("#txtReviewName").val('<%=HiContext.Current.User.Username%>');
                    $("#txtReviewEmail").val('<%=HiContext.Current.User.Email%>');
                }
                else if (resultData.Status == "0") {
                    alert(resultData.Msg.replace(/<li>/g,'\n'))
                }
                refreshReviewCode();
                refreshConsultationCode();
                $("#txtReviewCode").val("");
            }
        });  
           

    }
</script>
<div>
<UI:CallBack id="cbProductReviews" CacheContent="false" runat="server" PostState="true" Debug="false" ClientSideOnCallbackComplete="ResetPagerReview">
    <Content>
        
    <UI:TemplatedList ID="dlstProductReviews" runat="server" Width="100%" DataKeyField="ReviewId"  RunningMode="Callback">                                    
        <ItemTemplate>
             <div class="WareRefer">
	            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="marginCenter WareReply">
	            <tr>
	                <td class="Refer_color"><span>���ѣ�<%# Eval("UserName") %> </span></td>
	            </tr>
                  <tr>
                    <td valign="top" style="word-break:break-all;"><span class="Review_icon"><asp:Label ID="ReviewText" runat="server" Text='<%# Eval("ReviewText") %>'></asp:Label></span></td>
                    <td width="20%" valign="top" class="Refer_color"><span class="Refer_date"><Hishop:FormatedTimeLabel ID="litDateTime" Time='<%# Eval("ReviewDate")%>' runat="server" /> </span></td>
                  </tr>
                </table>
              </div>
        </ItemTemplate>                                                                               
        </UI:TemplatedList>
    </Content>
</UI:CallBack>                             

<!--��ҳ��ʼ-->
<div class="WareNext">
<UI:CallBack id="cbReviewPage" CacheContent="false" runat="server" PostState="true" Debug="false">
    <Content>
        <UI:Pager runat="server" ListToPaging="dlstProductReviews" ListToCallBackID="cbProductReviews" ID="pagerReview" RunningMode="Callback" />  
            <asp:Label runat="server" Id="lblErrotMessage" style="margin-top:20px;color:red;" />   
    </Content>
</UI:CallBack>      
</div>

	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="WareForm_tit">�����Դ���Ʒ���ۻ�����飬�ڴ��ύ</td>
  </tr>
  <tr>
    <td>
	<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="marginCenter">
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="10%" class="WareForm_line">�����ǳƣ�</td>
            <td class="WareForm_line"><input id="txtReviewName" class="WareForm_input" style="width: 180px;" type="text"><span style="color:#c71717;">*���ע���벻Ҫ����20���ַ���</span></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="10%" class="WareForm_line">�������䣺</td>
            <td class="WareForm_line"><input class="WareForm_input" id="txtReviewEmail" style="width: 180px;" type="text"><span style="color:#c71717;">*���ע���벻Ҫ����200���ַ���</span></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td style="padding:10px 0 5px 0;">��������������Ҫ���۵����ݣ�<span style="color:#c71717;">*���ע���벻Ҫ����200���ַ���</span></td>
      </tr>
      <tr>
        <td><textarea id="txtReviewMessage" cols="70" rows="8"></textarea></td>
      </tr>
      <tr>
        <td style="padding:20px;">
                    
                  <ul>
                    <li style="float:left; margin-left:5px; line-height:24px;"><span id="spReviewUserName" >�û�����<input type=text id="txtReviewUserName" style="width:80px;" /></span></li>
                    <li style="float:left; margin-left:5px;line-height:24px;"><span id="spReviewPsw">���룺<input type=password id="txtReviewPsw" style="width:70px;"/></span></li>
                    <li style="float:left; margin-left:5px;line-height:24px;">
                        
                        <span>
                            <span style=" display:block; padding-top:4px; float:left;">��֤�룺</span>
                            <input type=text id="txtReviewCode" style="width:50px; float:left;"/>
                            <a href="javascript:refreshReviewCode();" ><img id="imgReviewVerifyCode" src='' style="border-style:none;float:left;" alt=""/></a>
                            <script language="javascript" type="text/javascript">
                                document.getElementById('imgReviewVerifyCode').src = applicationPath + "/VerifyCodeImage.aspx";
                                function refreshReviewCode() {
                                    var img = document.getElementById("imgReviewVerifyCode");

                                    if (img != null) {
                                        var currentDate = new Date();
                                        img.src = applicationPath + "/VerifyCodeImage.aspx?t=" + currentDate.getTime();
                                    }
                                }
                            </script>
                        </span>
                    
                    </li>
                    <li style="float:left;margin-left:5px;line-height:24px;"><input type="button" id="btnReview" onclick="addReview();" value="��¼������" class="btn_sub" /></li>
                    <li style="float:left;margin-left:5px;line-height:24px;"><span id="spReviewReg" style=" display:block; padding-top:4px; float:left;"><Hishop:SiteUrl UrlName="register" runat="server">ע��</Hishop:SiteUrl></span></li>
                </ul>
                
        </td>
      </tr>
    </table></td>
  </tr>
</table>

</div>