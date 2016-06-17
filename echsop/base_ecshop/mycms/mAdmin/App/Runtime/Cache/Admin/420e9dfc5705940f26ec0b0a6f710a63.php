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
<div class="nav-site"><?php getNavSite($nav_site,$_GET['cid']);?></div>
<form method="post" enctype="multipart/form-data" class="form">  
<input type="hidden" name="id" value="<?php echo ($obj["id"]); ?>">
<input type="hidden" name="my_id" value="<?php echo ($obj["my_id"]); ?>">  
<input type="hidden" name="one_category_id" value="<?php echo ($obj["category_id"]); ?>" />
<input type="hidden" name="dbName" value="Guestbook">
	<fieldset>
    	<div data-role="fieldcontain">
            	<p>留言标题：<?php echo ($obj["title"]); ?></p>
                <p>留言内容：<?php echo ($obj["content"]); ?></p>
                <p>联系人：<?php echo ($obj["linkman"]); ?></p>
                <p>email：<?php echo ($obj["email"]); ?></p>
                <p>联系电话：<?php echo ($obj["mobile"]); ?></p>
                <p>传真：<?php echo ($obj["fax"]); ?></p>
                <p>留言时间：<?php echo (date('Y-m-d',$obj["create_time"])); ?></p>
       </div>	
		<ul data-role="listview" data-divider-theme="a" data-inset="true">	
			<li>
				<label>回复内容 </label>
				<textarea  name="reply" rows="10" style="width:98%"><?php echo (htmlspecialchars_decode($obj["reply"])); ?></textarea>
			</li>
		</ul>
         <fieldset data-role="controlgroup">
            <input type="checkbox" name="is_publish" id="is_publish" class="custom" value="1" <?php if(($obj["is_publish"])  ==  "1"): ?>checked<?php endif; ?>  />
            <label for="is_publish">是否审核通过</label>
         </fieldset>
           <div data-role="navbar" data-iconpos="top" id="submitDiv">
         <ul>
            <li id="submitButton">
             <a data-role="button" href="javascript:void(0)"  id="submint"  data-theme="a">保存</a>
          </li>
            <li id="resetButton">
		<input type="button" value="返回列表" onclick="javascript:history.go(-1);" />
             </li>
            </ul>
            </div>
	</fieldset>
</form>
</div>
<!-- layout::Inc:edit_footer::0 -->
<script type="text/javascript">
	$(document).ready(function(){
		$("#submint").click(function(){
			var params = $('input,textarea').serialize(); //序列化表单的值
			$.mobile.loadingMessageTextVisible = true;
			$.ajax({
				type:'POST',
				url:'__APP__/Index/sortUpdate',
				data:params,
				beforeSend:$.mobile.showPageLoadingMsg('a','正在提交....'),
				success:ajaxTips,
				complete:$.mobile.hidePageLoadingMsg()
				})
		})
	})
</script>
</div>
</body>
</html>