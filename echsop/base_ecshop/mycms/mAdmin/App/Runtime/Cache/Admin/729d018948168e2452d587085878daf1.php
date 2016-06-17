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
	<form method="post" enctype="multipart/form-data" class="form">
    <input type="hidden" name="id" value="<?php echo ($obj["id"]); ?>">
	<input type="hidden" name="category_id" value="<?php echo $_GET["cid"];?>">
	<input type="hidden" name="hardware" value="<?php echo ($_SESSION['hardware']); ?>">
	<input type="hidden" name="lang" value="<?php echo ($_SESSION['lang']); ?>">
    <input type="hidden" name="dbName" value="News">
    <fieldset>
       <ul data-role="listview" data-divider-theme="c" data-inset="true">
        	<li data-role="list-divider" role="heading">
               <label>当前位置：</label>
               <?php getNavSite('',$_GET['cid']);?> > <?php echo ($obj["title"]); ?>
           </li>
           <li>
               <label>正文标题</label>
               <input type="text" id="title" name="title" value="<?php echo ($obj["title"]); ?>" class="type-text">
           </li>
          <li>
               <div data-role="fieldcontain">
                    <h3>正文描述</h3>
                  	<textarea id="content" name="content"><?php echo (htmlspecialchars_decode($obj["content"])); ?></textarea>
                 </div>
           </li>
        </ul>
        <div data-role="collapsible" data-theme="c" data-content-theme="d">
            <h4>更多可选项</h4>
           
            	 <label>正文摘要</label>
       			 <textarea id="summary" name="summary" ><?php echo ($obj["summary"]); ?></textarea>
           
          	   <label>作者</label>
               <input type="text" id="author" name="author" value="<?php echo ($obj["author"]); ?>">
           
            	<label>来源</label>
               <input type="text" id="source" name="source" value="<?php echo ($obj["source"]); ?>" >
           
           		  <label>页面标题</label>
                  <input type="text" id="seo_title" name="seo_title" value="<?php echo ($obj["seo_title"]); ?>">
           
           		  <label>页面关键字</label>
                  <input type="text" id="seo_keywords" name="seo_keywords" value="<?php echo ($obj["seo_keywords"]); ?>" class="type-text">
           
           		    <label>页面描述</label>
                    <input type="text" id="seo_description" name="seo_description" value="<?php echo ($obj["seo_description"]); ?>" class="type-text">
            
         <fieldset data-role="controlgroup">
            <input type="checkbox" name="is_publish" id="is_publish" class="custom" value="1" <?php if(($obj["is_publish"])  ==  "1"): ?>checked<?php endif; ?> />
            <label for="is_publish">是否审核通过</label>
         </fieldset>
        </div>
        <div data-role="navbar" data-iconpos="top" id="submitDiv">
            <ul>
                <li id="submitButton">
                	<a data-role="button" href="javascript:void(0)"  id="submint"  data-theme="a">保存</a>
                  </li>
                  <li id="resetButton">
                    <input   value="重置" type="reset" data-theme="c" />
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
				data:params ,
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