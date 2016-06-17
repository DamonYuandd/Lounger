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
     <form method="post" class="form">  
               
                    <h4><?php isLang();?></h4>
            
                        <label for="name">标题(Title)</label>
                       <input type="text" id="seo_title" name="seo_title" value="<?php echo ($system["seo_title"]); ?>" class="type-text">
            
                       <label>关键字(Keywords)</label>
                       <input type="text" id="seo_keywords" name="seo_keywords" value="<?php echo ($system["seo_keywords"]); ?>" class="type-text">
              
                       <label>描述(Description)</label>
                       <input type="text" id="seo_description" name="seo_description" value="<?php echo ($system["seo_description"]); ?>" class="type-text">
                       <input type="hidden" id="is_qrcode_add_logo" value="<?php echo ($common["is_qrcode_add_logo"]); ?>" name="is_qrcode_add_logo" />
             
                      <?php echoLangsCheckbox();?>
                       <div data-role="navbar" data-iconpos="top" id="submitDiv">
         <ul>
            <li id="submitButton">
             <a data-role="button" href="javascript:void(0)"  id="submint"  data-theme="a">保存</a>
             </li>
            <li id="resetButton">
                      <input value="重置" type="reset" data-theme="c" />
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