<%@ Control Language="C#" %>
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
        $("#spConsultationUserName").css({"display":""});
        $("#spConsultationPsw").css({"display":""});
        $("#spConsultationReg").css({"display":""});
        $("#btnConsultation").val("��¼������");
    }
    else
    {
        $("#txtUserName").val('<%=HiContext.Current.User.Username%>');
        $("#txtEmail").val('<%=HiContext.Current.User.Email%>');
        $("#txtConsultationUserName").attr('');
        $("#txtConsultationPsw").attr('');       
        $("#spConsultationUserName").css({"display":"none"});
        $("#spConsultationPsw").css({"display":"none"});
        $("#spConsultationReg").css({"display":"none"});
        $("#btnConsultation").val("����");
    }
    
})
    
    
    function ResetPager(sender, eventArgs) 
    {
        cbPage.callback();
    }
    function addConsultations() {
        var email = $("#txtEmail").attr("value");
        var name = $("#txtUserName").attr("value");
        var info = $("#txtConsultation").attr("value");
        var userName = $("#txtConsultationUserName").attr("value");
        var password = $("#txtConsultationPsw").attr("value");
        var code = $("#txtConsultationCode").attr("value");
        var productId = '<%=Request.QueryString["ProductId"]%>';
        
        $.ajax({
            url: "ProductHandler.aspx",
            type: 'post', dataType: 'json', timeout: 10000,
            data:{action:"ProductConsultation",productId:productId,name:name,Email:email,Content:info,username:userName,password:password,code:code},
            async: false,
            success: function(resultData) {
                
                if (resultData.Status == "1") {
                    cbProConsultations.callback();
                    $("#txtEmail").attr("value","");
                    $("#txtUserName").attr("value","");
                    $("#txtConsultation").attr("value","");
                    alert("��ѯ�ɹ�,����Ա�ظ���Ż���ʾ!");
                    if ($("#txtConsultationUserName").val()!=''&& $("#txtConsultationPsw").val()!=''  )
                    {
                        window.location.reload();
                    }
                    $("#txtUserName").val('<%=HiContext.Current.User.Username%>');
                    $("#txtEmail").val('<%=HiContext.Current.User.Email%>');
                }
                else if (resultData.Status == "0") {
                    alert(resultData.Msg.replace(/<li>/g,'\n'))
                }
                refreshConsultationCode();
                refreshReviewCode();
                $("#txtConsultationCode").val("");
            }
        });     
    }
</script>
<div>
<UI:CallBack id="cbProConsultations" CacheContent="false" runat="server" PostState="true" Debug="false" ClientSideOnCallbackComplete="ResetPager" >
    <Content>
        
        <UI:TemplatedList runat="server" ID="dlstProConsultations" RepeatDirection="Vertical" Width="100%" RunningMode="Callback">
            <ItemTemplate>
            
	  <div class="WareRefer">
	    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="marginCenter WareReply">
          <tr>
            <td class="Refer_color"><span class="zixun_user">���ѣ�<%# Eval("UserName") %> </span></td>
            <td width="190px" style="padding-left:10px;"><span class="Refer_date">��ѯʱ�䣺<%# Eval("ConsultationDate")%></span></td>
          </tr>
          <tr>
            <td valign="top" style="word-break:break-all;"><span class="Refer_cont">��ѯ���ݣ�</span><asp:Label ID="ReviewText" runat="server" Text='<%# Eval("ConsultationText") %>'></asp:Label></td>
            <td width="190px" style="padding-left:10px;" valign="top" class="Refer_color"></td>
          </tr>
        </table>
	    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="marginCenter">
      <tr>
        <td valign="top" class="Refer_color1" style="word-break:break-all;"><span class="Refer_reply">����Ա�ظ���</span><span><asp:Label ID="Label1" runat="server" Text='<%# Eval("ReplyText") %>'></asp:Label></span></td>
        <td width="190px" style="padding-left:10px;" valign="top" class="Refer_color"><span class="Refer_date">�ظ�ʱ�䣺<Hishop:FormatedTimeLabel ID="litDateTime" Time='<%# Eval("ReplyDate") %>' runat="server" /></span></td>
      </tr>
    </table>
	  </div>
            </ItemTemplate>
        </UI:TemplatedList>
    </Content>
</UI:CallBack>
<!--��ҳ��ʼ-->
<div class="WareNext">
<UI:CallBack id="cbPage" CacheContent="false" runat="server" PostState="true" Debug="false">
    <Content>
        <UI:Pager runat="server" ListToPaging="dlstProConsultations" ListToCallBackID="cbProConsultations" ID="pager" RunningMode="Callback" />     
    </Content>
</UI:CallBack>      
</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="WareForm_tit">��ѯ��Ʒ��</td>
  </tr>
  <tr>
    <td style="padding:20px;">
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="marginCenter">
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="10%" class="WareForm_line">�����ǳƣ�</td>
            <td class="WareForm_line"><input id="txtUserName" class="WareForm_input" style="width: 180px;" type="text"><span style="color:#c71717;">*���ע���벻Ҫ����20���ַ���</span></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="10%" class="WareForm_line">�������䣺</td>
            <td class="WareForm_line"><input class="WareForm_input" id="txtEmail" style="width: 180px;" type="text"><span style="color:#c71717;">*���ע���벻Ҫ����200���ַ���</span></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td style="padding:10px 0 5px 0;">��������������Ҫ��ѯ�����ݣ�<span style="color:#c71717;">*���ע���벻Ҫ����200���ַ���</span></td>
      </tr>
      <tr>
        <td><textarea cols="70" id="txtConsultation" rows="8"></textarea></td>
      </tr>
      <tr>
        <td style=" line-height:30px; padding-top:10px;">
                
                <ul>
                    <li style="float:left; margin-left:5px; line-height:24px;"><span id="spConsultationUserName" >�û�����<input type=text id="txtConsultationUserName" style="width:80px;" /></span></li>
                    <li style="float:left; margin-left:5px;line-height:24px;"><span id="spConsultationPsw">���룺<input type=password id="txtConsultationPsw" style="width:70px;"/></span></li>
                    <li style="float:left; margin-left:5px;line-height:24px;">
                        
                        <span>
                            <span style=" display:block; padding-top:4px; float:left;">��֤�룺</span>
                            <input type=text id="txtConsultationCode" style="width:50px; float:left;"/>
                            <a href="javascript:refreshConsultationCode();" ><img id="imgConsultationVerifyCode" src='' style="border-style:none;float:left;" alt=""/></a>
                            <script language="javascript" type="text/javascript">
                                document.getElementById('imgConsultationVerifyCode').src = applicationPath + "/VerifyCodeImage.aspx";
                                function refreshConsultationCode() {
                                    var img = document.getElementById("imgConsultationVerifyCode");

                                    if (img != null) {
                                        var currentDate = new Date();
                                        img.src = applicationPath + "/VerifyCodeImage.aspx?t=" + currentDate.getTime();
                                    }
                                }
                            </script>
                        </span>
                    
                    </li>
                    <li style="float:left;margin-left:5px;line-height:24px;"><input type="button" id="btnConsultation" onclick="addConsultations();" value="��¼������" class="btn_sub" /></li>
                    <li style="float:left;margin-left:5px;line-height:24px;"><span id="spConsultationReg" style=" display:block; padding-top:4px; float:left;"><Hishop:SiteUrl UrlName="register" runat="server">ע��</Hishop:SiteUrl></span></li>
                </ul>
        </td>
      </tr>
    </table></td>
  </tr>
</table>
</div>