<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<!-- layout::Inc:jq_mobile::0 -->
<!-- layout::Inc:common_js::0 -->
</head>
<body>
<div data-role="page">
	<!-- layout::Inc:edit_head::0 -->
    <div data-role="content">
      <form method="post" class="form"  enctype="multipart/form-data">
    	<div data-role="fieldcontain">
        	<h4><?php isLang();?></h4>
        </div>
        <div data-role="fieldcontain">
        <h4>二维码加LOGO：
        <fieldset data-role="controlgroup" data-type="horizontal">
            <input type="radio" name="is_qrcode_add_logo" id="radio-choice-1" value="1" <?php if(($common["is_qrcode_add_logo"])  ==  "1"): ?>checked="checked"<?php endif; ?> />
            <label for="radio-choice-1">开启</label>
            <input type="radio" name="is_qrcode_add_logo" id="radio-choice-2" value="0" <?php if(($common["is_qrcode_add_logo"])  ==  "0"): ?>checked="checked"<?php endif; ?>/>
            <label for="radio-choice-2">关闭</label>
        </fieldset>
        </h4>
		</div>
        <div data-role="fieldcontain">
                <label for="name">网站名称：</label>
                <input name="website" id="website" value="<?php echo ($system["website"]); ?>"  />
        </div>
        <div data-role="fieldcontain">
                <label for="name">网站域名：</label>
                <input name="domain" id="domain" value="<?php echo ($system["domain"]); ?>"  />
        </div>
        <div data-role="fieldcontain">
                <label for="name">ICP备案号：</label>
                <input name="icpnumber" id="icpnumber" value="<?php echo ($system["icpnumber"]); ?>"  />
        </div>
        <div data-role="fieldcontain">
                <label for="name">网站版权：</label>
                <input name="copyright" id="copyright" value="<?php echo ($system["copyright"]); ?>"  />
        </div>
        <div data-role="fieldcontain">
                <label for="name">可信认证：</label>
                <textarea  name="credible" id="credible"><?php echo ($system["credible"]); ?></textarea>
        </div>
             <?php echoLangsCheckbox();?>
             <div data-role="navbar" data-iconpos="top" id="submitDiv">
         <ul>
            <li id="submitButton">
             <a data-role="button" href="javascript:void(0)"  id="submint"  data-theme="a">保存</a>
          </li>
            <li id="resetButton">
                   <input  value="重置" type="reset" data-theme="c" />
               </li>
            </ul>
            </div>
       </form>
    </div>
　 	<!-- layout::Inc:edit_footer::0 -->
</div>
<script type="text/javascript">
	$(document).ready(function(){
			$("#submint").click(function(){
			 var params = $('input').serialize(); //序列化表单的值
			 $.mobile.loadingMessageTextVisible = true;  
				$.ajax({  
					url:'__APP__/Admin/System/saveSetting', //后台处理程序  
					type:'post',       //数据传送方式  
					dataType:'json',   //接受数据格式  
					data:params,       //要传送的数据  
					beforeSend:$.mobile.showPageLoadingMsg('a','正在提交....'),
					success:ajaxTips,
					complete:$.mobile.hidePageLoadingMsg()
				});
				return false;
			})
	})
</script>
</body>
</html>