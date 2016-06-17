<%@ Control Language="C#" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>
<%@ Import Namespace="Hishop.SystemServices" %>

<script type="text/javascript">
    $(document).ready(function() {
        $('#btn_Common_Login_Button').click(function() {
            var username = $("#txt_Common_Login_UserName").val();
            var password = $("#txt_Common_Login_Password").val();

            if (username.length == 0 || password.length == 0) {
                alert("�����������û���������!");
                return;
            }

            $.ajax({
                url: "ValidateLogin.aspx",
                type: "post",
                dataType: "json",
                data: { username: username, password: password },
                cache: false,
                success: function(data, textStatus) {
                    if (data.Status == "OK") {
                        window.location.reload();
                    }
                    else {
                        alert(data.Msg);
                    }
                }
            });
        });

        $("#txt_Common_Login_Password").keydown(function(e) {
            if (e.keyCode == 13) {
                $('#btn_Common_Login_Button').focus();
                $('#btn_Common_Login_Button').click(function() { });
            }
        });

        $("#txt_Common_Login_UserName").keydown(function(e) {
            if (e.keyCode == 13) {
                $('#btn_Common_Login_Button').focus();
                $('#btn_Common_Login_Button').click(function() { });
            }
        });

    });
</script>
<asp:Panel runat="server" ID="pnlLogin" Visible="false">
	<table width="166" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td style="height:30px;width:68px;text-align:right;">�û�����</td>
                <td><input id="txt_Common_Login_UserName" type="text" class="input1" style="width:96px;"/></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td style="text-align:right;">���룺</td>
                <td><input name="Common_Login_Password" type="password" id="txt_Common_Login_Password" style="width:96px;"
                            class="input1" /></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td colspan="3" class="pad_top10">
                  <table width="166" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="49"><input id="btn_Common_Login_Button" type="button" class="login-btn" /></td>
                      <td width="51"><a href="#a" onclick='<%= "top.location.href=\"" + Globals.GetSiteUrls().UrlData.FormatUrl("register") + "\"" %>'><Hishop:ThemesImage alt="ע���û�" src="images/login_index_regist.jpg" runat="server"></a></td>
                      <td width="66"><a href='<%= Globals.GetSiteUrls().UrlData.FormatUrl("ForgotPassword")%>' target="_blank">�������룿</a></td>
                    </tr>
                  </table></td>
              </tr>
            </table>
</asp:Panel>
<asp:Panel runat="server" ID="pnlLogout" Visible="false">
	<style>
		#Span1 a{color:red;font-weight:700;}
	</style>
        <div style="text-align:left;padding-left:6px;">
            <ul style="margin: 5px; line-height: 180%; color: #666;">
                <li>���ã�<span style="color: #36c;"><%= HiContext.Current.User.Username %></span> (<asp:Literal
                    ID="litUserRank" runat="server" />)</li>
                <li>Ԥ������<asp:Literal ID="litAccount" runat="server" /></li>
                <li Id="htmLiPoint" runat="server">���û��֣�<asp:Literal ID="litPoint" runat="server" /></li>
                <li Id="htmLiShoppingCartMoney" runat="server">���ﳵС�ƣ�<asp:Literal ID="litShoppingCartMoney" runat="server" /></li>
                <li style="text-align:center;"><span id="Span1">
                    <Hishop:Common_Link_MyAccount ID="Common_Link_MyAccount1" runat="server" Target="_parent" />
                </span><span id="Span2"><a href='<%= Globals.GetSiteUrls().UrlData.FormatUrl("logout") %>'
                    target="_parent">�˳�</a></span></li>
            </ul>
        </div>
</asp:Panel>

